Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5F053780F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 05:33:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a2so942286pfj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 22:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a84KsBU3XDYgs4XayuUgrsJnwt0D9N9P0PEEYwOfYrI=;
	b=lXTiekhgY0Aer3GDA7CWcnU00Eyib7cg80A6LMKYtUSJUop8pMXoIhqhoDGZoDQCAH
	HHv0zN1b+sA9GNaqcHv7c2gv9X9y2BWstssTOo1AQafUu8QN8a4jcEmMqqaCj2rmIhbR
	5bdy21vBoZAnGTrXoYsl1HSlUj72NHb6yFOfa/SLr+Mb/jou8Lvz33jmA2YWwGAz6B0g
	UPAxnZWc2s4n7XcYLCED8+uoFDOqr5kyfsZhHEQcF0RRBQ0sIugFIazZuIcOgqT9KUYM
	vPUiGEmZNNEELYEnoip9LAFA8sYg2+Mk75utnLTAa5c+POYWsWezRRGh6NiIZW2mTzHr
	RK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a84KsBU3XDYgs4XayuUgrsJnwt0D9N9P0PEEYwOfYrI=;
	b=H0VXI0LJ52tlV5yGGEXTGPMXpmjAYOK4frjW9s+WRTWnzr4dpR3bd3LxOm4PW1VJSz
	l60WinNJeTAeZRfMXoREHG9v+unk8N3nqWcmDVm/dZ5SRUJISGSmbPunyW3G78Rr2jah
	uTtpCT3DwowSduU3ho8H/LADdC7ZCoCP3h0Xp4kqhDMTkuBFOQXfYq1zMuHDZmtZQ0ch
	XtCco7ic/of5FcWUK7jwjLFLzsZ5xotawVyRsNeaeodsj5HLXKsGKk24iT0C7O/84ZhB
	SCu4XI4xqcwPsjYTd/mVfIEN6DcNjRkAVWPJ1P9E+F6OZWHd5C/gaCHPVgSOikLgX8I4
	Xbzg==
X-Gm-Message-State: AHPjjUj8NX07vMQe8zcPsCprKOgnPkuK1l5xvwptss6wdjWB0neTgTOs
	rUreUGjMUzIrBppe
X-Google-Smtp-Source: ADKCNb6IPQUVeHkntTJlm85ZnP9q6L6WXfqPgV+KE9v1qSGnae1YVD1k3fDJHdz/WuBg8AiX/LoAEg==
X-Received: by 10.101.67.200 with SMTP id n8mr1919256pgp.313.1504848815744;
	Thu, 07 Sep 2017 22:33:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	m190sm1564096pga.2.2017.09.07.22.33.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 22:33:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 22:33:22 -0700
Message-Id: <20170908053322.16130-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908053322.16130-1-raj.khem@gmail.com>
References: <20170908053322.16130-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] minicoredumper: Switch src_uri to upstream lf git
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
X-List-Received-Date: Fri, 08 Sep 2017 05:33:34 -0000

COPYING file changed since copyright is now assined to linutronix from Erricson

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index 3bf9f66b9..7a024b3f4 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
 LICENSE = " LGPLv2.1 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=709087c2ed0acda54a4d91497a889e42 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=aa846ae365f71b69e9fa0d21a56391ec \
                     file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
                     file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
                    "
@@ -9,11 +9,11 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-SRCREV = "248019446ccf6079926efb54f8b6dd7be769bbae"
+SRCREV = "cdc1faf1212a51e89b477468876e229223fceb9a"
 
 PR .= "+git${SRCPV}"
 
-SRC_URI = "git://github.com/Linutronix/minicoredumper-debian;branch=unstable \
+SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
-- 
2.14.1


