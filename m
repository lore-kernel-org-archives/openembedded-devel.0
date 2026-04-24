Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA84FED3CC
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 13:35:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20925.1777037726593404196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 06:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eIMT80jO;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe62837baso4739328f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777037724; x=1777642524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19ZBj/6nTh09q6+BLRw37zhHykJihxHCT/EPb047gh0=;
        b=eIMT80jOONQH4CS/rFSnng6Y/+twyGEf+Sp1rGvkZgpJULP5+vYO0npohyzHENhXdq
         pPCHRWqFwebui+EII2UCdZNyeSLPfphJEmHDqKC0g2AWQ4iJdS/m4aZI5kLf1Z+5dQeo
         eOQZxroq9gl4rQr8rkMblV6TCf5qOPXA2spW0dTQUseu1ROvUpZ6ej0oXy02h1SVF9Kg
         PTwZkyGMzQnnvKKPM94rWLL7exfGqfetyy8+J6pPjq/IwiJaXXe5rL8ztRY68ecH+hE3
         ueJ6Kpo6ud+6dfLC1zm/1ay88NDStyAU1Co0+sIbi/i5kxYljIS/5S7DBmM7A46s2WFq
         Km0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777037724; x=1777642524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ZBj/6nTh09q6+BLRw37zhHykJihxHCT/EPb047gh0=;
        b=Ey5rXIIkl/pMb4LSiNKs+Kqn40MIH1RC4wsxFcss4+Jv+iC+OKehp/Z9lp0Byw8eSw
         saqLbh/htNTyVUXv30ZjXRopXHQD/7g3m80whHdGmmkPKiDhifX9huFlT6dj1jIgcGIl
         KvUTszQlxG5JogOgY0te1RtwOgtEJXQYAXgKjgVYbExQy/hIRHc9yXoUWXA7ayXzKcwG
         +LHrQ0g6omrg1SB8S9Aj0vlhI2dD/uRCUPZwXeTBaztccWuT9YlN16tEzE7Q7W+t45De
         KGUfVx5TD9IgN8Q0Q8DaeaM3I+0N2x1eQrCT3ArbL229Uz3BL68fK5D9tv/VcCUvOyZu
         WKlA==
X-Gm-Message-State: AOJu0YxRE0wZmWYBXf++LiG4jo4qkAS+FpOHABn6b5kuboyOq4hV0p67
	lT3E3BflKaYXvEo6kd3pWH96jEHHc3wTlXkM5sFxyhqMUs5bpIb6zrzYk8GKaw==
X-Gm-Gg: AeBDiesVWt9vko3wngqwjpxACUnZJBpbfpJNLvQYHNcparnebmepiXsOj9q9svADBtX
	q7Xlr/6xi1Sgk84iBmulcM5Saj5ZCwtvtIEidKaxyHNWh0nuHEuMVviyX1xkNpw0D1glvRTiIhl
	YpKBTOlXLgGQ6gIJP/vv5sNf8a5httpxFMLVVqvpp4CGM6IB4g1G8j5BZiVaer1xFM5IoWaeC0w
	j8sy9g7JogbKgouR314BUxdEKpXZBmkKAMhjjes6PXxs2p45PAVEjWgd8L2sabkT//IVbgKAHr+
	yMIQa+Sf+G/czagg5/ydVyfHj3K+3FSyUWwOFOFgd4sOogQpeAjlQbIRziXZctmMm6Pev7NeNsK
	25efJnUrjyTlxQkMa8MH6zDiXQ17vwc5GRzXAvV1/JfGJOnCDWoElXlpYiFj/g2pDWwLEQHdoxG
	w0PhNXse6bMISoMZeQS+pRWJwQlA/Zn3zE85EWk1SMrQouFI0djfyCbmTZ8rpV7t24ELvKAVyVP
	z7vcXabPINLV/P647Izfg==
X-Received: by 2002:a5d:584c:0:b0:43f:dc86:d61f with SMTP id ffacd0b85a97d-43fe3db30c8mr51368870f8f.14.1777037724236;
        Fri, 24 Apr 2026 06:35:24 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm24721851f8f.21.2026.04.24.06.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:35:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2881.80.4.0.1 -> 2881.100.56.0.1
Date: Fri, 24 Apr 2026 14:35:10 +0100
Message-ID: <20260424133509.202328-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 13:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126606

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/{mdns_2881.80.4.0.1.bb => mdns_2881.100.56.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2881.80.4.0.1.bb => mdns_2881.100.56.0.1.bb} (98%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.80.4.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
similarity index 98%
rename from meta-networking/recipes-protocols/mdns/mdns_2881.80.4.0.1.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
index 48bf3291b6f5..10560d795ad3 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.80.4.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch \
            "
 BRANCH = "rel/mDNSResponder-2881"
-SRCREV = "e2a1e56a2f8d29640908c48f4de3f1ba65d1af46"
+SRCREV = "ea3902cfeff86a04b4c684753c80e425edbd1a21"
 
 inherit github-releases manpages systemd update-rc.d
 

