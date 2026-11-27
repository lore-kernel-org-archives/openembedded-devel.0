Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11752.1795762842940892834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=edVMdspu;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f045b921caso44585765ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762842; x=1796367642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTkGrovYpZUFRLTaSC5nymBP63TyLoXQ4i0p0ybC8Ek=;
        b=edVMdspuyCBaDdI4+OJsIQE2qz1EUh4qZQYa8CI8yR0r9js8j4xAIaLcVFdAozOK4a
         8qyzR8kjjATiwrOF3JDGSMfis8KZN53b9bxibrh2VdD46m8muxLjDxB4plLloBNIvRoy
         p3f22x/mGG9Lw4ft8u90k3alTP44uPcbDt8k9T9eldzuKAbVr4Bc6rAu9aXrK364r0IV
         w6HQDNyHK/DaasXIFCX7FZSekWaVz6WJp6WlVzS8lCMx0bOa445QhcvdKmhnjZj8HrMp
         y4YJMmkg6ZV8vrSprmOSAVEI6PJW5K4j3AiuwbactOO/PbFhU+/2kDKGEHpdRODVnpj8
         7Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762842; x=1796367642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTkGrovYpZUFRLTaSC5nymBP63TyLoXQ4i0p0ybC8Ek=;
        b=zaCJOJYntNpvejc6+coV+kXHmuspBmpuSMTnfR6532gIjSn7+j++6KX5AARD3ZCOtx
         8ksspM3lago2ervHqTmSCMM/N2KNas59MVUgKfIQa3mi266IDMHNMLQy2kvrAN7AEAII
         +pzXq3FAYf7PrYp6mQKfbLU6bjlwK2EiMR4NxRIJelzEs6MS5XdBnpqp5Uf3pM50TiYr
         kolf3tp+iz/lX/HxYLgYdBDoeBXjPv2xPi2NCm9ffhoHagPwVfLtEDcILA94/JsrLQSs
         atBImuTbZxs4v/HgKOhTXN4Sul8Ef0nzJaSWPYPWFGjQ3OuDJgfensaA+cOZfFo+vrGL
         cUxw==
X-Gm-Message-State: APuU4Z8IE4aSEQKzswOVpLDjRqpM/CPJRQnqp27+0A12vPiECzj6mwb0
	aoyxF59PjoUh7BmoeNUqP/G/slb1kXPxwOZ4diPjYcwP5rI87AOKkmZ2HbA4f4o3
X-Gm-Gg: AZFdTZcCKTU7B5Ma2p/Kt/FB0IsWtmlzwpxcO/ohlBXtdRQAlIsbeVn1GtIUiUXdADb
	L6g55SfVpVCQwo7l59ktdf8E4SPPTDEZ9RfM+c9aii7goGO0YTpm+r13fepu8m6mCqTTViRaN3q
	CdEqkol1VLN5k1H2qGVoUUTRIgn7WcR9hT4WF1rcAgNUBBB3N3f6spRfs6SSW6msZa8XBKwCZSa
	ESsSKw/X6TScvkh9CV7waUx4me/IXnCxQ67AIem6opOOWkfBtfSenV9PUvXbEMpOjrO2OFlxlqK
	+JfDnslX5z4pOX0s+8M0v7k9zDREwscTwLbcFJkrOKgjm89oXttlzIdxS20gc2pAMRjiekndoRq
	Ra4UjUDAc6Nk5EbmHHXOsI4x42GHRrHYPViP+fVbUQKCBPJIahFMBWh4Telj+l/0r6WV0TS+gxV
	vLsFR4zamCb7MJU3IvKfpx8QuUbdACtqCC5e5cWoGIUKI6Ux+29oFvbll+XBRJaZTx4pVuogW5h
	Nhiv++76SNogjq6LNc5F1wreJDCxVCdFIvTj+qcPfZQS2s1GJY4Uo7DhEuBexmxb6XO5RBcEOKZ
	bQSASn3Hn+yeGZatSX3xvQjpbNAnTy5SBBh9kJYyqL8HaFnOzZkWpEAuZNUtDLi2K3uZe7qAOEm
	+gJppRG4t6nhPNzpfTFYi2IKH6fMsCAnfq99VEonfd/VO5dsWrwYEgPu7LEE1DD4N5A8/VhrU2A
	uudEu3LfadqVX3EXN6SlClj05SZQFJUKgaVqM0ZquR9Q+G2cdqW58afBH21bMD2s8tpp0cNPtsl
	PU8Ugytyiu3RkZAYMjEGQ2JJ3q8tYMJLgy11EpXa0CJeuf+ZTbi+KqwgJvkrah5QCnYE9zdcUOv
	3T8j
X-Received: by 2002:a17:902:db11:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2f03ef873cfmr245431145ad.6.1795762841900;
        Thu, 26 Nov 2026 23:00:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113719395ad.71.2026.11.26.23.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:00:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 10/15] sngrep: upgrade 1.9.0 -> 1.10.0
Date: Thu, 26 Nov 2026 23:00:33 -0800
Message-ID: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133299
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
 
