Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 204EE615C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:25:55 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id m7so363405pjs.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YCQ/D4+LV9DytVIOPSDYLFHe8RZF8+8mYP76Nzpyh9I=;
	b=maGZbR1LtVsg3pF8IgdXmgdC+mx+vS9oHZ838DXtsJnf2oiYOAfHUROWVgAqPXKIHG
	7V2uM3fZL7bcd1UnvrJg4ex8LTjEZu8iOE/T7vy0PLiUQPiBFCvZwX8GxLKeIhn91XO3
	qXNm1zlmncs62AP+VBo/qlMKKjqH7CUOi0KB+Hs1yseka48ZWLuKClIdsCtsGtrxIyLi
	P2HIXKpoGsSCXoPs9dY4Qzprs8jC96Izkz2WzvZOEvvyWsG8A7IX6EiGa7XRH91gIZ6K
	ZyDe38Ozzqazaq+q/ycVZIeY8EEVKd9IyuIdFr8nvilYBebsMXTF+wUK4SR3pCzleVvZ
	r7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YCQ/D4+LV9DytVIOPSDYLFHe8RZF8+8mYP76Nzpyh9I=;
	b=swBWhsRxBsQ+ZSZET+yZbzcKcwc21WmKavNi591fBEJmn44p4xtfxvNJrdO/8GJXP1
	fph4tIYIEy9uuS48wWTCPuHnvMGCC99BzgIUofyfXuWO4tdfhVxet0Q5CFdybzJodoOc
	m+dbOpTT5EeMs3mG/3SPC4hbiZa6V3GdZaOPs6WcUqvIKgHrNOJl/ybQBT7Yd87dnpu/
	m9JdPgomfBGz3ZEKauILM8MVRFw1+lT/sc71OxYmR/ply9JsxaQCX5xJjZJC4y9X2acy
	6Ox27OS5OxENhiaifzMamdeq3f4SNj4G88MOVmkCRdhsukHLsTNZySWruWFxjj4BCDQY
	0Vlw==
X-Gm-Message-State: APjAAAX0OioyYdMfyuH8ADPwAzsn44cnB3tag7d+fWi0LS41RGZROhch
	nm3+aLhltMsl4bsZkw1h/WS2ZNyuY1U=
X-Google-Smtp-Source: APXvYqz3EMswKVli8w5BDUA5s6ewwW7GkGLPPfFmegkA+uwEyT/un55/anAPV4sbKEpPuVRvY4HDrA==
X-Received: by 2002:a17:90a:bf83:: with SMTP id d3mr799636pjs.77.1582007156462;
	Mon, 17 Feb 2020 22:25:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id ev5sm1571898pjb.4.2020.02.17.22.25.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:25:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:26:00 -0800
Message-Id: <20200218062601.3743291-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062601.3743291-1-raj.khem@gmail.com>
References: <20200218062601.3743291-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] netplan: rdep on python3 version of pyflakes
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
X-List-Received-Date: Tue, 18 Feb 2020 06:25:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
index 860762c494..db029a4b8a 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
@@ -19,7 +19,7 @@ SRC_URI = " \
 "
 
 DEPENDS = "glib-2.0 libyaml"
-RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python-pyflakes util-linux-libuuid"
+RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid"
 
 inherit pkgconfig systemd
 
-- 
2.25.1


