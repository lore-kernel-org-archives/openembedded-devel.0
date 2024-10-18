Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE53D3F28E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.30104.1729278833214018375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWP2ATdq;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e35fb3792eso25394707b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278832; x=1729883632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MTWV+6or2v85P6ntXtWJ4MD1PL3zC5F4H9FLLqt8Cw=;
        b=MWP2ATdqmf5Xs+SyCUPLaJQwtaaI+97HnmcWmFwfAj3Gt7C9w2nPVeVxSS2ml4uZgu
         S790BuI6LFhQDbBQbHeDjeCFkfOuTzJF0vIQGg71egLcylDInpb80Z1MxUEB/uNOcX5S
         zS1yp2JMJya5xiT7O62nEAJ8bov8KU8cVuv/ukRvjqTgnirsvNv7sxW5vG6a0x3avyLk
         l6eyteQiD1KWZF2HSwldPI/BOpjuN5FIifvV4Xw2pi4C8lj6kl3V+4whSmeQj/1xJrVG
         G2cvoS3knhWKIbNzuo/giLWNvfdk/jinuECNOsAMX2T14WUY1Z1zHz98Gky9XMgQBQ9J
         DHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278832; x=1729883632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MTWV+6or2v85P6ntXtWJ4MD1PL3zC5F4H9FLLqt8Cw=;
        b=g1NGmHtoXxvGL1VU5VUqNimMCB9QvHPVvuqwK1nyizRLbEOsujKzdsPPNx8l6a+12e
         z5jaVN1I8R4as4Y/2Mh0mxFV3I4vmaWJZSkYYt+j8/grdI237th9oJvLFkxn38q3bNmQ
         Jfnzg7iBLdA5NaeIG5bp0UmCvXj12J5G4N4q8AW0o6ra2QpJYQbVdtHoAcxI1uFW8gC+
         39ga1TH75bonIfrXTlimfsTkhF5TUIbbpITz4SqMI3u66tMHLKwGvcH85qFX7BSfsi7D
         bYNfouZLiaOkW+COQTzstlPGif4bLFfTUpLHgvzin90nkKSegX0ify1ijFEYwV/GSUDW
         aAzQ==
X-Gm-Message-State: AOJu0Yw7Jocz03thaautdMPMXTNecaS/ghiXMz/+V3RcK9rFakWxCJ1/
	1SyuVexREYNj3DknSRkLtVTeFvk+ODK7DB7bQX604h44qK6ArkJ0jSIsXQ==
X-Google-Smtp-Source: AGHT+IFN56QlR8Pw7tLXLGPY5Y7q+1kq7imRVN3t6WS0D3OWaKsr3mRDIbQ1YEM4/wpH52OIhv6fQA==
X-Received: by 2002:a05:690c:ec3:b0:65f:dfd9:b672 with SMTP id 00721157ae682-6e5bfbed451mr38377067b3.11.1729278831785;
        Fri, 18 Oct 2024 12:13:51 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:51 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 63/68] python3-txdbus: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:50 -0400
Message-ID: <20241018191101.25184-64-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113050

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
index 1232f5e99..01c069291 100644
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.rst;beginline=32;endline=32;md5=2141358b0bce85fc45216ba91735ad50"
 
-SRC_URI[md5sum] = "d397357dee78750385f92ca9c6c1f063"
 SRC_URI[sha256sum] = "8375a5fb68a12054f0def91af800c821fb2232949337756ed975f88d8ea2bc97"
 
 inherit pypi setuptools3
-- 
2.43.0


