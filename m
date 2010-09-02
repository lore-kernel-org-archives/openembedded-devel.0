Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OqzEr-0008Sg-TI
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 04:09:32 +0200
Received: by pvg6 with SMTP id 6so3243437pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 19:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=b9y/TYF3WQ88VMTz98+Z/Ui8f/bMbXI0FcU0/49gIzY=;
	b=KgmZQleGvkBBxMp1GWzaT4REIvkLpKk/rtqwJYMk3hDTKx7GFPMkC9cigFx4jWxANT
	eQXXR5FMQXEs0lHFko4NGoiHUZaBv/R0DlbU2ZnG1AxaI8nw9BPfe6gQ/R168nujJx/r
	ck5uBTIii2zkPUpsT/xgZ/Fj70TLk8reuwX0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=TSBU27X/QA5ijPfS43xhKMpEbv3TVCWJH1G2Ff5+KmptBGEvtfAh5dqbv3uvGbeqZx
	gMHpslP7fNi0y2rENdLu/xkZZ0EcF75ry0NxN/9Zbvw5DDCcjalOGA/YL7zE2uEbznyn
	JKgLrc5a/vafJRUXo2nfh00JZ0zvk6P/iwEQM=
Received: by 10.115.18.12 with SMTP id v12mr9802351wai.114.1283393312188;
	Wed, 01 Sep 2010 19:08:32 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	d38sm19697728wam.8.2010.09.01.19.08.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 19:08:31 -0700 (PDT)
Message-ID: <4C7F071A.8020501@gmail.com>
Date: Thu, 02 Sep 2010 11:38:26 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] gpsd: unbreak gpsd_2.38.bb and gpsd_2.39.bb
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
X-List-Received-Date: Thu, 02 Sep 2010 02:09:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The older recipe(s) are needed for programs which have not updated to gpsd's
newer api. e.g. prismstumbler.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---

Updated v2 patch as a new gpsd recipe has been added.

---
 recipes/gpsd/gpsd.inc     |    5 ++---
 recipes/gpsd/gpsd_2.90.bb |    5 +++++
 recipes/gpsd/gpsd_2.91.bb |    5 +++++
 recipes/gpsd/gpsd_2.94.bb |    5 +++++
 recipes/gpsd/gpsd_2.95.bb |    5 +++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index 63d6433..23335f0 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "dbus-glib ncurses python"
 PROVIDES = "virtual/gpsd"
-INC_PR = "r9"
+INC_PR = "r10"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
@@ -49,14 +49,13 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
-    install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
 }
 
 pkg_postinst_${PN}-conf() {
 	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
 }
 
-pkg_postrm_${PN}-conf() {	
+pkg_postrm_${PN}-conf() {
 	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
 }
 
diff --git a/recipes/gpsd/gpsd_2.90.bb b/recipes/gpsd/gpsd_2.90.bb
index 25c739b..69cd9ba 100644
--- a/recipes/gpsd/gpsd_2.90.bb
+++ b/recipes/gpsd/gpsd_2.90.bb
@@ -7,3 +7,8 @@ SRC_URI[gpsd.sha256sum] = "8c81461266fc95aae6519ec996d7e4f4801fb5a02dbcc7a5d1c13
 PR = "${INC_PR}.0"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
diff --git a/recipes/gpsd/gpsd_2.91.bb b/recipes/gpsd/gpsd_2.91.bb
index 7c575cb..2c964ca 100644
--- a/recipes/gpsd/gpsd_2.91.bb
+++ b/recipes/gpsd/gpsd_2.91.bb
@@ -8,3 +8,8 @@ SRC_URI[gpsd.sha256sum] = "02ee0f0a86a3c74fe807ea0a3fce908cb94dd7ff3afcef0b1fb66
 PR = "${INC_PR}.0"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
diff --git a/recipes/gpsd/gpsd_2.94.bb b/recipes/gpsd/gpsd_2.94.bb
index 66bd559..2b5e9d3 100644
--- a/recipes/gpsd/gpsd_2.94.bb
+++ b/recipes/gpsd/gpsd_2.94.bb
@@ -10,3 +10,8 @@ SRC_URI[gpsd.sha256sum] = "1520b87d106d198aa42137db4b230615dbd0d06b04e6fcc84e010
 PR = "${INC_PR}.1"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
diff --git a/recipes/gpsd/gpsd_2.95.bb b/recipes/gpsd/gpsd_2.95.bb
index 27aa851..ddc4e91 100644
--- a/recipes/gpsd/gpsd_2.95.bb
+++ b/recipes/gpsd/gpsd_2.95.bb
@@ -12,3 +12,8 @@ SRC_URI[gpsd.sha256sum] = "832343a53921a8371efa540ba57c91dadedda445e571c1beb97c0
 PR = "${INC_PR}.0"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
-- 
1.7.1



