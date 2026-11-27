Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10380.1795753120866600617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VAPJxDkR;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so9928494eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753120; x=1796357920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTkGrovYpZUFRLTaSC5nymBP63TyLoXQ4i0p0ybC8Ek=;
        b=VAPJxDkRO9BKJnpgLk6sL/sMENN+E0SroPtCOy4a/mQYJMKW0VYUclVJnQA9D/gjvz
         EW7+UAX3LEjsRT9U9YpOx8txNpn1LR+sqU2ySWJV9R5ZLsoZNDbRxOa5SUpZ9I/KUTm2
         diLXEY4JrXAkrNMaAXIw8CbZ7ImnaZ9VPAkJZ/zKim65aoes88Yos/tJ5apVkwGVcBs1
         D2T1vJyyX0S5/oR4BXQaV06kwVWy3LI40uesbZIikK06KN9s2EHV/YHLiBmbFuJY+1MN
         GXKeqxCeCTWjgonTp1HaRzyZe93QblGqU8+3fy22PAdLGAXwRUFa45Jx4Y9gjJ997xxX
         FKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753120; x=1796357920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTkGrovYpZUFRLTaSC5nymBP63TyLoXQ4i0p0ybC8Ek=;
        b=2FsVCcrAjym6i4oLucupjGSBbxNOt/hyw754FyAfVeOI0+5GwFK3MLiUNxV07LrHvp
         aJfoNZrlXcgla7jALTTr1AYuhXVGhvfnmwLGNWocnsi5zevGpvetHaW7LNDi7bgaHoiR
         SkFfteDZYBBgZ2y+1iE5FalRhqTvmKVNqHB5y4Wlx5Uf/EWAUUT7mRfGIdrAkcqb1JtA
         BF48atgo3yebW1u1mrS+xtpdXmZYNQLevHkm2nz003BdWlI/UZ/xfBtGCdxHQ9HDX1QB
         btE3MQ/tjEpQemOZY5/PyMxGQOL0MY0HaPicmtGqX0XwflMSWwyrE9DIj8sNLEWwWCx9
         txcw==
X-Gm-Message-State: APuU4Z+EvRcM8ZLCz9nzkNMTKMb4xA4fadCb+Ytm1LRUjImd62na2n4O
	2sF1tbCAox1Ala6TjhALgyXGTKCx+WrNL5T8i3YvuzZO0ozJjCQ8hszeUo5FOk6C
X-Gm-Gg: AZFdTZfhHGstA3mEpBmiAeFr64R58iyjygJ26E5DvkX+HUAYfQ44sDZH1la/Qca2Ir1
	EnVENlnRpSAY/V2A4bjXqBNPdqUimPB0un9sk9VTzMhzIf8WtNcj67LLNsdxZe8FqPnTqTGIfnn
	zR799mPCf89Z518Ed++XdJxmi+pTIZLAsk7+P0kZlgv/uwhhNdDMuXSyd2A3SQ7yFZ1dHIzRFWF
	enpngSiDqt65yEsBGxEoEd5rdRP1GOaGGJ5wF8ivZCFmdEOB8LSl1LazzCrOj4IdMKvUzpPPgFY
	mXZ84UJ0cln2PXBjK12BBjgfWEoUA0xU7qngSBcauTRk8xgVXWXYkZVGolUX/yIBRxXSevJIUmN
	rAWdJselKgbh6vi8XW0hBdfrr5aDAytXHkKf4tLppwEe8IWI15m/OpRoXm7RDwCSAVCPHmOpgSl
	AKmPsfQbMJUhYJCt4GDEbprJR2LnZ3OSm8bJWMvIzAnxhk0Q4Zg5kQXBDMzeT+pflosoYm6dWhF
	Mx5U6QN3E/WGO6ZpmL+gA6RwKX8Se2ErKOYkvRV78/jUN9vWojETyNYpm5xlPmuEYR9zJIeV03k
	9nh5oVOJHQ3zmjYznmKbmqZIexqpExdt7SEp2m127wP69zz3Gm6co3ijWFJZAPvPMQLCYCl5T71
	JI+0avsy/FgNdA4X5h4EWwr5SIodB5g7I+cxWkTlpTDtqkw+Pjz0+PonThdnyOmNouyQm+1HVV/
	A07efC6Ko2sscZLTD5+xj7ve90RYz+V5rJnDmbFnQuf2gtN7K5hDKJ+khzyyWUK5cQbPrIdFAux
	/0L8tY1LobCiH7DkwjFu+i+vDlJANcyyh8YrmsgK/FHQOuL/BRIvOOaVNdb8zUjWh2WOxQKxVFp
	pUQw
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr19209501eec.11.1795753120175;
        Thu, 26 Nov 2026 20:18:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 10/15] sngrep: upgrade 1.9.0 -> 1.10.0
Date: Thu, 26 Nov 2026 20:18:22 -0800
Message-ID: <20261127041827.1778052-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133298
Content-Type: text/plain; charset="utf-8"

- Add a media inspector dashboard with RTP stream inspection and
  RTPengine session display via the NG control protocol
- Add TCP support for HEP3 send and listen, validate HEP3 packet and
  chunk lengths, fix a use-after-free on rejected HEP packets
- Fix an off-by-one out-of-bounds read on full-size SIP payloads and an
  infinite loop on crafted NFLOG TLVs
- Add mouse support in every panel, color themes, a CSV save format,
  a negotiated audio codec column and the sngreprc(5) manual page

Add UPSTREAM_CHECK_GITTAGREGEX, the recipe had none. Builds from a git
checkout now embed the short commit in -V output; no dependency changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../sngrep/{sngrep_1.9.0.bb => sngrep_1.10.0.bb}              | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.9.0.bb => sngrep_1.10.0.bb} (91%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.9.0.bb b/meta-networking/recipes-support/sngrep/sngrep_1.10.0.bb
similarity index 91%
rename from meta-networking/recipes-support/sngrep/sngrep_1.9.0.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.10.0.bb
index 43eece2b51..cfa090ec56 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.9.0.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.10.0.bb
@@ -17,7 +17,9 @@ DEPENDS = "\
 
 SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master;tag=v${PV} \
 "
-SRCREV = "76b19854eea88bb0ca6df64f33fe8bec08130e6f"
+SRCREV = "3b5a62b27b1851784a9bd8d358828164f46d1793"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig
 
