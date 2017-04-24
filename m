Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7444671D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:23 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id z67so13856024itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m9la3FjFiidqczOclXqY89hP6620WYWl0qDwrlY7KL0=;
	b=uS0gKZHsgiJ8Wt+GnAUq3+2IYacB0yK6HEoL0xvBrZu5a+oGv9/pyDElhm+5LiXIkg
	SG7DCkY4YO3BOyFr36F8W0l/XbNeQnTBTLI1TzvwVnkyfmmV8EJm2xXkHNprh5k7v6Wi
	04w8Oa/cDHbVYXf+KJC1dofOQ9Ap2aYjXersPWUP6ccFygNs9zMoCwLdT+lzczl6gQDM
	nlJJWoHTMkik/ph+7FdFW6gXvk9t3+aHw15xVtj7w+8qtF6MIw+XI9Egzj6pgMbOWuTs
	RHOAsOpXvqqmTo7cZTXlUjbeAzBi24JCTPzBEOOC/PTefAGEAEHH2yZWCtlHohBU5IYj
	EpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m9la3FjFiidqczOclXqY89hP6620WYWl0qDwrlY7KL0=;
	b=qZV5H9mCGB1oeJlU/QvgOaFXsgCCrIB2buSIpuLORnBHTlqkCqj7unsEkDvehxBEjE
	viwxyy78wbqoJs+oRkCNLYgaQcYFc1my8fl4/6IeWyjWzAzWbCutJQxYpCsqJGTSZ13m
	sdykZFxyD7Bi+AkaHnw3DtiNVRBtbW0mrbZcPxp2t2YpljgPS7Sg6Xs1EwzcDhC5Ry8A
	Eq/7/gz+mMtDFS7BM4LOvp3mtPLUZQOMH9k3/rAEGzQ/gqBkXi4oiEp+qQ2CDCeYIi7U
	s38nSmZSNBWWsugXNdwo+v5aQCqWLoVCRBCilpv+U/2wZviEh+KP/HzzHgxEsVt6TURT
	DPtg==
X-Gm-Message-State: AN3rC/4dxBHiQuw4KEKjHzycrLCNpno7FTPtwcjW+Ot8SdZ4RXZVT+Z3
	sT31J1RUc9CchK7A
X-Received: by 10.84.230.135 with SMTP id e7mr30870716plk.20.1493011285017;
	Sun, 23 Apr 2017 22:21:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:49 -0700
Message-Id: <20170424052058.4952-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/17] glibmm: Upgrade to 2.50.1
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:25 -0000

Disable PIE when building with SECURITY_FLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/{glibmm_2.50.0.bb => glibmm_2.50.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.50.0.bb => glibmm_2.50.1.bb} (84%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
similarity index 84%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
index 9cf822074..401b3b2ec 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "e7416beff6cba1f38c2bccd0dc8c3278"
-SRC_URI[sha256sum] = "df726e3c6ef42b7621474b03b644a2e40ec4eef94a1c5a932c1e740a78f95e94"
+SRC_URI[md5sum] = "a5b915dc42fc62983fa78ca8486f4391"
+SRC_URI[sha256sum] = "1fd85051da9cb402cc8348cec72dfe4d79f9345df4a1dbf68703a4ded45846a4"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
@@ -29,3 +29,4 @@ FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
 
 RDEPENDS_${PN}-dev = "perl"
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.12.2


