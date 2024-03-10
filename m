Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCF4C54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:01:42 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
 by mx.groups.io with SMTP id smtpd.web11.31335.1710066215417561684
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 03:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@heimpold.de header.s=strato-dkim-0002 header.b=Oe8fCmRC;
 dkim=pass header.i=@heimpold.de header.s=strato-dkim-0003 header.b=kZl7YYIa;
 spf=pass (domain: heimpold.de, ip: 85.215.255.23, mailfrom: mhei@heimpold.de)
ARC-Seal: i=1; a=rsa-sha256; t=1710066213; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UGSLj6opksPwuwJ9NWB8568QeuhPy7OyOjXdmEYSx2p9hF939z6T8Sp8ikZ2MAv0Sx
    O/k2XwXF2pJ9oB4snp9YdBJ1sKg1iftqo3ao23YtVo+lji5ymGdcoSNxPqiKuEyLHwKM
    E1M4ZslhBHZ6rbBuWI7NnhVI9dzCESPwUfsJiEJ9VxiwXc+DLSbpIasgTvS0M1O+KOmN
    /VI0+vXC8uhG8zInc63PXingg2gRqAP2Qu755ekL6/ZLcAws3jKA68aPlK9WZFCbsiDy
    bTaMdMSjZ31EBg7momGJrjSm0P+BqBhLuleHJHOYWARtLNSfsRotEc/zVK2TJsFsuqco
    K5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1710066213;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZcOAwjjyRya+HvDhdtZ3H84S+R34ao35Q3MlOaNYvsk=;
    b=htUn/R5TjKi6/C3b6ckT9Iq4xxG1Rd22yUBWA3TV1Ng5RaXp8za1MGoDEOsUf4/wnE
    M/U3BKQLRdzuizoUz5DX8T3J5CZUTalZ5UjfCNF6JFWVxiTFHd+tbXz2aMfBk70lu0zV
    eQd0xnC2F1mhHJIe1y8dWz5lB/ddvA/BBk+O7XmmaBRhOCnaiJ3vookBE7OD2bGFRFDJ
    fP87+aHc41FYONXCRpJfWXQFt7mTHNM9lgjAkIdakRx4RrdMXFqJe0/piCnQAlp4TMvz
    A+wSkssU5CP6tIDHWNmCJBbmINN8tTLVtvtPSa7BQL8mAHcJHh9CxkehNSCoo+9XCgq1
    xBoQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1710066213;
    s=strato-dkim-0002; d=heimpold.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZcOAwjjyRya+HvDhdtZ3H84S+R34ao35Q3MlOaNYvsk=;
    b=Oe8fCmRCtqcjSL56IU/HDcm7vBwG1M3jpw+ETxTSYVanC/IZCnK2WHiE3LuclfSCKO
    aYkxOBjq8ZhovdjoD/JL130NQsu0+QUczCGlc2uZ6mSpHB/PuOImQUFA3vvvXcqow1BL
    WIEF7KZOQarYLzaQez85lydMfLtCR2aO+Mrw29NX9BVHnlKa2h2tSj3ElNNpsSbgnVfA
    QkzKxqGXh4bsriTxNG30LIc/QjowG3Y0ZY93K+mmxe5bLj1ZRs7pJFYSzlb4QQoH5Qef
    sXT+qDq63Ws23wsLL/okAjTirNve7XSAqbsfYSbXjJAjADAt+A3wc02Fa8Ac6oR3jm+Y
    FM7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1710066213;
    s=strato-dkim-0003; d=heimpold.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ZcOAwjjyRya+HvDhdtZ3H84S+R34ao35Q3MlOaNYvsk=;
    b=kZl7YYIaGarluFWwVHTLUPrUvG8WU7z8bjNdUe98/HYlkt61XFe9JrTMgUZAK3SqoZ
    18dFOPmaFj48AFtoqGDA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EW8QnKjhhg/vO4pzqdNytq77N6ZKUSN7PfdWTGQORRBv+hBJ4HuTjU1tSIhFDMWzcNP501bqk0f9XZ4duqo7mTX"
Received: from tonne.mhei.heimpold.itr
    by smtp.strato.de (RZmta 50.2.0 AUTH)
    with ESMTPSA id c6248902AANXnNw
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 10 Mar 2024 11:23:33 +0100 (CET)
Received: from kerker.mhei.heimpold.itr (kerker.mhei.heimpold.itr [192.168.8.1])
	by tonne.mhei.heimpold.itr (Postfix) with ESMTP id F2BDC154C7C;
	Sun, 10 Mar 2024 11:24:46 +0100 (CET)
From: "Michael Heimpold" <mhei@heimpold.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Heimpold <mhei@heimpold.de>
Subject: [meta-oe][PATCH] ser2net: add a systemd service file
Date: Sun, 10 Mar 2024 11:23:06 +0100
Message-Id: <20240310102306.570073-1-mhei@heimpold.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 14:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109256

This adds and installs a simple systemd service for ser2net.
The service is only started in case a non-zero configuration file
/etc/ser2net/ser2net.yaml exists.

Additionally, this configuration file a marked as such in the recipe.

Signed-off-by: Michael Heimpold <mhei@heimpold.de>
---
 .../ser2net/files/ser2net.service              | 13 +++++++++++++
 .../ser2net/ser2net_4.6.1.bb                   | 18 ++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/ser2net/files/ser2net.service

diff --git a/meta-oe/recipes-connectivity/ser2net/files/ser2net.service b/meta-oe/recipes-connectivity/ser2net/files/ser2net.service
new file mode 100644
index 000000000000..13d8ee4ff3e3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ser2net/files/ser2net.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Serial port to network proxy
+Documentation=man:ser2net(8)
+After=network.target
+Wants=network.target
+ConditionFileNotEmpty=@SYSCONFDIR@/ser2net/ser2net.yaml
+
+[Service]
+Type=exec
+ExecStart=@SBINDIR@/ser2net -n
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
index 108647bdd6f5..e5ebafa54fc5 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
@@ -7,10 +7,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gensio libyaml"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
+    file://ser2net.service \
+"
 
 SRC_URI[sha256sum] = "78ffee19d9b97e93ae65b5cec072da2b7b947fc484e9ccb3f535702f36f6ed19"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
+
+SYSTEMD_SERVICE:${PN} = "ser2net.service"
+
+CONFFILES:${PN} += "${sysconfdir}/ser2net/ser2net.yaml"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/ser2net.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/ser2net.service
+    fi
+}
-- 
2.34.1


