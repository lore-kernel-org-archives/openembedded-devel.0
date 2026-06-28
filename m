Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F86C44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69151.1782634349418424671
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BsHRcvbU;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139f1dfc9faso1111025c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634349; x=1783239149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9xbUHhFG3+DLqtuCDGBlD8/PV+yxqYZTuPBeWshNuk=;
        b=BsHRcvbU/2GclnSSGkfDShWsvgjZpH2PA+5fSPIkzpg8VRm20AczbjLzs+xKTlzcZA
         EowTo/ja3B8YwYOPHjpgYaxrPgzfzyPSSYanQvxxmcaTTW5qejJwSJa8D/scKxxjiWJt
         IYKRQ6HtEMZw4NkYjgLhPUYWG5n8gqgqeQBT9pvKUxfAZuJ2Om22FKHmyfKkEcNTrT91
         7wBfP3o1Hyar0Ku5Z3qqZh8F5jrg66q1GL8qjwQDlWStRMGDhNpSC3EkSDJGhkklNb5X
         nFoNp0rIl4Ut77ViBcOI1ZfFqybC1uXJniS5o4ejc9KlbVdTsiPC50GHJxdI7JqS8tNc
         r0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634349; x=1783239149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n9xbUHhFG3+DLqtuCDGBlD8/PV+yxqYZTuPBeWshNuk=;
        b=QsqWOxtZVW/wPs6kan9Zdwvpgl90/nwDMiSDLOUQ2Q3xVuw4Ms9ENOdGiBqZCo04tc
         K9kga9aF3hbUejYSUjLj1/uTPxYGnAy7k0Dr0NODIuwvFAaDjcgV0GpiJAYXbJkIeI8e
         QnBcijQeCE5vtFGf13ilWyeUhNAIpDfsEekmQuJJAzQAYt2I0g+QtgmE/naVWEfUBxFi
         Vl0IV6NY1UWJIlv9/LXlfdEKuJpVRMco6yH0UV7WIimMfPRD1b8dXbIEeWO2PQxFnI+d
         L0Z0EuaHFF4LTB6kxth34q/KS3v7kSyTDWEoE5l1uoY5+MoeIbywnU6trFQMOjRbtl41
         0sUQ==
X-Gm-Message-State: AOJu0YxoH/csWi00NFzWNurYo2x5n6qET9vUINROslvIpVANfm6ofVYl
	3c4VotZtZ+VH3ZBI0Ptg++xpECmP2fjdSSj1NPS0JGR8bHlfREgjuAie8fSPIrylJuIpBw==
X-Gm-Gg: AfdE7clH6XcLycSS6oA7FGZWGAKfBJCVawk9c9DZxE9NlllMfc/Ca+aA4liLPwvyJSR
	FSr3/cVALBHbArSzfwP5FgudoCtSpqXu2+RERKO2+cXjiA8r9vk86LPT78a8GOkVVjqa9N6FiG0
	l5PPuYn3REEe4mePY/knlZyG8i1RE3dysBmZLoAy4Zsc7MBszWBjJ+MDVzBsv+f3+lBSO9Kx5Oz
	dE3uMhdunVsJsMy7wN/cWtj38UTsbrcmaPB90DPWrBGEMXV6inRkiVgi6oo4Ks1F/f81Bp1iDeQ
	oytQJV5ZequL6VNKgXCHGexQfuswg9LZTMQxs2U1zOMC6MLmL4y0Eh/5K+szxBeYmQY5pAGSY+d
	+y9xmgIoz94QDjRXxqTTw6Ow0hRdkRsBc8sq5sNgT5ROsCVTUt5q4sv4QbsHRcbxfi/OuSEbNXh
	MR0kfRAWqWdiigvUR9BRpGlN3nhhEhheQ7F9d/wGY0RLAubfNhinsYhq3OsoO+8EEmloKlFsPTn
	cFFB9RwTNTB/nV1eaRLU2ALnaqvcA++EDyyd6LbREULXJLTBpNWdLpGTU5rvR9ltfzSwFWcoBdd
	xfdZalG5/UfvSpEIQJ46FBkLdFLVQA==
X-Received: by 2002:a05:7300:3084:b0:30c:ab4d:382a with SMTP id 5a478bee46e88-30cab4d3cc0mr6476887eec.44.1782634348777;
        Sun, 28 Jun 2026 01:12:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 069/128] st: upgrade 0.9.2 -> 0.9.3
Date: Sun, 28 Jun 2026 01:10:20 -0700
Message-ID: <20260628081122.178348-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127879

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/suckless/{st_0.9.2.bb => st_0.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/suckless/{st_0.9.2.bb => st_0.9.3.bb} (91%)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb b/meta-oe/recipes-graphics/suckless/st_0.9.3.bb
similarity index 91%
rename from meta-oe/recipes-graphics/suckless/st_0.9.2.bb
rename to meta-oe/recipes-graphics/suckless/st_0.9.3.bb
index 22ad0211b6..12cc4bb877 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.9.3.bb
@@ -7,7 +7,7 @@ inherit pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "6b215d4f472b21d6232f30f221117a777e24bcfee68955ddefb7426467f9494b"
+SRC_URI[sha256sum] = "9ed9feabcded713d4ded38c8cebf36a3b08f0042ef7934a0e2b2409da56e649b"
 
 DEPENDS += "libx11 libxft fontconfig ncurses-native"
 

