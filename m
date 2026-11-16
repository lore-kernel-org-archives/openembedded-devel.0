Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22467.1794808956969709414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=F5D5mY7h;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37071c0f42aso4512558eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808956; x=1795413756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPDMS2PdcB8miH9QQ4A2KlgwdGE1BzA9Ge/jRBzqEb8=;
        b=F5D5mY7hqt+J7bcnVVKNrF+8y+eR4Y3WuLcjb8ZxovO4Gzn44rLIAM296ljIAkQi5U
         MLljxvqjhFBjzDs4fZ85Iwi9KM0YR8hnHJRFsB//YamZFuceHoPKetpdnxryAG0gfMxX
         Zofhfucu4Cb4xILOltQQC/K6zuL2sBlar93HTjHLD2/ICuXK+tkCy8KU2QssauaRc17f
         AtOxne4wrQ6X6GmpCmvtZZXY+JBJ7Z0IfCq4cwPnk9FvCo6+df6q3yMtsR3C9RfyAYzs
         45i4Pk6dyio9yqTWpG0C/5nCdEPMm3V5M78Hp+rTFaskR1ar73gYZkMAXIFWflY8UmrE
         LeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808956; x=1795413756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPDMS2PdcB8miH9QQ4A2KlgwdGE1BzA9Ge/jRBzqEb8=;
        b=OI3R+ZAjVKSjR4/R82KqDl859nYvguZxNSofG05BG87nxsCrpOsu1UFqRj64GjAPVN
         mDvmoLpZ3HDIT0h5XrZZtE4tTTdiwSJGiK7SKlTwBs6jZL5xj2zRUVmhucHUUFZ5q37A
         OFfAakSybxACW2oJMqvuPPKmSDQEJvvA+upkYfirLASTM8msQ563sMmDt6lUClvUu5Vo
         s+BT9YFX+HuiP9DTa/FknXXoXEQJaWup29YPgpeigPqSEM/izaKm0chWbzOwwyYQUGDK
         +QTo2WFMW4UkeeHs3zlPLT+aW3zwMEw6vSKtohF53AOIOWZuwD7x3iuyc6hawLKCeHP1
         JD8Q==
X-Gm-Message-State: APuU4Z83f6X0HFQJ3zvhAs8XKmb44ldhVstOGWGDRBlD+L+Hm6DyYB+A
	DNS5PlUCv1LUAP8/UCD9oddRTdLihJPO4IkD6y1OPlQpzTMP/kWeLOq5ti4fiIFf
X-Gm-Gg: AYBFou1rIHOSutAbVL3/YRtzHqA//IIQNRDVwttBVPZ830XgB7vZXCeQxAGhkhvGSYa
	xAwyg4chZ9XlSyUAp3vqfiwe8NcwURwjI0KKBjxz7LOc2Ex8ApnbsRbOTinVPF48TVI1QuuEcgm
	ZraHUTCF8BDzEJG65MyLULbocxgrI+09+LOWjQLZ+CVLVlJGKINcrKu4VkdXs4Pr4SSc80lB40W
	xqRCBGi37mZ8QPZocyiJI5Lf+V4Zidsx8H589dqItl48i7NP+7CDUhaDhOp0PQeQf9YXj2lm5zq
	UiHOZQR8NRZKZhaAzJv1TF8+9LFWSuK2N858wdhXWbjkizCmNMLknvYTLxbene7MAU54YmI5Evt
	fkK0XFn5iMa8dpUGFSsQtNsZF9xmMp1PlsfLdZhj39+ldV7YwSy6AeORnHPoW2gn6KNhGD2e3QJ
	Pd8v8ANFMYr4KtgIzZgmG1awDqfoq+QEeA0tt25ysLNdBsn2yTjB/s8ZOhFtkrSvVOcJKp1cmvA
	T+lLfdh5c/4wpK3TTSAOOJgRdCHnjKgc+KfGfjkz07TJFJIPIepQgk0sjo5z2YTGgxwiiONUL4b
	yDA9xQyRIUz9nM6M+1dhigaoKJkXzswAM1g8+KlVF89SUal6OwzB7VPodlMPqLnKsuDCc/7iOuB
	xqmKiGfJxAFzTPJbc9eOxZiwPXGwVlIsCW6dcCFJSsDvcXQyLWID2pH0mlqh1tncxn6ubHqG6/b
	RFn1If00yTYgJEvMEq6wP0Y0jQ/XHshGb7hzlDdTCjSQkwvphLoaEwNr+yHRU2rungA3gH6Xonq
	qeLxj/FnwxqW2pU3WSCJPwAdKwdHspQqnXSl9865lxyeIdzBdnEBxK28LHtqx3+VS0+pIPcFkPr
	dYj0qdSSeR0d1IYOCThlL6DH3A==
X-Received: by 2002:a05:7300:e9d4:10b0:37f:e673:1a8d with SMTP id 5a478bee46e88-37fe6731ff0mr1140046eec.7.1794808956269;
        Sun, 15 Nov 2026 22:02:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 22/30] swagger-ui: upgrade 5.34.1 -> 5.35.0
Date: Sun, 15 Nov 2026 22:02:00 -0800
Message-ID: <20261116060209.2916444-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132420
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../swagger-ui/{swagger-ui_5.34.1.bb => swagger-ui_5.35.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.34.1.bb => swagger-ui_5.35.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.0.bb
index 48b8e99fe1..df5c8a602c 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"

-SRCREV = "d3296954a6b813898d298815ac3e68daa1cf7408"
+SRCREV = "bc207af2a9c79d33f8af1899555f3e4ec67fbf89"

 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"

