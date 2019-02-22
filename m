Return-Path: <tuanha@viosoft.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6D47CABF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 02:10:58 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id v21so329006pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 18:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viosoft-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=5aoc7ad1rCtTMEEVyMP/Ni2qsn2q1cgh1zdFAWXBrdA=;
	b=A/QB+SM8nhqYtCLkm6M7Sq0cD4hnGaBq+S1BGjMWX4YJ0D87+796LIl5Ckj2mO9FTy
	xG7elvahhvWOOG0emmMTALONLpMZGSrsTDVBLORGsw8/QLelHX9pdy7bF1/FAN4PUR1q
	g8mr8XFG6HsplNQRsD4bNme5B8vwl0tIDd+gxBh7JOx/3I0QZE6gDms6qe3eEe8hQfZ6
	aE64MNJa5H9MOMrN01ugDTN/bjlrvKCR2X3L4leFKmS8MlzE5CQDA25yiG0SJkczzur/
	ULINSqK1XQ/4G4MmHnnTvElMmm2k5Hvg1WeAROpyEh2MdNhzL07rU93334qZzDFWZYSf
	HX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=5aoc7ad1rCtTMEEVyMP/Ni2qsn2q1cgh1zdFAWXBrdA=;
	b=lQXaaPNsByUdJDGv3hxmLUSxmUmXoGkelMrYXsfEzBcL7uzzmJtS+o1v4H+UkZuJrR
	fhohSPt7/OK4NkvNYnRxA8GAgWINlZMqfowXj9+KwPCdcxhDbseLdjIi2IXcL6vl8iDp
	cE9VlApRH2y1J+yzAwdpsjxvXxnX+9T1HOkOTPnGk+EKlSxlpphNyIEbgwBOLhZg2757
	8/gnY8rDxlBzL89QsZoarWraHfztwaPx5+TqmcDMyX9mKlTl9U2ViPCYgSpvgbi8kSoV
	J/bLFS3Jr/qtviWwizqnQ6vuDAHRcIzti87nbwYO5WTW8AzNaBiGULdFutAH7pjaCMMj
	yyFw==
X-Gm-Message-State: AHQUAuYWof7LQFkK++nYlGOB02FEyYnpkBPVY9tVcyrbeMU+XUV3B+0C
	kXaYUda7KSnEXxFDi5PU7eCOsX1ut1pOQw==
X-Google-Smtp-Source: AHgI3IZoUuJoQ7VPnqzhG0+F36bWdOHy9wmYnH0wbee3kuoWpG3/DxGdKV6vQKl+RcvZEjshqadJGQ==
X-Received: by 2002:a63:6bc9:: with SMTP id g192mr1605129pgc.198.1550801458814;
	Thu, 21 Feb 2019 18:10:58 -0800 (PST)
Received: from [192.168.100.8] ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id j9sm135376pfc.67.2019.02.21.18.10.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 18:10:57 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Hoang Anh Tuan <tuanha@viosoft.com>
Message-ID: <35f095b0-e865-3794-e16f-f7d7ca17c770@viosoft.com>
Date: Fri, 22 Feb 2019 09:10:55 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] [PATCH 1/2] tk_8.6.9: Add tkConfig.sh in crossscript
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
X-List-Received-Date: Fri, 22 Feb 2019 02:10:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


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


