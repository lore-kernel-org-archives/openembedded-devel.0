Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22038.1794808941017295030
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H98zdBhb;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e795af1d4so2197793eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808940; x=1795413740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIoywkcL5Bo5yWmyqB2o110L1S1/CPqPXUALky0YawU=;
        b=H98zdBhbg4aV6HKsQYIe1YkI2AV6p0UYlXQFxckuCUkrQadi9Po2kvIX2PNjhkybRJ
         2y5aPfog39yD168S2EKecjoA4VYAz6RYgNkGUO1/hmp1+YwXSwRPjGOxe68PPzU8xgW1
         yMDwxtLTYD/tkixP++t761B7RWgRx6on2AK5lPqpyKqaEV55o1FDp/ZuRpjzgjBTkb77
         OGA/XhPcCHUhJ7+wsqhOb/uHennO43bLCis+9z3idjTTYJGrFHk/KSViaPrU6vMx3B3z
         K7ya9Bka9ClFGL5DsEYGHFCEy/ISh6OH9wNHsFNmySYbWh3LcTuF0CCW44OjjFlvHtih
         cCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808940; x=1795413740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIoywkcL5Bo5yWmyqB2o110L1S1/CPqPXUALky0YawU=;
        b=bFLU0S+Mjj6ZcUYxL88B7P76YmQZFz5QaQVFauV1EuH0GKQYE4wNwgJjI/TiGe1gUC
         WpnQoSVJiS6lUz+JU4qDOFv+6hB7EfZpLspgotPaCy8a+e8V7XStEE9CXw7N15IWqcyK
         JIlJ1gJG/qsIpC5/NmsZciXxKyxn5vpBa7Zi49ZCOy3xwjg8Ye6x33qKvZhIGyJcFcpi
         OubMRtRVsSAyHtqdYZ8xNR0qoOl5/BVreBSv/d+VjYdGQHLAg3X1qkLovzs4fFsooiWD
         5QIe53/l9LRNHKjsn7gJ9wqkFNbBuSSY2tE+Kqd+7lJYu8f5cWAXhrhKgm2RJU7k84Zp
         YCDw==
X-Gm-Message-State: APuU4Z8lqYPaFkytfeSecs1A6AEIZFSxanc1cVG3anpDCZL/3azgkg4e
	oFISivlbaG1klJHxiKdHYnIl7auwqFmP7HGmpO8PxDcfrJ9N6KK9ulslE4Z0Q3Rq
X-Gm-Gg: AYBFou2Ai9r0TQPxXchGcZjyS3LeizTsTxoMkAAriLQDO7gvslUmSfpYJnMJM6yOLT1
	D8Y3IA1U/TMxV5xu3QudUOxAzTXKVKrY2fQqsEuDen2VP/55QtwLgRQAq7fGQvswjElYiI3TxqT
	GpYa0NEoI1lZUujdmJVGf46D7nlqWQ+upCF/JqWDKJm0OAivbyhh5uuZxlGkJxbmKX+iilSGOZJ
	pMg7yK6c4RK21u6WDC3XVY1O3I1WdOlv+sqXYqO38aGEHETEc9LQxc89iI0KOnYsNosMSUzCfXO
	fnsTI+mjmTfXWGDwucebMDfDOsvzIddZU+avXWBsqw7B0pXQpQhvbYipR871dRowDzydQn+L22L
	VQuc6H0/3i0T9pG1lOrQ5oCXjCsm0f+kNisF+qqCyYwIjitJwAZZPL92R6vXt/3U+rKAcqb3Fo7
	+ZlQXK91y80W9gNyxhrE09NZAMmzcwfCeGjXUWwjiEB30DBE1BQ/l4s1r9Zu76HuwVIvL4Xux32
	oUqqesWUNHDUYnQMdFC4CRpT6vLns8hk3+t48n0WTOv3IBhzJlVwfJcHf06DfJc2Xa2Mu+sFhnw
	Wo1YNko/KS0tvVn56w9XnUrCXeT0WHA4F3relntUJUcXS7HKv15b35wWROLo/5B4w4Jn3ti66cD
	nw8GeswIZ+iY5zArYIq8443Z4Qp+umZ2oYCaQT75bi9B5OonI5/TbNF4zu8ZieQq8tKCBvyyun7
	aWJ1IsHRIEiC1eFyYvnCGv383pGFxOlY4wNP6kMV+RBraEqQBmHCLTJ2LdwLAe3xh9520qUH3fC
	VaKCNTzvO/8jUMHI22yXw4xRxQ6wGgyHBdw5N6Ewv2jzmX7bbgYj+Z7H7M4dxce2ErVXQ5IAYhq
	Upw+m5UZvL3LQnMBeJu/gDCfLA==
X-Received: by 2002:a05:7300:c38f:b0:36a:79cd:12df with SMTP id 5a478bee46e88-3796676ad9cmr9136230eec.9.1794808940245;
        Sun, 15 Nov 2026 22:02:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 08/30] liberror-perl: upgrade 0.17030 -> 0.17031
Date: Sun, 15 Nov 2026 22:01:46 -0800
Message-ID: <20261116060209.2916444-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132406
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{liberror-perl_0.17030.bb => liberror-perl_0.17031.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/liberror/{liberror-perl_0.17030.bb => liberror-perl_0.17031.bb} (93%)

diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17031.bb
similarity index 93%
rename from meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
rename to meta-perl/recipes-perl/liberror/liberror-perl_0.17031.bb
index 3dc456eac9..fe9647c4b8 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17031.bb
@@ -33,7 +33,7 @@ RDEPENDS:${PN}-ptest += " \
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "34d382276c0fb0d6b38355b94c96a30b12d834d5662eb53f088ee25e3e712924"
+SRC_URI[sha256sum] = "0a85374cf9cbde5a5075f16e62246e5d36abde63ec08c5c5694f128f4546852f"
 
 S = "${UNPACKDIR}/Error-${PV}"
 
