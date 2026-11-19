Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1889.1795113454586719610
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=omIiz62d;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a07078200fso85164b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113454; x=1795718254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDlEgziNqunqggW/luFDNrufEbsRgIUzQyEFSwkgPBc=;
        b=omIiz62dgJLkp5/OZ5mYvxe5dPsts4tEF5CEPdilEMRIri2YQZXqWBBW/FPUOj8O4v
         Nrv+hUJU6aixM8eK4lOWqvEJyHDi9eSgJdQp3UEI891F3IEZlgHBZZ4h4A2r9aouiMbB
         VX7ESDooBTPH5CRC2ftuTsD+wpfV+UB0yfJDCg7rfFuHVN51lvs9qYvU5unk5FOV7GHb
         tFR2i0PxKFQUNRDIGAHY6M2QeOwoQ1J9TH9cJtmy4m4u+S+/AoOWCk8Bw6XqX1mDkxBO
         tZmLYvYEBUABf7m6i9RG8C2681YgPFA7S8flJYyXjuD7t2vw2SPsUpJOHsPoQMENF/SJ
         aG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113454; x=1795718254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDlEgziNqunqggW/luFDNrufEbsRgIUzQyEFSwkgPBc=;
        b=Wuio2jsBLRYJgIzTqQ3YSg6ye8DNjL86tztgeut1aytoZIWisQMyAbRMPqGFyMydsD
         F6msGYhyOzhd03mBOG1toBAVzdx8rP00ZAyuHt46EhwlFz/OTgcB+H3ICOcP2ndwnmI3
         0g/RNdqK9vw6Ld/sG931RBso7Dgz6f8OZAGVkV0kMssnRdX5eIVMEJNKKtFYBmqgsqN6
         F5lCcskgq0gHwqqxP3qGdlhp3+5BClZ99ycXAIGG9ouGz1WFfJ+pVCzN8SfXn+ignEtM
         KZJrURV98bfcz1obk6ZYrLSXRFOJ+/TEEizyrUgTggyfuoDC2k7YdXBfoYOtX1Q48GHS
         aQ4w==
X-Gm-Message-State: APuU4Z9Yr1efY/RIdtjC6TxURsDqbiX4xBFTx2rQduDhwdvHj9TeFXWF
	5NTdkQL+LIfP5YOiKwW4OdCiktyROwNMrvLdfNGWOzHx7edcc/Whq2ZuSU2LgQ==
X-Gm-Gg: AYBFou3rjTsdM7DNaFUqqw7ywn2VRvGJF69kfp3G6hBpS8YBucDoIvQMXd2KsbbIucN
	lF+DnJtiwAF7Ku9oc9LOrkvrQ5xHBCEJa7GLngMU2XsJ36kf5gc+eV4uQfO/kKoh02sLONyUYqj
	IXnfiQHpQTgggSei7r8JrAuTHMFHmfKmT+FVJP4QMHYMFOhnfwdfodi+RcsBpyg6OtP8LpHB6Lc
	u6CjrwAnGkjZhBLNdtxGcG2Z3ZksfE950yJKC3uOQFYNJmzHwb9cMKp0KBaBqGFE/yCdKmdFXn0
	Zq1SF+gtEm7ppPC2GERlOWcp0czMEPfJDew7RfDZrlkJucSa2GRJqHGvLok7WSR5//tHf/W/jUH
	dr6G3FIGhOdWNq+oF3LBzVOZx076oHc7jtDg+Ff0svP8rb1FEm+dWZC14XAzkXiG4wxSG8mnF69
	YmhAN64TuPFEv1v6dex74bW/sxY/lfz7J/roXxEYx7wLVatTdIfqpmBpOHtX7c82goKdp/gWxVJ
	Xt/98NVNTWwmkggodc9VHL2FFS9G2QEkoQiBpeUfe5qDTjsCl3rThTVpK6oWgGY9KqUtqn8r9gm
	uZ9AL85ggvFzTFN7L3+tzoAi86WB/Gg1neHRDEf0BkrU3hdFBffrtK7wQchkraETalX5t+yLmgc
	TyuThG34=
X-Received: by 2002:a05:6a21:115:b0:3e2:a07b:f383 with SMTP id adf61e73a8af0-4014e752d44mr463435637.70.1795113453961;
        Thu, 19 Nov 2026 10:37:33 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 39/64] cockpit: mark CVE-2024-2947 fixed
Date: Fri, 20 Nov 2026 07:33:07 +1300
Message-ID: <8a91e76e858d2220689c041094acaedfe6f5de26.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132729
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Commit[1] also identified by Debian[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-2947

[1]https://github.com/cockpit-project/cockpit/commit/9c4cc9b6df632082538b53bdc8ee9ec1c5cad4da
[2]https://security-tracker.debian.org/tracker/CVE-2024-2947

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
index e12cabcd98..3aa1f155e7 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
@@ -202,3 +202,4 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "cockpit-project:cockpit"
+CVE_STATUS[CVE-2024-2947] = "fixed-version: fixed since v314"
