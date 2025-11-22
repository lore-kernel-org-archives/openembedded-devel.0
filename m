Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FBCCFD2EF
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.970.1763839895624442331
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8QzH+6R;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3720e58eso2381766f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839894; x=1764444694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZUNyEProcEVmF7mFGPjeNMIfhLubUAqzlzgxBhu2D4=;
        b=k8QzH+6Rn21PDRnAQuW/oR/2PaMUPIXPwIJANh/c8cIhmRwUplbY5V2FfWq+qdqJVL
         3enWByzEkbhC7a0OP9aqaR65APulv/E/trMZoEKOIBYhrcdO4q7AQ5ukdGmfmGTE2BQD
         BlUGO5dqIgK7hZNOqIooBcgUNHZ+Twmw5FGOC4k0O+2t+YDP3sOLc1I+9QiPUlPHg+Xp
         pJyjXVOr29arlVAX+VeY7NugnoShObEku4kX4wjApLlTyArF5lx5RaCAuJCKXST8+orR
         zyP4vU6qoUod6U4FLBepGWJ2zn9rbqI97QlI9VdoFL32BKqBLm6QK6yynOHWk6Qc/N9U
         T46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839894; x=1764444694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZUNyEProcEVmF7mFGPjeNMIfhLubUAqzlzgxBhu2D4=;
        b=w6Xk+KY75hcy8APjQ3j9L/6gWFr3U5dEcBJ1Ansk+kAc3h7+jlOTaiG7q+3+vUFC8t
         xg7OxsWvdkgEnstzXlVX3N8A71CkE1hhP6hpfZn5lch22B32JUnGKb+wHSLFHc61pcXh
         YHomjVWR4q7uuXNPHRfCRY0suCeUoqzMeS/FKfLfHvQ+G6V5wSitIzkEBfT2MNnMuQmi
         tWXmL0hyLmpy6TLplQyBNIYWbbpTtDW5qz+6JmdL89lMMnfdUFBUVYu9nwPoMYkq+PUO
         V06EPVfiVjRagjq+uf9ljKi5c9MF+GQXnD06x+vovhVcIcPV0Y/EtelgZ1SMQR7c1r+L
         hUJw==
X-Gm-Message-State: AOJu0YzKRBroJWPWgFs6CSsMWawIQ9WWti+igU91t0rozQHTMhTSHM4H
	fKC0Kd40MGkNfrnnaoFz8ZKjM55vYTLwldHM19YEgIHJKBUY7wWG3bIv2PyxjIz/
X-Gm-Gg: ASbGncsLnylWvXq9VCCiZhUZRR4JRECGKpGzdm0Ihxlx9m/kKNx/737WC4hDJY2S7E3
	QlMCHk0MDX8PdMuyN7uAWI/+1SZm9iQdXORLSpoVT1fuJK+6TPJ1OruFvOROqegyF26Zp0TFcfo
	rRD+ZTFduXEM7nkDftsjJzRx5jY7HLG14cqodnl/HjW1DkcN/eS1wkyjyY8K0j1U8cyjTS+CHGt
	7+T7R7ClXckNNCtKTxKIEQei+g3qw9mOQcPTXRTzXrniVditgZUA7CAGeBdEDfjWDKsu99wmWjE
	kLD1qDfQxLhw5W6WhcUNKgovDtZ9UkWuJRQy2X/24phecj/PMgDJLu729iRatlSeJspelP2cWbb
	4rsEEb1wGe6lpw1czqVADq5FDDcj4YWSzugcdsVIFRv80n36J6epCUGNNyf2MSU1fjqtvdEuLCy
	ngrmkiIoks
X-Google-Smtp-Source: AGHT+IGaw3a5l8v13uufMRckolHb0dWjcoKaxOiWx/ITu7BWhQMzNrdom2EEqpTbhuaCvPJdmd4Ltw==
X-Received: by 2002:a05:6000:230b:b0:42b:3b62:cd86 with SMTP id ffacd0b85a97d-42cc1cd5cedmr7088184f8f.6.1763839893740;
        Sat, 22 Nov 2025 11:31:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/10] exiv2: patch CVE-2021-32617
Date: Sat, 22 Nov 2025 20:31:25 +0100
Message-ID: <20251122193128.1703871-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121985

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32617

Pick the patch from the PR that's mentioned by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-32617.patch          | 129 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617.patch
new file mode 100644
index 0000000000..b34554e86b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617.patch
@@ -0,0 +1,129 @@
+From 8353d035bc2e0a0500251168a350d0252900386b Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sun, 16 May 2021 15:05:08 +0100
+Subject: [PATCH] Fix quadratic complexity performance bug.
+
+CVE: CVE-2021-32617
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/c261fbaa2567687eec6a595d3016212fd6ae648d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xmpsdk/src/XMPMeta-Parse.cpp | 57 +++++++++++++++++++++++-------------
+ 1 file changed, 36 insertions(+), 21 deletions(-)
+
+diff --git a/xmpsdk/src/XMPMeta-Parse.cpp b/xmpsdk/src/XMPMeta-Parse.cpp
+index 9f66fe8..6959693 100644
+--- a/xmpsdk/src/XMPMeta-Parse.cpp
++++ b/xmpsdk/src/XMPMeta-Parse.cpp
+@@ -976,12 +976,26 @@ ProcessUTF8Portion ( XMLParserAdapter * xmlParser,
+ {
+ 	const XMP_Uns8 * bufEnd = buffer + length;
+ 	
+-	const XMP_Uns8 * spanStart = buffer;
+ 	const XMP_Uns8 * spanEnd;
++
++	// `buffer` is copied into this std::string. If `buffer` only
++	// contains valid UTF-8 and no escape characters, then the copy
++	// will be identical to the original, but invalid characters are
++	// replaced - usually with a space character.  This std::string was
++	// added as a performance fix for:
++	// https://github.com/Exiv2/exiv2/security/advisories/GHSA-w8mv-g8qq-36mj
++	// Previously, the code was repeatedly calling
++	// `xmlParser->ParseBuffer()`, which turned out to have quadratic
++	// complexity, because expat kept reparsing the entire string from
++	// the beginning.
++	std::string copy;
+ 		
+-	for ( spanEnd = spanStart; spanEnd < bufEnd; ++spanEnd ) {
++	for ( spanEnd = buffer; spanEnd < bufEnd; ++spanEnd ) {
+ 
+-		if ( (0x20 <= *spanEnd) && (*spanEnd <= 0x7E) && (*spanEnd != '&') ) continue;	// A regular ASCII character.
++		if ( (0x20 <= *spanEnd) && (*spanEnd <= 0x7E) && (*spanEnd != '&') ) {
++			copy.push_back(*spanEnd);
++			continue;	// A regular ASCII character.
++		}
+ 
+ 		if ( *spanEnd >= 0x80 ) {
+ 		
+@@ -992,21 +1006,20 @@ ProcessUTF8Portion ( XMLParserAdapter * xmlParser,
+ 			if ( uniLen > 0 ) {
+ 
+ 				// A valid UTF-8 character, keep it as-is.
++				copy.append((const char*)spanEnd, uniLen);
+ 				spanEnd += uniLen - 1;	// ! The loop increment will put back the +1.
+ 
+ 			} else if ( (uniLen < 0) && (! last) ) {
+ 
+ 				// Have a partial UTF-8 character at the end of the buffer and more input coming.
+-				xmlParser->ParseBuffer ( spanStart, (spanEnd - spanStart), false );
++				xmlParser->ParseBuffer ( copy.c_str(), copy.size(), false );
+ 				return (spanEnd - buffer);
+ 
+ 			} else {
+ 
+ 				// Not a valid UTF-8 sequence. Replace the first byte with the Latin-1 equivalent.
+-				xmlParser->ParseBuffer ( spanStart, (spanEnd - spanStart), false );
+ 				const char * replacement = kReplaceLatin1 [ *spanEnd - 0x80 ];
+-				xmlParser->ParseBuffer ( replacement, strlen ( replacement ), false );
+-				spanStart = spanEnd + 1;	// ! The loop increment will do "spanEnd = spanStart".
++				copy.append ( replacement );
+ 
+ 			}
+ 		
+@@ -1014,11 +1027,12 @@ ProcessUTF8Portion ( XMLParserAdapter * xmlParser,
+ 
+ 			// Replace ASCII controls other than tab, LF, and CR with a space.
+ 
+-			if ( (*spanEnd == kTab) || (*spanEnd == kLF) || (*spanEnd == kCR) ) continue;
++			if ( (*spanEnd == kTab) || (*spanEnd == kLF) || (*spanEnd == kCR) ) {
++				copy.push_back(*spanEnd);
++				continue;
++			}
+ 
+-			xmlParser->ParseBuffer ( spanStart, (spanEnd - spanStart), false );
+-			xmlParser->ParseBuffer ( " ", 1, false );
+-			spanStart = spanEnd + 1;	// ! The loop increment will do "spanEnd = spanStart".
++			copy.push_back(' ');
+ 		
+ 		} else {
+ 		
+@@ -1030,18 +1044,21 @@ ProcessUTF8Portion ( XMLParserAdapter * xmlParser,
+ 			if ( escLen < 0 ) {
+ 
+ 				// Have a partial numeric escape in this buffer, wait for more input.
+-				if ( last ) continue;	// No more buffers, not an escape, absorb as normal input.
+-				xmlParser->ParseBuffer ( spanStart, (spanEnd - spanStart), false );
++				if ( last ) {
++					copy.push_back('&');
++					continue;	// No more buffers, not an escape, absorb as normal input.
++				}
++				xmlParser->ParseBuffer ( copy.c_str(), copy.size(), false );
+ 				return (spanEnd - buffer);
+ 
+ 			} else if ( escLen > 0 ) {
+ 
+ 				// Have a complete numeric escape to replace.
+-				xmlParser->ParseBuffer ( spanStart, (spanEnd - spanStart), false );
+-				xmlParser->ParseBuffer ( " ", 1, false );
+-				spanStart = spanEnd + escLen;
+-				spanEnd = spanStart - 1;	// ! The loop continuation will increment spanEnd!
++				copy.push_back(' ');
++				spanEnd = spanEnd + escLen - 1;	// ! The loop continuation will increment spanEnd!
+ 
++			} else {
++				copy.push_back('&');
+ 			}
+ 
+ 		}
+@@ -1049,10 +1066,8 @@ ProcessUTF8Portion ( XMLParserAdapter * xmlParser,
+ 	}
+ 	
+ 	XMP_Assert ( spanEnd == bufEnd );
+-
+-	if ( spanStart < bufEnd ) xmlParser->ParseBuffer ( spanStart, (spanEnd - spanStart), false );
+-	if ( last ) xmlParser->ParseBuffer ( " ", 1, true );
+-	
++	copy.push_back(' ');
++	xmlParser->ParseBuffer ( copy.c_str(), copy.size(), true );
+ 	return length;
+ 
+ }	// ProcessUTF8Portion
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index c8c5edbed4..389d8da921 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-29473.patch \
            file://CVE-2021-3482.patch \
            file://CVE-2021-29623.patch \
+           file://CVE-2021-32617.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

