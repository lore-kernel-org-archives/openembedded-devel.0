Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB4C770F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:27:48 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id e32so126331566qgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 10:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qc23vMpZSX6u9lzVax05kuoYu8kVYRNxOgKXLHkvRdM=;
	b=Bvts06pC33SDF9qsmw8swoL7WTQwm7J+BVApbHKQr518JsiRNHRRDllXWz2hd/OOWI
	sk5WDKnMsHDeya2d0l9w1kIWGXdCMMbsfHmBkW7a5Q46MlZhi9LEqAxG4rbfZMw5+Lmb
	ajxloel3b5DghCNa6Zru0GCqU4tGiWxa+Y27wYmlz+WhbXrnfiI/I7SdiXzzl23Nn5TD
	yjBGFixEXE5qh+JnkzPSl31r95RSrnZQpCWbjW+Wslm2oLDs0p86Jo8MybSfXy1gxfx0
	BS3QLPd++uHlPlrz0gxqJVpLmEvm7gJEXx8HjAjegr72nEpr7mp5CMFKq/1wdhIK4kQ5
	qpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qc23vMpZSX6u9lzVax05kuoYu8kVYRNxOgKXLHkvRdM=;
	b=D8Djr3h730FJA9yndbkLuXj2pdW89MQquRt1piWvVLotqjQVXpRMwrSwOHTGXNQb9H
	AuKAnYQyCYBeve6gSlR2d1wzWATRnZIiNYamTflxGHTZOs6xjqqQ8YANUxi/WjxNOi6i
	pRbKtYgBxnkLLGhaKM526Vymihtz/vfXp4fXjc4SciWIi/vavA9o36wmpc55nRy1wBng
	TNIUrMVgM/40yFtQDa/poE+bcQy3PX/FNzGlys4BBxfsiF70tacIOyVmGad4HmA1U2Lc
	aF84j9jw7okAUNFFPB1Qg3ec5Z/Q5Ez0+0dUkgo8I7OXgtHbASJWyM+JrbrXUtqxHLA7
	es0Q==
X-Gm-Message-State: AG10YOS3R68rtJpZHFhEyBFR5vI8/dYzLpLhooPBhGuqnsTNnbLEV0j8xOT1ySAfsqlCDQ==
X-Received: by 10.140.222.146 with SMTP id s140mr32230706qhb.24.1454351268927; 
	Mon, 01 Feb 2016 10:27:48 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.127.6.77])
	by smtp.gmail.com with ESMTPSA id
	e34sm14318729qga.4.2016.02.01.10.27.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 10:27:47 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Feb 2016 16:17:04 -0200
Message-Id: <1454350624-1149-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-networking][PATCH] lldpd: Update to version 0.9.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Feb 2016 18:27:49 -0000

The new release has following changes since version 0.7.19:

- client: fix segfault when displaying some information
- build: add some integration tests

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-daemons/lldpd/{lldpd_0.7.19.bb => lldpd_0.9.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.7.19.bb => lldpd_0.9.0.bb} (94%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.0.bb
similarity index 94%
rename from meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_0.9.0.bb
index 1bdc8af..3d97169 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[md5sum] = "4e924420e00ccd5dc289506f43221820"
-SRC_URI[sha256sum] = "aac11cb1fdc037709517372c70c9bf89c752ab8e5eaab9ce140b84ed5a0507c8"
+SRC_URI[md5sum] = "ed0226129b0c90b3a45c273fe1aba8de"
+SRC_URI[sha256sum] = "300e4a590f7bf21c79d5ff94c2d6a69d0b2c34dbc21e17281496462a04ca80bc"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.1.4


