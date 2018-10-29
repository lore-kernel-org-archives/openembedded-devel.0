Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEB8791FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k12so4113126qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zZvjp6GdNHeYzRVV5nEmDq4aNLc82DrHpezs4W1kuZo=;
	b=lyb5VQKVFtn6NexqLK0gaG0PwInMc5lovrgnjxGRjQR/+Y4A7JwEUHbuOAAk1d03af
	ajlK3nLJalzxzmRmnEh1WwznEyYnoyzMBhKiH2+iadokKhYmVFb8hieI5wmeIonF525w
	EK0BkmZm9ALA7v3zTZiqf57rmof2tM0ItftjS2ZQ0ImGnjtOeduAXpqvhDgBL2urFyq0
	ZLsPLlcUq7YUZLyq65pq4qvU7Eu3n+cVLAElDPeOY5JUee3R5TF+b1weC5aSh8qzqMC8
	6XgZPsTuXxLZKcQO9Mf7cMsdjcfQR/Z2RkpbYHd3MSVQ+vFGN7w0ePR7RI7rQ+ImOiKW
	NiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zZvjp6GdNHeYzRVV5nEmDq4aNLc82DrHpezs4W1kuZo=;
	b=eBtSZqFXXtV2rwLOGcTz7NBEtlRisY+Uv5sYv949ux+0U9ncW0TxtRsAaZ/E9PUxoC
	BK8bEeJK7xJ4NL2wrckIMuqQS2ZWSkEhHhoRNPOsWs3yPUQF8wH2hWtxWUhHU7Paimh8
	i89RVF2Ukjv6huDkWK8MxU0jZbovVAnv91qySsIieCftawUNjkur9hrqWPGXcl+JIW9Y
	DePUaHl6+mjO1IG5YRvkAv7URq9nrBDYiQtK1Q+mMrssKP9AjmFHfmguq09a4MMgj0sj
	PuF8/J69Ce4mWH+yxugaRcMhw41kcII2i1txVyL69a7nRUuiVJhMwU3SGyhXnFFiXIfE
	78hQ==
X-Gm-Message-State: AGRZ1gKZNWv6mPh26xIVx2DdFCS4VHJMO0d8Fcs7ahzg9gix+DodZSbB
	4viZfHYrBVmIEiR/EDJ0ep2RFG98
X-Google-Smtp-Source: AJdET5cnYlr/CEelnR8yleRkE5iTN2XwTJRyVr8ToZ50TJISC7abfHL3mcTFsReLpwgBUcS6wXKbFw==
X-Received: by 2002:ac8:1185:: with SMTP id
	d5-v6mr13227287qtj.354.1540831310947; 
	Mon, 29 Oct 2018 09:41:50 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:50 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:05 -0400
Message-Id: <950a5e000cdf171ed8bce8d574a7f7d4b91c1fb7.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 08/16] libgweather: add recipe for libgweather
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:50 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../recipes-gnome/gnome3/libgweather_git.bb   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/libgweather_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/libgweather_git.bb b/meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
new file mode 100644
index 000000000..29ee2c90d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "GNOME Weather Library"
+LICENSE = "GPLv2"
+DEPENDS = " \
+           gtk+3 \
+           glib-2.0 \
+           libsoup-2.4 \
+           libxml2 \
+           geocode-glib \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/libgweather.git;protocol=http;branch=gnome-3-28 \
+           "
+
+FILES_${PN} += "${datadir}"
+FILES_${PN} += "${libdir}"
+
+SRCREV="${AUTOREV}"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson gobject-introspection
+
-- 
2.17.1


