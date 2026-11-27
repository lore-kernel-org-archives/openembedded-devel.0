Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8062.1795739688862511751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dDyj0/Wh;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5372928eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739688; x=1796344488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpKAHSEFwbGdO5qQzFugMtACh/WJzkIJq9N9GzbVt78=;
        b=dDyj0/WhLyAOANu3FTiXJkEtG+YP0B/DKEtu7qWEb1zelCSiojkm2yuCktuRxr9CRR
         ELPvLD3r2oWN62yYqr02iDP9QziaC/ltNux6qyGCnDserfix87BDerTJTNh2gCHYpq6y
         kQ72njqqGfgZ6oPwhFfUOp3na5FueC7KWEgN58UedcPUz21ChXCg/+lTyMh2G4LjSDk+
         MRbralbY2Z52D8rVx3Iy9eyzM0v1nv8axIPdYZkV0ff2sOQGYDA7AjPTxFWG/Srxzqsa
         KOtKvaEcx+fdj+YYDEH/ntjB1uRXGrn9hK71LthB7xFyryRzEcgT33np/qfQ6jjFqwBm
         72qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739688; x=1796344488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpKAHSEFwbGdO5qQzFugMtACh/WJzkIJq9N9GzbVt78=;
        b=Wruq1WOzDZTkYJoAkRWnkhZoWgiBykBwJFhHGpR+LBQpvoxVe1op3b+HldyRQUy1y8
         +Qi+ALedrvXQHn3ZL+dMND3snLMFlVjzHsCNn+gX+yPjKWp41kaae5wyYYmmQrDEojyg
         do3YiKiRJZ5oAKQ0/fX4MIaKomplly9AbISN5hOnvVIRCJ7K+C57cErnNNR+0XwR4DhD
         6VdU7/ucp92AaxbTnIUyJV3ug+y3alipKkpiH9qqJ+dJEAR5xvxq581b34fIKFmRlAf5
         yuxtAEYL3a2xrGwI2Q0iOpFC1/LYNApeiyiAuzVSTl3hHxvur5YIJNK5bIdMdUeB1MtC
         /s5w==
X-Gm-Message-State: APuU4Z/U2RMW4s+0JJQIk1OcTN2t8drytbHmHit6cNkjBCnCWplQ1+m/
	Gjo0Ic3PGSz6hPZnmxo/zjat9GOf4UiaJa0Od2egEW3G3A7E4Ez/dyKa+VIxaM7S
X-Gm-Gg: AZFdTZdolGFQ0n4FyMqKM4rrZpJ349lW/zmsui+kT2O7lOw88Bic0/P802nAz141Zjw
	qFpbHtcJ6u9xE/rB+czJLxxk3K+G02Me8ZKVjnxUUVBaSCl1NPh8a1V+otfUM8pSeujipF97+er
	8yVLGsGBxKTyWGDlCShGbtr/faF13PkoI9Y1qpal7ywWlvZH1X6QNPOAapbR2stow55eHEHBehD
	d/Z6ou5OqQKuL5zgFeM24ict6uFs7MZ+dygmGwrcMPLLEJzrY+YGfaugFDpbTOJkc0GD/UQ21WJ
	Wh1O9zORx5qi6d0HAgLvMWydln/MysNPKo6aaw2Y01qySW1BVUuiFaoLbnbEmzYBXtSkhGwVr30
	vK2g9hMPZubt4keqUlA8WBIrl+gnzpfdwBO+j4JJq/lraFec45vxQ1qopXd6lBiW3G1tCZgabKq
	yqTvSkGnCdkKCIO/y7xf0r7acMVZpMX91P8pDFWXBH30ArNdII8IwUZovon8ZvitxlrPhc8iL4U
	53pBvDogxGY9MPzT4qkO4TnK9FYSL8QHS3HHpnUGwOEKTzK+3wZ4UGehmWyhe5xngulUERfm6bY
	g+OIDtT8dxepHYoELUaDO7UfoelLgAlKPw+kkOkopzlzrfMqpMWMEFXQksiQvJVxSsI1YJ5JZhl
	vLTw3eYGbI9ganuQIOd64shA9JwnvH1oWex/mPyci+DtqsOuKBjX22vG/e/5BoTjUnForPLIgrJ
	XW/Oe5VU31/7jhB0seRgxSUb3nRaI+p4fQXIwFv0l7yK8Nt6kfKbe0hRI58sZ/FT3MP2H4DFa1I
	Xt75e5IFgOGdMRkZUwqDIEgucoqllUjJLgWqpnKS7DgtsATkeTb0b365MyVLvotGrgygYSr+f83
	/6/eJSNJZLohLGK+AlW7TJ13mg==
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr21716109eec.35.1795739688189;
        Thu, 26 Nov 2026 16:34:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/69] lemon: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:33 -0800
Message-ID: <20261127003425.2166632-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133117
Content-Type: text/plain; charset="utf-8"

The default tag regex matched a year in some sqlite tag and reported
2026. Lemon ships with sqlite, so match the version-X.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb b/meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb
index 403871a07d..6906462283 100644
--- a/meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb
@@ -6,6 +6,7 @@ SECTION = "devel"
 LIC_FILES_CHKSUM = "file://tool/lemon.c;endline=8;md5=c7551a78fa3fdecd96d1ad6761d205ee"
 
 SRC_URI = "git://github.com/sqlite/sqlite;protocol=https;branch=branch-3.53"
+UPSTREAM_CHECK_GITTAGREGEX = "^version-(?P<pver>\d+(\.\d+)+)$"
 
 SRCREV = "b09c88c14082339b66c7b7158d609a771e64ca69"
 
