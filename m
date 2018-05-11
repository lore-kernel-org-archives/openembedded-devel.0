Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 31F1978464
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:22:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a8-v6so4204671wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pI+zqYpI4H7FHOvjpgcLyPLfUqmNiOOvn7ON5XHE9pw=;
	b=eNaQ8CgB8PffHc0WwOL7A0Mw86dPoIrOen9XBkTiVm3SCbYu39vhnfVsMnsHBiXUpK
	g44vuIOdzV4/wNHGclcNdiJAxE6wyd/daEUBMD8Qz1nz0tRi155buKJ7uoRdaZondivE
	tPeW7LU+iKOrRtTgUBAKsYm/uYyRIZPnZFFcJ+QAsaeziIB2hh8baKRn8kO8ILSm/KXA
	jC56u+/F3kl3g3gmcTuPqkT09MeYijTBYPz3RH8Jvl5T8uQIjORyrnNa/1rrEZsIjyWF
	AVkXQinglmNBOL7lHbehjjt7dSlQF7Qr2rnJ20aJKFb3zxe2mpLJatUgXWlQcph55u9n
	6PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pI+zqYpI4H7FHOvjpgcLyPLfUqmNiOOvn7ON5XHE9pw=;
	b=cVMydG0ravIMnWLXTyTqJvEv8LF2TuE0yGMBb8wFzLhqdIoFzkay74lIQzsjuPWbRg
	D9mkHwIwfoWhsZ/urbvwzA+slt8lX8sD6fzGftQxORnXbohcc/M2etD/P8qGDwqNtN1l
	TCTgnFE2eGci8kqbWHlNEC5A+pcJfWmvIotVtR8+qEUhaFINlX2/RQi93AWsSWexhDhn
	tWxxadE7ZRc7ORQryhjPq7QCUDJlZwqzhCI3bXDGWKBSaXKhhdbbDXufpwbjVs2MRAUZ
	qQDWGZLSAvv7tYo4aBnxoHZdleho9jLN5Kwna01+PsEFmxmEaeEZ9gayvKgHZqZj1YFQ
	flHw==
X-Gm-Message-State: ALKqPwe81E9UpCUmVlCY2dKFM+akQdg2ZSLTo13l5YrLbmiSq95Luz2j
	j8e4HycH4M1OqHfR8sFkXpAoYQ==
X-Google-Smtp-Source: AB8JxZqGJmCoNmEsR9yYJ9AGmsRMkXqJXUMOdvBPHaIUulWLtNvymdsI3DOvw4P0uovYN2ByQReSWA==
X-Received: by 2002:a1c:b595:: with SMTP id
	e143-v6mr2562344wmf.66.1526066537964; 
	Fri, 11 May 2018 12:22:17 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a14-v6sm6722446wra.84.2018.05.11.12.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:22:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:22:19 +0000
Message-Id: <20180511192219.7915-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH] libopus: add native and nativesdk
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
X-List-Received-Date: Fri, 11 May 2018 19:22:17 -0000

* can be used by spice

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index a24f5e30b6..dd6789dc01 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -50,3 +50,5 @@ python () {
 #| {standard input}:773: Error: selected processor does not support Thumb mode `smull fp,r3,r5,r8'
 #| make[2]: *** [celt/celt.lo] Error 1
 ARM_INSTRUCTION_SET = "arm"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


