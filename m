Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C115CCF9EB
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 20:37:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.13425.1761424624338158557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 13:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gV5nrjYU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so7055985e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761424623; x=1762029423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N31quwgAvOVsInGPyyNScsTUSI4jt+ffYhYEBzJ/jFw=;
        b=gV5nrjYUZQyKKpkrRRxYAqd9EXYsMLsLZAHXS0/Zl7ZTwCkEWQNKG8Xby5hyJ8DcjA
         c1rypiPf7gxYodCmvhgTPNb4TVd2hN2k2qU/AMYCw0TSV2uOsc/H8hYImWYnRQshPo1Y
         YJYehKKdawvpVhH1C2yNVA4KTugyChNTfRjWUjsHNIY5emnspp8M+Cq6aOzo3rRGmFis
         ypqsXcarN5jCMBaKPd0gyNRgiEMmlCrwlMyF8vLkUGRF2mlPw1IC3rYtZyrPMYnto7vu
         QLxjaVfnR2N2nAezG7fmHg22iTFBSXKSAUfwslV+CqG5EB64J2c+5waYqQJwkPpVoB1P
         c93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761424623; x=1762029423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N31quwgAvOVsInGPyyNScsTUSI4jt+ffYhYEBzJ/jFw=;
        b=htOS7VEqKl8n6otX/5njxky2KodEOaLY1fle0+NdLukZrwPq6LGbzV3kWMeRHU50EL
         Q7xnMUAgZNB2seqPdtUABMyTAyzyXZ6cSZlQhF2FrFYgZY9ftLE+WNRqiv8B3ONBsVFh
         9+5wFQbe+yb6wWeRfqq8rI1Z417PE5TSiBXrTrGAPF70FopzfbxD1FrDnxnxjmiOBwsc
         s1R372i01VQ0vuQJkTaPrLgJHFzrQy3IFaq1czw9382ypD1QtxG7z2RL9butkRgCAhQd
         1haYQ0ktv8oa7DU90QZrxVR//bbg3FiSoWaXCzEG15fPj8TtXOuwAHTZ4LlhWZy60Kg1
         YcZQ==
X-Gm-Message-State: AOJu0Ywf5v3+2bf+JEsfdwMPhRZWlrKmd31bkVrBWAzc8dMiixgHmoLV
	iiipenuACHAekWa95OrP3daE9XZowlx1aiKKvVhiEuM8ELGbpgHKgimCaqF49g==
X-Gm-Gg: ASbGncsGkeTkWSRjwclgSkInCCyCNnn4jZNIC9s1arXIKfm6Y9y8WFo+NezZsFpIoy9
	OnIyGwe5miXmghKoa5EIPGXRM7XP3zG/8gz4S4qbqna64tLNnaQ3TK6N64cIMWjzfFb0bjDGsFY
	xDkepryyZjKApq6jh3KafOg9BR0LXfo+OtUM5xqAmzX3TVQ2brs48F0/5W03oMgLhKWoiFvYBF2
	hk3ZPXfOZgTvkPJ/QbbPGHjkUvtll8fq/ASjNmyujtYlgc+SXUjH/xZ4jT1h59EraLHmrTe9GO2
	K3/AvT5ROGILRBdggaZZ/dCRXZbPhXxfzSFxk05kTWlkaf6Ld7O+l57WEBVvVr5QTKL8dqwJ2IU
	Y2wPsnuPdqFGiFBmQJsW3eSy8t824VgSLm4BiVeVAMTW2cSo75txuonoCJ0qX9Rl1SRpJC6IH/D
	hB0m0IX4ktJpfFGyr9EVg=
X-Google-Smtp-Source: AGHT+IEdFvXTWfG5xqs+gMOL0hH0vNm/kqmcJeTxl93XPjcIHAWFoPWoX7xBnGuEEHfJBpmdJN2vdA==
X-Received: by 2002:a05:600c:34cb:b0:46f:b43a:aef2 with SMTP id 5b1f17b1804b1-4770aa4bd6amr7999665e9.38.1761424622658;
        Sat, 25 Oct 2025 13:37:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e4esm47049055e9.11.2025.10.25.13.37.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 13:37:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 3/3] libxml-libxml-perl: skip recipe
Date: Sat, 25 Oct 2025 22:37:00 +0200
Message-ID: <20251025203700.1751175-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025203700.1751175-1-skandigraun@gmail.com>
References: <20251025203700.1751175-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 20:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121010

The application should not be used in its current state:
it is not compatible with the current version of libxml[1].

Due to this, skip it for now - if it will be maintained again,
it can be re-enabled.

[1]: https://github.com/shlomif/perl-XML-LibXML/issues/84

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-perl.bb     | 1 -
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb   | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
index c49b3b5a27..9c45a8dad3 100644
--- a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
@@ -58,7 +58,6 @@ RDEPENDS:packagegroup-meta-perl = "\
     libtext-diff-perl \
     libtext-charwidth-perl \
     libtext-wrapi18n-perl \
-    libxml-libxml-perl \
     libxml-filter-buffertext-perl \
     libxml-sax-writer-perl \
     libextutils-config-perl \
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index 6450111da9..935601fe84 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -70,3 +70,8 @@ do_install_ptest() {
 	cp -r ${B}/test ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
 }
+
+# See issues:
+# https://github.com/shlomif/perl-XML-LibXML/issues/84 - libxml incompatibility
+# https://github.com/shlomif/perl-XML-LibXML/issues/91 - looking for new maintainer
+SKIP_RECIPE[libxml-libxml-perl] ?= "Not compatible with latest libxml"

