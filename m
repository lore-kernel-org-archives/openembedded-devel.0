Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2B1A780A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:18:01 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e199so8211039pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rvpcJvbnAi4uid9neAcBLyv1WPJQeDrm85SezLhhufk=;
	b=p5yGg4rqsWWaUXX6nhBc2m1nyjtIMFYHnUMcs/GcwYD0jn/s/FTf9NXLxJESOy8SiY
	OUOMbXGR6/uF2ZYut9VRXvsBrLF2r6jusV4/o2LThxd8qAX3ZobW8zNEE3/k4dR7UNT6
	r54F4ZL6ME5wnr7qbGXlDZEYjmD6OrSrTBkH+FS/3uClhXxIk/PsYv9KSeqgfcvm67+n
	+b2ah5mblAj5ktHze/0/u/nI9EWCvPK2w8oHvDJz4EpaWFM2Gh89Ti8hhOZWmOpu+9Z1
	rqwx5PpMQlxSECRerrWRo/I8am9PsSGM4+JeCUfYBQsaiMfWIpDPS6W3aLxMgNq53Tom
	I1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rvpcJvbnAi4uid9neAcBLyv1WPJQeDrm85SezLhhufk=;
	b=uK5n4Olhy//dNVshD1IxruDysHcdF+KOZvKaADMTQBpzwiHAuEpJm4FdTovVF6oZIh
	8i71D/n373TmZneFlqNOn6YPK2CM4yk1UsOoA7tOSjG3zmby2IbrRY5K30EO/hr0nvNW
	RXBS9X2vsFh0hEAEZNCQAodZq0OWQ3/Fj1QOBnZrisMyqw8PUE+AFsstYWxm6rDcsf0f
	bg3Br9rKrJt5mnNBf7OCU9aejes8gnrUphoweLNL6Iw7Hq6GAM6BGinMXHUF06rIXoL0
	tzHPf53jq9dE/CiJeZRbCwDQie3Uu65Kzxt6hDb8nd0JfPWpOuy1GfhVZtdDgPCaboQv
	97Pw==
X-Gm-Message-State: AIVw111JDMD5H2sdnlq34Qw9P1nLoKxIMwkTHkYmvVdsHsjGpeW1d/d2
	sBDuAf72lLO56Vi8
X-Received: by 10.99.39.69 with SMTP id n66mr6249494pgn.94.1499519882455;
	Sat, 08 Jul 2017 06:18:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	o73sm13277185pfi.2.2017.07.08.06.18.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:18:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:17:42 -0700
Message-Id: <20170708131744.33927-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170708131744.33927-1-raj.khem@gmail.com>
References: <20170708131744.33927-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/5] kodi: Fix build on powerpc
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
X-List-Received-Date: Sat, 08 Jul 2017 13:18:01 -0000

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


