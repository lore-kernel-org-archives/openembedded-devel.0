Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEE874FD0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:17:14 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id c5-v6so17687715itj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=citZ8TOzsfblUk06CREkLepBgBcvIpH8mkJux0ZnHY8=;
	b=tZDesW3B2kMTQutMu1fMUcvBeHJfJ5aRpqqVUEBA1dgPcO5jFug0xD0E0kE3WkwzOV
	k9UbRS3yRqQzChOLmxdKmpfFOFk2mnzsL4HZZpy2+C7fGEYp0GfWYX7sfNHCqrXXgUUH
	FjRFyMvmRoSGYE0cUkwVQoG7MI0gOleXt3xGP/1I4Ctchsea2zgDOz8C15QU43vJAW3H
	P73GY6hkBzXjQi7wUdGQ5Io30DlUeeoYAIpPy0WLnU+6WE/WAaMmme3hMLWNgRYDk8kM
	m+hwmQXleW1ZgN1J8aBYDH+RpEXuKkIDt2wPatOfIEUPKH2snQbRD0WHpaIfEOgDRwMD
	bIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=citZ8TOzsfblUk06CREkLepBgBcvIpH8mkJux0ZnHY8=;
	b=K1MwBNQKwqyOxQnA20hv2tisP7dN/PPotNLb2tZoz3l8ZRye9SjuFkFVSezjGHayjy
	I56yV1/kyNZB8MSfQguyxCCRbrTfou4kZFh9xIkpgB60CYWK+INZ61gJNsmCD7c2FB+R
	cmadBirf55N3BhGQey9eHanXjuBzNNnQh9q6PvgSrRAkaU8VJqb0/3owefORUoPU1QZH
	Zm0l0pioArLdOD/DYXfJ1Ac3FqS7F/QVOoEj6SJ79sxLhWeih4M04HlMS+95PUlZzUpv
	bPI4VoWiHlrurcsPuV7mih802iDFwxU38v3UoJROcv0NuEt1HChZxbRSlbuVGd6b3x+X
	IQdQ==
X-Gm-Message-State: ALKqPweoWoYeUP5SqQNzvHjOQZSqxtj0LfGTH9v/yaO2LxyKqQsgkAJX
	r9labLac72v6sAO6Oy1VSllao8WK
X-Google-Smtp-Source: AB8JxZpaC7c9DaBJh7rYFUgz/1x5ZXiBDZdJVf5EMJyrg6RVPkqXDTB3LeiSxHedCyYU9qBMFSgvrQ==
X-Received: by 2002:a24:cbc6:: with SMTP id
	u189-v6mr11464008itg.63.1525893435478; 
	Wed, 09 May 2018 12:17:15 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	g127-v6sm7276222ioa.79.2018.05.09.12.17.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 12:17:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 15:17:09 -0400
Message-Id: <20180509191711.5389-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH 1/3] gst-instruments: switch away from github archive
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
X-List-Received-Date: Wed, 09 May 2018 19:17:15 -0000

Since we know that github archives that are automatically generated have a
tendency to change their checksums[1], switch to using git clones.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../gst-instruments/gst-instruments_0.2.3.bb             | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
index b6cdc4f146..67d39512f9 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
@@ -5,12 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://github.com/kirushyk/gst-instruments/archive/${PV}.tar.gz"
-
-SRC_URI[md5sum] = "14a394dec25642848b17f9999f1b4999"
-SRC_URI[sha256sum] = "5565658a33ff9596946541304fbdd3b3683dbb82171a0e6ce56f42b64a01e58d"
-
-S = "${WORKDIR}/gst-instruments-${PV}"
+S = "${WORKDIR}/git"
+SRCREV = "4ce8092636ee6572148b5fa044080734cf5a6b8d"
+SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;"
 
 FILES_${PN} += "${libdir}/*"
 
-- 
2.17.0.rc2.3.gc2a499e6c


