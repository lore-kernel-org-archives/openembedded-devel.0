Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C54CE6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 15:11:23 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s66so26173219pfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jul 2017 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rvpcJvbnAi4uid9neAcBLyv1WPJQeDrm85SezLhhufk=;
	b=sBo4KbmJM/sMeaTwfOAhaeRuOMvy0sor/s5v2rbZCR3eKQu3054MCf/TXSbNBDzaV/
	M3B69RpVGatn9KwbJxKGu/iEbF/lIp1i9SN1y2Ok+oFLbHQvhTog0cIMBuIhJlyxlUOc
	ESLwC0PKQrl6XOWm3OocsnU8mAx/U0fjIPlngbNiOMfiaugV0cJXWXu5Rj/pVrHMgE8S
	alRHllWe9BU/l1qYuwf+lDOI91YO3txAlvrn6PYAek/UC5maaDcvoXqx3BIbFObqoF0V
	9TakOj0nzm8J8ZJAOf4IiqM/XPGZ85vHvNfLR7+mGSfR6hjrATYAfNMQknQHzh59RxP6
	hddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rvpcJvbnAi4uid9neAcBLyv1WPJQeDrm85SezLhhufk=;
	b=cr8htTJxejRH7sCIsEJuqb/C8wsNAyjlYkX2N1yMxpk7Ie81fnHtJ+5XytD06K3PA+
	5pWzECCNmj43xUl55C/2SuSYa59ZeLUZwKJc3ybXyFpzgGGNwHthu5uJ1sFy4D/JliMi
	Dp+icQtAEUSxA5WEtdr5GY4RsHQ7Osm+D2/Qqhyf97HNUwHQiU63V+UP8rihnVSXCUnx
	IrQ79dlNaR30i0OStOCZMOeT+VB6ZewlRuOrjOvr7Rn1fI5cmK10wt97awrvmyAVFYsF
	hECEASQIpLHmHdyT3wDEX0XotYbvKTb4eR8tVcpcmdL4Z1ufUWhxgutLq7Bh+ofdEpSH
	abWg==
X-Gm-Message-State: AIVw111+vA2+0WrKQ3u1QUW28dufiQmuT9IaQkJQo1Ynw+2qP3/iKlRT
	3y7atj+w6AN1ieJs
X-Received: by 10.98.160.133 with SMTP id p5mr10377103pfl.226.1499094684635;
	Mon, 03 Jul 2017 08:11:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	k67sm12295707pfg.37.2017.07.03.08.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 08:11:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jul 2017 08:11:07 -0700
Message-Id: <20170703151107.35350-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170703151107.35350-1-raj.khem@gmail.com>
References: <20170703151107.35350-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] kodi: Fix build on powerpc
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
X-List-Received-Date: Mon, 03 Jul 2017 15:11:23 -0000

64bit atomics are not available therefore link in libatomic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 3bc2eb591..0b39116a1 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -133,6 +133,7 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 LDFLAGS_append_mips = " -latomic"
 LDFLAGS_append_mipsel = " -latomic"
+LDFLAGS_append_powerpc = " -latomic"
 
 EXTRA_OECONF_append = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
-- 
2.13.2


