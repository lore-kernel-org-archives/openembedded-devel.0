Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id E22F2782A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:35:58 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k8-v6so3636409pli.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oZ8/v25/1K8q8CtV5HOG08iWXf4o9KZfULP2xGh3GYw=;
	b=SBWobm5mp76KQmC9dRImJ8191mLbZk2NkqZkM3w1v8tR2AA7nLHhPax0GvTMLiLErj
	fCw4HWoj0qwJdN0hI82dDPIkynm8ZGWCEE0e7d3UJ5L1l2q7c94IufImj7h787kEe+MN
	fkf99Px7+4BJqX1cMwSCDqxgx6qVHn4G26/aweHk3oMjf5TcvM+2Rn9ZBjvbX72Fhl51
	AR21mERqbg2bwy+leXuD1/Iy+NnmcJvh67wbi224YClIiWedCVEaX+OCGNAqR2cBw5YG
	BA+lqk8Voeu43IsBO0hMoT+y3x2FIJrJrdaS61lfGqeEjnJa7oNcTRViSyZFOdbkXYG+
	xkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oZ8/v25/1K8q8CtV5HOG08iWXf4o9KZfULP2xGh3GYw=;
	b=pjD5+cJmu5AU47rqzeKveE0/toRqAIsKaekQ81oBLznaYRggDr3pPzDS5lFuGPzYoV
	451zOObkzx0wDAMjkc3qKfPNESxCgJv1W+blTtMmguiO2LzhgfQa5pDAQ+gJ7F0q7Reh
	PxBzkBll/scffm/m38kLR1lN4kzYGgf4SjBLHeD/6+QvMRoL7VSM1c8e8VAOO8YYBOI+
	++n3/pnODAjFLnVs9f4bvtsTDUP6w+Sh3pLP1FynLcEVDrrW2SNMtODEy45HJ+Lgs2yc
	n5YuknBKFpuptRP4EE9VuZIGSQYGa/7Dj6AR0dS2equ+JS1iLOwGTUnSmZGPxTWGaxyn
	av+Q==
X-Gm-Message-State: APf1xPAsEq9/whDHdsL7K9SzRRhTEid3sRlZrMmsVrA8shfbSqA7qW/X
	X2SEbRPWdJWRJAFUG5Ji3/MObm+Z
X-Google-Smtp-Source: AG47ELvAaJUW8CRapbO1V93J9wby70z5hJgJ6IraUPsKQ/tRUnxrIVcVqI3XkwvWrERJnb09H04aBw==
X-Received: by 2002:a17:902:b58e:: with SMTP id
	a14-v6mr1919194pls.76.1519911359977; 
	Thu, 01 Mar 2018 05:35:59 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	b6sm9853743pfm.160.2018.03.01.05.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Mar 2018 05:35:59 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 19:05:50 +0530
Message-Id: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-openwrt][PATCH 1/5] openwrt-lua: remove hardcoded 'lib' string to a generic value CMAKE_INSTALL_LIBDIR
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
X-List-Received-Date: Thu, 01 Mar 2018 13:35:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This solves a bunch of below errors and warnings when the libdir is /usr/lib64 for
64bit machine or in multilib environment:

The libubox warning:
-- snip --
WARNING: libubox-2.0.0+gitAUTOINC+96305a3caf-r0 do_package: QA Issue: libubox: Files/directories were installed but not shipped in any package: /usr/lib/lua/5.1/uloop.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libubox: 1 installed and not shipped files. [installed-vs-shipped]
-- snip --

The ubox recipe fails with below errors:

-- snip --
.../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavista-linux/../../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-linux/7.2.0/ld: cannot find -lubus collect2: error: ld returned 1 exit status
-- snip --

-- snip --
| ../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavista-linux/../../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-linux/7.2.0/ld: cannot find -luci
| collect2: error: ld returned 1 exit status
-- snip --

-- snip --
WARNING: ubox-git-r0 do_package: QA Issue: ubox: Files/directories were installed but not shipped in any package: /usr/lib/libvalidate.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or
delete them within do_install.
ubox: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: ubox-git-r0 do_package_qa: QA Issue: /usr/sbin/validate_data contained in package ubox requires libvalidate.so()(64bit), but no providers found in RDEPENDS_ubox? [file-rdeps]
WARNING: ubox-git-r0 do_package_qa: QA Issue: ubox-dbg: found library in wrong location: /usr/lib/.debug/libvalidate.so [libdir]
ERROR: ubox-git-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: ubox-git-r0 do_package_qa: Function failed: do_package_qa
-- snip --

The ubus build fails with below error:
-- snip --
ERROR: ubus-git-r0 do_package_qa: QA Issue: /usr/bin/ubus contained in package ubus requires libubus.so()(64bit), but no providers found in RDEPENDS_ubus? [file-rdeps]
WARNING: ubus-git-r0 do_package_qa: QA Issue: ubus-dbg: found library in wrong location: /usr/lib/.debug/libubus.so [libdir]
ERROR: ubus-git-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: ubus-git-r0 do_package_qa: Function failed: do_package_qa
-- snip --

-- snip --
WARNING: ubus-git-r0 do_package: QA Issue: ubus: Files/directories were installed but not shipped in any package: /usr/lib/lua/5.1/ubus.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
ubus: 1 installed and not shipped files. [installed-vs-shipped]
-- snip --

The netifd recipe fails with below error:

-- snip --
| cp: target ‘.../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/’ is not a directory
| WARNING: .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/temp/run.do_install.27647:1 exit 1 from 'cp -dR --preserve=mode,links .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/git/scripts/* .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/'
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 classes/openwrt-lua.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/classes/openwrt-lua.bbclass b/classes/openwrt-lua.bbclass
index 793f363..d67ff58 100644
--- a/classes/openwrt-lua.bbclass
+++ b/classes/openwrt-lua.bbclass
@@ -4,7 +4,7 @@
 # for the terms.
 
 OECMAKE_C_FLAGS += "-DLUA_COMPAT_5_1"
-EXTRA_OECMAKE += "-DLUAPATH=/usr/lib/lua/5.1"
+EXTRA_OECMAKE += "-DLUAPATH=${libdir}/lua/5.1"
 
 FILES_${PN}  += "${libdir}/* ${datadir}/lua/5.*/"
 FILES_${PN}-dbg  += "${libdir}/lua/5.*/.debug"
@@ -12,3 +12,12 @@ FILES_${PN}-dbg  += "${libdir}/lua/5.*/.debug"
 DEPENDS += "lua5.1-native"
 OECMAKE_C_FLAGS += "-I${STAGING_INCDIR}/lua5.1"
 CFLAGS += "-I${STAGING_INCDIR}/lua5.1"
+
+do_configure_prepend () {
+    if [ -e "${S}/CMakeLists.txt" ] ; then
+        sed -i -e \
+	"s:ARCHIVE DESTINATION lib:ARCHIVE DESTINATION \${CMAKE_INSTALL_LIBDIR}:g" \
+	-e "s:LIBRARY DESTINATION lib:LIBRARY DESTINATION \${CMAKE_INSTALL_LIBDIR}:g" \
+	${S}/CMakeLists.txt
+    fi
+}
-- 
2.7.4


