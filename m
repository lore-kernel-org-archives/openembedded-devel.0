Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6448.1794046332363141705
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Cw48fADP;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f6295304dso1506120eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046332; x=1794651132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey5STgU1MiArszvFC1yJqQ7xHTt+fMubzIn0LKG8Tkk=;
        b=Cw48fADPfXn6OvOBU2JBZiBZ0TY1IWWYGGsLEutvq4Z+K5rD4qoS3+AM6pQZ62+SMu
         dchdqxt7xsIVKVizuQK89+kHK0fmsiIaXw0YYtWSoUxTYy0oG5COZiK+cf7oDAl2QqIJ
         fm7bs5XY85hGVSiokgdpreGa+JHG4FCgJOe7JBvQVtUpdZR5eiEYXqZk/GxHrhEU1PYT
         iDcDbfztJnSJMKDeDhswXYligrpqeHbk8HXyx3sASkgFz4dFc6vybuk5g0I6cukv5/Hm
         vlfXFuOjHZMv1t00gdiY4MdPiWZsCOj//ceSt0ZT7OZAQiNx9EA7+ZhnGy2Tp7dMD/hL
         uYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046332; x=1794651132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey5STgU1MiArszvFC1yJqQ7xHTt+fMubzIn0LKG8Tkk=;
        b=kh2GeckNEXSBGF6bIDkFINjFBHa2Bvx/q3M80/q946/vImczLRgHUcQdpPBzttaVdf
         0HU0HosKh6KGsYqH8298E1FLP7tx1ZDnBEqCNC0gq3Eh4P6x1Fi0+IHsgt1rlcREE75N
         DKc9NzYIMr83XkHea27w1bHj7ipQ8OiuXpvKZpBkskC4Zdx5izLi4dt0xmZz/BDGdroS
         0fBUSQQ9z4bjFrtDpFBfFU5tRPsdflbQ8oV2hTS1PIJbxoXrDIeFPIDuIKq+a8BnqRJH
         aVBjhxMjGNhmHHRKxBnmNf9B6YdNtha2DR5NHa9qiqhjjIM1EWwAX/Dhqxfb+SNxA+oS
         sJmg==
X-Gm-Message-State: APuU4Z9HeBDKDz91xaBXzZrfh1UwHaPtlxwIx00vBuGTwi81iK2R/OmT
	DMW4Re/POcDlo4VWKglVvtDV6FtR+JqowbMlwYgeVnfuZCHukWitXFyOFf+P0Q==
X-Gm-Gg: AYBFou1fsn7yecVsZ3JZcxqWhI55RaggJExtcJTqvJgsydw04+ksKDU4iyKsPBX1mRs
	1ZWHD+2me23Uovu3wjdJsGHOtYguTVvETHKdaLSzWRS2920an+ed8Rn10aAfx8xnFsYJDmghj44
	EWLa3ekMSwvRwRdTiSim6TwX1WwVEZsB/yZef6Fhhph+CeFYTOAiYmOixZS9NTlZ+/YST4fQtpl
	bw1OpzK5QaXcu7sOHYnLxE5nxg/QeL5LELIdr8QOlxM99os5YyogsOKBlzuGZvfTHXXoOc1AwpN
	OUFsQTJRNGZO2jj8L4ON0rSozNFxaD7NJwQvPwn7ZnjFNpU4aRTkwupMDDpVL/tXwuPpnJ0alnT
	PgL/w036HVfDXauJFJKXI/CTPq03+zqID7VsjxwNc60CzBZVefAq64LrXXwKSbEQf8KUr62qyPn
	amnZX2n8kSeWGM9jC5MHNx91EdhA5oRmnuugwspFyMf+VZyN7OYymCdI+tXl2tcy0XFXAmQKlHM
	y/cLFEWS9nbwzNHOiK8Hwv6xe6+LBLTGox8M1v+rzalkrs+KfvEo9qIPyYtEv+a5KWvE6gZB2JI
	s6mgBMQtbZErtS4fFRmzjw4PdfFl1q4MEhn/eNIR32LcFayI6fXmpwdIjAmRpxXBHsl7Wg5kSoA
	gOxY6oJw=
X-Received: by 2002:a05:7022:ea8c:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b25d32e856mr6994115c88.11.1794046331614;
        Sat, 07 Nov 2026 02:12:11 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 6/11] libdaq: upgrade 3.0.28 -> 3.0.29
Date: Sat,  7 Nov 2026 23:11:49 +1300
Message-ID: <20261107101154.2992152-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131980
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/snort3/libdaq/releases/tag/v3.0.29

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../daq/{libdaq_3.0.28.bb => libdaq_3.0.29.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.28.bb => libdaq_3.0.29.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.28.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.29.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.28.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.29.bb
index c9231100f8..89bc961a1b 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.28.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.29.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "6e76888ae8ddc5dae1eb110363f2254d0f701b32"
+SRCREV = "c8d4083904f7791f596d853178aca4ef1e20f7d3"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
