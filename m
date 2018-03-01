Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABC57883F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:36:10 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y26so2314314pgv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gcDXo6+3VXzxAzKhH09ziAQWHdSDWTPoYO3tmIbUnVE=;
	b=rb11GBXgqwy6dupE+edZD0T0Nnq4Bzaqk6Z135+0rq/H6sbcewgAC3LHC0x7xtdcuS
	h97WdN1oFpIoZfvfWBxdBABL2K8ap4+N/+Bb3/2UwgkW1CuqYgA2APyopIU79ORbb4cS
	vfrQ2gzNqMDLYwZenmrfciXhSoPIoRS5NZvrlDeQ32QFf6rYShyTUsC/Begh6vJ8Va38
	OkNp9MFKNDCF5zS9l+W/zDwtdhih6Oh/RDmVPZETk9Ty6txmARZGxVAZ3eC/gY7ytNMs
	QqRb+VgkLk4y97Yb83l7H0lB7qhrtCNLBAfKh/a9AXNn602xCKj9dwBqoAbrgbVmE6Nx
	JAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gcDXo6+3VXzxAzKhH09ziAQWHdSDWTPoYO3tmIbUnVE=;
	b=JrN7II6JBIvxRYjkcwdzG8FMI/0+XbtF2O5bLU+9Dtr/2r7EDP87AhSAb8ANqPrDDR
	GqQd3K6K/kpO0OwnCgCRw42tMiygodY5tl0i/suYV+eIvLeEQZKxlXzZgQpP7K0T3AyR
	zZe/fKHbS+HdSXaFaD7ZbPOjY/ClZpAzNz9QpCgvxiEms6YJUX1rp03TVUnLgz3U6sJ3
	bhxZd8eWg5kdKxnJ6tmpSyTpJha38K3byIhnrQWFhV8RlYxVjlTkntaJvPuQHqAKz5Ir
	0kHcGd115HZ53MZ79hRX8n+7msvLU3xvcVeT9NIxqeusrCc8cWzY6MyNufElZVScCW5J
	klnw==
X-Gm-Message-State: APf1xPDKxyz8v5oCHQKK7N46Fxs/HH5B4sC7N6bZxCi0+kvtnaGxQnuh
	11HaaNNGgA0q4q7XrhjKOPSqxwoY
X-Google-Smtp-Source: AG47ELtywVzgd1ZdNPjzUON+dinCxRXNjmnpCR4GrarVS04urY28KekR0hO0Lh+43HMDqLdmvLeG3w==
X-Received: by 10.99.160.80 with SMTP id u16mr1543303pgn.389.1519911372212;
	Thu, 01 Mar 2018 05:36:12 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	b6sm9853743pfm.160.2018.03.01.05.36.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Mar 2018 05:36:11 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 19:05:54 +0530
Message-Id: <1519911354-18140-5-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
MIME-Version: 1.0
Subject: [meta-openwrt][PATCH 5/5] netifd: replace hardcoded lib string to a generic value
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
X-List-Received-Date: Thu, 01 Mar 2018 13:36:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1. If libdir is other than /usr/lib/ , then netifd recipe fails to
build with below error:

-- snip --
| cp: target ‘.../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/’ is not a directory
| WARNING: .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/temp/run.do_install.27647:1 exit 1 from 'cp -dR
--preserve=mode,links .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/git/scripts/*
.../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/'
-- snip --

2. Also replace hardcoded '/lib' string with ${base_libdir} in network scripts, so that
   dependent scripts are called from correct paths.

3. Include default.script in an alternative binary naming scheme, as netifd's default.script
   conflicts with busybox-udhcpc's default.script as below during
   openwrt-image-base:do_rootfs :

-- snip --
Error: Transaction check error:
file /usr/share/udhcpc/default.script conflicts between attempted installs of busybox-udhcpc-1.24.1-r0.2.corei7_64 and netifd-git-r0.corei7_64
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-core/netifd/netifd_git.bb | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/recipes-core/netifd/netifd_git.bb b/recipes-core/netifd/netifd_git.bb
index 755518b..140b76b 100644
--- a/recipes-core/netifd/netifd_git.bb
+++ b/recipes-core/netifd/netifd_git.bb
@@ -27,7 +27,13 @@ SRCREV_openwrt = "${OPENWRT_SRCREV}"
 
 OECMAKE_C_FLAGS += "-I${STAGING_INCDIR}/libnl3 -Wno-error=cpp"
 
+do_configure_prepend () {
+    # replace hardcoded '/lib/' with '${base_libdir}/'
+    grep -rnl "/lib/" ${S}/openwrt/package/network/config/netifd/ | xargs sed -i "s:/lib/:${base_libdir}/:g"
+}
+
 do_install_append() {
+    install -d ${D}${base_libdir}/netifd/
     # cp because recursive
     cp -dR --preserve=mode,links ${S}/openwrt/package/network/config/netifd/files/* ${D}/
     cp -dR --preserve=mode,links ${S}/scripts/* ${D}${base_libdir}/netifd/
@@ -50,23 +56,29 @@ do_install_append() {
     install -dm 0755 ${D}/etc/modules.d ${D}/etc/modules-load.d
     echo "bridge" >${D}/etc/modules.d/30-bridge
     echo "bridge" >${D}/etc/modules-load.d/bridge.conf
+
+    # Remove duplicate files under /lib/
+    rm -rf ${D}/lib/
+
 }
 
-ALTERNATIVE_${PN} = "ifup ifdown"
+ALTERNATIVE_${PN} = "ifup ifdown default.script"
 
 ALTERNATIVE_PRIORITY = "40"
+ALTERNATIVE_PRIORITY_pkg[default.script] = "60"
 ALTERNATIVE_LINK_NAME[ifup] = "${base_sbindir}/ifup"
 ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
+ALTERNATIVE_LINK_NAME[default.script] = "/usr/share/udhcpc/default.script"
 
 FILES_${PN} += "\
-               /usr/share/udhcpc/default.script \
-               /lib/netifd/dhcp.script \
-               /lib/netifd/utils.sh \
-               /lib/netifd/netifd-wireless.sh \
-               /lib/netifd/netifd-proto.sh \
-               /lib/netifd/proto/dhcp.sh \
-               /lib/network/config.sh \
-               /lib/functions/network.sh \
+               /usr/share/udhcpc/default.script* \
+               ${base_libdir}/netifd/dhcp.script \
+               ${base_libdir}/netifd/utils.sh \
+               ${base_libdir}/netifd/netifd-wireless.sh \
+               ${base_libdir}/netifd/netifd-proto.sh \
+               ${base_libdir}/netifd/proto/dhcp.sh \
+               ${base_libdir}/network/config.sh \
+               ${base_libdir}/functions/network.sh \
                ${@bb.utils.contains('IMAGE_INSTALL', 'base-files ', '', '${sysconfdir}/config/network', d)} \
                ${@bb.utils.contains('COMBINED_FEATURES', 'wifi', '/sbin/wifi', '', d)} \
                "
-- 
2.7.4


