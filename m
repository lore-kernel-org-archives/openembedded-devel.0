Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4269.1793738646521599392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pmIHnJoc;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b1ce85287aso69748c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738646; x=1794343446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyZZd96FOp06DCSaxP/SXZ5bEzQItK9SUTFvsZh1Zfg=;
        b=pmIHnJocY6bqCkpzO1I1VyXbTZs5vW5IGfVU7+h1YgjD3iVTt3v06IkvoLdMSIQrNS
         LLf6imtM3vPGFYzGn3QZW1HAr+8gP6cds8kerd8eUYZPrKpcNml+BtWkALL1Bb+toVNq
         NtXxAs0uQHY55R0Y4B0aGfRD2PkxXmpC6x2VTaKqkaiIMZLCn6BCpHJk+JBudiKRmm36
         cCo86MqkWOXpOMTdBt8+VZKbGIqYqAMWvlbhI2O/qgc/cqpGShndYFG/ej9adr5ZOyvA
         Yzb0EFH6hw8ndGLlso7QK/ECKrUSK1HGo6/Odo7qcppEwSbJjmoYouIOuxzxbAgfKwag
         GdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738646; x=1794343446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyZZd96FOp06DCSaxP/SXZ5bEzQItK9SUTFvsZh1Zfg=;
        b=ECp3ZR5sU++cPlTLgOiLU6g6JvdBft2AJVg/eaq9qo6JNkd0w7tmdnt70bdT9IqEgd
         euPBwbau7uoyjxc2q42SewWljJWspvQx4+h/Gbi65tVXsofxktPehDY8M1n/zfxkZmrV
         qfG0TQontb7xmZVm2g/u0klHS0BHsxjLAX8o6i+mP2ui79h8twAjy6T9oz5T/eW0gAZM
         nN2gNnLy0zZ4c1eIU12yEBZ+Z7przG9vcnESipC4VxZkL4qAIChUvJPM2OrrdRLTtTdK
         uYu7ZwrZ0dOm5sM/F89r3HYK/a1NSET2YkeM9z4Dyi1Xb1TogmdezRWGPwHoCa9Uy3z4
         vqxw==
X-Gm-Message-State: APuU4Z88E+yPVnrw2TMwc+/kYIbj6uL0dp50n51Up6ts34hcO6JEWS7z
	GvWaVVtHUz3QY/9Fi7Squ4zykYGr8mWm6/66nF2X7EiPp/xaKVHkBtnocW37EQ==
X-Gm-Gg: AYBFou0VcwWDfDQBqdHt6Mw2GAvPupa8w0pPLqwYOGhYBZZ9QTG4hDZDblujus7wvBT
	0TIFpbqeVeX9LKNn6uKpjrsWzk2ar4NJgkx7G5KkOUvGHWJRrtR3/2yWYVGHiMykmLwIpiYb+7u
	oGuknLP+v/uLlz73cqVTMYiBgvmB/X4ayUPzP3rTT1M6JYJcyVgvW2T2M3NTMMKkuTZKHmZheGE
	zMquDSB4Wk2KotSls3ID1a61IrmMNXYic452zLGJni4y1CU5JymaPhUw88Ik4eA0u+zsANNfmVr
	iLajtTcV9mY/gsRsABluhBYs6sKozv7aluX6Uev5g2ysuow4WU5uMohyjcHLmsJncIefEJ6Cmhy
	29iQpl2gzIMEhGcmnuUpIg/cktHP6e7AAGBpJaHl1xCtfP540YT2zC64W2oT5Ak7qVF+3B2HCGp
	1yBc6YHuMFdPobWPwNOwKoFIPt5t7zmt3AB5fJDZJn7JebPQN//HRIhFuanb+t7Qyj15oX4m6G3
	oXIpgPYVEOEk/8aNTDsFc6afCz/JEFmfCBDwbjYmxXHlVXnI9Ami4ki3AcmmB43ZWEHZ/+apDxz
	0GEIbzDnecMduADfhaSu7hj2vC/OX0NqX81xVfaPZCzULkmPpjzqsXvwTb94vw==
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr34360657c88.29.1793738645460;
        Tue, 03 Nov 2026 12:44:05 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm1544834c88.21.2026.11.03.12.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:44:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-v1][PATCH 5/5] ctags: upgrade 6.2.20261011.0 -> 6.2.20261101.0
Date: Wed,  4 Nov 2026 09:43:50 +1300
Message-ID: <20261103204350.1092741-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
References: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131823
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ctags/{ctags_6.2.20261011.0.bb => ctags_6.2.20261101.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20261011.0.bb => ctags_6.2.20261101.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
index e2f6b309ef..ec80a2fa25 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "82494361bb3e7d4f7cf1d2bdc0d0e9001c926e45"
+SRCREV = "692cde832a9b0bc74ad5bebdbed4768b00435436"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
