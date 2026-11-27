Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11812.1795762993313444275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=twcEnyX9;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so11506217eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762993; x=1796367793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqdEYpHY7+m0xCq9JHqrP3z71ngsN3b74EK28nilPrI=;
        b=twcEnyX9PeKyjYVBSmODP2kd7naW83RN24WSdKiEkoqANdhe9zAJin715zfwoD1pHG
         XD51SZAQonJc+eAUiuexHcc8CtzpnwinsSdyu9z0OGFS/4gy4wLiM7Lmhrex1Z3ip/iK
         w7bYQwVtHSQckRzrZq9MqvFtWHZ1AV/c55/AG0Vb0QjetqD3Yu4W1z6UI9KaiInE3Xi3
         aXcjj9UzjLHjDGZJZq09k42RcVXi5CCuW9DueKfXZpTtbAM5eHyePa8xidiwNfmaJuFg
         jUvdXx3NoNwYdmG01B1T7vmBAZ1yPTZUN/xILFq/LgatHuJYmH1Lgu736EYANKwcDp6O
         52Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762993; x=1796367793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqdEYpHY7+m0xCq9JHqrP3z71ngsN3b74EK28nilPrI=;
        b=zpFP2lxs9/tp22TUOdrlyMsdL7w2GVGhlJIagqDv3isCw91s4SRUzW+jbBdzlQd68B
         oSDtYhR4Ky9hig0NnnFEPh0aXhbPpqZSKbZfbU8/Oou72jx8eHsHbpHBxVtuMumueWbx
         z75sFxM7FuIZ5XQcFUL0akWpg1j7wT8IZ4P5l4MLZ+arAiNn9TbTdGBcHZMlHGgElqbE
         rb+gojwYT9/Ylkp5cJ+DL9EKJmV5MSO6mwTlLxZ6xIGEIhD+FtH02ahY7QRSF732+lSt
         u8N9WNAhBLbEHuEvAmYESpSfDJgDQCSIxS55TReEPfDyy/RtE2JjPrTftjIQGiGhF7qq
         AoxA==
X-Gm-Message-State: APuU4Z/iOtIPrWhMc4nIPvz/yUNFWh9IWBVvp96WaZ+Rrwbp3+ba5/Pd
	aO9uw8eN6t9pS6GVu3Z2ZwFEY+r57Ag0FHLrZ75PzSJUGhybCGRak7a5aJYPhTi8
X-Gm-Gg: AZFdTZdvSteufsJTWnoL94kJMQDO1IvHVOa2QBpuK0bSv6NOPdhkGCmiWJDIL6CkKhO
	9aGTRq8qJc7Wg7i5CmSbkexWHgQtfRpZAdBOjQ0NZ4eLocsa3dgLlaKtMFZgmtH5OUtzybw1xlu
	i3XmhvJ66iPbbUm1P2JoU2b1L3w2Oa/TY4v6dhWSHGr86jAdYMNCog1O/pbCuJMlpfRPPmgV9Zh
	I21fe3OJfMFaop8LfkRk+ktmBNqtO3t1w/DJzZQbbERmTjAAqwQyTt4r9cQpa8KkJqo7Ekzd9RL
	PsWkB1LgupAK+eYx77Kf/wUo35VquZ9OaVae15akKo9KTO3/JAXpGEiMARGD+fFc3qxpF8kuXUV
	MACCuttw2/X4hxz2UqOaqekxBVVcvtJcw6R/VcDganPjgH2nf55SRaon0Hqg1BZ8dyKZu7x9TtU
	QFcVxoGxHr3G6Yze6JMfGnge7g2swjHPCyuXOp67AqZqzoikV8Cc9XwXE4VXJGmdOMUS4X4cK3h
	kEmEJlL5Fxp98+M2IBOrWJF7Dbk9+083P0DDkwrR4raY61w9bKNSeUawOMB+pnosoWnsRem84d8
	6XWBA4H6watC3G6dVSeoWkY6NC2dmBL1j3KTmhPavhl3/NLYSvTVlcrWLCTWR7Q9cp/JftkkyQL
	uItSP3v6p2jTXUuu/VFK7+Z0+jnbhZjaVJUO+7B25ZmcaGyZyHMveN60edcgN2H5ZprHDptR7es
	filkgk1XEKHCPZOzD4c1g/C6X+xPxxAyGw6KdwVegJRmC/IWYPqx13tW0PfuhtNO0GpcpviTv5/
	eMSrdcA51Kwn77H+W912XU9DCqh5TKjoio12g8Kju7zlU5HYROpa84hN5DuByZLiSVyGDN7+3+N
	P2sstg==
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr20247153c88.39.1795762992648;
        Thu, 26 Nov 2026 23:03:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm52671117c88.3.2026.11.26.23.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 1/4] libmime-charset-perl: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:05 -0800
Message-ID: <20261127070308.2377122-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
References: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133356
Content-Type: text/plain; charset="utf-8"

The default cpan regex only allows two version components, so it
found 1.012 rather than three-part versions like 1.013.1. Allow an
optional third component.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
index 21af44a1ee..415457fadd 100644
--- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "1bb7a6e0c0d251f23d6e60bf84c9adefc5b74eec58475bfee4d39107e6
 
 S = "${UNPACKDIR}/MIME-Charset-${PV}"
 
+UPSTREAM_CHECK_REGEX = "MIME-Charset-(?P<pver>\d+\.\d+(\.\d+)?)\.tar\.gz"
+
 inherit cpan
 
 BBCLASSEXTEND = "native"
