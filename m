Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F40CD13DA
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27192.1762704028288799023
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WffMFb1+;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3ae9c3d0so87132f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704027; x=1763308827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iL672yT6iMQMyCv9bky7rtLe0ML3Dyl0oCtg1nTU408=;
        b=WffMFb1+ggTmV7X2CpQnjubmLYZBeQZN5aLcJA2WDCfcEfYN8YObAmdjT+lfdAc7o+
         eTii293vsaaBMbg1SLsBcbEx2I4DaYJ7HbzndxynDObE5iyeJ882/Qkqrj1Pmf6AgZub
         DV/jXL06b/JHAeJJQx3HT+setfibTsEkNNkx3YFMiS5913Nd8xyGrtckhlRS0kVrx0/G
         8xt9lLRvhW0GPPvZ4GxD34I/WPj80FM+Ov2/1QGdwySuJaXefOBnaUJxKS+37UYlqedr
         UXhSLnKVFa4cpw6ukP94xzKmgiFiq+MJ+Klmsv7kkoLs1JQoxmIzJSbpjsi0Y4RqHjPT
         oUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704027; x=1763308827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iL672yT6iMQMyCv9bky7rtLe0ML3Dyl0oCtg1nTU408=;
        b=CqM0WuYWWuowZ8fnYI01hzXz+Z/cnfvzSGQXZiyIpQfiiUQVKUd9IcYPnYqVTPLjK2
         +VsDeZebh78EV8tc5FzSlZE7D4I3dPURLKA3vngNMPvW92F8QpZAXtOwuj0gCJ2K3BB/
         IWR3nyq2Q9kxBQcoVxFjkiVMwr4887ZJmnFbcowvpgzP/kKEizAB+OjdatRetUvqY3bu
         4l7HxvT2HWcajeBL51jabKGICYjmSwLdx7eVUy9rdRPsInvyr92h7Swzlqjta/5Fs8Ri
         vEBdxEhRG9sLmy6nWp1bjiwOZtVy//x0tUA1bLRouu1pEgUCNCfoDWcH2CtML1y4IXD3
         3f8g==
X-Gm-Message-State: AOJu0YzSP/8YyiOWK2oAkrNayZN+yibbXk/0NpLKg2wKC/g4p9Axk1Op
	r4Nzw2jCngK6qiUopEnIDUFxh77DEczr/Klzowo+oCmxx/wzvFNOfNWuDLrZQqFq
X-Gm-Gg: ASbGncuI6nokk2XlQ/Z4twvu1ZEGLBGkDoAfPRjKYEE9m+Ut341/NjXuMDJvk/nAcus
	zDGBrWEfl/KMpYiJHIYYqy6WDztOVPTg8nK29sStNEbpkf9/p2sZmSpH3gh3bS6mpAg5schcDJ2
	We+6zRUGh+Dj1mneziqlgVzbdfjXR5VYat3ZgeP7arLCes3GNqL2PwMhBCeEVbHLD55JVVSNGE1
	g14SG1znthIKjIdBYa1QwtDrj18fbPe79QjjIQIF+y/u0+vF3U8Wuj+ET/b5r2qxpUitlULbx3c
	naT7DEBjUwy032gdH7/2e1glYPW7bWf+0tFPxcOwfzVuWI1yiaIBv+ljhaGup+rG6Yq3GcSjxlY
	l1zQiew+wyDWvYt05JZ0NyVTAK4tQCKRCQuPjiswQSJqMFDtkf1jRCfhPM9XKChUBYDFy5Qk8vT
	ef9suHguhT
X-Google-Smtp-Source: AGHT+IEfm0eF6u5HSDVSACNEMGleFhBxrA46q3LOjrd/y9dSgAl43MuwG9XBMnOmdbdNBr2wBCEX2w==
X-Received: by 2002:a05:6000:4009:b0:427:72d1:e3b2 with SMTP id ffacd0b85a97d-42b2dc22cbcmr4657486f8f.35.1762704026605;
        Sun, 09 Nov 2025 08:00:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 06/27] zabbix: upgrade 6.2.7 -> 6.2.9
Date: Sun,  9 Nov 2025 16:59:58 +0100
Message-ID: <20251109160020.2522353-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121422

Changelog:

Changes for 6.2.9
- fixed unauthorised file system access when using cURL
- increased TimescaleDB maximum supported version to 2.10
- increased MariaDB maximum supported version to 10.11
- fixed broken database upgrade if started more than one Zabbix server at the same time on one database
- fixed a crash when testing item with aggregated function count containing invalid argument
- fixed race condition when starting Zabbix agent 2 with loadable plugins
- changed global script name validation to include menu path in its scope of uniqueness check
- fixed HttpRequest limit in JavaScript being reached even if all objects are destroyed

Changes for 6.2.8
- fixed data sending to Zabbix server from Zabbix agent2 persistent buffer
- implemented API token authentication in user.checkAuthentication method
- added support of PHP 8.2
- fixed selects of history, trends blocking drop_chunks and housekeeping
- fixed success message when disabling hosts in host groups
- fixed the crash in calculated items when using tag filter on 32-bit systems
- optimized JSONPaths in the Nginx Plus template
- fixed discover status not being updated for templated graph prototype
- fixed misplaced error messages in the edit forms for host groups and template groups
- fixed template dashboard availability to users without permissions to the templates
- fixed Zabbix server crash appearing when only item tags change between LLD runs
- optimized Nginx Plus by HTTP template to spread the load across worker porcesses
- added the cookie engine to HTTP checks
- optimized Remote Zabbix server health template to spread the load across worker processes, updated descriptions
- optimized Zabbix server health template to spread the load across worker processes, updated descriptions

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zabbix/{zabbix_6.2.7.bb => zabbix_6.2.9.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.7.bb => zabbix_6.2.9.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb
index df29d4a9e7..13cd081b62 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/oldstable/6.2/${BPN}-${PV}.tar.
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "6d423810667b948ed22052d9aa84a035e2d4b92cbe8efdb669cac529806b722d"
+SRC_URI[sha256sum] = "a2325be57b8027bb340bb602c33f8092165dbce4da562301c03867101a21efa6"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 

