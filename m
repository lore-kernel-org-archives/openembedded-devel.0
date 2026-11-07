Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11973.1794070366847190858
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=apAodfGJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4675365e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070365; x=1794675165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+3G+D/C6gYUvrgyV+XDWDTwYdKdt6os5fRO/EFnbZM=;
        b=apAodfGJMmst6ASAjZAqNCd+QA/duTo1LZgddCq2ZRl++acXs6ENImXedziiswuhq3
         KY22Tdf+L6JQVebyyVMPnYf8RurmV+VufvcwmuykzvjKzrCRsUYopfChAYxODFnobNue
         XxbyGKGkVFK7jwTvTBwDfrOllxX0378gPNXc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070365; x=1794675165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+3G+D/C6gYUvrgyV+XDWDTwYdKdt6os5fRO/EFnbZM=;
        b=c6/7oMuxdxSXugtvQXboSAwRx2nPbXlLjlPC0SA4xNtTRW6PNkO5Z0UFmpoCnpj2NC
         2TpJEquBqxepFWEkHzThSfdti0j8/MctvC6pJoPcRX5GTX8ifK4qYgVx5iXTxhhgiWS7
         mtiiW2YZIhZDepIZMIGGuStXoMmzja4FTmiPtHaMkfY2JcQLUSmgRUgUrh10DUwvO0yI
         iMhA7TL6QY9un2XlnfFY8Tvz6drwMFC7g65lscbHjDzBV7lzRc1PclGFX2pD6hsnNG0S
         YHlzk0YEjcNEL6sI0VH08JeWkr2ToFjhOsdVmJEBFrQv9o8Km33I2W9OlSLCxUEuY0UL
         Y7UA==
X-Gm-Message-State: APuU4Z/zvLanpThw2JdTv5qp1xlVxpD0hP/ucVD/bNsn7UsmExXa5ipF
	XmmrglQWj8low+SqWPvdHViv3HkedgEN1CexjhGupepW0/eBJ5i24DhU7BXdwD7ryO/WuhblfYM
	wT8GU
X-Gm-Gg: AYBFou2Dyuyq0exaNiQFCKK4xKOI/WFH0uqp7LjXQFA+OKRTkQKUMaA8ESQ0eWcdXY0
	vLkdPjk4vLA93PnaSH2sgVDvzq9Mf2kJ34wJAqC3kN6iTqtoMl6Kh6MDOe12Z01YEGq20Ta/FK9
	UY4ScUgYNXZ7x+/d8Zte+eTlDJUeV74jpj8NfwqmfZoZ3ZRTDKy/AtXVG03GjCInF8k3wW7Q7kn
	nkHIakFq2SEre/4Dl9J1HLRt9Z/NBn3FrVWg+7zoVnh2RNH1jfl5Lw9131d+LPMXontEIS44A3t
	jNmgEPrlV7Uc7Yt/EBvE1nUwttj1msdARNPvk2O8hkuxTChktws5SIWNuP51A33fn7aQvfl9bnC
	deqos5RmRrw6UF77G8yhsgmmOpsKrt8EwHcThFFmLbnaV/ew6jiSTJDVSxH/u4kwuhvYH+2nEMB
	ilSNEXQydNIRxWahUiY7szqOWalAHYOzhU/c5TuB8H7g8/qAQkSLNu03LPo9XeXajaS5ElRV/En
	z878tbcRlqp5bgV18pfQuT6pOzaJDFmH29ihHtj+R8pCYxKzAB0IEWHVLuTZLQFl4pibpbCiSDS
	VxGbnxIRptkFwSI3L2Ri1kmAToLFqqsrHZDdVorO68TzJ1oLB9dJHEbKf4wgwIgywq1HVGGc1ar
	GwCwSvjvQEvVKoFkkY533Yy6uSu1WvqfAVt7S3nUuYz2ZYkd+amHsDQ==
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr47825325e9.7.1794070365174;
        Sat, 07 Nov 2026 08:52:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/22] meta-oe: README.md: Improve send-email command
Date: Sat,  7 Nov 2026 18:52:21 +0200
Message-ID: <20261107165221.122340-22-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132007
Content-Type: text/plain; charset="utf-8"

Add -M30% -C --find-copies-harder to the git send-email example in
README.md so that git format-patch detects renames and copies more
aggressively.

Patches that move or copy files then show only the changed lines
instead of full file deletions and additions, which makes them
smaller and easier to review.

Suggested-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/README.md b/meta-oe/README.md
index da6c4cbe79..d8aefd6db1 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -19,7 +19,7 @@
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M30% -C --find-copies-harder -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
-- 
2.47.3

