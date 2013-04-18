Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USnA7-0003MF-K2
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 13:38:01 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2013 12:20:20 +0100
Message-Id: <1366284020-8025-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH v2] Hiawatha: update to 9.0, add systemd support
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
X-List-Received-Date: Thu, 18 Apr 2013 11:38:06 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---

v2 - Fix sha256sum

 .../recipes-httpd/hiawatha/files/hiawatha.service     | 16 ++++++++++++++++
 .../hiawatha/{hiawatha_8.8.1.bb => hiawatha_9.0.bb}   | 19 ++++++++++++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.8.1.bb => hiawatha_9.0.bb} (78%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service
new file mode 100644
index 0000000..26cb8d0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=Hiawatha Web Server
+After=network.target remote-fs.target nss-lookup.target
+
+[Service]
+Type=simple
+SyslogIdentifier=hiawatha
+ExecStartPre=/usr/sbin/hiawatha -k ; /usr/sbin/wigwam
+ExecStart= /usr/sbin/hiawatha -d
+TimeoutSec=10
+#(doesn't like this setting. Can't find files) PrivateTmp=true
+LimitNOFILE=infinity
+CapabilityBoundingSet=CAP_NET_BIND_SERVICE CAP_CHOWN CAP_DAC_OVERRIDE CAP_FOWNER CAP_FSETID CAP_SETGID CAP_SETUID 
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
similarity index 78%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
index a729970..ac21558 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.0.bb
@@ -7,16 +7,19 @@ DEPENDS = "libxml2 libxslt"
 SECTION = "net"
 
 SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
-           file://hiawatha-init "
+           file://hiawatha-init \
+           file://hiawatha.service "
 
-SRC_URI[md5sum] = "5def93779bbc10a021796abd3609caf7"
-SRC_URI[sha256sum] = "2583d8e7f48ddc6cdedc27bb51d3e130679fc2f4411622bae9ddce3ef965d063"
-
-inherit cmake update-rc.d
+SRC_URI[md5sum] = "8abc4f85dbb9a76ed66e7f35de520064"
+SRC_URI[sha256sum] = "5e40119afb050b11737250c08d89ac7ba7472645738a48c06aa79979a19729fc"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
 
+SYSTEMD_SERVICE_${PN} = "hiawatha.service"
+
+inherit cmake update-rc.d systemd
+
 EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DENABLE_CACHE=OFF \
                   -DENABLE_DEBUG=OFF \
@@ -44,6 +47,12 @@ do_install_append() {
     # configure php-fcgi to have a working configuration
     # by default if php is installed
     echo "Server = ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:nobody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawatha/php-fcgi.conf
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
+    fi
+
 }
 
 CONFFILES_${PN} = " \
-- 
1.8.2



