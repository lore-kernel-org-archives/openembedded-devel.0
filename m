Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 41AC277E7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 34so10612683pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oo3LztmdZe7Sbc+1HWfmGR/acih40awghtipmOYB7Zg=;
	b=KLjzY9thV76qp/+Dmv0MfJJDVORYJMFlqUZfypxI8Fdeoff5GC0wXl6o/x0TmmLMQ9
	BSDz3YfT0FoT91YiYJKUL2y7hMmKIsD/OcSCI5+LHe78RDsVRQVPL44ol+TQFadOgOr+
	cszkT+fYxqhy/dpk3wRqtxOfRcryDtadr94jid4CwZmt66PpHJOlezngkNAI2cPDTZMP
	e5LUElpe0s1fCMba5BPX8+TrwKI24rg+WmdRQwdcNeBwrnoVVdfguFsXeeXH99MITx1R
	W29XPien8e/x5xBqnirrH7UriOwckxyzio6cUFGpOrSbLXRBWDC7Y/iWl1WdIAuA/SK1
	uTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oo3LztmdZe7Sbc+1HWfmGR/acih40awghtipmOYB7Zg=;
	b=B8HwcNeTHBnofIX5HVk+jVDMDN1jVr5qQQvVmsLw2lwk/72EIO2SkNDrejJpbj2mtd
	k22RM09JPCuAOw7xEXzAplCiVwRJkeg2vjUzN6ORWQTQOsyWx+lA5o9Fchq0fYKgYCAp
	ShXE49BufJFSWPapzI4frlXEOS9UOQyRk/szESWOy9d3a1GTp4y2XKSLKy1a3o6rWg6r
	hp0VInlF9SIOAN56oI9qotIE7Z5XvycX0qJo5ITCNNpJ6t7/tBI8JuHT1Do0mV+NypMn
	jWSNFdBjS+HtBsddyAhE1LoGjgGFPYxrODg9nyxot6o3wmg9zj2TV5Bic/7rMmWn9cT0
	rZ2w==
X-Gm-Message-State: AN3rC/79TrtaNwlo4KM5qDzbfWiq6++k3DUyvEXEUtMPzVCbyrm4HCSb
	cVz6US1D1jER/w==
X-Received: by 10.99.240.83 with SMTP id s19mr4347909pgj.45.1492116093907;
	Thu, 13 Apr 2017 13:41:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:48 -0700
Message-Id: <20170413204106.30679-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 11/29] ckermit: Fix build with musl
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:33 -0000

arrow keys piece is a bit unportable, disable it for now
for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 187a57e6f..61c08ee27 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -24,6 +24,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 # trying to look inside the stdio headers.
 CKERMIT_ADDITIONAL = ""
 CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS"
+CKERMIT_ADDITIONAL_libc-musl = "-DNOARROWKEYS"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.12.2


