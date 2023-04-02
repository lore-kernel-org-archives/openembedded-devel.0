Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA41C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:20 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.56522.1680474613628637362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZZdml2E0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id h14so16378001pgj.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rzDxQUAB5KMImZouw9yqlppBx2Y7A68IMTYJlhzqU4=;
        b=ZZdml2E01F7rf+zGD0FKIENoWTY19dTkUoZyTSXgCiyLeBkUiiqL0AhdQzr+rmaqnU
         tM8y45zYH8I1foXviHsTeoJVj8Ssnf44OUiLCa+igNGp0Z53g8gUZRvMJtSp5n2clbSe
         aOx2j0QOLnonWfcHy6gR5H6KTKz0L2Uj+RpGAavOPTI0F1EXxg/rk1GoDzJdHNHCQ3hm
         IyLAsmDIR88bh5OzcOvlm60NptO5QQLALnta07+85X6zxW3MHPWPYujVUKzfB5Ubcg67
         0TROSR/SX8HYGIwNW8cZQpRvRxK7Pgoq6JL2jPKDZB+C++VkrCRahStRn7znogJUqDBt
         bSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rzDxQUAB5KMImZouw9yqlppBx2Y7A68IMTYJlhzqU4=;
        b=B/o6bj8Nbf7qjSju+W/7Ym90AbtCPKlcGpLkCeN9gneF7F2rVnW3i2lKP9DrlB4228
         lTxxkO2RzGnpYLZ1YfQMrjZRqn1u0jAhHq96d/l0a6HWEV73bsz/u33TWM/vmaRppemo
         7sRt9t68oTPNNOvLePxkKy1U1VcVKz7rmqqHjPjBg33I232/lpvcG5p/lpL7o8MV5Pn3
         1UFedYmPPBOGovYOqm1j8NCgSLtoo/4hnlTXU0s0vFGIEYYRY5jigJLWEvJAKOp4oxd4
         twfjUASJjRrnY6bAayOl6Qpbq1fzvd1vVKaDIL+5Mi0WKogwMMkYeAoChmrMk9Ha/yzi
         qgQQ==
X-Gm-Message-State: AAQBX9fOuCEgDnl2xLCzG3zMWdUmdh1uhaIswizfnVMhpUdRq2s5+j7y
	Vrd3N51p4SkPXS44zBy+j4qGgyUZWUE=
X-Google-Smtp-Source: AKy350ZFpmpx4lG+GshiZB2JXmoijMXnngdtGkFlLimG0Jc6fMLm+OaQuJbf8UwKsllZHskWpMDx7A==
X-Received: by 2002:a62:6454:0:b0:5a8:b2bf:26ac with SMTP id y81-20020a626454000000b005a8b2bf26acmr30977038pfb.20.1680474612736;
        Sun, 02 Apr 2023 15:30:12 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 10/11] recipes-perl/images: move to recipes-core
Date: Sun,  2 Apr 2023 15:29:42 -0700
Message-Id: <8641dfe33feea365918907299622794be00fe3f2.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101888

Be consistent with other layers like oe-core, meta-oe and meta-python

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-perl/{recipes-perl => recipes-core}/images/meta-perl-base.bb | 0
 .../{recipes-perl => recipes-core}/images/meta-perl-image.bb      | 0
 .../images/meta-perl-ptest-image.bb                               | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-perl/{recipes-perl => recipes-core}/images/meta-perl-base.bb (100%)
 rename meta-perl/{recipes-perl => recipes-core}/images/meta-perl-image.bb (100%)
 rename meta-perl/{recipes-perl => recipes-core}/images/meta-perl-ptest-image.bb (100%)

diff --git a/meta-perl/recipes-perl/images/meta-perl-base.bb b/meta-perl/recipes-core/images/meta-perl-base.bb
similarity index 100%
rename from meta-perl/recipes-perl/images/meta-perl-base.bb
rename to meta-perl/recipes-core/images/meta-perl-base.bb
diff --git a/meta-perl/recipes-perl/images/meta-perl-image.bb b/meta-perl/recipes-core/images/meta-perl-image.bb
similarity index 100%
rename from meta-perl/recipes-perl/images/meta-perl-image.bb
rename to meta-perl/recipes-core/images/meta-perl-image.bb
diff --git a/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb b/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
similarity index 100%
rename from meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
rename to meta-perl/recipes-core/images/meta-perl-ptest-image.bb
-- 
2.34.1


