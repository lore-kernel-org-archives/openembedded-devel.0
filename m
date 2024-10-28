Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E8FD3E2D6
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.119.1730140102002483647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nCtu1pzI;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e290554afb4so4742915276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140101; x=1730744901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3xYQxRsxVY74EYytAoazphDAgqTFfXNxKJPwh/Ko20=;
        b=nCtu1pzI59npPC5Rxcvj+mwmB1FpyZrhgPWakds2rv02nIT7f+HlWfSM13gfbLHDfO
         KPkUACmc0tnET3pD6RuxDel0lTRnllx8XBE4kJ7sQHROmr6wKLbKhpXlYfn2MHsA6r6G
         4LOUOVCh9HkQAVIv7YCDfUk3VjRBhMuv8B22RtyggFnaFl9O4mgZRX8Dfkk0TYuMwFUc
         ZlIVbO7gP/jjmqNIauNLBgr34rT940bOsii8YwAoKyzfJvF0Y/I2A3JMnITkreql1cjJ
         7Y0B9NLMQjKw9uomH/9THWkg72kudM4XubgAc6mT1ZHEBCGmlOq7Wy0qUtcWCflMYKEA
         zihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140101; x=1730744901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3xYQxRsxVY74EYytAoazphDAgqTFfXNxKJPwh/Ko20=;
        b=lFdHU1E0zH1+83QktuYLM9oshSnt9VKrQHrAXkVRp/DJzMqKMYmZmiEpjYQ051WMhc
         fpfv4iRttys8/SQCSjIzXWNC9A0GlAAqYgC3zTHqOAuqTUGM0RZ4N+XLgELGTxlUaB3N
         OXukyh6dOBTTqxBPHD8nmJvAISRSRSA9mDesDPj4LqiMVa6N21G38o8GAHAFHCGo0ZEX
         +prZ806J+VhWP23oLJ+2MLud//3WfCYYeR6w9tmQUYgt5jeBTCPnhkCazqpnRNb36+lD
         n4rMS3D2RSsC8WVJGhqMpgeN+TU5L4d63rfcPLp7UorflY4b0/X8xYboxtf8lVuUY8/c
         SI5g==
X-Gm-Message-State: AOJu0YzVMCBbV6rZbZgomHRge3gsKEgwkiCRd2pgPovdnWBc3y7ypoSy
	fPycn6VNbDBtzKobn0DyOBMqHrVZjHxEXEmsI7hRWfC+shkPbeerGLybfw==
X-Google-Smtp-Source: AGHT+IEPwD+91R0IvNDDGzLaM0aYth7DBAHowTPlpoEaxoxr8SUFInVywNBZRMC40na9V9geXBf3Uw==
X-Received: by 2002:a05:690c:4b89:b0:6e3:2be1:a2dc with SMTP id 00721157ae682-6e9d895d199mr93800087b3.11.1730140100512;
        Mon, 28 Oct 2024 11:28:20 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:20 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 15/22] libnet-libidn-perl: Use
Date: Mon, 28 Oct 2024 14:20:31 -0400
Message-ID: <20241028182749.5058-16-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113283

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index de85e2664..f56b5a26e 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -12,7 +12,7 @@ DEPENDS += "libidn"
 # such as Net::LibIDN::idn_to_ascii().
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
 SRC_URI[sha256sum] = "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e9430fbb6f393bdbb17"
 
 SRC_URI += "file://libidn-wr-cross-compile.patch"
-- 
2.43.0


