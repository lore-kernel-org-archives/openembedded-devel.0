Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id B3286615B5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id q39so538241pjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=42Fzs0hdtVKrDh8gl19Pq4Bl6y5Lx84V6h0eU88ZmeE=;
	b=HyukR7DcZMaTTZI2lni5h9ldOsZbi82T+0voPxvcFIYvVMHqSskmJ7W/uZ/mlV2wWO
	lZhljMJglPnZpRZ2c5AUOjxgqMgSqWHdUuNNOwgitzEvcRiGH7sXkdRWhPwMNvy3lw5k
	HhQgcLBwA4L62uNRq2UkRVEq2Eny5RYXSbVVjNJLwZ/P7uDBV/NDbUVPOPgCfMebnZvu
	n27perxgBPr3zb5SCOiZWuxxjFQxe00pZbcZSlMhPEbqA9l/jgQj7YgSzTf26i2mb1PV
	uwu6Lqppp3fIaxxbqmjCnJMALkLK6J4fJh7WmJnY9YoyLdAtn89gKaX5Xph5LR8XSiLJ
	e2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=42Fzs0hdtVKrDh8gl19Pq4Bl6y5Lx84V6h0eU88ZmeE=;
	b=W9rSM7gqE8/RNAZ12K9Ktyhd/OfSP2Unua6eNCXJsrM4eMwpHCXPxmHv96pq5ZamDw
	X3A++DDuUUbcPKjoVfrlbq7+tOJ/JhXC+Vbwadd5lkM4ssH47NpwnFih/smARheOM8mp
	pxYxd+uTSqZPeRkIOumM7kY9N+Zwdp6Hqowx+JZoWpL199S+YLodaZ2mqv9EbZ3C2qaD
	GwtfcIiwd5Kjc7fupID4D63tH27Ir7Sqm9cbdFb8zNuYQbQLCWlAg0S27BsFhtu0nos+
	FWhIEef2UKmrqJL3GHDhcHmDdo16hZVNkWDyhD3hge+JN9t7sV1xb7MGAS+ZkAr2nvyj
	SQoQ==
X-Gm-Message-State: APjAAAUyW8ysr+ODarLLgdODWhNayyRjvdAQrSFnsA8WhIC6rHq138GV
	dqCxJlBI83erO1ZqrP3jQN7V8kTvjSQ=
X-Google-Smtp-Source: APXvYqxBU+yfAWbCcIV7a09WdQ5mzayT6c/oHlElmv+ZTB7wvIX+bdg+H5KE7+b6gbUUTeSjWHqEwg==
X-Received: by 2002:a17:902:7b94:: with SMTP id
	w20mr19406319pll.257.1582007027500; 
	Mon, 17 Feb 2020 22:23:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:45 -0800
Message-Id: <20200218062348.3742529-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 5/8] rygel: Upgrade to 0.38.3
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../rygel/{rygel_0.37.0.bb => rygel_0.38.3.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.37.0.bb => rygel_0.38.3.bb} (95%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
similarity index 95%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
index 6ee02fcc04..3fc8450513 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
@@ -12,11 +12,11 @@ DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstream
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
-SRC_URI[archive.md5sum] = "f897167ad82e2e741582f2c393a76843"
-SRC_URI[archive.sha256sum] = "dfd3d885da3ac383ba0cfbf119995f4a0c2bca2cc8f8cfcd3df10cfec8f35cd7"
-
 inherit gnomebase vala gobject-introspection gettext systemd
 
+SRC_URI[archive.md5sum] = "7f95401903a3f855b464d5152b9d4c07"
+SRC_URI[archive.sha256sum] = "08c21a577f7bdad26446a75ffa32778b26842c3b1188165f0b19818559747d00"
+
 EXTRA_OECONF = "--disable-tracker-plugin --with-media-engine=gstreamer"
 
 PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
-- 
2.25.1


