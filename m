Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5DE27883F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:36:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g12so2317713pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8cR3eGHXWZTEWJNfjfy8YYlXMhTypLVeC5OwaVFb1pE=;
	b=cbmffPWPbnnsLZG22m3RNqvDk+07hfjfHdqN0pqCjo8N2p0ghAnz6PejjH9BiB53mz
	esCl6mQqp1BLeeVNZDQPJDygHY3iKYIU+o+a3Avly/Kp/mV4GWO7Zz01OA1jIlMaDWW9
	lXTF5t5567q+Mb/z6ktLw7EY95La2ZwnUbR8MupZwvdSliMyMnhufo6SicSxSJb1I33t
	T4JVH8ATvegKPaVph7CAGuckFtNuy2vMipYmmfstQgEaFbhOH36LXAeop7FEU9Numt0p
	UXd9T8A/zIRPQWKtSVwKVMJJ6FnTDbQX3q7UXr271z2W6n+n3guu93YO/Ma15a31dw18
	7bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8cR3eGHXWZTEWJNfjfy8YYlXMhTypLVeC5OwaVFb1pE=;
	b=ilvpeVUaa+eVZn7rX1fos13lPlKV4ayoqG3aUICfVzv/uR4qusHWbzZomsf1Zi62p3
	FqfCe1uzdJw+sMjMzpNqe0PskWBuV7Vc9d6rz0OpwjATJEe/4KqUhIpzHgmhX3zd/Hv9
	ihWdnax163i3msVkg6uMytZhimwNRZhi6DYnsS6KDg3QTQl2jvnsrDJ8UQDblKV2TnM8
	8eUCQJ/n3mzK0fntz4792HtdSZ6gUTFDnxwcCyhIvW53bs3DfLcu36g5jpcwVuv+O5E8
	RjX2KeyBCEvJj5mP7rPRifEmnQc/mydgoBXcCtCDYpaBTB6I3O3dFr0MSK4X0aY1IQrH
	UeqQ==
X-Gm-Message-State: APf1xPC0nvOvTYeVJkSfYGk6FDLQjlaT2y/gTcOQeEbv6K3Vg2ivT5c8
	eA9sFWlwrk3hrCaVnkxYS/FS/VF8
X-Google-Smtp-Source: AG47ELs70IJ9PbL73D0j24/P/CrS89dofSg9N/83P/foalQTVRTLGSLZwLx0TBoOh6iLigH24OxT6A==
X-Received: by 10.101.97.139 with SMTP id c11mr1598087pgv.447.1519911369475;
	Thu, 01 Mar 2018 05:36:09 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	b6sm9853743pfm.160.2018.03.01.05.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Mar 2018 05:36:08 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 19:05:53 +0530
Message-Id: <1519911354-18140-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-openwrt][PATCH 4/5] mountd: fix build error with gcc v7.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 13:36:08 -0000

Avoid warnings being treated as errors to solve below error:

-- snip --
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:694:35: error: '%s' directive output may be
truncated writing up to 255 bytes into a region of size 53 [-Werror=format-truncation=]
|      snprintf(tmp, 64, "/sys/block/%s/", namelist[n]->d_name);
|                                    ^~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:694:5: note: 'snprintf' output between 13 and
268 bytes into a destination of size 64
|      snprintf(tmp, 64, "/sys/block/%s/", namelist[n]->d_name);
|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:748:25: error: '%s' directive output may be
truncated writing up to 63 bytes into a region of size 48 [-Werror=format-truncation=]
|     snprintf(tmp, 64, "%s%s", "/tmp/run/mountd/", q->dev);
|                          ^~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:748:4: note: 'snprintf' output between 17 and
80 bytes into a destination of size 64
|     snprintf(tmp, 64, "%s%s", "/tmp/run/mountd/", q->dev);
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:374:43: error: '%s' directive writing up to
255 bytes into a region of size 42 [-Werror=format-overflow=]
|       sprintf(tmp3, "/sys/bus/scsi/devices/%s/block:%s/", namelist[n]->d_name, dev);
|                                            ^~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:374:6: note: 'sprintf' output 31 or more bytes
(assuming 286) into a destination of size 64
|       sprintf(tmp3, "/sys/bus/scsi/devices/%s/block:%s/", namelist[n]->d_name, dev);
|       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:378:44: error: '%s' directive writing up to
255 bytes into a region of size 42 [-Werror=format-overflow=]
|        sprintf(tmp3, "/sys/bus/scsi/devices/%s/block/%s/", namelist[n]->d_name, dev);
|                                             ^~
| .../tmp_new2/work/corei7-64-montavista-linux/mountd/git-r0/git/mount.c:378:7: note: 'sprintf' output 31 or more bytes
(assuming 286) into a destination of size 64
|        sprintf(tmp3, "/sys/bus/scsi/devices/%s/block/%s/", namelist[n]->d_name, dev);
|        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-extended/mountd/mountd_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/mountd/mountd_git.bb b/recipes-extended/mountd/mountd_git.bb
index b4ac22c..ff7b3a4 100644
--- a/recipes-extended/mountd/mountd_git.bb
+++ b/recipes-extended/mountd/mountd_git.bb
@@ -22,6 +22,10 @@ SRCREV_openwrt = "${OPENWRT_SRCREV}"
 
 S = "${WORKDIR}/git"
 
+do_configure_prepend () {
+    sed -i "s:-Werror --std=gnu99:-Werror -Wno-format-truncation -Wno-format-overflow --std=gnu99:g" ${S}/CMakeLists.txt
+}
+
 do_install_append() {
     install -Dm 0755 ${S}/openwrt/package/system/mountd/files/mountd.config ${D}${sysconfdir}/config/mountd
     install -Dm 0755 ${S}/openwrt/package/system/mountd/files/mountd.init ${D}${sysconfdir}/init.d/mountd
-- 
2.7.4


