Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50295D5B178
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.127.1730140105911454057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ot7/maa/;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e377e4aea3so40980547b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140105; x=1730744905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xvrp+Ui2TNXWwg1PJTg7xMTwMGidzvjDQ8U+0w0T04=;
        b=Ot7/maa/kNroiWIrAH+hz8Et+MojiTZfaMt5UXA+S3bRJYPbnQHK7eH7SD+45xoANM
         47ZlZ1oZOQGJ3gRzvb5klLQVUOjs0O60hbm+kvThkYaAG8I8duBkK/OkC7jJVzJbhY4f
         Okp7B2RCnbjvn5g/mA8ymgK8VUpFiHTCNP2RN9DiYJGZjk+/XBiOdlBwmBmZrlG7sNAm
         19+9dn+iHLEVtVpekdNv64ITs/VpzZiL1zoqXRwH1jS0FkRHSYRe5A8LM+yT8Dwqm13O
         bcZKh+3YRhwqAHEparx4MKyYk+T9SSgUtqN00n103aVSrZVc+GtQz8OLggATK/+jNmkH
         ksyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140105; x=1730744905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xvrp+Ui2TNXWwg1PJTg7xMTwMGidzvjDQ8U+0w0T04=;
        b=NHsrHnUTysBRt2kOXQ1CtQ6rPiN+gQo+cN63sw3Q4jLlPRp9vDbcTD4sQCE1jCIlfw
         K9gXpfrYp7IokY5Ts4Rr6aT7RIPAnWa8tEHDqi/zX4GFuD0jwxPPoIw7gsl9kLTOC833
         mmJm8hTaVmSKAbL9eJK+YWLLC2FEXMuMD1/clid/qhQ75RCTQhWG7Idk8eOY4BpCDVXs
         9z7NEY5OEa1RDFek+d6R+hSb+QAlry+nIaS6wevGo8GB+JjV2MST7fSqaEar0YVBpOcF
         QXg+RgkR1C1KXG0vZzDUG/VvYSG2pvMWjZ4O52gy4D2uAdy+SWt/SbeMgiYynaGQ5tx1
         L6NQ==
X-Gm-Message-State: AOJu0YxSSSux9KnQVpFu+cNT4iv4qNbaoV0fcr6amJnWiftMIP6bajIi
	sTH2fPlK359T/UCyo8jsjmlxC3bXIc3lu0cPX7KbIvpgCWxgPPvzp2KuNA==
X-Google-Smtp-Source: AGHT+IHgAY/KvfmHDmN6HNAsyo127dgXULxfQSEZpAA1udAnYT+EcQCISpmZ7GB+OIOUd057XortyA==
X-Received: by 2002:a05:690c:f06:b0:6e2:ac0a:8926 with SMTP id 00721157ae682-6e9d88b8a54mr87882527b3.9.1730140104519;
        Mon, 28 Oct 2024 11:28:24 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:24 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 21/22] libxml-libxml-perl: Use
Date: Mon, 28 Oct 2024 14:20:37 -0400
Message-ID: <20241028182749.5058-22-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113289

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index b1d5e5db5..e0ed6e7c3 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
     file://disable-libxml2-check.patch \
     file://fix-CATALOG-conditional-compile.patch \
     file://using-DOCB-conditional.patch \
-- 
2.43.0


