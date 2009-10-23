Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1N1FEE-0002rQ-Mv
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 10:10:33 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 7ABA24C80EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 10:09:27 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 94D864C8113
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 10:09:25 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 2A57D18405F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 10:09:25 +0200 (CEST)
Message-ID: <4AE164B5.20001@bolloretelecom.eu>
Date: Fri, 23 Oct 2009 10:09:25 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla-Thunderbird 2.0.0.22 (X11/20090701)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 212.27.42.4
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH][RFC] update-rc.d.bbclass vs dpkg issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2009 08:10:34 -0000
Content-Type: multipart/mixed; boundary="------------090409070603020609070906"

--------------090409070603020609070906
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Having recently switch from opkg to dpkg, I encountered some problems whe=
n upgrading
packages which use the update-rc.d class. The problem are that update-rc.=
d :

a/ unconditionally calls "${INIT_D_DIR}/${INITSCRIPT_NAME} stop" in the p=
rerm script. This
is wrong, it should only do so when the prerm script is called for the "u=
pgrade" and
"remove" steps.

b/ unconditionally calls "update-rc.d $OPT ${INITSCRIPT_NAME} remove" in =
the postrm
script. This is wrong, it should only do so when the prerm script is call=
ed for the
"purge" step. However, "opkg" does not seem to support the "purge" step s=
o I suggest
calling it both for the "remove" and "purge" steps, after checking that t=
he init script no
longer exists.

You can find a description of how maintainer scripts are called by dpkg a=
t:

http://www.debian.org/doc/debian-policy/ch-maintainerscripts.html

Attached is a patch which fixes both issues. I'd appreciate comments on t=
his one as
update-rc.d.bbclass is widely used.

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris

--------------090409070603020609070906
Content-Type: text/x-diff;
 name="update-rc-d-class.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="update-rc-d-class.patch"

diff --git a/classes/update-rc.d.bbclass b/classes/update-rc.d.bbclass
index 91af859..4744806 100644
--- a/classes/update-rc.d.bbclass
+++ b/classes/update-rc.d.bbclass
@@ -16,17 +16,27 @@ update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 
 updatercd_prerm() {
 if test "x$D" = "x"; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+	if test "$1" = "upgrade" -o "$1" = "remove"; then
+		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+	fi
 fi
 }
 
+# Note: to be Debian compliant, we should only invoke update-rc.d remove
+# in the "purge" step, but opkg does not support it. So instead we also
+# run it at the "remove" step in the init script no longer exists.
+
 updatercd_postrm() {
 if test "x$D" != "x"; then
 	OPT="-r $D"
 else
 	OPT=""
 fi
-update-rc.d $OPT ${INITSCRIPT_NAME} remove
+if test "$1" = "remove" -o "$1" = "purge"; then
+	if ! test -e "${INIT_D_DIR}/${INITSCRIPT_NAME}"; then
+		update-rc.d $OPT ${INITSCRIPT_NAME} remove
+	fi
+fi
 }
 
 

--------------090409070603020609070906--
