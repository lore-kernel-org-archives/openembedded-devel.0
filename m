Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8211.1795739714302933582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=taK9FZ+0;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15984830eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739714; x=1796344514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTi7tXHAOhwQ7N5t17NyOUXNZ6ByiKmPDZ/4FqooUvQ=;
        b=taK9FZ+0eauA1S+ldQubD3FvihUjqFUzYQ8WHKELFjOHFs9cuMjptogOR0JGK6JrFt
         e6XPal+LsFf/LpAwFEFh2rWCyOodIjeZcBFRjx7vI3JOfRjz5QLQDBEuUv6P/rHUTa/U
         Wn1/AZT0LNrq6Xu3eJFrbyNwl/djt/uifxNInFMAsXvRGuFQ70/VogVK77+eS35eWmqJ
         AAT0WLWRk6ocm6RTKvDeei1JjKJwyB4275d8xZYMPtVkpj8u3kORT5BTDvmsPTynlGmA
         ui6QXyxZ/riD2JlaM0fflbjZxBMWL8ebylYtuuiB8Dl/GcQj10GX86U5DH2EhZ/P867e
         pxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739714; x=1796344514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTi7tXHAOhwQ7N5t17NyOUXNZ6ByiKmPDZ/4FqooUvQ=;
        b=qUOnOoghxmn8DygSkL0l/a9ARsJw35bXY2eAIKusR3ChFnow82vYOMLyzUgQIDhSRX
         yKfOJ+gx6TW0AboH6vYJfMrJjOC/6unhqbxeD4UsPtbkA+av4tfrXyDKqu8k5x/dypwm
         Lud0O7bAF1t2C+xRJgyWOWrp13MygZ310771rnYkgJsx5Mt884tyJY0Nn6HUKizLmtEe
         50FSCYTHIZR2uW4IbNpi3/WglXtVor75SRqkrd8swIInqJ4q7g0DH1KkswUu/75+GeR1
         Z97JWm0jHF2VkNeTeaK3dK7SBMtfuRRc/5WxwiNP5pXoSLkC7Sytv/TJTbZ8cOzpdY1u
         /Rvg==
X-Gm-Message-State: APuU4Z+Q5P5A2SHhFNP3zlSO5MDSVhi5OEsVe61Zc691RIZeDVk/K61n
	KGDvK/GH3kdNqFFjRctdIY6HlJ06Gso2Qdb51Q246vcbJuywixLWD7xUy20GjFuY
X-Gm-Gg: AZFdTZdM/CcQsT9KknDEjgSsNKAug+ciVRfiOyFWJiXXArKKxlmR+0xV7SaXM+Ha/vE
	4e8XAocbOYXFdZgkaNKapAsk8j/30L96+LByha3IeoON6UDoV7lxP4HrzdVKMlRAItmUtgHEC/B
	jFzmypdwMM+yJ0Emol8JvR0uU4QnDyRoU+HvJYTd9r9VoatyBv5o5BoHRjTiRmft9kEfsv+C/uR
	T9zfmH68VwY6Pqvzs5ldhXtQo3yslK+91JmU1kUEuRk/EamWLC4crtz+QEPhLY3fUH1HY8k5NFa
	BMtyFGYrwcx/3Kr2lcWquhrDJfxu7SQGddKreMKB5qIMphYfYqzCshDKmKtDs2+D1DVOYOZSTzg
	WPB8btbnzPEoOGXwWxop7ycbNmqjpyGGAJF52xLm1JzW6a0/+3yMqWSBLPxV1TzUBPo5f+1XTle
	AHGeZ4LPQ3O0b1DAwXjKTFd1Lsv7fF8UbZGhIBoCg8kGHVbXgoUQc/wbz0AenJ70gsmfczFfIR/
	JZ5QhoDe007T/CkU5D3LmuxShP3FRXFtbso2Efn9nWT1vd6V/YFdS9wTCZ5/fFkzWBKuXb/HQSm
	eQ8JP3I55fffro5coHiaYIisZcmmaRkTm3RxQBagYGwb0uAajNbj8XR6B/+QhBJhzSIHez8Xq9m
	SXQdpyju1W0ryvNO9e8QAdmjd7lDFyAoj6hs+ONKSDzbMs3TyCuYkd2ObJ2HMjf+47fSBfBY2qC
	hie7yC3PX8UAxkL8sNeMK3KZPrmqyQuYGK/zR9oWYuKmJWGyjqImpwH91tLJkDdS10mZCrZmcW7
	YOi2ikkMXtSsgDlImAfeJ7Y64C3XrR6wiYacGgOa0SVvtCGYJ6k9BuLK1M9Rm3mX9YWxLPFaYTM
	yKuV
X-Received: by 2002:a05:7300:d941:b0:381:3a24:1be2 with SMTP id 5a478bee46e88-3856fd5d566mr24439789eec.13.1795739713719;
        Thu, 26 Nov 2026 16:35:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 42/69] libmad: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:58 -0800
Message-ID: <20261127003425.2166632-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133142
Content-Type: text/plain; charset="utf-8"

downloads.sourceforge.net has no directory listing, so the check found
nothing. Check the SourceForge libmad files page and match its version
directories.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 0f89574b9a..9f20cb5408 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -23,6 +23,9 @@ SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler
 
 SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libmad/"
+UPSTREAM_CHECK_REGEX = "libmad/(?P<pver>\d+(\.\d+)+[a-z]?)/$"
+
 CVE_PRODUCT:append = " mad_libmad"
 
 S = "${UNPACKDIR}/libmad-${PV}"
