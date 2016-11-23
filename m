Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A944B71AA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c4so445228pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TrUWAZgCT+Jqr3xW1CC/ihQ3uNDwDpNT0t6v8JYL74E=;
	b=OwexzZ/IxU0BJ10K+vvY9ew2g24v1nFPbY4wPX4MGVmX6drafTpnjcV4VudySpy1Es
	0E8a++craWTP3TBEtFAB+k240cBCzyqMYW46B6f5pJC3UUL0VqOtffmU+u/HHkEGTmkU
	bizxTEidq9Ig2YYWiVLZRQCSRvDcP6w9wR+v32L3OCJMMwQZ39rUZbvxwnJioHC2g8fs
	90PP+ilsB4yqeB4FNsf+3j8EZ2ap/xLceiJaXrogJRbw1E/1u+/8nXKhqzz/7b1k3xjO
	Rpo9DtK65HNeMP2MUMNe2R5tu5fZC3VT+iEX7BgSLLB2fDZrRh+r+U5VPTlHDEuEcz6n
	sQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TrUWAZgCT+Jqr3xW1CC/ihQ3uNDwDpNT0t6v8JYL74E=;
	b=XLgLyIrZHWLr86dbsahzPXlpw4qF8OFS9Hezpp06ibcVk6fmlLPWv5AzfWFWcP5kxG
	RpmetNyvgloEBEv1lFPn2hIUB3TYMSol876Nk5HjAQqVFczDhCYVqeMnifjI9xd2JKkM
	8hVSROa0dk3RZXImOfGAjeNCnULm6oHBjh34Ww/qG0j0QRjhfMu1kFMuSJ90ZH7x9wl7
	Fpk5p0GyMX0LguXnTojJHUDRG34HHW4cbIwyekFLaQpQtoYvBWBFu3Uh2wxQmVfn/PRj
	CVtMjEuzxmbqutzwX0MbIo0+ov5VdaeWRyg29JRRBNOynf3eJDC+6OqklgOAGnrjnF2A
	dh/g==
X-Gm-Message-State: AKaTC00Cn5X+Wlc4xHMspJm7qdD0hP6LwiPyg2eAbLjvp6xY8q3LyTSjQtFP0fEgpKuvyQ==
X-Received: by 10.84.195.228 with SMTP id j91mr4569372pld.88.1479892967438;
	Wed, 23 Nov 2016 01:22:47 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:59 -0800
Message-Id: <20161123092209.23699-39-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 39/49] libmicrohttpd: Upgrade to 0.9.52
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:45 -0000

Inherit gettext is needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libmicrohttpd_0.9.50.bb => libmicrohttpd_0.9.52.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.50.bb => libmicrohttpd_0.9.52.bb} (81%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
similarity index 81%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
index 421b78e..2a006b5 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
@@ -6,10 +6,10 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "4a3f793d59f663a2b0fc62d44668fb66"
-SRC_URI[sha256sum] = "d1b6385068abded29b6470e383287aa7705de05ae3c08ad0bf5747ac4dc6ebd7"
+SRC_URI[md5sum] = "767111e817e2497ff92f943c5653497a"
+SRC_URI[sha256sum] = "54797f6e763d417627f89f60e4ae0a431dab0523f92f83def23ea02d0defafea"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig gettext
 
 EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
 
-- 
2.10.2


