Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC51DC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 18:02:18 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.21611.1699466534905433575
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 10:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=pH0IfOUb;
 spf=pass (domain: ossystems.com.br, ip: 209.85.161.54, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5842a94feb2so3932923eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 10:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699466534; x=1700071334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA6gEv9HIN56ib/+D88dpLEGAksXTXUCImLKQsLOktc=;
        b=pH0IfOUbR6rc2QD8GZw1BPdStsyNMp/lbfAotafF+H2t7osqVL1TDfF4CEgSxkqrjT
         8Hmd/i/o6oNa9UeZt/au11EtizWpB+kNSDjliV9gsSxF9ruXt5LlvROOGgoz7FdeRjQM
         uMy62LpvfOf1hahGCrg9Fq2gdltSODXiaXkIJRFt+9srBCHr4FssdSVB14jdTm2iTqeo
         aRzep30/T3nSfYAx6dD9IWIM/IJLRjQIYgSTSlEb+WkhRZDRx1O3esmNN3UEjsAMrlmX
         xQH42lxkfbkCPgFsOwzFQNrjrroFk/+4UlZlyPF3O8BIypRJsDV2D4SNzd478Hbk7nc0
         sIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466534; x=1700071334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA6gEv9HIN56ib/+D88dpLEGAksXTXUCImLKQsLOktc=;
        b=Gud4bpMk8gn9s2mFhoXWBH42oF3Akh/4HtP3RkxD26zLInV/BAl66ypfprVAsSwpJL
         VeZ8VWunhZT9eJCFLwOQT87YEYv3arpkr9+IQpOrvOI9lLjh194PIx+BJ4SdSVCZz9kg
         6L4ixH63y/R2XutTRIPzxNq+89DB0L6MYAXr9IRR7NNysPwWP4/MY9Y+VPgTw+P91yPc
         Yd9DmjLVPDSKHKmF7pIc/o3j/3rQozCzx5ufkhdhGmtCFYokA6j2/KhJhqJ0Zj8HXeMJ
         aY0SXN5P8qej0NbXCBIQHBuZZPEFeDDh+/eAdsruYWawk0SXDvfANxxI0F2nipu+rzQX
         KWvw==
X-Gm-Message-State: AOJu0YwOFsGQ6qFj6wBNvCM2sWEnPWpJe0i+X9T5yk8ULm9Lx9WrEdBl
	NgpdxQGDtJKv7ypJiRgTdO5HpTgxqLDvSaQpM5Rm2g==
X-Google-Smtp-Source: AGHT+IFeZU6rlM+jCaLzlReum97fBF0MPLr5TltD9PH0A6hpgP3vrnLClcyLeIzBkbKXJTv+mJLf8w==
X-Received: by 2002:a05:6358:590d:b0:168:dfe6:c549 with SMTP id g13-20020a056358590d00b00168dfe6c549mr3163555rwf.9.1699466533478;
        Wed, 08 Nov 2023 10:02:13 -0800 (PST)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id bu7-20020ad455e7000000b0064f5d70d072sm1325643qvb.37.2023.11.08.10.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:02:13 -0800 (PST)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 2/2] python3-flask-restx: Switch dependency from isodate to aniso8601
Date: Wed,  8 Nov 2023 15:02:06 -0300
Message-Id: <20231108180206.3263886-3-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108180206.3263886-1-arthur.oliveira@ossystems.com.br>
References: <20231108180206.3263886-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 18:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106485

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

Replace `python3-isodate` with `python3-aniso8601` in the `python3-flask-restx`
recipe to meet the updated dependency requirements for Flask-RESTx.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../recipes-devtools/python/python3-flask-restx_1.2.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
index cff797139..573c2dbff 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3291305af7a613
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    python3-isodate \
+    python3-aniso8601 \
     python3-jsonschema \
     python3-pytz \
 "
-- 
2.39.2


