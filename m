Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25448C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:36 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9336.1788343528823856887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rt1cYGcB;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca12086c06eso719351a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343528; x=1788948328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/lamRA8E4r4uT6kZQuydpvY62itbZPxjzpYwKDjY3c=;
        b=rt1cYGcBbZkwfy5GUo9DPNxoKwA6pfk0w10q/7AdQ8Pm04m9Hqc25QFDXTlOrD4B2I
         MkbJAcQ2R0GNW5W66ssuCdYXkIT80nyaMIxFmJJ7+BtJkoEbew8Mvj8w7P4/7seHcXm5
         uoXk1vRkg5cpjHKt7OUI8s+MytwftC+FmRX+buj+tp2XlMD5M/8faA8YlszVoBSQJBen
         s7YsZzALIZA1YJNEIdi/YZOvv+7XWG9e0wZdS9726SBavfUsU0IKjqfPrbrQCnD3klIk
         J8R60JWHu4zgMtnNEA/ZtQySn8GqTTnqehjE9oRGDZT7m+ucab4Wc9C24ue45D8Hne1m
         v1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343528; x=1788948328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/lamRA8E4r4uT6kZQuydpvY62itbZPxjzpYwKDjY3c=;
        b=NJYlbMh47joaebM3PB5I24P46aWzaUSXtE1mXoYxTdsA8c7MObVg6RmXyOQmcD4O8e
         AiZS8tThwuhiH8rkHBkjHAdgz0TQCtrpPt5brsBzXe8hdNbnBg1WOD5abb84xdjyQmKm
         1DJllVfYZUUL77T863N3X/IvQsZyvMEIlvWBImnN1dAW36oKG7btGK1dh/h1yhQEgvGr
         vjWQa1G7Jt9PnigZC4IU2TUQXxeFOygn+yfNl663YpDoMAYGfV7t0z+ynYzURU6cYNj1
         4Vrze3/PqfChEOHYoURnQMAqrchlbpkZajQ88bnP3NQctPiaYZjgF/xDvFZqqZJESM85
         Ktcw==
X-Gm-Message-State: AFuF++kbhd+KKl/M8sIgVOMcD70QxtPVz6hRWjEK1YpjlSHRM6851avm
	BjvtQAs/QWRsn76xC7Pf29k/Dh/wCYredt72TglgsB5EQkuiKKkHJJMiusJX5gEG
X-Gm-Gg: AYBFou3E7fhRAnMe2J2sp0DXoMx2EvEecRsHXSy5JzAJoJm4TOy4faqwoST9stV1WpF
	ej6NnNHjN/2eaIuZIJgqG1pgT43JN6Y9/7HOFy02CVC3weZZJxLPoYvfzZ6d8MYfz/0MW1VBLLT
	A42sNAxqF6rm18ZrQA7wzkHRNtge10cao8dZ5aiEl3FtwqDqPcUfGihRFTRO8HUm8qoBs6f+SBp
	BSOxjPdu553b58gwlmYpB/SqdFX+Do6kOZFCWAZxe3qRrV4uFqXXV0GOWMKyieFiAKfb9KqwjCz
	EQkFz69YAJFtlatiC/7CJCghB/bA+a/uwXFDYd+RQvMOq/K+qid/zGChPtKanKTP8Db9CAGoFm6
	rQmj0iYipc1IVP+/MlgFSitb1pvgZT0xHKahtTDbHoP3R/QX4CAxj5zFS0Mv+98/4u9MC/EGlsw
	J4vL06SkaZ/BRWCYSXmJ9PEU6Y3uAmGbkN9Ukeghi/jYKUKFU4vE9lhgIcA7tWtskWoo2fEmF5
X-Received: by 2002:a17:90b:4d87:b0:398:e436:370 with SMTP id 98e67ed59e1d1-39aedf66692mr4646663a91.2.1788343528057;
        Wed, 02 Sep 2026 03:05:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-networking][wrynose][PATCH 4/28] proftpd: upgrade 1.3.9c -> 1.3.9d
Date: Wed,  2 Sep 2026 22:04:46 +1200
Message-ID: <20260902100511.2105916-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129635

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/proftpd/proftpd/blob/v1.3.9d/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f4b73e8ec1c5cbeac6a1cea104db3a30dadb41e3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/{proftpd_1.3.9c.bb => proftpd_1.3.9d.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9c.bb => proftpd_1.3.9d.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
index 95c9f3919c..8172ba3018 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "78a1bea439969913d7002bfb16ee7f0f60e262b4"
+SRCREV = "f59f248e26bdfa514443e42bf72a145641df635d"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \

