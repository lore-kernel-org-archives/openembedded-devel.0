Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5E67914C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:32:00 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z4-v6so636779pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X4SOYcA7rFOCV3RMmufB+Lgjj7Q/FtDqjn1BQiI7f2M=;
	b=oglAWf2gvILqmgqU8BZZ5D9+oWbxUklcje+0q59fze4xBH3Hzxlsm5mBy+XeJ0twMn
	14LqrT8iF6OxSO/0bjSuajff9L+r7TP3rJjrMCv+8hFQcJPbvcalH2FjYihRtIBVKqkK
	1taTuxbyaHIQhcENrdQtq1DAfxvecs6OlKsFS3u8RKznPBJmhBqcoewIgUt+iIooal4a
	fnQyQ2r0TzRnYgM6oqGAGzsdOPTCL4pjYQS5kSYM/aYuNwkUCIS3baelVe5rHS0TDK9U
	OUPDDJRgI2IgdqCjeu0+Zzy5WGZBAp716gNU31Bf5E5mPVrvX4GW7HqBJD3gMikrBlwc
	0now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X4SOYcA7rFOCV3RMmufB+Lgjj7Q/FtDqjn1BQiI7f2M=;
	b=KTGN7XFmwtt0KVwT65XA77y5J9Sw0TqfMaydCIfpfba4UhgJV2ZpSzSDNz4JMRrkqP
	ly9PXTGlKOIy0KdNAxaoPioPfPDqrAoWFo+CH3HjsisW1jJFrojwxShQsmLnr3TFBFL2
	13WrGignS3yofX6B/Y+rbHyy7J3BNFDUeGwRz0hrU/gF1nfIQafvAuyKpDamhhhpXe6W
	0Wi5dAtIwuib1zBEWQGNb1BUn+8qNeVb5rq/t8Noz6IVpuRj2PecZZdeReAP3+bOU/N7
	f8gSvF/OWd9QhVMIqUkcu2vvNtxeJimoas6t9ejZuu1gF0HxHuWRI+oyuNUR12Q0S1aj
	XT0w==
X-Gm-Message-State: AOUpUlHQI2w0i5SjCPisv4tyLz6rVdcafZEyOFQv+Tn24mwlJfALOemr
	OxVneaFakeBzRPFXK7zKhEe8djFS
X-Google-Smtp-Source: AA+uWPwAt/vsnNnGRQoLZ1LpCXlHlE67eOvdufZZM4MYityWSeqq4ps2yMy2luCNlROcnLI+E2spxA==
X-Received: by 2002:a63:c80e:: with SMTP id
	z14-v6mr39272094pgg.77.1534696321219; 
	Sun, 19 Aug 2018 09:32:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm14190520pfk.19.2018.08.19.09.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 09:32:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2018 09:31:51 -0700
Message-Id: <20180819163152.28471-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180819163152.28471-1-raj.khem@gmail.com>
References: <20180819163152.28471-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] xkbevd: Add bison-native to build deps
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Aug 2018 16:32:00 -0000

Fixes:
| configure: error: yacc not found - unable to compile cfgparse.y
| NOTE: The following config.log files may provide further information.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
index a6fc9e7551..b42c1b9506 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
@@ -5,7 +5,7 @@ events and executes requested commands if they occur. "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=208668fa9004709ba22c2b748140956c"
 
-DEPENDS += "libxkbfile"
+DEPENDS += "libxkbfile bison-native"
 
 BBCLASSEXTEND = "native"
 
-- 
2.18.0


