Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R48IS-00024b-UI
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:31:52 +0200
Received: by bke11 with SMTP id 11so2253934bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=o0JA5l3VOpRPzYGnkWMAaVgD41I3QKFTjphY+r8r5uA=;
	b=RSVsJAkTJwm/vjt75Nz7Ao+Fir1S5a0Vq5Zw3uMJvqRCYFY8EQ4rY+DOTynVTF6YXw
	rDKxzmfhlwzvW/0uTppZ3zLyfDZ15h+s9KlePf8KtF3U4ljzLfDFEAi2PHrFl1V9c4Zc
	swOOJsKZNQUNZHaMNnJPw1x3EMropLHSaQCMI=
Received: by 10.204.144.86 with SMTP id y22mr598706bku.160.1316078801730;
	Thu, 15 Sep 2011 02:26:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f15sm2508389bke.2.2011.09.15.02.26.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 02:26:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:26:30 +0200
Message-Id: <6f97022ee7adf86a732e555279716791430880c4.1316078712.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1316078712.git.Martin.Jansa@gmail.com>
References: <cover.1316078712.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 1/3] linux-kexecboot: move defconfig to linux-kexecboot-2.6.39
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2011 09:31:53 -0000

* linux-kexecboot directory will be used for defconfigs for git version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../akita/defconfig                                |    0
 .../c7x0/defconfig                                 |    0
 .../collie/defconfig                               |    0
 .../poodle/defconfig                               |    0
 .../spitz/defconfig                                |    0
 .../tosa/defconfig                                 |    0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/akita/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/c7x0/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/collie/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/poodle/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/spitz/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/tosa/defconfig (100%)

diff --git a/recipes-kernel/linux/linux-kexecboot/akita/defconfig b/recipes-kernel/linux/linux-kexecboot-2.6.39/akita/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-kexecboot/akita/defconfig
rename to recipes-kernel/linux/linux-kexecboot-2.6.39/akita/defconfig
diff --git a/recipes-kernel/linux/linux-kexecboot/c7x0/defconfig b/recipes-kernel/linux/linux-kexecboot-2.6.39/c7x0/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-kexecboot/c7x0/defconfig
rename to recipes-kernel/linux/linux-kexecboot-2.6.39/c7x0/defconfig
diff --git a/recipes-kernel/linux/linux-kexecboot/collie/defconfig b/recipes-kernel/linux/linux-kexecboot-2.6.39/collie/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-kexecboot/collie/defconfig
rename to recipes-kernel/linux/linux-kexecboot-2.6.39/collie/defconfig
diff --git a/recipes-kernel/linux/linux-kexecboot/poodle/defconfig b/recipes-kernel/linux/linux-kexecboot-2.6.39/poodle/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-kexecboot/poodle/defconfig
rename to recipes-kernel/linux/linux-kexecboot-2.6.39/poodle/defconfig
diff --git a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot-2.6.39/spitz/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-kexecboot/spitz/defconfig
rename to recipes-kernel/linux/linux-kexecboot-2.6.39/spitz/defconfig
diff --git a/recipes-kernel/linux/linux-kexecboot/tosa/defconfig b/recipes-kernel/linux/linux-kexecboot-2.6.39/tosa/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-kexecboot/tosa/defconfig
rename to recipes-kernel/linux/linux-kexecboot-2.6.39/tosa/defconfig
-- 
1.7.6.1



