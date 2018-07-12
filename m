Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1227603D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 01:27:14 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l10-v6so6114802oii.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VKKZY8an+OrUDpg9y8otIRmXG46YqwrqRXjCdfCxMSI=;
	b=kudL3kJDyvwLgAPSWftZnDFjR628gHQpCDIKL6yarEEZqkCpuAaiWmIIU9xDEKJAXA
	a4BhmCrdvRdBpf6mgYJ4FF9wE58xz1ax1X8WEkR9wbqc+HlOuA61nF1JLHOF+UcjiNLa
	/bpr3iv+j2qZw/GO8ab3ccVZ9Ms02OS/jcMRU0iy/l7FvSy92aenxMsfFvW1iTUoQhlC
	iDYl50g5YZdHeqhMrXxQHKPLa1hV1wkIOpMFweCQ5AZCsP6giqGyu8IRLMyE3QfYHcrg
	PZIv4jslqDiykcRA+Z/M6H2Z5Pv0wZg55ndhkl2g9hXHyi4362nx6rHq780xkbib1iJM
	IZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VKKZY8an+OrUDpg9y8otIRmXG46YqwrqRXjCdfCxMSI=;
	b=E/U4Z+OX5jPROlUYFmiGcwxbE42uAa6P5SBjWkZUN5LVwmFDwhwwkYG6Q1KGqLtMvI
	IjdEge9gWnkifUE2YZ7NktkLUd5Tnn8oiyotQvIz80hxoTfXGWi4mbwpRsFuVLd+6PXW
	0nwsEjyY24ZXXmwOrE8cOyxymteA3CqmPczKvvw67pIQusZq6pE1wfyDnhbOUYRtamIS
	hlryLgLVbiOFhC6NZXfAtkJ6Yf4CE95yqFsmHdVARTcJxsX26q6avQRKiVeM3QvXHgFR
	BNuX+vZur4V54nq7UC7qmrDIiw2RIcSomztcRKpJTViLjaPC3sdqowyr9K29EvgAUh6f
	lVZw==
X-Gm-Message-State: AOUpUlGeMT7An5Bq3mIiC2vegtW+n9lqwNhKUb5f5938MctqbK23dcju
	c1HdMnprPe4GaBNwW0NVtiM=
X-Google-Smtp-Source: AAOMgpe1eFw2VBO8R8ZZwshUilaszUnn2lBOsItky7rjMe36Ow3KnvMIqfaDTn7n6RzPAsgAVKuQhg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr233488oic.252.1531358835341; 
	Wed, 11 Jul 2018 18:27:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:3df0:c2f2:5900:71b6])
	by smtp.gmail.com with ESMTPSA id
	y27-v6sm87401oix.4.2018.07.11.18.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jul 2018 18:27:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2018 18:27:10 -0700
Message-Id: <1531358832-14848-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
References: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/4] pyxdg: Add new package
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
X-List-Received-Date: Thu, 12 Jul 2018 01:27:14 -0000

needed for openbox

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb

diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
new file mode 100644
index 0000000..0128a7c
--- /dev/null
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A Python module to deal with freedesktop.org specifications"
+HOMEPAGE = "http://freedesktop.org/wiki/Software/pyxdg"
+SECTION = "devel/python"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+SRCREV = "7db14dcf4c4305c3859a2d9fcf9f5da2db328330"
+SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg"
+
+inherit distutils
+
+S = "${WORKDIR}/git"
-- 
2.7.4


