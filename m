Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A77C37841B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v60-v6so6330189wrc.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aDbYA+SJ7RKRGG+zV+Z/IaAas2eF8tLizDMfBSsIQdo=;
	b=impmeSdMjJ5OT0UtBwc3K9hKAJmLi/+hivuGJ2v1EtMOuMrdxoUieGUYs9UFpz5HoK
	6RZs63NVvlT4Mbk8Y44w7gElsbeypySmm0ii2iLpk5BChejTckgtOr7KiUyYfHOVrgG9
	Fqolw9aZxXUMFzjCNcusbIyCPsQ1TY6EcQW5QkJhUCIagMg4udJ6ExziA2o+lMXOYGdu
	c5Kx5FPsp4z9hZ9frQdEXVCXNLxaeljD6Mq5IB6w8YEQqp0juV5QUPXmw/Dm9bx/PP2D
	v5pH8BmcA2jHbU7kfeHhxBhPxosoQNKG5YNavw4VrzfytHdwjcD77KbKfitugbSlasrE
	yIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aDbYA+SJ7RKRGG+zV+Z/IaAas2eF8tLizDMfBSsIQdo=;
	b=WJBSl/1H56rWzmivneTtP543joaNpCeFsR/2xx223D42P4zv13eQB22TfJAvgIK+16
	FrH+W7AvO4QRYA9Ft1uuX3ptGoHZfMMTILYvGZHXuvYS5QobCg267LISSq4Q2fl27Jpw
	4P+bZvoYctOk6NEk9v1IsD+9smleDBSKQj9qseU/Ybatm6p18id9U0eYKGl5Dq6qd9Ea
	mYxENTJuF0Ko+UAJhwxAFISi2+IhzK2iYRHMdGDFtk5co/0lxtuFP0Qp/5c7J2McQIrF
	y87IAfglJ8TSXAFbvnodKmUpXIhSxWjBi4daBWs/OwQ8hGjq+eMlApvcd96v8CFl7B9a
	iqtA==
X-Gm-Message-State: ALKqPwflu2FSRAamS5kTksoXtq9uvRfU3g9ZmJmTzuMrZKFNBBdYyi5R
	eyEE5kmakTojSepj1fH26eruzw==
X-Google-Smtp-Source: AB8JxZr7e5tqswuNfq76x2Zw0TJhBceLSVTJDXvt/Kes45WZF2mEv9LDefFarEDOgYcop9zYib+Nfw==
X-Received: by 2002:adf:9925:: with SMTP id x34-v6mr210888wrb.29.1526066518004;
	Fri, 11 May 2018 12:21:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	187-v6sm2366327wmu.41.2018.05.11.12.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:42 +0000
Message-Id: <20180511192145.7811-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 6/9] celt051: import from meta-cloud-services
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
X-List-Received-Date: Fri, 11 May 2018 19:21:57 -0000

* needed for spice

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/celt051/celt051_git.bb    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/celt051/celt051_git.bb

diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
new file mode 100644
index 0000000000..ee3882148e
--- /dev/null
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -0,0 +1,30 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+
+SUMMARY = "The CELT codec is a compression algorithm for audio"
+DESCRIPTION = "The CELT codec is a compression algorithm for \
+audio. Like MP3, Vorbis, and AAC it is suitable for transmitting music \
+with high quality. Unlike these formats CELT imposes very little delay \
+on the signal, even less than is typical for speech centric formats \
+like Speex, GSM, or G.729."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=375f60ab360d17f0172737036ff155b2"
+
+PV = "0.5.1.3"
+PR = "r0"
+
+SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
+
+SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "libogg"
+
+inherit pkgconfig autotools-brokensep
+
+PACKAGECONFIG = ""
+
+PACKAGECONFIG[ogg] = "--with-ogg --enable-oggtest,--without-ogg --disable-oggtest,,"
-- 
2.17.0


