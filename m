Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 47677770D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 16:19:20 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so85035355wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H1XbOBKwiUoKaXlG14PCi25zh7m//sKtiw8cUmEjFNM=;
	b=SD8nJerfg8+sMBtQYk8K9mRTgg2H/tSo3Dy948dKb0v/bWQGQ9GBZfE4y9ajG2kO23
	cOrT/zD9h3bzLv0B6NHRgfBd0+Gh7126H2xPSPDiqciUicNGfbXBXLsbALrpfe4nVBL7
	NRhnwvvj1Yvi4DSgZgFWkYN6Rd3drWCi/uhARtJdumx7KzVZu2GzdpIk4bDT4keb4p3/
	oiVbbiuXmz4F4XYq8M7ZW35AQ/Ph0NsIZi/12iufdB/iJfPcIowo5B4qXwP3wV3Wiqno
	oWHmwCkziT+uJ2oUT0DKMc862fc4FrNlHlEZ5Cs6aIx75OGz2KSDeEAmjf6khy1VHp6X
	dE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H1XbOBKwiUoKaXlG14PCi25zh7m//sKtiw8cUmEjFNM=;
	b=c5GAKNzOggTTVZZ8AZN7yG1db6B0TX/ODgo+pgZKcDKiy2JJUvpKibj9L3YQFArD1I
	z5MA/UBfKuIvb/dTGxLATjchfAG5VhSD1v3L1ZvoCrw6ES1r7xmxZBgLnFvE7Q00njB7
	8IDne2KkmUYl7STLR9asgzG2bIEJ8MXcTIDiMRiTqmVMohxaVtrBQ1JKIwJ7qUJiRZbD
	vFDWllVgkxA072eZzLlsF2LsXoPYqsE6KiAzcehovihAZyBpF0T7SgsLxovvGOdUQgRA
	DxiQrXL9avgH6L6j84/wB89GK95SD1EfUYcw/xgCWsIyhqnPhoig0y9KSIrjBjdKxgzA
	XlOA==
X-Gm-Message-State: AD7BkJKfpX881yNIIu94b9QQyROANL/7fGNsU2RvkDHc90hJxpqsoksjAhSn+bK4W0ynpA==
X-Received: by 10.194.47.133 with SMTP id d5mr28733614wjn.87.1456935560889;
	Wed, 02 Mar 2016 08:19:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gt7sm36634693wjc.1.2016.03.02.08.19.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 08:19:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:21:11 +0100
Message-Id: <1456935672-15538-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/5] gst-ffmpeg: blacklist, not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Wed, 02 Mar 2016 16:19:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
index 8909f37..891b10c 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
@@ -98,3 +98,6 @@ FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
+
+# http://errors.yoctoproject.org/Errors/Details/40736/
+PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.7.2


