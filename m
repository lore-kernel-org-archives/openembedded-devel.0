Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 44BD077CDB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 10:50:02 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id y128so22017343qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LIBqm3mwuzP+jxp6mterYZwqp7wO/UYArW0Q9dgKcBE=;
	b=QI6gSPYCGUNbw0WFABv4UA7Vb/pMDJ1xvPfA4dAoLiZmVsEYx60QrP2ETrnHzK+4Y9
	KS81szJ4UqgCkeIREf15Eqkqad7zaKPvP40BCY+8AKiaHq21ovK7mXbYwHvIhAwe7kE9
	I11F/R13UuPnOSbQ85JYxD658y4QcvzDmHT7S8m4F79S2MLcZdGQYvF6kkg+cd7k3EXK
	Nassrv25z+kzABSS99SZ+HQXORVQTfUbMNEa3ViqHmW4cDN0T6OaRSUpOOgKviI/MBdj
	/ebnGpSnPKGYzMOr+CBAXIMP0UcCx/iCTQBhmvGuBIpvRke1e4iF1LeJ8wKvLL3n00xw
	Iqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LIBqm3mwuzP+jxp6mterYZwqp7wO/UYArW0Q9dgKcBE=;
	b=SWLghABv3GIuztxxWworJc5BAv87/IG08e7A8FZXBkcgpM1E8m/nzsosvbXiYDI8gr
	uxWAuAW1lKjZL+f3eH9Z5vTmxh7+7LOydSB/tSW10Oarn4TkBjEkpZv43W0g73Nrmt/x
	lidPSb73RSME1Gkj4pU96maSAL7Lo/SACkEG/gUo8OmGh19ygYVr1Qy8P98UJvQYK/XM
	xyi086HpxlTNlUtVYtcH72InMleBaxfbBST9lvw9RFa7SRoanUZ2vndpJMn+DkgGM0K/
	P+t58if5+sAzOQFA/tkrAnop102PB+hrdNe6HRjEQZ4G28hGW7uzJngkYTdGisIYMS2O
	EPGA==
X-Gm-Message-State: AODbwcBqdbmB7m+mo7aneF8iQt+TjWWw8lpI/Tk8oEVs2ljin1UAaIIU
	1hKm822YTCGXlw==
X-Received: by 10.80.177.86 with SMTP id l22mr8327337edd.45.1494931804069;
	Tue, 16 May 2017 03:50:04 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.218])
	by smtp.gmail.com with ESMTPSA id w11sm685464eda.63.2017.05.16.03.50.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 03:50:02 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 12:49:56 +0200
Message-Id: <1494931796-11721-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] xerces-c: fix a wrong PACKAGECONFIG option
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
X-List-Received-Date: Tue, 16 May 2017 10:50:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In xerces-c's configure, these options is being referred as follows:
......
    curl_flags="-I$with_curl/include"
    curl_libs="-L$with_curl/lib -lcurl"

    icu_flags="-I$with_icu/include"
    icu_libs="-L$with_icu/lib -licuuc -licudata"
......

so they shouldn't be set to ${STAGING_DIR}, use
${STAGING_DIR_TARGET}/usr instead.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index b848b06..3bcedd7 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8
 inherit autotools
 
 PACKAGECONFIG ??= "curl icu"
-PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
-PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
+PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TARGET}/usr,--with-curl=no,curl"
+PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARGET}/usr,--with-icu=no,icu"
 
 do_install_prepend () {
     sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
-- 
2.7.4


