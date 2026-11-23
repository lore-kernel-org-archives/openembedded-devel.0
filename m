Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48529.1795411855954897484
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TQyQ6Og5;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so2375112eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411855; x=1796016655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDJE6vvoCc+ipGTABXdgg0bVHWWKOiBwkfGKln4RfJM=;
        b=TQyQ6Og5XYVvTO5lwteRUsif5mLjWr7Nl+ECsH2+wR6KNwiGTQAJhciNeErv7D3uiy
         n1oc+6Q7G0cvFDjVgPhfecoSZ1eZXe7hDvWIiEZXUO6VXZf4CaNnlCDkW5oN628symnh
         iqRnQMK2zE9yN7LCVYzqGWLTyODg3+AJaShNTh+g489ATujZHLMFwQesV6cwnZFi2Xxi
         1xLlm3QlCPQqly0IeNHGO9IMx54qTjtUq5jU6D3/a/307mqHfsLewuFwoc7U8K9Q/rCl
         T1Ownn+HzEXYgcqbPjrFb3O/1ENsPTw38HiILYHyd4VL4Xoc7moAVnNS0mWZrejZDYin
         BIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411855; x=1796016655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDJE6vvoCc+ipGTABXdgg0bVHWWKOiBwkfGKln4RfJM=;
        b=SM4ASx8FyhGXBMaNhd9GJgyke92qxOJzqAtNHkt9TwYQ0V7UtD5B6N2EW/mTQK7afx
         ZV9R224Wq13NZltlUiCObgnr1wofp20+Lq8uw5I0dC8EY1xiyd57k70fkuh3XK/gIb/N
         Zej5CCd5TJFegY+I2oQRBrVTeN79PuZNE9jRQEibRPPEtrZaBh57WEHqW8k2lg6m733m
         +5RCaxQNhxha6J5LFZU4r69lHD4guBYmMtOyplFHAWIm3aiNoHM+/ahuYOhJmj78bEQF
         NdJdS6Dz1Nby6pSVKrBleiR+CBsvP8oLKSB7iUqXIjUjyJ5s4ZQ3J+gAE9RT7TSHZuxB
         TzvQ==
X-Gm-Message-State: APuU4Z8wHUA1m3pZqngyC3VKaWX++qoRE77Mh3Gp2UaLEq5NajbRIMfP
	N4EZqtRcQJQACacg/LI2Wh8iz7m1zcwDDjFzEnK6En+TXxyG9GeDvcNhdgXE6GkS41Y=
X-Gm-Gg: AZFdTZcw+gidC+p4gjEywysh0vb9qaaalfedWcNosiay59uUrhMvjKy1xBPaxIwj3DE
	hhuEL+k0gxW5+peeSh/pVN603MGZw2FpzOifs2eoF8fgYhxK5Fq4U0dM5vW0/NdRJXFgoXaxB9I
	0Sumy5HuemB+BU+3Q++uwLCUpFir2rg+RfATeZIuyopLhEJC9/Uy94r9WBzVb4RWaXZY4E6mHR3
	9WdkYMMSYmp/HXNoBAa+s6rqrmPJvdddjBo24D8KPf8KSDIZuFKjGQmU5GmtIZDZx+67tYwM0U1
	LjZkfwHvG1x+jP8XGahiwkp/dsNToUINDXFUFC+K55y61NzpNBBvUvAPecfAOWcNO6mlHkm/Lje
	2C0QdVcAHxyIqtee2NiH/akZXrGT/ENMqtcwKWv39o8ynXqWiTitjvPWdit46Dy47CbGHHzFgEW
	JVt+0i2sq6fhzkM2IHeAwFj9e8xPxyS+6djfHVhcISWXmIaOhs7W1uFXYa0E737NFQ0wY+C2hAo
	7yUCr3o0/nJ/oUp2wmcz+dpFzcYiZ7JaQ1FeLr5vBKIy9gb21u542joE5mmxNMzOSKLClgau0Xd
	t3iylbr7bIhwyXWAQhCA7AZy/kHPTWBNaY6j5MY1VZy4aZOJMLfDQPh6JyhFdJd9BOHLFArC2Wl
	g8I2NESb/e3/XO2IRhu1CcCYN4ph8IHXttEqvyfD6eWasw1cSpubBjkEhuOe0zic6H+e7nLgKl+
	K+JlUO/wM8Zc5zYHhWSIywSfMypNXvsyCqUGBtyeuRDTjhZpv/VYQ/9MU995f9V/wkx6EQ+9taF
	utW9fdhD97rkFzvMsdL1XyZX1vokn2NPdurQBLv2Fo7l5QW2VBOyABCHvZceOJMO2HU2ow3eDfb
	v02m
X-Received: by 2002:a05:693c:8084:b0:36f:4981:da16 with SMTP id 5a478bee46e88-3857073f5ebmr10231326eec.25.1795411855271;
        Sun, 22 Nov 2026 21:30:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 21/42] libconfig-general-perl: upgrade 2.67 -> 2.69
Date: Sun, 22 Nov 2026 21:29:05 -0800
Message-ID: <20261123052953.3658549-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132836
Content-Type: text/plain; charset="utf-8"

Validate incoming config hashes and forbid comment, here-doc and
include markers in them, fixing CVE-2026-129820 and CVE-2026-129821
(2.68). 2.69 only fixes the Changelog.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nfig-general-perl_2.67.bb => libconfig-general-perl_2.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libconfig-general-perl_2.67.bb => libconfig-general-perl_2.69.bb} (87%)

diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.69.bb
similarity index 87%
rename from meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
rename to meta-oe/recipes-devtools/perl/libconfig-general-perl_2.69.bb
index 775246c648..a3bb37e17c 100644
--- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.69.bb
@@ -8,7 +8,7 @@ SRCNAME = "Config-General"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "473d65127b23dac0e8039c01e28bc4072cb9a6e93e81a1ea4893cea08c698db0"
+SRC_URI[sha256sum] = "6538a47e6950bca0b0b6ac4c69a7a5e915fc52cf060346d935f16570fec86d43"
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
