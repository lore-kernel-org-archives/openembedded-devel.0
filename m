Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B042D10367
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.6184.1729801138960453623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cog3yfds;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e3881042dcso12948687b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801138; x=1730405938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPGXWwsqHA1JioWAxG+QADg3bYT8YDrf3zwKsE134Gw=;
        b=cog3yfdsdPeZeC++M0E5fm9Bg01XJYh25PKOdX0sKW4vlOaRemlxveOUTnMAUCNuhE
         FgjYibEAYyQcQHfMRQTOkAS9fagvRBGLe4fUwFMdl3zbvrUk612nJyi3hwvbwPWyySLK
         rIVBeDUJRx3Tv1M8yyFro0NnyhPdUGQEeu6K5muIFiWDk2x6iBwZb4raCoo4ZrpnCh7v
         CQqjuGgzZDPCK9PFORhGEv6ymRRLkyV7ki/8mBUk/k99sVjJHFBfmpmvwhTYMn0MUryy
         qkU2SqWiuAIcFGw7l8MuHVJD0Oo2ngSO02DvzI/gKdTomVJhHjqc/oD+ES97X8xpG/2E
         Lo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801138; x=1730405938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPGXWwsqHA1JioWAxG+QADg3bYT8YDrf3zwKsE134Gw=;
        b=MkFUyYz/tDWdE4WhT0aTlhofL1jPSjnoyJ6wQ7Wd3OYlY48mO5b4KW5j0IqffdY8um
         /bHcX3bSniE2fdsa1RWwDhiOeD1JFY3THSwpGsMG2EBc26/Ky9Ui6Bb000GCq+ir1nSv
         QLMtfmuxHAuDhNTMXnULAv17zGhCayOA51zn0PiIL+mYqvhsTUFbHq0Sp+koHE6WlHPk
         X4ZQCuaohE00N+oh7lSZgDyjzjBnfMtzexPFtu46cyrPzS9Q0HGQ7VyN0AZaGTDSdJAQ
         zn3pmSM32ECyYawBABognW1HMaIxkKPMxM+jwK5T5rzbLHPzGzvcXGMAV3TORwpJwmMe
         W7iA==
X-Gm-Message-State: AOJu0YzeSrbMHR86yvwAgL5BTyX55pw5qZow5RTQZpYrz9VeZ/OOfTpU
	+ho1TiNx/rsq66T7dvKCwVGbCxYb9T3rnZwDSGuySQvRwCWkQM50J976gg==
X-Google-Smtp-Source: AGHT+IG2Di8JGDTHs6oEQ2//Q1CJd6Ie61otJGWYyKGoKEwe0k1aGZL9IbZtElZWI5Fw7GfU5fQXDA==
X-Received: by 2002:a05:690c:386:b0:6e3:d31:cdca with SMTP id 00721157ae682-6e7f0e72eb2mr88497827b3.19.1729801137663;
        Thu, 24 Oct 2024 13:18:57 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:57 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 08/42] libconfig-autoconf-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:27 -0400
Message-ID: <20241024201806.440273-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113186

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index f4c1e5673..8331a1d4a 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Config::AutoConf is intended to provide the same opportunities to
 developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> does for \
 Shell developers."
 
-HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
+HOMEPAGE = "https://metacpan.org/release/Config-AutoConf"
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-- 
2.43.0


