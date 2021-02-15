Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.25700.1613351619811902368
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YSqL/sLc;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id t2so2932867pjq.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6rz0+kEXNKvtjv47a0Q46VgNyXp5oP5bQdytrD1tPYE=;
        b=YSqL/sLcYAnLi9Oh8Bh3J2GrIT7zzxbtU4jKn3XhUOowLRG967LUzVhdmcrvxbXrQj
         SDuZ8dEvpbqY3WHwVY3NVmRU3KmJ9GnZx5R665SC/+wa7Dmni2/QdNk6pf8dLEbZvDkI
         IJMHm46qEAFcAzPMgkbkJrucHi8rfJw+857EHiQVhhh6sFpkrc7VYo9kKGGlGnQP5Aff
         MJMq8wGhSmBp2awJVM72sQeM/kHIY37Oamb7fLR7AUtVMbWSTXKZGHGTBKOpFCeUuy1C
         pwtf/LPbUpRUiI8B+TZfsqfC87QxKaw12CiMjDgyxhCaGlfSQQAoY+JtcFj5hCiyuaBO
         sCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6rz0+kEXNKvtjv47a0Q46VgNyXp5oP5bQdytrD1tPYE=;
        b=UWw4PtGsInv4WlOGbBnLYVYvc1j9qu33d+iG/NOFCD9IM43dhGdZpUtAWRCwonq7g+
         ODNn8Czv/m+M4C1oaTemXGU5y+Mw5NMYo3McEZS39hBQfgJniIuYOqs+HkpVlr9evePO
         +8aF3DXZEmxsVrSEwtFt7LoJrRwmg+1UOPDpednUDw6MCUPpUEScISOU6gfo6A6lQguJ
         Es4ZThvbiFIi8PujCnFC13K6aph9SrCIz31wZQ+l/CFkns1Xh1wjzOLMWShvDqmGTdO+
         A1PpnXaCFe/6bZ7lE2R9XvbP8i2dlaz7OEVSC38NqHtyO8b50799BBFu+9jDi96cV9ue
         Ea8w==
X-Gm-Message-State: AOAM532vfY84J9qsxagjn+FgfbAEm6VgwuNBZ8+EzVz2n25clycijYVm
	nL6Mxeju7vPuvW2Tg1AcZF27jvVNhLHAeA==
X-Google-Smtp-Source: ABdhPJxOXMrncpdUvJXeu8cG85ccYxpX81Eu17PT0gnIt7hVDNj/FuHYRMZDTOt9Fmm3lw5EqcSY9w==
X-Received: by 2002:a17:90b:4ac8:: with SMTP id mh8mr13704826pjb.38.1613351619072;
        Sun, 14 Feb 2021 17:13:39 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:38 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 05/15] dnsmasq: Fix systemd service
Date: Sun, 14 Feb 2021 17:13:19 -0800
Message-Id: <83842c9150fdead52dc7b0913ffac32677720f98.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>

Systemd service file option 'ExecStopPre' is warned and ignored by
systemd. By replacing 'ExecStopPre' with 'ExecStop', the intended
behavior is realized. The 'ExecStop' commands are executed one after the
other.

Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55c94cb3196f53d0c1c76bbd74136d1b5d51802d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/dnsmasq/files/dnsmasq-resolvconf.service    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
index 2980f7def6..ef2f3f7e41 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
@@ -8,7 +8,7 @@ PIDFile=/run/dnsmasq.pid
 ExecStartPre=/usr/bin/dnsmasq --test
 ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d --local-service
 ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
-ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
+ExecStop=/usr/bin/dnsmasq-resolvconf-helper stop
 ExecStop=/bin/kill $MAINPID
 ExecReload=/bin/kill -HUP $MAINPID
 
-- 
2.17.1

