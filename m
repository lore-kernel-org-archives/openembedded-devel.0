Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id F3A09713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:29 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so14836482pad.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=NFUkAVch6iNNCDrqw/ILsKA/iDfChdYSTO4C3Pbbh6I=;
	b=qlyABqo5CbxeTe3b7uBIs0GK6a6VM3BJ6f/FsEpDdKcL2xpKhes9+o8QR8Iwm/bGfK
	vxtSY52WqvkgyxHBFh9xN128KPL0yIIZ1vg0fF/cQiEQImuAPgQLBdnqzUfAxf7yZKWl
	bOYmqQY5lGn3U5zBaZ6b8D3UiaRZKwheNHY3KAfb/LM9ajEMkf8Wizz0GhD1qDLJyVb5
	fWlnJnlAjE5DcF1BYIwBjbwuVqJqCoMiio1akDYq1yJfmDtsLTLVfRJeAnUclkFhzndy
	1oYUgqV4TJ0glIL1TvZWWb/nICdic8jyLuWNnCOo7FIABRoMcjc+xeQcXAUO+ylnp8M5
	Tbag==
X-Received: by 10.70.55.102 with SMTP id r6mr77622616pdp.55.1419700950421;
	Sat, 27 Dec 2014 09:22:30 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:56 -0800
Message-Id: <eaf285dc302e5fce489b63c918bc085cf370fb5a.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/27] glibmm: add perl to RDEPENDS_{PN}-dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Dec 2014 17:22:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

QA Issue: glibmm-dev requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
index e68eb50..71daf9d 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
@@ -27,3 +27,5 @@ do_install_append() {
 
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
+
+RDEPENDS_${PN}-dev = "perl"
-- 
1.9.1


