Return-Path: <tuanha@viosoft.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 26E6B7CBCF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2019 03:56:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y4so1960941pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viosoft-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=uMuMowTSCcQA7Y/OmEXt4hqyiZQfrqxiyC9jIt83tUw=;
	b=OuWHD34V6LjvH0TkJYe0vgV17VU6raicaWMThcxv+w8gxROSO5QQHyh8TbTKs9/B2u
	DoshpUNHyRWpqAwEDqVijL1jT+un+K1IDi/nVIBqtfY+fJgbKRUnQOx0FzVvsQ4OUUhN
	/lekBVk+1QBSX9iXkHQ397sFL95HnTDtIVhgBO6Yj7ukK7NUgnSACfsJ88tY7yuVYYdt
	+GNJ7rnwv07/O11krt1xHi0eDF2N/5/Tcmvh6fxtQ7JCtxTU56/o8/rAo4PZge8S7Yyl
	Kdu2W4zF8suPBJarr2muvEAKIJxLHKYGncXJF9wWK/PuYRcWh5WFMyfWTnuTJAMpzmSh
	eHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=uMuMowTSCcQA7Y/OmEXt4hqyiZQfrqxiyC9jIt83tUw=;
	b=MH2/hSpFXAhj+Ej/a0g0Jn8N3zsz5Kv1CSrU82j3Nuy2MPCW/AtKrG3e7nuQno3/qi
	Xy9V0RVcF6CroY7CFet4aXKA+1+SekZIWpTVEIVbNtvr7yIfcDpjSu6f6EOjepAfkwPA
	BbQTMBTVJvBqvKEWAmtC4NdNS5JSkXg1wBpSnpmBn8hsqEyMQdR/S6Z6PTjHC+p0PEJS
	WUpmIB/ydKzf0ywfs/cm6NPTwBbtIUOxaJWQ4jDLK2eeYw+u+AKcrdtsBmtF3fq7mwiT
	z6m+GgoNgBvIIzn/kGUUDhD79pS1VOPOfq0KCY1h4jy+l1da0/Os+IL8nGSAuWImiRdG
	NjIA==
X-Gm-Message-State: AHQUAuYjtLPgu7mGZtqnMuKZYK0LseFrdPDDr20ZoWxuu/gW3YNph6HM
	gS/Zojfv9du0ZtsDP+MGGDlToghLdBb5XA==
X-Google-Smtp-Source: AHgI3IYVMkeKKWGwGYDimTTQIL03zfL7ZeEQbU1UR44MEeAys20xSBD/ypRaKt/EkPzpjyYYJEhDlQ==
X-Received: by 2002:a63:e447:: with SMTP id i7mr7149216pgk.70.1550894182613;
	Fri, 22 Feb 2019 19:56:22 -0800 (PST)
Received: from [192.168.100.8] ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id
	g67sm7688271pfg.13.2019.02.22.19.56.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 19:56:21 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Hoang Anh Tuan <tuanha@viosoft.com>
Message-ID: <830a09f3-5527-799e-d2f8-f296899ff382@viosoft.com>
Date: Sat, 23 Feb 2019 10:56:19 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] tk_8.6.9: Add tkConfig.sh in crossscript
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
X-List-Received-Date: Sat, 23 Feb 2019 03:56:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
  meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb | 25 +++++++++++++++++++++++++
  1 file changed, 25 insertions(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb 
b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
index 9eec4bb..459ae82 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
@@ -50,6 +50,11 @@ do_install_append() {
      ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
      oe_libinstall -so libtk${VER} ${D}${libdir}
      ln -sf wish${VER} ${D}${bindir}/wish
+
+    sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
+    sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tkConfig.sh
+    install -d ${D}${bindir_crossscripts}
+    install -m 0755 tkConfig.sh ${D}${bindir_crossscripts}
  }

  PACKAGECONFIG ??= "xft"
@@ -69,3 +74,23 @@ BBCLASSEXTEND = "native nativesdk"

  # Fix the path in sstate
  SSTATE_SCAN_FILES += "*Config.sh"
+
+inherit binconfig
+
+SYSROOT_DIRS += "${bindir_crossscripts}"
+
+# Fix some paths that might be used by Tcl extensions
+BINCONFIG_GLOB = "*Config.sh"
+
+# Cleanup host path from ${libdir}/tclConfig.sh and remove the
+# ${bindir_crossscripts}/tclConfig.sh from target
+PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
+tcl_package_preprocess() {
+        sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
+               -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
+               -e "s;${STAGING_INCDIR};${includedir};g" \
+               -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+               ${PKGD}${libdir}/tkConfig.sh
+
+        rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh
+}
-- 
2.7.4

-- 

