Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D56BD5B852
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.125.1730140104484366843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbNleEyk;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso4331367276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140103; x=1730744903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WHeyoRSIMYftA8RzX7wgf8tvUbROGNNLNMsMRhjvLk=;
        b=GbNleEykT5D0tw6PiNiEhrpJc7ksJJALlSk+Ey2rqYBgAOMjkVWtrHAWIOvZaScSqs
         w7b+g1z4hhH8hiYVpY6Ys7C9snh9GQ/8jo54+qkXHW11DcTpnJkjaq7zpg3Uc93OVZ9/
         dnSMgQCsOuVt3Wm4WNbgw+sdaae3IHYe6vj4EIXaFJA2NLNlBVAOvAZB4wZXVbMPNTvZ
         5bW8XY3DCa+HcgbcgwfBvPTbelGmUYOH87mRijKz9uErOOGqlISAQAjoWBLNNUUTm7r1
         nGVtBRd7xjDXYY7Ws509EhcJUvPEm6VPNwDNHclXulg5ghZjH4XwcdU1GfaKH2XYXA0d
         7D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140103; x=1730744903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WHeyoRSIMYftA8RzX7wgf8tvUbROGNNLNMsMRhjvLk=;
        b=G5wYOOhat+7E9vNqmcvzGI4Lfp/iBF+YHkOICaCYdsOH4RLfA8u3DIBQfFAnS0/Pk4
         o9Td6FJh35dN+wxS9SRY0b0VM3I6WrxKFKoICHpt/YAD4NvwLWSDQ0QxaK/yCGOaegyg
         c0c3/ltH7sO3N68racsOMbejTZfGqBbRniLRiogtbuC4FLJLWWeToATx1GNNjp5rHeou
         0NhEN1FAPbDUXXHF/PqUgjyQsgx5cgck1gOnmaFB8OvrQpOCmIKSpGNNu3mB9iWknSHY
         jruhJz3WxTq33AD7wYyAEbest7c9q3op7qLqfrA9YpH05zsuaQ+NRHAWRvkz44Ya2S7R
         2rnw==
X-Gm-Message-State: AOJu0YyXtDLoRzTo3mkmsLyrynHmxxT1tt8lVDVp2bw7yTmD06m7F4JB
	JNYsZcVydf9IE5X6+KsYFZLr9tuAzmukiIqrxvE3Wnupq+DgMkDsDQT7Yw==
X-Google-Smtp-Source: AGHT+IHS+mqQWqXnD2FdaewV92k4tsnq9xBU5Bs1Uf78XskOrE5ez3R7C1lLN5Gfltqm+lJtUytDVA==
X-Received: by 2002:a05:690c:6f89:b0:6e5:bca9:cb75 with SMTP id 00721157ae682-6e9d8982117mr98613477b3.19.1730140103201;
        Mon, 28 Oct 2024 11:28:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:23 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 19/22] libtext-iconv-perl: Use
Date: Mon, 28 Oct 2024 14:20:35 -0400
Message-ID: <20241028182749.5058-20-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113287

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index d242630d8..80c976561 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -13,7 +13,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
 RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
 
-- 
2.43.0


