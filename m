Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B581F7720D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:40:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so1072256pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=UNv/sLMw/AZRWyLcZ8Q/Do0SajtEv74aOzwBNnAyzcI=;
	b=ykjH6cZBR6IP9S+mldzcosM43fGYmNibKKIuXMw7WVALZB0b+OKAHI2f3B0FntthZn
	k+7kZwgP0L1+EYJQh4tcwcytz5QJbDzPlPCBlMSG7i3/k3eOJx7qic4iky4PoIVZdPE0
	NYS7heK+LlM8bW9Nq75WL9hIgWpByDythhhyIskrDDPWc1nr4Ekl7QCgg6OcYGDIj6xh
	SSe+iyIyv8cid3Bee70V1LmkDpTQ+EGnj73gw0Mia7RM6WpIAohon06Pb+hx7wx0gjlL
	tiFML6AIUs/yp+EToSArtol0FANEROfGybzmUEu0tM+MIBEZFUd+P7+5mfO7edI1b1F7
	/Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UNv/sLMw/AZRWyLcZ8Q/Do0SajtEv74aOzwBNnAyzcI=;
	b=MrPcjemI1Z06g91iHWnkzabVwCN8sx2QagObz/jI/ycQSRZLpPa9ByOrShTtY7Botm
	A2swdYcDaBDyqaAw7o89cb8zUdeIGx9V403BZ5XGKi9xLhqLT/oZ31f25UvTbJu6htBO
	Ab+CKuT9VnOvEnVcRTDobM9hiORDCcp8KYeHJGcvaP8VIFI75+ONuNADVJenldlHv485
	lHXh539EK+R1zm/VQmHN3ZIr9WRCXDrE4RX0HyRMaxDM4R0XSWPTOqeCZ6aXSZqSf+fW
	qBFsYUKh3bLSo6fJnBh2kXEWMvN6R+rXfGKdeJqsTUZkGO4h8r0qPfP4M6wW6j2Mhd8K
	Nlfw==
X-Gm-Message-State: AEkoousGLKIYgrxZGhJ30d3EPJHnIRq9USrEmCLEJbrKShIGERloQjVRlDISYaTxql7e7w==
X-Received: by 10.98.10.157 with SMTP id 29mr150957639pfk.62.1470757247865;
	Tue, 09 Aug 2016 08:40:47 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k9sm56963914pfj.63.2016.08.09.08.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 08:40:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  9 Aug 2016 08:40:35 -0700
Message-Id: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][master][krogoth 1/6] libp11: fix fetch error.
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
X-List-Received-Date: Tue, 09 Aug 2016 15:40:47 -0000

ERROR: libp11-0.3.0-r0 do_fetch: Function failed: Fetcher failure for URL: 'git://github.com/OpenSC/libp11.git;protocol=http'. Unable to fetch URL from any source.

removed "protocol=http:

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libp11/libp11_0.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb b/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
index d97bfc6..1fb301f 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
+SRC_URI = "git://github.com/OpenSC/libp11.git"
 SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
 
 S = "${WORKDIR}/git"
-- 
2.3.5


