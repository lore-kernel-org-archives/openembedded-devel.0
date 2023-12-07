Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C2CC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.113089.1701991476592222096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNVsT8Oz;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ce9e897aeaso1120143b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991476; x=1702596276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqqIxKUNV5aK7/bdXWYdR62qoIryRqWEcKsqipH0GN0=;
        b=JNVsT8OzHekM4u5CtB0YW8Py8ZWDeFH3QdsuiQy5v945cGckCXptTWV39gpUIGWZpC
         OT1tnuEGFvvAlkjQSjMJkxniPJRM64mkseXpAjrVATMfvAcpTmITbBYhvbRR6BOSVHfk
         c5uLsPCfGpJmMWr4tpy3vjNbidhY3FWSlPX0tanHSrtnYgnwzFLxVvYX+EkJl+wMd5BN
         q2h/ycgHyqExdKR3YLV5sxxzFUXYLBQzTAsu3TAQW/qX8LKjrHd/HKZveqW/AnrV69T5
         66MQKOS1nkSOpqhlagFoiothcHF2ec2vWXjrX51FYN/d5mo+Q0eMzLHThviH57/ExvF2
         sZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991476; x=1702596276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqqIxKUNV5aK7/bdXWYdR62qoIryRqWEcKsqipH0GN0=;
        b=pdnJyPrLmN/G5YWTUr1ymuCFSD++AYya9Ko9Naam1iY4rjnAKfC0X0+oEfvS/NteQa
         JWZQcoHzlj6wG2JGuNP26Ldru3NnVYMZqg5xsS9u8br2/s7yKvxnnWxwxZAjwcinq0sS
         Z2mEkICXbuT/N42rnTcwZUifnkwHBXu1WjMUAk5mG/LtNBbumGMjWdlEmE/BIDHGeifC
         TRYNg60GbRq2GpAu9HPc5r0Rk2wGS7MZYjTWnBW+m/jjP19N1064iHe23wPwGMmwQ+j6
         balIAb+XODV9P+FYYr7JU5R9I1UJIjI9Y4FT7/4saZjbzfNJex5+5R81cLsWsYfvBbjw
         GPZw==
X-Gm-Message-State: AOJu0Yz5x2PD2WpKtMzRrQTccFfM4cEeR1vO5gvQULGVhqpPjsVDmsPW
	sKVN3lPW7BkD6Dn7Xp6QJtwCFP+Calc=
X-Google-Smtp-Source: AGHT+IGvlkSvDlN6qXu0RnuBzgWzd2+P9v5e4wGeG0sIwe4MV0rJsuUDlZCXwHyQoE4spiGiGa0xQQ==
X-Received: by 2002:a05:6a20:8429:b0:189:fd93:c969 with SMTP id c41-20020a056a20842900b00189fd93c969mr4294781pzd.26.1701991475727;
        Thu, 07 Dec 2023 15:24:35 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/7] python3-cloudpickle: add v3.0.0
Date: Thu,  7 Dec 2023 15:23:56 -0800
Message-Id: <da9af2cf72b017ca4d06523c3d3839dd9e19ec43.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107298

Dependency for python3-pydantic ptests.

"""
cloudpickle makes it possible to serialize Python constructs not
supported by the default pickle module from the Python standard
library.

cloudpickle is especially useful for cluster computing where Python
code is shipped over the network to execute on remote hosts, possibly
close to the data.
"""

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-cloudpickle_3.0.0.bb        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
new file mode 100644
index 000000000..25c379590
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Pickler class to extend the standard pickle.Pickler functionality"
+DESCRIPTION = "cloudpickle makes it possible to serialize Python constructs \
+not supported by the default pickle module from the Python standard library.\
+\
+cloudpickle is especially useful for cluster computing where Python code is \
+shipped over the network to execute on remote hosts, possibly close to the \
+data."
+HOMEPAGE = "https://github.com/cloudpipe/cloudpickle"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE.cloudpickle;md5=b4d59aa5e2cc777722aac17841237931"
+
+inherit pypi python_flit_core
+
+SRC_URI += "https://raw.githubusercontent.com/cloudpipe/cloudpickle/v${PV}/LICENSE;downloadfilename=LICENSE.cloudpickle;name=license"
+
+SRC_URI[sha256sum] = "996d9a482c6fb4f33c1a35335cf8afd065d2a56e973270364840712d9131a882"
+SRC_URI[license.sha256sum] = "3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5"
-- 
2.34.1


