Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34263CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:58:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.30.1761328677157708597
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gKjshArR;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710665e7deso11524895e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328675; x=1761933475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yxbfs8bQ5NzJUe7MjT4VZ1JfTLRmNyTQJb+FhHIbvh8=;
        b=gKjshArRfPmUR5hGFZDAbFtnDi4qUq1FuD2j7FBPqS1vURBUIvPcct9x6F81gPc5eb
         l637icfxdsZTmNroVD+mBo+kCoYZAj5hiyEPg8o1P64B4PfVG/C5A9vnYiD1zpFlVq8q
         FBnaWQzxlTMrHTqXecEyL78NEX2a4fiJwZSwyJFbJU5PKuSP4HF9YiEtNVKtm/Pn1IXq
         k210ABoJGxVK13IC1wfN5uLJZMwJ3XMHHjlkQSG4KCTZrrcJrzlRBs/msbt7u4SJ72ED
         aEdCMJ00d6xdvFM7H9MQeYP2caSY0CMZGtfdmmmuouamDmGqQfYtgCqS4dMQmaUe9v0M
         6Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328675; x=1761933475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yxbfs8bQ5NzJUe7MjT4VZ1JfTLRmNyTQJb+FhHIbvh8=;
        b=Q9T09SNdqEAIkA9S2dylTIBm551CUCkCRdQ7lsRwQbfgK51LVZUAMdMnv1CZw06JJe
         LsJrWnn539/bRj6sg4vsJ/GcLRaaZaiQJf66gyF+hAd7aZecH1UVCFu3tPgme6MbPWeB
         fHbU8Dyp3zzncIJ8+HdhSV9IoCEf7nimHJPadv1uXMxb6wQZ8ECtAVxCc339RgsjDAP0
         v1Eftpq5CxmzV975vswrjBcITCQuNBEmiQTh+17mWs9TcB+twYVtUu3qDeaVXyPHJGfm
         iWQd6jWUWyohBRUhpkQuSITqOYmwx70+SGAUc3smWD++I0LAs856UJAP92rgtGbdcMT6
         7g9g==
X-Gm-Message-State: AOJu0Yy8gE5LPF5MDPbuVLprdRnHLyKJSbw+Sph60EiuEBAlCWR9Dsyd
	9P/+SWgn6tJzoRC9yt+i4Ox/0Ua3lKITBv8HEFp3wfulxTIhu7NpWwA5Y6NNPg==
X-Gm-Gg: ASbGncsggLYKFiiVQvyP7kBnhU+fK9Rl+Yu9UzBKIVi7lzxqc+FUEkErO8Q9ugLPPxT
	iAjJ53F11voqvFF3EVqvVH2WfiC7EpgYGeXIiLEOydOq0yMmiUJo3upVX8Ddhz/YgCS8CiSuJo5
	w6tiIQBMUi+vOx2hhmccx69yJcjyyjsRNy1XDOXujHvLj8Rvea6pDH3hcH/2qLjda6UPBszboXM
	61UNRo0l1Lng+8Xl/5N1pjubef9skiVvLxqG913yJKvH+zBlVnPnQXYzS3ujWchNQ/FXSDtgf6B
	PdaXf0ZBTnyfKfHhwrDXyTwihEY8hA66yXfh9AeHC71rmt81jXUIyRaBOmxRXRA+n/Cy0b84c/a
	XopzPhSu8TabRHfGpKZI/k+2NEdPxBRJSWnWaXo2lmuFHaLtd41O11Rl6Obbp26dye4mY6AM1bQ
	==
X-Google-Smtp-Source: AGHT+IHo/fAybELDlF+/NKntmc5CylWzOhhdA7sN/sNJiG4kNcPAwg+7WC7TPZjhYolWUntXxOyNDw==
X-Received: by 2002:a05:600c:4f89:b0:471:a98:99a6 with SMTP id 5b1f17b1804b1-475cafae164mr60583005e9.11.1761328675408;
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 10/11] libtest-warn-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:46 +0200
Message-ID: <20251024175747.704498-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120968

Add missing runtime dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc  | 2 +-
 meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index a26b91379c..189a376f80 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -30,6 +30,7 @@ PTESTS_FAST_META_PERL = "\
     libterm-readkey-perl \
     libtest-deep-perl \
     libtest-nowarnings-perl \
+    libtest-warn-perl \
     libtext-diff-perl \
 "
 
@@ -45,7 +46,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libnet-dns-sec-perl \
     libnet-ssleay-perl \
     libtest-harness-perl \
-    libtest-warn-perl \
     libunicode-linebreak-perl \
     libunix-statgrab \
     liburi-perl \
diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
index 6536787623..5481ac7022 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
@@ -39,6 +39,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
     perl-module-file-spec \
+    perl-module-test \
     perl-module-test-more \
 "
 

