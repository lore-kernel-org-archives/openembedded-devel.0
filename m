Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9A1CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:40:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6297.1761745255147236160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHE1y61n;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4710022571cso75530745e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761745253; x=1762350053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6HjC/dO3uriEvRDzdWqPBRPr/FOQ7bENS0cKGV7deo=;
        b=FHE1y61ntZTsiQqqfWyBVtqUONcnOXBiRbh8MuHubBUmEztW8IRAAnkFwOMAR1p1ZT
         cClpAQTJBxdK3EoH6kOmwJzuek2SnWQivV+UJNHHhWXOOvlp+dp2WhAqz9rlJ4xTz44w
         n+dywRgxMn4UjPmslQVZlMP06xkXnqeUT8NwsaMnz8M9Ztdxfntf+iuGNGS4tDoj2aEf
         EZE7IFf5/Xd5AShnQ/bMRo4Q4YX2ArQBgoWa4Nmk561rXolIz7tI9Npu6Oe5gONmkSUl
         th2OEnLzjPhAEcqdBVN+Oxno+/FpQEr0zvVaiesCcryg/Fwg3DSuPJsWZEzln+Or2vSb
         UT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745253; x=1762350053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6HjC/dO3uriEvRDzdWqPBRPr/FOQ7bENS0cKGV7deo=;
        b=kpQLzpaHmrPGT0gHjchGq+It1HqR4dDN6hBL071Z8D6/S3tXAjpbHTWYMAWYCMlZI9
         EAue529oJ52BYCX/3baR9CEwTCSIA07UnL3DVyWSRuRmemA9m8tA65lp3Vl5HEQTXawJ
         Uqu4R3krLmDBU5IAWGfpHOlwLYMgofWdWBpQQ8/bZiFNKgBXTuAczTfvRFr+x5xPj2I3
         7KJw21MoIixFN+BPBVXjd0svNyDgmOaCw7UGkHUbWE+tB07kNQbQ/c0OvbajtbFuX12z
         3PJppbo69xb59wo71zy9RX0XaIFgvQ2lvY2Ji8NKFEn/68XfFh/ej4RSH7YFSVnBgCv3
         it8Q==
X-Gm-Message-State: AOJu0YzT0h5fOQxIRIDslJkXHuNxBWK7/H2k9TXasK0JYmFIRMxG8bOa
	kn00RMAm5bvMCH/iHFq5F0UkGRJ4PVpvY1WlCrwihrLvgfhtEhVx8C1cN4lVzDSv
X-Gm-Gg: ASbGncsjZMeIcMNVx95szbgOUoQbLir0jqr8EwHChO6eQ4mYtlHFlUwvmyfRvj5nNLW
	Q4+i00JpfVJ2qBXMPHD4ZJtRJVylol7bCb2QVyF+JgsdvhWWPvTkCougrTknqYworCTJoJnRope
	DQY8K62M0LZsZlah/sifGaowUVVeR0EW7AjGeZhKVaXBOpuWF1UujdkYhpMxzxfUFU1BNikttGI
	Vj6HfJEq8t+GDqunpliUeU93S9i2n/L6fBOqDlPnjRzEUklYtPn4hplpgR2aAg6EOsREFjr1sR2
	IEWLu+QrddGxX2faAhLCG0I8lARc0mZejZ74sG5sL4B8KYEhp/wmZw9addztptbvfRo3cI/WGNy
	qKH5GE66WAnJymDCm87/Pp2vqei0/hfJVwqqOKTdGOM6HiOb8BUuQx1USFwldmQKousJqEnXTtg
	==
X-Google-Smtp-Source: AGHT+IHOiZ8Sgd4J9tjmhmPBaUZu/reLvPxFQqv8zUobXReObqoR3fIOoqumM5PeDBmSnNkDEqclZg==
X-Received: by 2002:a05:600c:3510:b0:475:da13:257c with SMTP id 5b1f17b1804b1-4771e1f13c5mr24526285e9.27.1761745253458;
        Wed, 29 Oct 2025 06:40:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm25950484f8f.22.2025.10.29.06.40.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:40:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 3/5] libauthen-sasl-perl: fix ptest
Date: Wed, 29 Oct 2025 14:40:48 +0100
Message-ID: <20251029134050.3455088-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029134050.3455088-1-skandigraun@gmail.com>
References: <20251029134050.3455088-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121154

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index a9eec69502..e4d04b16cb 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -27,4 +27,8 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
+RDEPENDS:${PN}-ptest += "perl-module-test-more \
+                         perl-module-findbin \
+                         perl-module-tie-handle"
+
 BBCLASSEXTEND = "native"

