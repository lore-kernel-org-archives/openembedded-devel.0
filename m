Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXf-0002vt-Fb
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:38 +0100
Received: (qmail 13983 invoked by uid 813007); 22 Mar 2010 11:08:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:49 +0100
Message-Id: <1269256016-13155-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH][STABLE] shadow: try to fix serial-login issue
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:38 -0000

From: Koen Kooi <koen@openembedded.org>

---
 recipes/shadow/files/pam.d/login |    2 +-
 recipes/shadow/files/securetty   |  167 ++++++++++++++++++++++++++++++++++++++
 recipes/shadow/shadow_4.1.4.2.bb |    5 +-
 3 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 recipes/shadow/files/securetty

diff --git a/recipes/shadow/files/pam.d/login b/recipes/shadow/files/pam.d/login
index 2186d3e..65992c6 100644
--- a/recipes/shadow/files/pam.d/login
+++ b/recipes/shadow/files/pam.d/login
@@ -20,7 +20,7 @@ auth       optional   pam_faildelay.so  delay=3000000
 # You can change it to a "required" module if you think it permits to
 # guess valid user names of your system (invalid user names are considered
 # as possibly being root).
-auth       requisite  pam_securetty.so
+auth       [success=ok ignore=ignore user_unknown=ignore default=die]  pam_securetty.so
 
 # Disallows other than root logins when /etc/nologin exists
 # (Replaces the `NOLOGINS_FILE' option from login.defs)
diff --git a/recipes/shadow/files/securetty b/recipes/shadow/files/securetty
new file mode 100644
index 0000000..2705baa
--- /dev/null
+++ b/recipes/shadow/files/securetty
@@ -0,0 +1,167 @@
+# /etc/securetty: list of terminals on which root is allowed to login.
+# See securetty(5) and login(1).
+console
+
+# Standard serial ports
+ttyS0
+ttyS1
+
+# USB dongles
+ttyUSB0
+ttyUSB1
+ttyUSB2
+
+# Embedded MPC platforms
+ttyPSC0
+ttyPSC1
+ttyPSC2
+ttyPSC3
+ttyPSC4
+ttyPSC5
+
+# PA-RISC mux ports
+ttyB0
+ttyB1
+
+# Standard hypervisor virtual console
+hvc0
+
+# Oldstyle Xen console
+xvc0
+
+# Standard consoles
+tty1
+tty2
+tty3
+tty4
+tty5
+tty6
+tty7
+tty8
+tty9
+tty10
+tty11
+tty12
+tty13
+tty14
+tty15
+tty16
+tty17
+tty18
+tty19
+tty20
+tty21
+tty22
+tty23
+tty24
+tty25
+tty26
+tty27
+tty28
+tty29
+tty30
+tty31
+tty32
+tty33
+tty34
+tty35
+tty36
+tty37
+tty38
+tty39
+tty40
+tty41
+tty42
+tty43
+tty44
+tty45
+tty46
+tty47
+tty48
+tty49
+tty50
+tty51
+tty52
+tty53
+tty54
+tty55
+tty56
+tty57
+tty58
+tty59
+tty60
+tty61
+tty62
+tty63
+
+# devfs consoles
+# Note: On kernels greater than 2.6.12, this is not needed.
+
+# Standard serial ports, with devfs
+tts/0
+tts/1
+
+# Standard consoles, with devfs
+vc/1
+vc/2
+vc/3
+vc/4
+vc/5
+vc/6
+vc/7
+vc/8
+vc/9
+vc/10
+vc/11
+vc/12
+vc/13
+vc/14
+vc/15
+vc/16
+vc/17
+vc/18
+vc/19
+vc/20
+vc/21
+vc/22
+vc/23
+vc/24
+vc/25
+vc/26
+vc/27
+vc/28
+vc/29
+vc/30
+vc/31
+vc/32
+vc/33
+vc/34
+vc/35
+vc/36
+vc/37
+vc/38
+vc/39
+vc/40
+vc/41
+vc/42
+vc/43
+vc/44
+vc/45
+vc/46
+vc/47
+vc/48
+vc/49
+vc/50
+vc/51
+vc/52
+vc/53
+vc/54
+vc/55
+vc/56
+vc/57
+vc/58
+vc/59
+vc/60
+vc/61
+vc/62
+vc/63
diff --git a/recipes/shadow/shadow_4.1.4.2.bb b/recipes/shadow/shadow_4.1.4.2.bb
index 04887a0..7f64023 100644
--- a/recipes/shadow/shadow_4.1.4.2.bb
+++ b/recipes/shadow/shadow_4.1.4.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 DEPEND = "libpam"
 RDEPEND = "${DEPEND}"
 
-PR = "r5"
+PR = "r6"
 
 EXTRA_OECONF += " --enable-shared  --enable-static --with-libpam --without-libcrack"
 
@@ -24,6 +24,7 @@ SRC_URI_append = " \
            file://pam.d/newusers \
            file://pam.d/passwd \
            file://pam.d/su \
+           file://securetty \
 "
 
 S = "${WORKDIR}/shadow-${PV}"
@@ -49,4 +50,6 @@ do_install_append() {
   # The system MDA will set this later anyway.
   sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs 
   sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs 
+
+  install -m 0644 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
 }
-- 
1.7.0.2





