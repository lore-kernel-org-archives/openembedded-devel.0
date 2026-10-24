Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3747.1792837524883448116
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JOAYtddL;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd76b1361dso8953925ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837524; x=1793442324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjENptmEJkaooccPtJvX1cTvA08OlWuhL9K9rM/23wQ=;
        b=JOAYtddLkJIEHRLC6i0jDmim3AN5NbRD9EYIEhovgvaLfxB+6JQmd9M1X3WYimMawG
         TtC5Cdi6A5hoRAhsCSlANhJ2evR6GR2oAHL5phvH/kFH+B4su+aHK2TLFqJtZOtdQKvQ
         aYmRIqwcF/tZRrz0r4qKqF7rBDEGELRUBq2ETuPbTd3dkkcOEhYh9o7BApViUQun2leM
         3MtQHtfXP8eL8LI1Yje6iKpgx2yuw7noBgynenC+pUURwN8xQ3ps1vdG/t+/1b5mC2E4
         A24qVNy29mUCCoy+6+REHfSYIJgj7G7HbdhClMlLOVfKVkFX+TswjDTXHMzof4B9zUD8
         UKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837524; x=1793442324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PjENptmEJkaooccPtJvX1cTvA08OlWuhL9K9rM/23wQ=;
        b=gNZzLZ5HVG7E8X05qEFWKZuvP+p1JsGqj8zZDPWMQNV3/P7ihG2h2y/Hz0yjK7Rs5m
         Yc6XkOOdKJGLH5xiOtKoKx6sSRZWIyGaidkTWVO5W8EM/qv8gVLoga0CL4brIwgrh55F
         MGzEwLGHpezjZIMg8KTyAxLgpfaAlTQEK/xz544EC71H7z2aK7BaISgenN6jesmYxl+S
         gujiMKkPfQA7sfJ+2W6wFiIFG9rJIZ60eIVUF1Sv+HIEs3/Ao6nelNyDJ1LtrqBHpzcH
         MqEENwpFL3/W6mdvd9Axz1nelewecwr00j1vWMVwy3Bj4Fdq6ybBHHom3RyclMx9JPYo
         MyxQ==
X-Gm-Message-State: AFq9FYIoP7goN3Pp7Zmu3aUz0HwuiLkEe/NpUhBqzVZyMlyzpuurbtUU
	C7ffAsTuPvd3MXuU7VUz3e/09Zy+xiiB3DRmcXbcqwMrffYAo2QxToiBpZl51W72
X-Gm-Gg: AYBFou3eStxfY6vX3ugJCByCcNPRKky61cAb1Kqw/qcI+QKgtxKTEKVTN+DLZKKCnLO
	YaAxYyp/LP/navFcus82wBDozqpG3jNJf5bj+nTGZr0mUvnO43yt7XdQuIQDQDByP3CUeLGHq6f
	t4lcrwFw+H3+LyGYSwp2cpUuwV2cZZJNU4V9+gl1gQmmRlgA6d0QoKbBH7N90+3z9MVou/Ni5N4
	QNeBEJO3c7IR3crRzJb5fPhSF68A63/nTSiVixb2A00awaAeK0HGPCTvoV9fCEc1eNmvpvRLV9L
	U0ZlH9bljuAjbhh1gD7GFhcnIt2mpJIpJd1UdpVVXGSe9mnMqhtf08tZ8i7JFcZ7m1LFK4RUT50
	sY8gl3bYzy5VOw4WIQWIphsaOl39x9M4rzBC++b/XVEneqxl4pTEr9MYOhm/NxdOsG4yydthfHm
	xvsCmCJmqt28BO/MufaE23uJMSKah/NG1PvPhHyAqrocUQbus0N8wvg2OqFwsHemd7+NvUQOPOE
	AHhhMHTF8yJwsAOx8XAisGGoxC/lteDOGK/LaAJxd8Atqrs1q4KFrsELHb9CqA3FkPoHtLMgxiv
	KFcorTYEBL9FnhaMeQ9p/02jIxlJuEHrX21mF+XLprHeaW6120uq
X-Received: by 2002:a17:902:d551:b0:2e9:4b32:fc6c with SMTP id d9443c01a7336-2ea9c69f27dmr13076375ad.26.1792837524242;
        Sat, 24 Oct 2026 03:25:24 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/7] zabbix: upgrade 7.4.15 -> 7.4.16
Date: Sat, 24 Oct 2026 23:25:04 +1300
Message-ID: <20261024102507.2256303-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
References: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131396
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/zabbix/zabbix/blob/7.4.16/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../zabbix/{zabbix_7.4.15.bb => zabbix_7.4.16.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.4.15.bb => zabbix_7.4.16.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.15.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.16.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.4.15.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.4.16.bb
index a112fc6319..568235e698 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.15.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.16.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.4/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "5e1d9b3747ebf9b81d5d62d8ce00ef9b3f7f4c081394ad11a2dd18897a24f394"
+SRC_URI[sha256sum] = "0e2c391dc184acce8e34250e7326a51e19c8bcee31e67b8497f5526247ecd261"
 
 inherit autotools-brokensep pkgconfig systemd useradd
 
