Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCA310A62DE
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48356.1774534346714114204
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=keJ3eHMh;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439d8df7620so726259f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534345; x=1775139145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=keJ3eHMhn/MS5XStqPPHTBzLQ6pOkUo0y+AJUpSkqNFBPsKor3XqAYF1+xWtxzYr7z
         E5gjG0bzzTp+B71JevGhkx6qYLBuoQ/t6iYiJjSfeH+JQDlWJ9dc04lXsWrwVg69P+Ts
         F+EMQwH4HmziPkyPS9HdfqFe0x076esfkN74RV/x40DvyqEumeKQcOGJS7g1x0fQIF/w
         gxyOna9yV0VsAD4NCw8Rqiy20o5GVw+jwejhrSYd8DvS+dZ042kcasLxVOcpnxJ/UnX5
         kVO8FSNwah/GJxhWgy1/+WNWVk31lGsDHNVro/uGIpdguROyBKKCp2xsDnuqzRHy8hbY
         I53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534345; x=1775139145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=dcbIfPgB6uNKpL1l8oW7AIGWWdgoWpvjk77dvD2X9e3ONPv3QIYvfPOmprnqYT1VUT
         Weq00evRirBaOqk9NuF0RifTBoY9qVei9+HIfk7nkFvtPuooUHKhQl03iEP8yFtbyi5G
         Bub6m0PwSzF2PAYGIZdv0mSLhdlvkc7gy6AnxyL1Ij8xAVvzl0NooYGyEstqukM5YMuF
         2Q28bsgkF7dTQ38quHozTkEJcqmPTCyTYPoh7w14xQOZOY6lnMxsYZh0EkTtDFKcJXnt
         V/GFpUapNA9uRtKMgUDb5Yaz94KO8J1gNxw04rbjCjYsI8QUgpS+OQQRxdI6+JRcRKVg
         Gu6Q==
X-Gm-Message-State: AOJu0Yy85ptRc+1VK3h9QC3ayskKJOY7jwzGLOl4yl8vSKbo/lNRBABr
	jsTVt8JAtjD3G9SD8Le/y+QSGYOv5go5aE2Spl4mek2TjAESj7JxSzKtSUdfnw==
X-Gm-Gg: ATEYQzzLS2L7RToOYdKYRZFwYBAXQp9CxbcMnsVFYhm7DoIWrjEuQtUTy0qBrv8UA1f
	IXKRAf3cTJkOl8Y1inyWTSHH923fGpI9qvGRt3zfvAGwmzFMDvYHKMu75r7HYz4PSiiqva6B9TU
	ZTzqb9QZ5/v1GnbfRDDXLZZU+0igfxOaRs/57lTwvB87uvonbEIyXfUmUaSXTJFcDxWKThxXP8z
	kaXQkE071sv/0BlosjZARRpvvbatyXv7o1GT3iev6joY+UwvWrsbr5Vy1L/9NTTekuIrgVfctrw
	qKIb9l6hS7UOfImaapbVh1S4f573ZuOdwmCrVtshE2QuQgK4SW1Sq1emDGJV915+4N07K39/Sr6
	91VirWGbquLDrgMQvWKA00ARX1+K8hEEhz/p72LUoacXdI4zgVh8Ok9PboPHhxpt7VCs7dVKPA5
	/ADMxG9v7L2xY26fvHEcoy++pM
X-Received: by 2002:a5d:5f47:0:b0:439:bcdb:95a8 with SMTP id ffacd0b85a97d-43b887efa63mr11777576f8f.0.1774534344542;
        Thu, 26 Mar 2026 07:12:24 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 08/12] boost: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:12:08 +0100
Message-ID: <20260326141213.2081121-9-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125730

PYTHON_DIR now contains PYTHON_ABI, fix the settings accordingly.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 64a57ddfb2..7b02ed4282 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -174,7 +174,7 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		echo "using python : ${PYTHON_MAINVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then
-- 
2.53.0


