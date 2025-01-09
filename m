Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34FAE7719E
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:29:55 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.7157.1736465393053673715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AkCE15Hc;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216634dd574so16509625ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465392; x=1737070192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLRE8tY4HTr0DHt2Lo/c6NXW54VL6vfFGAKJVTRFnLg=;
        b=AkCE15HcpFOkaiD0INqbE8A8ojW2qDAcuKXp52TaENHElkHqKnGRfHFExf65121sFF
         qsp7jy+JU0degwTCD7VgcmNLjW1Fxheb7LHApMKeJ0f3GEG4IkGm5nkM6GcJim89FXWm
         Uzbgcvm1kwfacgBvm7qNcclp4s4KoHTogcKjwXNDJ2cIjPOg6L7stteegZv8gnc/Mpqg
         917uqfi5XMgmQIFeaOXjjkvvnDLAlNKMd7NO/eK+mjI5RRufgMWTcG84uHxxDUPIw/Cj
         G7b2PmhIgX6rs6wS0UDrFl/5ldbSTVDgWpftnQuJrFK39jjrJNmzZQOjtRxaZOS1OBnd
         FC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465392; x=1737070192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLRE8tY4HTr0DHt2Lo/c6NXW54VL6vfFGAKJVTRFnLg=;
        b=dlslNr079lGTCSs7tONtVP/jXS8xgo4MGNjA+JomPm3CqtG2LkJy2TXnNbgTLbCPsV
         HneHUG/h0IPlvzWN5UxkdKOXos0loPshCqbke5sFSrT8Wc634bdupq7gcYxs8taV7DtO
         c+MDFRO1CGVN7e8wmEUSiJDJ2P5OCO+18ZUoSmDUXUDqNS4VhcDDMYVehqxcfhKlyMiY
         KwmlGgXYLygKBYzLbNT/lSqeVsF+1dt/IUW6F5DSvBY5DUVIBSjege2jR4rLgoYsUCNa
         boipUg9/wjOjYCbbodmp4hWT9fgvd7dI1dWeYEb2NkJ0v0/mAsSwit123rIpOb3hHPMa
         YpDg==
X-Gm-Message-State: AOJu0YzoktZcmEhOmVFzLkbY3j54ogeSL3RvuIN7xXnPJIdd/s+C+hfV
	OSS419b9H/JQYcRZn2JcmEZuGWSyQ5E3VXs5EMVUoVxxpY/yIovxocoahNY4
X-Gm-Gg: ASbGncv188oRwPCApbilLtGIOzDTn7z/XZhM2guUQ7xiG5MopbGCCPxoEdc6uvSS7Tx
	dHePufv6uHXbFsRWtoe8RUGdD0D2Mg/EKZNCiLErOiIAxZ/dgh10QDs+MXIwnWMlQTLUgVy/2wI
	nXFFGV4CAPFY2R8fcDYbN7AB/+/JCatEIGLCe+GctERKflojwjwuJX1QJXTopNr3puY8/4ULPeN
	J+o7FuqqjaGNNGBEH9vt7xwXjm66wmVlrUUW90Hkdwe0gYR
X-Google-Smtp-Source: AGHT+IFHS17hPCzJUUmot32Odp9lsjkk8Ls+W6XB2pOVVJDRch2F+1hCAU2P1HUMOT/cg0ynHDWlFg==
X-Received: by 2002:a05:6a21:78a0:b0:1e1:e2d9:44d9 with SMTP id adf61e73a8af0-1e88cfd3cccmr11665849637.27.1736465392082;
        Thu, 09 Jan 2025 15:29:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::1344])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d6a0b140sm1804500a12.60.2025.01.09.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:29:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/6] mpd: Drop adding +git to PR
Date: Thu,  9 Jan 2025 15:29:44 -0800
Message-ID: <20250109232946.1556083-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109232946.1556083-1-raj.khem@gmail.com>
References: <20250109232946.1556083-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114760

We are using latest release SHA1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
index 51c459cffd..bf95f41b26 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
@@ -17,7 +17,6 @@ DEPENDS += " \
     expat \
 "
 
-PV .= "+git"
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            https://github.com/mesonbuild/wrapdb/releases/download/fmt_11.0.2-1/fmt-11.0.2.tar.gz;name=fmt;subdir=git/subprojects \
            https://wrapdb.mesonbuild.com/v2/fmt_11.0.2-1/get_patch;downloadfilename=fmt_11.0.2-1_patch.zip;name=fmt-meson;subdir=git/subprojects \

