Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7097B78AA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:14:29 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l15-v6so15866934wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=omNA0FZvLgT2d7o+S24Q6zW5x6kjbjM0OcwF7xwYk0Y=;
	b=v1VEs96uv4nJ2VYzhic+uqk8LS2htyDEgbM/nJCzIEWxEl1XF5jzk4GAgD7+5sgDeN
	0H+42W70vxRMfid4IHzxVd4zGP6HRGCt5Y/5teCyd1KqalenhhmsmnXFNXObFnhN18rX
	8FPS/tizR7TRQIuiKT6YrkTtnfUVDk60PKoKn/lKR9VS0Lb4z2Ws48J3z3G/A+9nTBrW
	kABi2skzFQOI4P8JYDPJATvTNKvZjWLZx4fPTNrfsNoxB9oI1bHh6JoQA0rfXMnVujJ4
	aNTr8vaqwtF0aKfNNY4TqreGhPL5sjo57kN+ZOEaySmFf2+3jG1eNSTCgREXp+6APJXB
	BwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=omNA0FZvLgT2d7o+S24Q6zW5x6kjbjM0OcwF7xwYk0Y=;
	b=oiRfRxTOZ9cDKwSc420x4w0maaxV2TEVDY38K1ilfkvO3uOyqZztwWaD+foyzTxPxH
	QKM9jXb98N0Yj56FG3U1mn6GRqKYX6PE/ZIEkk0IiB9L7y16rl+PdpTcZXwyvUp2wZ3B
	plmekoLp8sbp/9lk1O80ikXdmzHCQGtks4SC+QSR/4zcuyKgJSeH5nMDTmNYPhbp8E3E
	kQL0K+vGWod8X+jzj4yX/Y9okgL30mbehcOfB7gP7z57NnbJEMLSTLWLjTv2qGK8qrLy
	NlUSCgaPjEIJNlfXLNiQQbJ+eRa3TNOoc6QhqFM64bBR4JhUdp41XEPjTgeJi7EleUBX
	TRgg==
X-Gm-Message-State: APt69E3lhZAqGkBTsNCKZlrpiEJdHflaWKYltmoGU2K8F/ip0oJBZuEy
	mwrnA6BcB8o3mARc6gWx4Q76cEQA
X-Google-Smtp-Source: ADUXVKIAalXBh+DP3AB+1bf4x95bfvwDpxvwAFjNDxxVgeRTtwJrE5zL0f50zzT99ZjFJ4Tbrd02Iw==
X-Received: by 2002:a1c:e80f:: with SMTP id
	f15-v6mr1034025wmh.137.1528827270040; 
	Tue, 12 Jun 2018 11:14:30 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:ddc6:6bd0:776b:2bb8])
	by smtp.gmail.com with ESMTPSA id
	y22-v6sm422040edm.95.2018.06.12.11.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 11:14:29 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 20:14:25 +0200
Message-Id: <20180612181425.17444-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2] mercurial: upgrade to 4.6.1
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
X-List-Received-Date: Tue, 12 Jun 2018 18:14:29 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../mercurial/{mercurial_4.4.bb => mercurial_4.6.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_4.4.bb => mercurial_4.6.1.bb} (85%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
similarity index 85%
rename from meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
index 90524974b..13710aaea 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
@@ -10,8 +10,8 @@ RDEPENDS_${PN} = "python python-modules"
 inherit python-dir
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "c1d9fad1b7ed7077b0d4ae82e71154db"
-SRC_URI[sha256sum] = "234af4a67565c85923b0a1910c704ab44bcf12f69b85532687208776563d87de"
+SRC_URI[md5sum] = "f9b2e4a3b5901ef744fa3abe4196e97e"
+SRC_URI[sha256sum] = "89fa8ecbc8aa6e48e98f9803a1683ba91367124295dba2407b28c34ca621108d"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.17.1


