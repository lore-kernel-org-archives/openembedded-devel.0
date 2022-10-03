Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAFFC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:06:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.116.1664816796389928463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=da6CqarQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s2so4885282edd.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DkfjGJDN+Lq1ff/YswzIs5l+kfuuB+WpuvzOqB2jpo0=;
        b=da6CqarQzPMMDxQstbLqrrTIX/dJHC3fCCgo8YtW+kAfm/4nVGGJ/tYj9rQBkeSBKr
         QN8zFj2jVYuXhgrkLfgQO017t+g6P8YWhoNxO4GvFier2GU1nxnMHeUtSl500pjVtZ/f
         7QX0ziStJ5ihBGaO2yDcnwCfU+J6q2khnauABq22U/RfPdZND9PHvdQf/7IYEkSZ40Eg
         W28cBo6in/Kp8BFjZxDaKMdVOh2TQDahn/Qbe7kftI39f6h/I/zuydKL6PS8RH2xQzOC
         MclNqJOeYqohmPPj9PPLi62Z1v+fWJKtMiV89+AwOi5YPc/oCWKU1tSLujmauZzP23K3
         Dk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DkfjGJDN+Lq1ff/YswzIs5l+kfuuB+WpuvzOqB2jpo0=;
        b=SGeAd26obKTstMUNBfS3v58sYmpibsw+C96j3kGlq7uUHOtATQuoFJKF08xGycAapv
         /qA0sZl/L42zJ1rKbIvduHSRwgBu2tG2pcelKlxvXToEu6EzRfgEPMIhUCBxAcYL6CLG
         P/p63cv0NkxUjFxaA04oqTiwVBMpc3fxoJ/1z2P5HUc/hkfI32dekPHv0JexYx+UOj4M
         kSdgzkD/sdX/pqxY44vDUo0qsXLefrSYCXBpGTcApZKqcqWFSbqNnTnCdJc65VZI+VUv
         w6sISq4Mt0gRJsM3sdTS8cx2zLQjVrFmGoIr7iaApg8WnFYoR72iOEVjZY/cyLyQXdws
         4VBw==
X-Gm-Message-State: ACrzQf28eNJbNX7kwQGwnrPsmlW3wSkcpBZvpIh9DEh6ge+hNsG3g4nH
	q3tCMVPyNkE2Z+2UzCvO2ysrcyrhixM=
X-Google-Smtp-Source: 
 AMsMyM6IQkWQO27vITjUEuPBLJGTUTXskphsZ5hmPKCQgDuLZNEPFIDesRnrLRFELPZXKSSOKnzI/Q==
X-Received: by 2002:a05:6402:27d0:b0:451:b381:e0a1 with SMTP id
 c16-20020a05640227d000b00451b381e0a1mr18921877ede.4.1664816794635;
        Mon, 03 Oct 2022 10:06:34 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a056402174100b004589ac5d0c9sm6342329edx.45.2022.10.03.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:06:34 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 3/3] jansson: Default to shared builds
Date: Mon,  3 Oct 2022 18:06:23 +0100
Message-Id: <20221003170623.26207-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003170623.26207-1-alex.kiernan@gmail.com>
References: <20221003170623.26207-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 17:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99042

The change to cmake changed the default to static builds (there doesn't
appear to be a way to ask for both).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-oe/recipes-extended/jansson/jansson_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
index 39663d1218da..833060686ac5 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -15,4 +15,6 @@ UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit cmake pkgconfig
 
+EXTRA_OECMAKE = "-DJANSSON_BUILD_SHARED_LIBS=${@ 'OFF' if d.getVar('DISABLE_STATIC') == '' else 'ON' }"
+
 BBCLASSEXTEND = "native"
-- 
2.35.1


