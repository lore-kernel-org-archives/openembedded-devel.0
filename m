Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009C1CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 14:26:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6583.1761402386576706754
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxfCg+VA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-421851bca51so2762824f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761402385; x=1762007185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVe5HZ88sjWbBHqN0S8Au7o9AcFqlchexpBvAWPQjUs=;
        b=RxfCg+VASBWr7RWgOcQpQHFDnGyjfZ4XYqjFunTQIx1DvMDuP8KaAX3aoCsNqumq4q
         owU69EZ3y6cEEViNYYevK8aH5lgiZxwH2CaduvBNA336/q3h+0SyxErrtCOVdfUsH1m5
         mGX/35MqbK6xGQzeoefBlbKpBadaldptvvguGwL6YqKzHwea8o6Ju3XglHYiiWEVEPZX
         EWEMOSbYIq+L1pWRDxkdnOic2c8K0Cnm+buKwzAAczosMbmoRubJQJ3781iYHatbxxkM
         DxCPqE7zpTEZh5Q9OCSiGFep2Gw1ItITRn7Z/kDbhlh3ksdYnl14i1zngdNymAm0HRpd
         Rh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761402385; x=1762007185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVe5HZ88sjWbBHqN0S8Au7o9AcFqlchexpBvAWPQjUs=;
        b=aj/8TnL/AUahQPQgmW4SJqS4z7ohB29Maxh+tizZUofkTY3ne/uYfobff8y6uFea79
         0gAOvm0uPkZ5dHpP5EHt36FxdHubKhPpJObj/RCVqZGDlp6R6EMrnm1trbNVZHk+wksJ
         wtpL75MgvaLyS63/S+9GHtPej77LBofNBPudJUbdvpg0cv9ihaBbPkHS+sLui2AN5PZC
         MqtIGXeZbHOLlnLQQLWV/6CRVZNJ9R7XRNjsUAv9jsJwVYVmFrX/7jQ5sL36r2tlG+gk
         gOWw/Y8qNF4tDVSp+5wIHN0bbqn2Lbcsb1KH8FnE8i4+gx+KnnV2rr+S3mzEqW280VNC
         fIvA==
X-Gm-Message-State: AOJu0Yxd0XdeaTXHS/+iiuE5co1EUvpYdduSQoJQKmvwwTdSgrXgRfTf
	zfb6T7sYa85TBJDD8pv4TGNZjquFAbVRZP/dO5h699t6bBBdmw3n2OBvhLgQ9w==
X-Gm-Gg: ASbGnctXzEOoWc28suCiQwzYOxPqwSerxsFTFb5T7kf7BDn5XmSpw3M29JX6SPOY1PL
	Ap0pHPtXIVxYHtu7OFsRgIEbphl/pGCDU0HYk5/Jc3zcu7dvRdPdja05o9+DnLt60zcd6c0KAG8
	AlMMLvtTJ3EPWj0IWyLjWUCuNcdkBepzR44fYX3UbTcsmiyQShp/nXWDIQ7/8RNwsjBZPc+MjQE
	5UewySWvGrOC/wor5so9e6TypDjKtFJy/LRK7p6g1WrL3jnSR9NzLITZCJh84JnqW3QxWehzJfI
	GyfcYcFBrVA/HYFmjIpVsJW39tTwOGLiN+Ch70ewEN0YRRwJYtmvFJoQReXrKc3FpZ9UvXG1v20
	dR/eNL88MHC3EJAOfGq4LBvjaL02+4+n/IHR2MXA4nI4VWdUVFqAkbN92sI2bcpaXpXGbXWRVem
	vc5Vm9Yvoe801u2o4DpNI=
X-Google-Smtp-Source: AGHT+IFB4/sGIPAungx2Yk6T6DbBROok76Q+zguISN19sA1gUU9ffoM/lmuawFEgsc7hTFGCAjJXYA==
X-Received: by 2002:a05:6000:220c:b0:3ec:ce37:3a6d with SMTP id ffacd0b85a97d-42990755939mr5074802f8f.47.1761402384908;
        Sat, 25 Oct 2025 07:26:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm3867482f8f.0.2025.10.25.07.26.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 07:26:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 4/5] libmodule-build-tiny-perl: fix ptests
Date: Sat, 25 Oct 2025 16:26:20 +0200
Message-ID: <20251025142621.1566114-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025142621.1566114-1-skandigraun@gmail.com>
References: <20251025142621.1566114-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 14:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121004

Add missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc         | 2 +-
 .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index fc32c709bc..7488da3351 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -24,6 +24,7 @@ PTESTS_FAST_META_PERL = "\
     libhtml-tagset-perl \
     libmime-base32-perl \
     libmime-types-perl \
+    libmodule-build-tiny-perl \
     libmozilla-ca-perl \
     libnet-dns-perl \
     libnet-dns-sec-perl \
@@ -48,7 +49,6 @@ PTESTS_SLOW_META_PERL = "\
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
     libhtml-parser-perl \
-    libmodule-build-tiny-perl \
     libunix-statgrab \
     libxml-libxml-perl \
 "
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
index f3c6e1a016..52c6088b51 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -61,6 +61,7 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    cpan-requirements-dynamic \
     packagegroup-core-buildessential \
     perl-dev \
     perl-module-blib \

