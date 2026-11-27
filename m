Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8222.1795739736371239642
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jHaz5rAF;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5373474eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739736; x=1796344536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYnUfkWoL9WAQPntUBcjFIVteYvE5enfl/fTfMsvP0E=;
        b=jHaz5rAFFxe/RHpXUYNer2WqRJs9Gnsp4SZipszwZENBtmfss8NFdVEYgSHpXo66pm
         zcrpaKmY1v6eb5+opyjfZV+KXlb1dkuf6IIptFM8ssjuLeMK5PgIwjrZ/qLUPg9j7dIm
         PdNfp4yIDbaRYpWQud1SuThsqIwPhi18geaqD4bYRx7rsR1AlkW5JB2DHh95VGdqOXwn
         tJxWQnkIAEy29GTQnS1Yr6HLCVU2+YlfYyTA4b2HVMnjatK4rLHp2kaz17TxhIH2ylNA
         s+wJ896DiffJNqDXeiEZmLlUyf86RRLzc/ZW8VkSGqsSatDhe75fECjYeiWa1UXBsUyi
         KonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739736; x=1796344536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYnUfkWoL9WAQPntUBcjFIVteYvE5enfl/fTfMsvP0E=;
        b=tD9Kjq958j6AiSv5IpCuv717ZuigXcvyS5iTeXbbZZHi6ZSArQ2kdapdfADC+8vGAm
         7VOlhW59d0GxqZGElV8uGHhNSR9+65JIPI/Wvkxbm17MHAoDCUl7Uv19vCkEZeo6aHES
         TzXqjhfqs8j9GndG/qLOGiZHSvLWJ4aN3rJ2wMpR/fPzuyDFRX4XVGxZ/M3n56q/a9KN
         p1wO5rhpABN1dN59FT09D++/PV9bDbjEwvWTVU66h8EltRxVnX1bff/J8CyHjXJ+ZBgM
         MS1LTqYnfvYmCR0jIOrS2ffs3IO3/87A/rc8m917WAsNwPajRJ/IxOOxPaKp1pNzg55M
         d0KQ==
X-Gm-Message-State: APuU4Z+LYYIXBOTFOVQinj3Na4r1rHNeXSKmA8jv0KKxvjLdUf2JdAbP
	wgGQCPNiVIpjAkVbRBqCtqa/lkziAyucJyhJGryCLSEl2ho8s3db/6Z7Ci3ntmTL
X-Gm-Gg: AZFdTZdfm25suFo46+yQxIg9DJKkWyDlUhher9CrYMk6hd8vREZ/ro9DaRxrHrhc8ta
	7GUZ8QU6yDJpVt6RxlsqdTprPgJXA4jmCPkEwblnGZM4trIYiiPewNv5qZSPQE4bg1e+K7BOd5o
	93xcjU4WBc0Sf1RxhFwnCvjjqcUJdDf/yctH0CbUCJ473rW3xVHIwrl0lsULjnCGoV3STv2gyOP
	GSGK8T0JwsTSXNPlxRqneLXtJhDNslrDIDfUnpXhheAk3VvGhknRWvMhAEaj4awn4xm/W5iVDcO
	AxoYlZZoDQqODkVGFUGnDid4Gjizoe5939y1xrCrtYLx+1FD6xv4lH7orTVuChUQZ//TU+DcJ2g
	80MXGZ/IDMjttFU1zh7uSzvXXwMiWqP1wEgZxDWqv1q24g7LQf9xtQRv8cHgggClKz826jkSpEt
	hs8CIVNpSU7PzFYSX4vcaraEFtM1+lzulXnCSPWwzou1GV0ikfm8sQRXWEHhVV3q8IEka+PTo1C
	ibvtnZ12FTRZdipxXBjKCd83s/0VsouQJrEVWyGee4z1PvUhtYr+ZAXzMmSbmhhr5Dg+6lYSQ/B
	ZMK7Nm3pDfnoE52XWXki8eahdqskDukoBX1KiRD++N7V0D0Q864t/oT6blkSOVDOJ9LkYRyOXuH
	5mDCMNcb53YEt13S5wtbaaPaSGw/o/M1YEUBTlUCYLMygmYAg+Y5bSnBLTT+bwgIazWUu5XScQZ
	hwIGJkTIpKAuF6JVbQEkO1aEw8fP/X/pg5f7fswAdzia6ZJizlzwRGbIwwCUiJpCYYG+BM8N28I
	4orw7eBnvrRWvSOXvSq1tEvZAbEOqRlpp47iYkNJZq1b7NOf5MMtghNhoEr5iRymK0rEFxZxBGG
	w7bU
X-Received: by 2002:a05:7300:c00e:20b0:386:c3ab:ab7d with SMTP id 5a478bee46e88-386c3abaf3bmr10277901eec.3.1795739735674;
        Thu, 26 Nov 2026 16:35:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 62/69] ncdu: Restrict upstream check to the 1.x series
Date: Thu, 26 Nov 2026 16:34:18 -0800
Message-ID: <20261127003425.2166632-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133162
Content-Type: text/plain; charset="utf-8"

The check reported 2.9.2, but ncdu 2.x is a Zig rewrite that cannot be
built without a Zig toolchain, and upstream still maintains the C 1.x
series on master. Only consider v1.x tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/ncdu/ncdu_1.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/ncdu/ncdu_1.22.bb b/meta-oe/recipes-support/ncdu/ncdu_1.22.bb
index 578ae4a5ed..606967b05a 100644
--- a/meta-oe/recipes-support/ncdu/ncdu_1.22.bb
+++ b/meta-oe/recipes-support/ncdu/ncdu_1.22.bb
@@ -14,6 +14,8 @@ DEPENDS += "ncurses"
 
 SRC_URI += "git://code.blicky.net/yorhel/ncdu.git;protocol=https;branch=master;tag=v${PV}"
 SRCREV = "7a1437389691c4adf1999afce63850c808602f08"
+# 2.x is a Zig rewrite, which OE has no toolchain for
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>1(\.\d+)+)$"
 
 inherit autotools pkgconfig
 
