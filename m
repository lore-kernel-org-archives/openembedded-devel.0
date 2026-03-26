Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED6B10A62E2
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48353.1774534341443984379
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CBgax7rd;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso459504f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534340; x=1775139140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=CBgax7rdKni1dsChU0FrXMQNo3mt2lftxACWUC0J8iE/kMhcifMJgSRlr2oAMqm2jb
         reMVQ1MSzBWiO7PDOPESXB59G7+EXhN8QivQS015ri2IA7RkaX2GRc3Kig6CFB+LXx+e
         nYD+oLf1mM4qFGKLX0LQnURecRaNye622t9w0rHytkzU0DawWbW67vLRFgeAnbtqWaKg
         4BR+PkwfWY/FthcH1rCZE54bv54++0TYjZNCzOZcG3wi6HNGzJ8LULjKrXqPXLmYati1
         A2GCFyQi74haW4SlPNx4IYhTxj+CVX8CNanIeGwgCBs92Zhte4ytdJWeEmCBlophZmxZ
         vcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534340; x=1775139140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=EDHP5U0YmPmIcHiC8bzvAb7NHBrloCzgcfetolKTdunFGGD+s3xQ04oRlDHXWCU9Kt
         KOJ/VYdxyVYgs1j/t6zFSrTrMDbZagyU4kjyaNozg1PKVSgMnBl2ShUf8COC0xmLNlG6
         r91V8RbBarMDSPriEvpxPWonB0vJOGm4uqNEy0pvJujckLRi87H3hGBdIN7b0OMapRYs
         xW5/57li+iH1aenpgK5ERCYGvBm8a5wMQDRjtDFsIQHTU2huhaC7dQCk/fBm1ZrqIC7b
         wESooRRXyBQGZowaNEZabO67KcvM68Kg/5YQ9djL1CdMqeelyffeXOcyYar6a2+Z/MU2
         lXzQ==
X-Gm-Message-State: AOJu0Yw7E1J1gFgjvstqWYqphRKiWXsNWAuKpcbBRkHYZIokk/vWkqMa
	pgXzprIl+VFzAUU3+z2GJZuGIZ8JK8owQp/zYmm2eshVzTwLzPFazzhb3mmYXg==
X-Gm-Gg: ATEYQzw4ntqAT0IzPaDN9XvxX/vcn/w7hHk6TUdao6phVu2kWhQ2HzC4mwKf/fADLMt
	EbG/aDgSSMC8VSm8E3KnYhsLN1kUSM1AuEZSiuWQ5EFQ3ZmlMxbRpEdh5l+52t4l4fqeVsCN69f
	nSNbNCdhikTab3AirO4HZ9pOGNpItvWfWj3bL/AZ7PmpK0132psH3LI7sY7csgpKZG8gDC0unIN
	yYSISigOpTjolF0J3v2A5zhkrxyPxMIGrL8Uq7vIrrRqmtFY658YxqMw/LxDihS1D0HXTGcqa23
	/yGoROZ6DS8Sq1OJ6V+88GHHdGeJhyjCvUlWv8jh7DqTxRZZMrfR3EAliFU/97sDYm/kuwM0uI9
	IH25HXLhfsAPfvzFZh8KyWYwSgT3c4QUTIRju7FC9N+XY3tH73aN6yJvHVu/eZKc74mCALzXbFH
	6n8Jn+skr5IZF0kg==
X-Received: by 2002:a05:6000:4381:b0:439:b6f1:cd8d with SMTP id ffacd0b85a97d-43b88a100a3mr11461714f8f.28.1774534339489;
        Thu, 26 Mar 2026 07:12:19 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:18 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 02/12] python3-dir.bbclass: Move PYTHON_ABI into PYTHON_DIR
Date: Thu, 26 Mar 2026 15:12:02 +0100
Message-ID: <20260326141213.2081121-3-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125724

PYTHON_DIR is now suffixed with PYTHON_ABI.

Python build helper classes and the python build modules
use PYTHON_DIR internally, some of them do not care about
the ABI flag. So it's important that the destination
directory is set correctly.

This will also allow fixing recipes that may or may not have
been using PYTHON_ABI consistently, since it was set to an
empty string.

Also added a new variable called PYTHON_MAINVERSION which
is a combination of PYTHON_BASEVERSION and PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3-dir.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 3eb0dea9b2..f3ad0a2d91 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -6,6 +6,7 @@
 
 PYTHON_BASEVERSION = "3.14"
 PYTHON_ABI = ""
-PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_MAINVERSION = "${PYTHON_BASEVERSION}${PYTHON_ABI}"
+PYTHON_DIR = "python${PYTHON_MAINVERSION}"
 PYTHON_PN = "python3"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
2.53.0


