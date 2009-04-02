Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LpLma-0003aX-Oh
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:12:57 +0200
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id C682294007A;
	Thu,  2 Apr 2009 14:10:05 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 8ABFB940114;
	Thu,  2 Apr 2009 14:10:02 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 857D01840D9;
	Thu,  2 Apr 2009 14:10:03 +0200 (CEST)
Message-ID: <49D4AB1A.5060709@bolloretelecom.eu>
Date: Thu, 02 Apr 2009 14:10:02 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49D3582F.4070304@xora.org.uk>	<200904012342.38417.raj.khem@gmail.com>
	<49D488FC.3080803@xora.org.uk>
In-Reply-To: <49D488FC.3080803@xora.org.uk>
X-SA-Exim-Connect-IP: 212.27.42.1
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: klibc problems
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
X-List-Received-Date: Thu, 02 Apr 2009 12:13:09 -0000
Content-Type: multipart/mixed; boundary="------------020704080704060309030708"

--------------020704080704060309030708
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

While we are on the topic, shouldn't the .so symlink get put in ${PN}-dev=
?

Attached is a patch that does just that.

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris

--------------020704080704060309030708
Content-Type: text/x-patch;
 name="klibc.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="klibc.diff"

diff --git a/recipes/klibc/klibc.inc b/recipes/klibc/klibc.inc
index 15205c7..5fc9f52 100644
--- a/recipes/klibc/klibc.inc
+++ b/recipes/klibc/klibc.inc
@@ -59,7 +59,7 @@ do_stage() {
         cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
 }
 
-PACKAGES = "${PN} klibc-utils-sh klibc-utils-kinit \
+PACKAGES = "${PN} ${PN}-dev klibc-utils-sh klibc-utils-kinit \
 	klibc-utils-fstype klibc-utils-ipconfig \
     	klibc-utils-nfsmount klibc-utils-resume \
 	klibc-utils-run-init klibc-utils-cat \
@@ -77,7 +77,8 @@ PACKAGES = "${PN} klibc-utils-sh klibc-utils-kinit \
         klibc-utils-gzip klibc-utils-modprobe \
 	klibc-utils-losetup klibc-utils-wc"
 
-FILES_${PN} = "${base_libdir}/klibc*.so"	
+FILES_${PN} = "${base_libdir}/klibc-*.so"	
+FILES_${PN}-dev = "${base_libdir}/klibc.so"	
 FILES_klibc-utils-sh = "${base_bindir}/sh"
 FILES_klibc-utils-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
 FILES_klibc-utils-kinit = "${base_bindir}/kinit"

--------------020704080704060309030708--
