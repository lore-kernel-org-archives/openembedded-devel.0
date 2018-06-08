Return-Path: <geomatsi@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 29A2275277
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 20:22:12 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id u4-v6so21872149lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VQAy/FczV2cUZgJ71MA3cmQHiByXFy9mrO6tk5ff6Nc=;
	b=X7+FLSv+l0yaAYg+4yodYe4BXNRtSdHD+KwIu4S3QcYhd0dtxvxd/3MZPtHXTeIYjW
	kugUqIjiAbP0copFECaC0rK7D7ZXJkKOlfVHrrvKNnnPht/JtPNo9LXSfYBlqIiWFsfx
	CBwAh7Wyg/foWQ5YUjp1vYjYX6fHfnonOtkrZfGdyFl8CwXREcEASP0UYq42Rv4UWApi
	aBgWsHEBy938GbBcFlBr2MXuGewW3jt//SmK6VQsFmV3Sl+Sao6eLjdTJgZGyE+dY2Wa
	URc7yr1i0tRJCGt8DOgVe7iLTrcMaSwpGwfrmy3MzIP30j24OGMAHrehcsITpGQL8K/F
	AEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VQAy/FczV2cUZgJ71MA3cmQHiByXFy9mrO6tk5ff6Nc=;
	b=L9Dm3+9gbvA/QuE3DNuFLaovjPjE3vILtWUKWQQ35qgsNiOJqEVVVd1Qz9GgI0MzFQ
	z/xGtc2Rr2son7zeK0fpu9fsH68oteP8nOirA+n85+0fCuerG9CBZW4xa5M9lqLW8D4t
	euZicJ7Ie7+4SfvRB8ZeUhwFFfMyGLaDd5MYOw8mk9fri4SnmmUXAQ766AHuqU9m0nsg
	6BtKbGf5s978xw1YZbVQNddQkZtGgx6jMDvP7a+4BLbU+rjrMvUe5o8Whpt83zmZ9tD1
	WU1XQROdAnjkvIe4dVeUGlzOMlCoZtish/rlbxCuDZDX1doG5I6gJzNRo7ZxpWbhrllk
	NieA==
X-Gm-Message-State: APt69E23auP8f7EAMTG69GDNbxOqKifGlnUyyPu/nNTtr+V75gi+dyPm
	Fe2IhzCMgl4w4of1XadjO9yZykIn
X-Google-Smtp-Source: ADUXVKIeX/Tawpwa6C92RNAYJfUuVC0PIpD7DDIQEEkuJVQ7dJaF676RI8sGB61FZn4kr7hMYKtZQw==
X-Received: by 2002:a2e:163:: with SMTP id 96-v6mr5745883ljb.8.1528489333402; 
	Fri, 08 Jun 2018 13:22:13 -0700 (PDT)
Received: from speedy.hunter (ppp78-37-197-55.pppoe.avangarddsl.ru.
	[78.37.197.55]) by smtp.gmail.com with ESMTPSA id
	w23-v6sm5293897lfd.20.2018.06.08.13.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 13:22:12 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:21:17 +0300
Message-Id: <20180608202117.5816-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-maker][rocko][PATCH] octoprint: add python-pillow to RDEPENDS
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
X-List-Received-Date: Fri, 08 Jun 2018 20:22:13 -0000

Add pillow library to RDEPENDS to enable seamless installation
of messenging plugins including slack and telegram.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 recipes-webui/octoprint/octoprint_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-webui/octoprint/octoprint_git.bb b/recipes-webui/octoprint/octoprint_git.bb
index cc56d5b..cdb55db 100644
--- a/recipes-webui/octoprint/octoprint_git.bb
+++ b/recipes-webui/octoprint/octoprint_git.bb
@@ -89,6 +89,7 @@ RDEPENDS_${PN} = "python-awesome-slugify \
                   python-netserver \
                   python-numpy \
                   python-pathtools \
+                  python-pillow \
                   python-pip \
                   python-pkginfo \
                   python-psutil \
-- 
2.17.1


