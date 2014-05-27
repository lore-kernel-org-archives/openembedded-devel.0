Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-la0-f50.google.com (unknown [209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 031A46FA95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 13:13:20 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id b8so6436881lan.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 06:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GcXHspEIbZZOEwxcWQXhSkxFi4V4KgbKkW6eN/QiR6k=;
	b=SYYacuPTNhkG9uDaG21lVhVHrMlLi/Lmbc1nn+hCNjPuPfO3Mn34tfO8ih4RvqfmVm
	Kn19ZdYXXRlABpSfPm7Qtc96CrK3z0pDB27hlvTeVzp5cUXwpfFo4JVLGmlDxfuAFK7l
	DHMM+L4aNZQ+k9RglN+XuSrej5EOCUYWPw8gghe3NzFHkBbVT/WFNyAb1AWXlBlEs1NV
	91WRx/Nr/w+ohEcwh9g2JTgSBoWZCZP8SCs+w3VNWpv+SQMWLf1y0+cvnZI6T5Bp3gSI
	TSy++qOCviiPEgXs+FTODkVuhIOVtdd7u4oJK/+pQ5mOfdj/d8bzANYkkpOhsSo88v68
	zsPg==
X-Gm-Message-State: ALoCoQmSxU8CH3qo6tOcDn24B2LJmeYMJY7j5hM+r/kej407BiDNSQk7mtcsozr4KNx7MV3bCLAs
X-Received: by 10.112.160.105 with SMTP id xj9mr22195112lbb.2.1401196400935;
	Tue, 27 May 2014 06:13:20 -0700 (PDT)
Received: from maxim-lap.localhost.onion ([92.39.133.154])
	by mx.google.com with ESMTPSA id
	bq6sm15132265lbb.34.2014.05.27.06.13.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 May 2014 06:13:20 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 17:13:16 +0400
Message-Id: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 1.8.5.1.163.gd7aced9
Subject: [PATCH] daq fix compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 May 2014 13:13:26 -0000

preset paths to remove that error:
/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
./config.log:cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]

Also this patch add required libdnet dependency.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index 4e85194..dcf38fc 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
-DEPENDS = "libpcap libpcre"
+DEPENDS = "libpcap libpcre libdnet"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
             file://disable-run-test-program-while-cross-compiling.patch "
@@ -15,6 +15,9 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
 EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
 
+# never look to /usr/local lib while cross compiling
+EXTRA_OECONF += "--includedir=/usr/include --with-libpcap-includes=/usr/lib --with-dnet-includes=/usr/lib"
+
 SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
 SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
 
-- 
1.8.5.1.163.gd7aced9


