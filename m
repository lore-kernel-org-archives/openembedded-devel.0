Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 462C76BD1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 02:29:40 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id e11so8162226plt.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2018 18:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iPsKxt900Lr3mvNAtZ6GyaCDHw7AYJyQ6QrFOUUlLW0=;
	b=OhcllKRKtmEUOHn0+Yl9kNbRLkmTOvpVVPn8IqwCAa/w+bc8k/s6hDIaSXr3PbGpHM
	HItJjJ2eOAXBocj4tZicwguUP7v+xQbULOP/jsdJFHgxVF/sEYr2pbMPCg8VaMxFoIDM
	cvx1OJrWe3+4OkM361NkJBR99ymNqUngDgorUP65+0ZxZ1vOCXnV1A8H6YcNq9ASKQej
	JorC3tPuz3QGo5MpZbvIfe08cPZZBkudJJPpCqaxqXvLcZsdEXceCB/2nWggpvFv0RhQ
	1olZ0Ed+OJixpAwP7mjXa2dI6QNJkEf10Wam3FqPjc4TS79XC+fZf5OvYHsf5oyOUIoJ
	vlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iPsKxt900Lr3mvNAtZ6GyaCDHw7AYJyQ6QrFOUUlLW0=;
	b=mAoEZMxH8VvllN/SaXifeSzmlXogFXCAhMo35s99CLibbhwuusw+Xn3O9MEfqeZ2WQ
	u/XVChpkPyWh9qG8afXG0I3EhQZZbyQy34wmsUHsGtykW2ZWohvNeMM90w8P7a2/oagc
	sjy5rnPcTINgihCSrM/M033uySwKxltW9UrQWMZKzvpDwkIglq1ZQxdSzbPvrzp9Y6TD
	9MQbZYP4fFkf27iWJWoPBj5BB++LIps7VGOlxT5YCYxLC9Pbn9pO/6BwP+biIEPLirrC
	TWf8GXq2JkuuK72vHqGBmqwvWC6e0auZBBELNIIM3OjhyFh3Rpopk5hqucujD3ml2YQM
	3+fQ==
X-Gm-Message-State: AJcUukeK7PMdQF06Q1WlceW3Al0BLN2caqUxQnpt5x/7UtTpNbLGYSer
	FCCxXWTRqrbyBW5/rdTKKMqfKLyeE/U=
X-Google-Smtp-Source: ALg8bN6a61kO8lFai0fCDbhnZAx7kmQXrNtXTvIHGOPxiVAKryiUA0kS3yYdun9oPLT+IZo3roA5bA==
X-Received: by 2002:a17:902:6bc7:: with SMTP id
	m7mr22355132plt.106.1545877780841; 
	Wed, 26 Dec 2018 18:29:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p2sm50666072pfp.125.2018.12.26.18.29.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 18:29:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Dec 2018 18:29:22 -0800
Message-Id: <20181227022925.5920-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] packagegroup-meta-oe: Exclude unbuildable packages on mips64
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
X-List-Received-Date: Thu, 27 Dec 2018 02:29:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e3fd4bc26b..1bbb40dc6b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -54,6 +54,8 @@ RDEPENDS_packagegroup-meta-oe-benchmarks = "\
 "
 
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mipsarch = "libhugetlbfs"
+RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64 = "tinymembench"
+RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64el = "tinymembench"
 
 RDEPENDS_packagegroup-meta-oe-connectivity ="\
     gammu hostapd irssi krb5 libev libimobiledevice \
@@ -114,6 +116,8 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
 
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "uftrace lshw"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
@@ -174,6 +178,9 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
     "
 RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash minicoredumper"
 
+RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64el = "crash"
+
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
     alsa-oss audiofile cdrkit esound id3lib \
     a2jmidid jack libass libburn libcdio libcdio-paranoia \
-- 
2.20.1


