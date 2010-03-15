Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.stanger@tait.co.nz>) id 1NrIwO-000408-Ol
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 23:39:23 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 5C9D346756
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 11:36:33 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 4B5B246755
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 11:36:33 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZC00301FMH9L00@sunstrike.tait.co.nz>
	(original mail from michael.stanger@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Tue,
	16 Mar 2010 11:36:14 +1300 (NZDT)
Received: from [172.25.116.124] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZC002QJHG7AZ20@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Mar 2010 11:36:07 +1300 (NZDT)
Date: Tue, 16 Mar 2010 11:36:07 +1300
From: Michael Stanger <michael.stanger@tait.co.nz>
To: openembedded-devel@lists.openembedded.org
Message-id: <4B9EB657.8080508@tait.co.nz>
MIME-version: 1.0
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: michael.stanger@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lua5.1: Adopt new staging policy
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
X-List-Received-Date: Mon, 15 Mar 2010 22:39:23 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Sorry about earlier thread-hijacking...

- Removed do_stage from recipes
- Set NATIVE_INSTALL_WORKS=1
- lua5.1-native now stages lua executable
- Removed -native recipe, use BBCLASSEXTENDS instead

Signed-off-by: Michael Stanger <michael.stanger@taitradio.com>
---
recipes/lua/lua5.1-native_5.1.4.bb |   11 -----------
recipes/lua/lua5.1_5.1.4.bb        |   10 +++-------
2 files changed, 3 insertions(+), 18 deletions(-)
delete mode 100644 recipes/lua/lua5.1-native_5.1.4.bb

diff --git a/recipes/lua/lua5.1-native_5.1.4.bb
b/recipes/lua/lua5.1-native_5.1.4.bb
deleted file mode 100644
index 35afb55..0000000
--- a/recipes/lua/lua5.1-native_5.1.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require lua5.1_${PV}.bb
-inherit native
-
-DEPENDS = "readline-native"
-
-do_stage () {
-    oe_libinstall -C src liblua ${STAGING_LIBDIR}/
-    install -d ${STAGING_INCDIR}/
-    install -m 0644 src/lua.h src/luaconf.h src/lualib.h src/lauxlib.h
${STAGING_INCDIR}/
-}
-
diff --git a/recipes/lua/lua5.1_5.1.4.bb b/recipes/lua/lua5.1_5.1.4.bb
index 8041def..e4a3c82 100644
--- a/recipes/lua/lua5.1_5.1.4.bb
+++ b/recipes/lua/lua5.1_5.1.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
HOMEPAGE = "http://www.lua.org/"

DEPENDS += "readline"
-PR = "r4"
+PR = "r5"
SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://lua5.1.pc"
S = "${WORKDIR}/lua-${PV}"
@@ -19,12 +19,6 @@ do_compile () {
        oe_runmake linux
}

-do_stage () {
-       oe_libinstall -C src liblua ${STAGING_LIBDIR}/
-       install -d ${STAGING_INCDIR}/
-       install -m 0644 src/lua.h src/luaconf.h src/lualib.h
src/lauxlib.h ${STAGING_INCDIR}/
-}
-
do_install () {
        oe_runmake \
                'INSTALL_TOP=${D}${prefix}' \
@@ -34,4 +28,6 @@ do_install () {
                'INSTALL_SHARE=${D}${datadir}/lua' \
                install
}
+NATIVE_INSTALL_WORKS = 1

+BBCLASSEXTEND = "native"
--
1.6.3.3


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



