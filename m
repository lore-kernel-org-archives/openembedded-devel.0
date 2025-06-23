Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84581C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:58:28 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.15422.1750669103479141462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NMtdONu+;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32a9e5b6395so32573381fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 01:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750669101; x=1751273901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bszt6tZRRIYzGBMUmGSvDspqX8laO3El/I2dx/4zSSs=;
        b=NMtdONu+CBiOtGqr1oWEi/5HxJTg1d5iAyT9VR978nk9Hq3S02tg4rbc75MzeXon+4
         rZBgaaiErkDuu8OuR629rpSLRbQGJPt7/kzB33VRDn3J1jeexIrkCvcornmmOqnX2/YD
         Ad6uhtS5zu9RvH4zdsGzO+PZmwqZ3g4XC9Nyank1JXFdU2myIygbMLrmiRcaMvVHpaaN
         oMwt8+brp6nh/hjpRN3tJIqXfsMmdd0cHkqgNnEIlVQNRMIbxuexUzuCBYY+LxWXoH77
         mgtfsgNweHWpaxAxs7xfKyyWxWvKRv/sl7eqitghVB9L+dnZVzhFdeUWM3qnHZMLFrD0
         1r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669101; x=1751273901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bszt6tZRRIYzGBMUmGSvDspqX8laO3El/I2dx/4zSSs=;
        b=Gt2wCYwCRBrStQMvOuKMBp67QJcMp3XEjnwjIj/XMdEivsw998BgbwkBvbZKQ+nRX6
         xtyb32ddKY6RkNy50cCZo/gL2KX3CczE7hFQH0WsvsLALVsj9ClTZvQEwQVwMlrxo8MP
         pnfrab3DTNp1j8OMck2jRnSYp/Kjyc/17oJ0AfyRkAWW650mD2Aj2jMqyQPkMHY1NJV8
         Dpy7KmtUfFFWdkKYYIgkK9cR1VcMXAXmKZry+N/IzIdo9Mw0JIZyD5li/0l/hsgvds8g
         CgnslxoFadtDBKEmROVqcRkPyq7q4IjiSoYSSRGhiGmRy6f5+UbgWyPN/tMrXJtNCVb7
         ikjA==
X-Gm-Message-State: AOJu0YyZGUSi6DrlXXjDjNGG4XR+GGqGiw9DeXgrnRlpy3arV4/1dbIe
	yBqpVJCm/Wl87up1QYRAaTXzCwFbmtsL+cdniKia9+UUQEfTB0jEAk3uOlnyAw==
X-Gm-Gg: ASbGncs413hYy4a4YzMHfl6mgXhO4r901w5QVMdke/1o5tA5eo8EuBxkpx/JPdRJp9x
	glhGspjMjKTmxNrmgq1jEEAgdFkcegIQSpjbHq7qyOb2AUR3oKvSKSnsZAplZ75qWQpuakxzLpj
	p9qwZYi23luWnaThGwu853r31wtipHZxZrDNFmpNsiZ2ks+y3GV7ec3YksddUcOAXfxlkDWq99l
	I7md/pcONC2iC692BI+sC1Zm0iLLQDXKu0byjyWz5cx4SjO3/DWWgCh2coPhzc5ECyixGNGmLSH
	7W1mY9Rl1RMI3d2oQhYC+iqnihxAbou0DktacZB28sVCZKbzPzagi80C+Pd46Byqb/40S3oJzMD
	Bw/s=
X-Google-Smtp-Source: AGHT+IE+p771EEXWhBzImOOqjPe/XTKIEtEYe4G5vJHUbB5iXawgUFDszXQXlWMzGEVAKZmHM0TkSA==
X-Received: by 2002:a05:651c:4194:b0:32b:9652:2c36 with SMTP id 38308e7fff4ca-32b98f07812mr23843641fa.24.1750669100611;
        Mon, 23 Jun 2025 01:58:20 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f597aesm13357431fa.8.2025.06.23.01.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:58:19 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCHv2] ace: Fix contains reference to TMPDIR [buildpaths] error
Date: Mon, 23 Jun 2025 11:58:09 +0300
Message-ID: <20250623085809.30954-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118064

- The project uses CCFLAGS instead of CXXFLAGS to add C++ compiler flags.
Assign the value of CXXFLAGS to the CCFLAGS variable and export CCFLAGS for use in the build environment.
It fixes the contains reference TMPDIR because DEBUG_PREFIX_MAP is already included in CXXFLAGS (poky/meta/conf/bitbake.conf)

- Fix typo -Wnodeprecated-declarations -> -Wno-deprecated-declarations

ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Compression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_ETCL_Parser.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_ETCL.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Monitor_Control.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_RLECompression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
Suggested-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index b730b0a86c..35252c3efc 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -26,8 +26,10 @@ export ACE_ROOT = "${UNPACKDIR}/ACE_wrappers"
 
 inherit pkgconfig
 
-CXXFLAGS:append = " -fpermissive -Wnodeprecated-declarations"
+CXXFLAGS:append = " -fpermissive -Wno-deprecated-declarations"
 CXX:append = " -ffile-prefix-map=${UNPACKDIR}= "
+export CCFLAGS = "${CXXFLAGS}"
+
 EXTRA_OEMAKE += "INSTALL_LIB=${baselib} install_rpath=0"
 
 do_install() {
-- 
2.43.0


