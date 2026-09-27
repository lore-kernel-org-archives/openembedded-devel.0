Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6488C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:03 +0000 (UTC)
Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35338.1790506255943924405
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DHhaTIaI;
 spf=pass (domain: gmail.com, ip: 74.125.228.16, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so707449a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506255; x=1791111055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amdJUaR0uYV7+BB/jQQ+tUdjROBia8ZWYdYtuV+Cq1k=;
        b=DHhaTIaIW1+XVUAXQvQJywXJEKFX/j0mP0YM5bt5THRJ7q1oGh4mt0c6XsRqVKRNlU
         Bmj3TPfsxV+TyuHDxoSIvICVWPeTXKqfFLIpgDaw5gAEjOW1Yxt7shcPE8vYpkIxA8BT
         t7D3TEx+ygLVkIiL7z5MbimtaxyGX3hYPmVFRiOeHh/Zv+Xlk5CG7yBJDA6+8/FKirYW
         XH9iGl5MCnSk4XvQhjSjnVjB9eUA9Hznz8pXn4v1J8UJCyL4mLfWeCkzeia3HUtUV1pR
         82ZkhgbQiZ1N74GGE2ACqLWSwqkYAMZnflwSihfhvCno7mUcMBrVeAdQ7fkCpwPIgZZk
         qVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506255; x=1791111055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amdJUaR0uYV7+BB/jQQ+tUdjROBia8ZWYdYtuV+Cq1k=;
        b=gH26NajO60EWI9C4clRXs9/D2OPplpcmJjRceNu3+gSnQkYlMFHnlZPJsATo/JFeC3
         X2Kg6siXOMAO2h2ZA+DzBBAhLxKPkjfyRnKg+ZZx/yCltS6HXxeYFNKPpxtDVAAN+zaR
         1st5V8H1VX5c6GwbrUZmq0x6K9avf/a0tOO+MovvHAfZ7Kc5psScooRKlyc5GY7YYPPa
         KrpXPw0JPqkVXxAgc8KIhPYswJDIYjPGUA/Ofu/MmJF2MSFJyuz97yXSxl/Xc+7AasW0
         bp6xscN3mBORA6aHUFuJUKVSbXkfXye0OSAs1Omb0mEhgIMKWsUfN8SF5S8emIH3BFtU
         p4Bg==
X-Gm-Message-State: AFuF++nWLr40Xc1CJYgQ3WCNblPbBmMjBk4cL5EwJMQXjha4ZDE3Qoyi
	V1QxBj85QqXAjX/netROWcDz35wWfLiKj7ouXkOOG0AzdHKdyealPCcqPWiYnw==
X-Gm-Gg: AYBFou0Fv1koEjLmNcKQgvgiE4mvGGHGcEyEdepr/bj593XcZQw3u0Au6ZCxHC8mYCO
	7MIGnh/i1qNSeu0KoYYFUxLE7Df4B50lP/SMqKXwXAUdkOYRfgd48RuFS0OY4suX5Z9NzioGFlP
	lJ1Ua4fg3zAonH7RD5YWLCsGm+h8mxu/C2ahay1BHuXmFn1EFDXeZWwZYG57uicPmUeHrb3Q/nM
	wcf1uhFi4ljyRKkZ0L7Z1SdGfW4987vNnA5qxwpY+MKZcj6fpKCKs0og9q6YwBzpFbaMj4jf9TF
	+KCu/IlgYN4DCvt20nQCtrqixNSi+7rw7q63H8WdCx+YS/Mlp8lszTTjkosIsd6YDGRsdS9Ixon
	gHdDXVfxSuucIFWwDTUN5nQWValTQ/heED07iE8D0BBgtp05VSuMPKAn51CgzgHyw0W5EI69Jb1
	gSHIdJLkQVxtZdaZ/L9FR2x4+Zdhcc/0staEFiqwAJm6hyHqE4FXFpq11j/RQ7+8gA3Gn5cK68f
	y6r3jMkl+rb+qVzTZvSzoI=
X-Received: by 2002:a05:6a00:b70f:b0:87c:e6aa:30ec with SMTP id d2e1a72fcca58-87e9dfafebamr7726666b3a.49.1790506255285;
        Sun, 27 Sep 2026 03:50:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 17/35] tcpdump: upgrade 4.99.6 -> 4.99.7
Date: Sun, 27 Sep 2026 23:49:44 +1300
Message-ID: <20260927105002.1832451-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130351

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/the-tcpdump-group/tcpdump/blob/tcpdump-4.99/CHANGES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tcpdump/{tcpdump_4.99.6.bb => tcpdump_4.99.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.6.bb => tcpdump_4.99.7.bb} (94%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.7.bb
similarity index 94%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.7.bb
index af7e8b6ba4..9199d184d2 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.7.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "40a8cefd45f0d2a06827e6658efb830d484868c449ad80f7efb33516af44f3da"
+SRC_URI[sha256sum] = "39675dfa06fb0e99be8da5d4a1784acbaab58ae0870231d956ff7870cb99eec1"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 

