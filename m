Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C638CD1297
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:27 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13711.1762853901849585262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMEXSWLO;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b994baabfcfso2479888a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853901; x=1763458701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nk3PLdFG6ich6bwCRNK/b/lV4Eu376tHieCjjb9O3Ek=;
        b=VMEXSWLONF23+oRkQN3tsz3lfZmgd3x5kn8UKZgFoKEfI22hZgZiyGYGZmxUk3UdZU
         1jrzcDmHvcnzvV0UfmXlA+wsElLqSs7v02nYsMDQYvBQ29wj8NiDVzze5hqiF1y9lxX2
         HfP/ppeyt4t6Z+m6I7KHBkbggkEO9U4JnVTjtY44iRnINfIT11BAvf7/X0Mnid8qLtZf
         497Brsh4usrKWvyNZwpLPlKH3Eq3goyLUDePGY66w5MRw7AAoVqAzQ6hHkQ4wyBK/UO8
         C1MgoTiAykrNqwK7+l6guS0+WsP52U8B9DWCBhUCe+q07lFT2jeNckDtK5QhntWwUvn2
         ey5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853901; x=1763458701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nk3PLdFG6ich6bwCRNK/b/lV4Eu376tHieCjjb9O3Ek=;
        b=O207gAGeavkSLL7aKOtG9PCfGkv4KEXEVFAfBRoMEcwjW6m6UaNtPR87kJHRffJ7BW
         dQ5HmB9hhvpLUU4kxLFIB+NS+Z6CMlJjyFWtCbYczIphJ8sMDbHUAYy/lG4P/EbXYHg+
         1LC/QMt3Y47CTyIaXakXRT4A+9UBxmTljg7GIt6eNStqlEW9QFueEbpMk8lzdeACiLLC
         yf5OQaQTP6ZVg2a6NpdH0fAAnDOcrnlA80SjVI0tZdTQOqCW+0L8Nec6pzL5xE0paAmv
         ZHUi0wI9ytHZDSiFdVYhoEnMv7EKfrC9aqLFaMOZcdiYEFpk7u/89ASHECDkoKvupWrn
         Q9Mg==
X-Gm-Message-State: AOJu0YxKa9VvUrcmUtlzHtMtFdm0GSj4TtFlMCe4HKwr1DZ7JZQA94m8
	t7kNuKQV4jyphzsxWgMPzrfSf3VkG6kCjDZ2K/kMmdQzApyPedlpfq6eD02zwA39a1k=
X-Gm-Gg: ASbGnctCff1axVnmCE0afqkwAzq8/Q07LlW5lDBAFbAhb9xGytbr7F1o4rZbt3J9icS
	d/GKxRA7X2fUpRcBNA+x35RbyLRAfg8hc+Bc1m19xXktDE7MWwkzpM8d0EVdHj+XjJTRHhEVKQW
	mjtQWILiNbJ7BSlREXGxozEZOwSfKD9Fn6BzGgFCH3S8E0kAKBQIVjPXhFISAsKqtpFRCi1rbh4
	ij3/Ce3U4eIq66SiwMTB+gPbIwJxJoB15h9ZDj79gOsMlsCqrpSdDIVVurCmLv0UTu+OBszIrmP
	5NYc38TktMjILxnqazdc9ZTERsjxgPnnJn69dHSzYMIo1n+yHFF3W/mf3SsTWJ1TV47kQM+0zwi
	iyOiQduVMqySqzTmNGqEQDn/w+rtj3n5wEkuHlP5RNiDaLrHbAIGZpaigexXXlmNn4IN3mCZHLY
	LzZfAIUaXDjszUkg==
X-Google-Smtp-Source: AGHT+IHBOgWt27YD3r5bzdfrcCW1eFQH8ljOEOI5EIJYHXb78v3B0/qb5g04tpY3nns7a2zo3P+0oQ==
X-Received: by 2002:a17:903:1ac6:b0:272:c95c:866 with SMTP id d9443c01a7336-297e565d953mr131669395ad.20.1762853901059;
        Tue, 11 Nov 2025 01:38:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 16/18] arno-iptables-firewall: upgrade 2.1.1 -> 2.1.1a
Date: Tue, 11 Nov 2025 22:37:31 +1300
Message-ID: <20251111093733.1393568-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121519

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/arno-iptables-firewall/aif/releases/tag/2.1.1a

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ables-firewall_2.1.1.bb => arno-iptables-firewall_2.1.1a.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.1.bb => arno-iptables-firewall_2.1.1a.bb} (97%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1a.bb
similarity index 97%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1a.bb
index e124fd2906..1dcd252b17 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1a.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRCREV = "a96b81da4a9b619e4045805f5f13a1e982c95663"
+SRCREV = "a4569b7602ef6ac850ceb8762da6f588e809457c"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"

