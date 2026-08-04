Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FB5C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 23:04:19 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28847.1785884655363717953
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 16:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M1LOXo6L;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so256390a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 16:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785884655; x=1786489455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mic0A2abOlFOH1qNlJh0Z61iQXO0s34FUypPLqZa8bE=;
        b=M1LOXo6La6DVRqX3jQPspf54PF5cVBmAAkOqpxmwczrmXc6mB0Sz66qcjq9LPWXDAp
         GOgDSqVXEEX/VSDd3U024fQ+BEZD8ok56MwOw22mpe5C3vncQGa/AQqR+Gm9UANvyCXT
         L6zaniKZpYnNVpVpGaGhCl+7MaKH840mcZW2FGdSwR+NAfm/H2hgcbv7/Iq+YPu4DfIV
         I9NbMHe1kzy5QTbbF811QkrLiAomyAaBccsHXYHqmCnxkeTNKcS2VBGnqgJTnEemXnco
         +nPcsvZMjRFcxMdhBKTmlYMSpS3cme7/W6yYOCnbn0nIb/gM2TIb7ngBzdR5JMSehSfV
         N3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785884655; x=1786489455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mic0A2abOlFOH1qNlJh0Z61iQXO0s34FUypPLqZa8bE=;
        b=fOhjWWgdggpAZB4PWHf2KrUOtjmwDOeHx5ipzkx3hNbfDLZr5kUukYMh+xRmf/2CbG
         Br6034lqgn62ogCvE4ihsAjwhV4Xr50L0w6o1DBITzMfazfozaixYkUTjoKi6km4Bq5n
         vb5ozDab3WYz1cNEyNFHAoFDCuCcqCe8rDCIUJaFHvJH1qxHT5iTX8iqsNIsFjLQ3fLX
         c9gNCv0X9PK0coASwJHf/m4lftg6fssON0ms8tTi6fx4dAqltYyz7mh3Zmj1rHi1psLl
         jCNnUNRAwm1Uc+YJTfVY63CJf/HAyXQ6prH79EfNR2OzIVBeiG9kni/4vIE0O8OMgUeg
         3LLg==
X-Gm-Message-State: AOJu0Yz3cwLfYNWZviJqBL18PAXcqxSIjAIVhUTjNsNCl8Ytv50FC0ss
	YmzX2v7Np9GC7sTD1AXBhaAkGURTq2fBF9tP+CEbPus3ZVDLwVK1o/SakgcQJwU0
X-Gm-Gg: AR+sD13gSNM5264WhOhNHiEsziChhxc1LsU2GVSHT+R0/gbHzEdyb2ki9P9cG/mwnoI
	ZIiDGss/VxkoAMZevLc4cOJQa4X55BKlLAKDbMC29OMSWdxgdLcp1goOTZxcp/LcS+EQ5dzQ8vp
	lAZ/5YxljGaeItwQBBQBmzxdIWGz0nVMdVqBSA8VvOP0SiLK7eR/5fEXAGO2DutOousq6ngSy55
	JD8uWKWYpQ8CZ/q681xYB+Dy0w3x3ui7GbEHfsNOhCQlREy5j+x5cAmjjuM6hqPC8V7uxChXTQe
	P4OtZNyXk3lmYAXlgzB2XTXo2ymR82zKnDYptfKxjU4uL7WH1qqZAoB6uiIYmxvoQGE9T12/nN6
	qKjsSNQiQEWr4X071vOWGGAX2LGCi6tsdmCjFOFaQ1uPEx9/qPuTKPpkVk8hhgR6Jvdq6Zf8ohr
	w3sSvuQFTmSse8PfaOSXk5iougGToNJXHdNQAGn8q+GjlzNBAiAgs4t+sna06EcJCWqtgJSzJVF
	Q==
X-Received: by 2002:a05:6a20:7f81:b0:3c3:a0cd:9d27 with SMTP id adf61e73a8af0-3cb85ea2b4fmr2000116637.26.1785884654689;
        Tue, 04 Aug 2026 16:04:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm13444844eec.21.2026.08.04.16.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:04:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 4/4] unbound: upgrade 1.25.2 -> 1.26.0
Date: Wed,  5 Aug 2026 11:03:58 +1200
Message-ID: <20260804230358.365670-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
References: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128788

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.26.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/{unbound_1.25.2.bb => unbound_1.26.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.25.2.bb => unbound_1.26.0.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.25.2.bb b/meta-networking/recipes-support/unbound/unbound_1.26.0.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.25.2.bb
rename to meta-networking/recipes-support/unbound/unbound_1.26.0.bb
index 273e466ea2..9134bb64e5 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.25.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.26.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "c33ad1b1a21e48bfe4f140e90252a9be1b0c5745"
+SRCREV = "a45da353d3feb5d8fc00685fa1ceda3816d5108f"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 

