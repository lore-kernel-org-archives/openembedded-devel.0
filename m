Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8052.1795739672816927759
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=izXj2+SK;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386b8f2f671so4316989eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739672; x=1796344472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVG0eQa7Y55rs0/kuNUlol9kmd7Z5XSFlPiWpZQK9jg=;
        b=izXj2+SKJTetdtX+7Rj3AllvldNr8TSPObOy5sdpR/k6Xjq2Ads/boe7gAbDwnV7dq
         5UjKzvt9IRrRfYhZwMGC/ZKfyTjfuevMIdlch2xI5AoKCSYWYsnZPXZBLNCHC4Rms6PG
         aI1HvP6IVkhB/KF8nTQb+GkFN+PzLD+nmIDbqFgxzehdXAaTH0dTcTx5cHugCxrtDmWC
         NrQFFsmyf4WjZ84kkU3cNZqMQ00Qe04wrU46ZXJ8HhcVN18xiI5VoJRIIzh1Cb85wxFl
         7/0tnpJ1IakA3hsTP23VIV7Le4JDej8X2zCCSaPk1hmZlLmXxnKGde3DnGHbFXo+30Ec
         du6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739672; x=1796344472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVG0eQa7Y55rs0/kuNUlol9kmd7Z5XSFlPiWpZQK9jg=;
        b=jd6uO1G5iUZXXdI1lTYbna1/po3rC1lmZCOCEzAWGlvDgR+BIyy/hByyGLH/dGBKlg
         99XXeNlNO5nlA2wTYK2EHq7mAUGzlf8pUaKPHfHnwit7Vw7LZFyuCwGPfGsvXqgA56UM
         BeKG1NQKQVJfxx0vhpbGQ6p+Y1f7tIOk8Zhvi/Gk/FheNRqEpCySPRS8wSFE7Iqs371a
         V/dbpchiFMwdFdo0qNpfAS2osNunZfusVdeTt8DnN5VKZxfNpdVX4PiH3MsnLU4jSeX1
         9M2V3rHH4HHSAGl2mC/wfKLpYnfbOWd8j/0Lf08MIZxCxYlsKNM2+IuaIU07wIBMg0Zg
         5GGg==
X-Gm-Message-State: APuU4Z8P1H3rAznWHrvLdA6dyUJP0Jnb3nduXt7ra64bdvgXa1TvpyPO
	1hs4e8shPUpUbDf+ct9AEHA4SuWMrH4/z6ORS5nMiAsKIsODB/LrJl0e7aSpJpFT
X-Gm-Gg: AZFdTZczBGhSFRl7j5eR5naBEiYCdL41QltHDAzA5OlR5MqJA9qlihu+FKfWuksMZ5o
	/amre7XZcciweTfs8uD2Vvfn82T9kow9MyyAfMv1gZWLlw8qdJO0ItGcoHZkbiI+PbNcVPMzt8B
	DyqqUDSF70/4TwJJcrmbr+reEjFade6hT7zvTQu++80PPJwZI0zc2LX4aFVxpmPBl3fdS2K1V7M
	0Xg9n+uNw25twKILwxSjJrRruKtSRSIeF6B+bE1jDKKAJx2i8DIDFx/M//HT6Fzf9vrFBPfjVQt
	S9HBq+ONJLBSL+8BUpTpI6RuzUdPgvuFOufTQj9v3WIfQFQtiCoNO2APEp1/MtwO3aOAPgD6H/M
	gUnYCKc3xxPk26ZrbT+aXJXQWeyvwuQAfWchG85NKxUyy+s2wVuefvjDUnFLF0qGOR/PPiti7+z
	JE8HeuBNTWQ6pVweHEW427Mq/QQggkVwPaDpUJECKugXcDdRhc3M1KjFnfrTbbhzXEA33JIIhAu
	11LNg6i3jfVGN3nGo9Ji93oOfT/t4ww1iO0moTJ0xL4pIrn66FJiQXqTIUfyXawmnEnX4w0+F8Y
	0azkPziDSX7PkMRLxXqm5Disxlr3WBtve8gOTdSbG41zjA/nvlpRwz69Dp12pbiFigJMlpKl8Md
	mT6CVxwsmfXzB1NHLDXuS5GoaPcFY9ccxWCsQ96vv2BoeD0rTTcpNHww8RQyc1OSZAnFN4ATXeC
	wx/zIUQ/D5THCcrvLTGNMV54y9FTBhqK8Ho4kwGfewqj8yzojXpd0eCXNGpC6uiurWN8TkawvSa
	jXeWitEKpfnj5GiLJAYZSbBExZ8sb52UyYASecgdIppN2YMHl7DqiYEPvc8VcWmHdmHVZJY3Cud
	AGUhTg==
X-Received: by 2002:a05:7301:da86:b0:386:d481:8160 with SMTP id 5a478bee46e88-386d48183aemr5205389eec.37.1795739672073;
        Thu, 26 Nov 2026 16:34:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/69] phoronix-test-suite: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:17 -0800
Message-ID: <20261127003425.2166632-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133101
Content-Type: text/plain; charset="utf-8"

The phoronix-test-suite.com/releases/ listing stops at 5.4.1, so the
check found nothing for the 10.x series. Upstream publishes releases
on GitHub; check the release tags there.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
index 5f105c9f8e..33be88c116 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "1f2092d536c0a3193efc53e4a50f3cee65c0ef1a78d31e5404f1c663fff7b7f4"
 
+UPSTREAM_CHECK_URI = "https://github.com/phoronix-test-suite/phoronix-test-suite/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)$"
+
 S = "${UNPACKDIR}/phoronix-test-suite"
 
 inherit systemd allarch mime mime-xdg
