Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 88CED6FCB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 13:17:51 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id w7so1471545lbi.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 06:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DilppEX2IkrT82HT9YnJ4S0gEaFkBpiU4mLD+8+vHHc=;
	b=ZJFRf2mvhkreKDBQQAvgOEfXxuaPnNsvQ/tcDNZYYgcZkGUp/bORbowviwVp8X7OGo
	SF2CCImwf02qDlUd49Lps+bfINHi3Nikb44VPYjnVTLSiuDSNGb0OHPft2eMQgxrpbal
	7A8OW25y/sIwp6i03hej7+WEfWFTkZZtj2eGLuRur8bpjON/9YLtJCOrRVzD83q+09KH
	IpT189BrLXnL1WywCLXlKBE8ItRVkeJiZSHeVWyla9L1ckbTdez+1p1Cy+WJFb1Ch8xL
	SxHFWga1Xd8RwmwIvZVGHpnj5H5+PeoXNbJ6pKUhA15V+trnIi0y2/+bROdAtluaIAcj
	E7IQ==
X-Gm-Message-State: ALoCoQmOuPW1PFHThASK2ufwE2rI+PvZTbPpM1BkCw1JFjQz4Uk47v5DSEdpJKXrp0DeLhq1y0Ky
X-Received: by 10.152.3.41 with SMTP id 9mr1451839laz.86.1402060672069;
	Fri, 06 Jun 2014 06:17:52 -0700 (PDT)
Received: from maxim-lap.localhost.onion ([92.39.133.154])
	by mx.google.com with ESMTPSA id o8sm7755187laj.10.2014.06.06.06.17.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Jun 2014 06:17:51 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 17:17:47 +0400
Message-Id: <1402060667-6786-1-git-send-email-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 1.8.5.1.163.gd7aced9
Subject: [PATCHv3] daq fix compilation
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
X-List-Received-Date: Fri, 06 Jun 2014 13:18:03 -0000

preset paths to remove that error:
/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
./config.log:cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]

Also this patch add required libdnet dependency.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 v2: use ${includedir} ${STAGING_INCDIR} and ${STAGING_LIBDIR} instead of direct
	reference to /usr/include or /usr/lib

 v3: collaps the 2 EXTRA_OECONF += into as single EXTRA_OECONF = (without
the '+').


 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index 4e85194..4cf3f1c 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
-DEPENDS = "libpcap libpcre"
+DEPENDS = "libpcap libpcre libdnet"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
             file://disable-run-test-program-while-cross-compiling.patch "
@@ -13,7 +13,11 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 # these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
 # this error from test-dependencies script:
 # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
-EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
+#
+# never look to /usr/local lib while cross compiling
+
+EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
+	--with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
 
 SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
 SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
-- 
1.8.5.1.163.gd7aced9


