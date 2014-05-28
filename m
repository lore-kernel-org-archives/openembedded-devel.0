Return-Path: <maxim.uvarov@linaro.org>
X-Greylist: delayed 165647 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 09:32:10 UTC
Received: from mail-lb0-f171.google.com (unknown [209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 039D765F1F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 09:32:09 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 10so5675708lbg.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 02:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=v9wlYWwDTiZBKf0QiEgstHsOFz7TNylnGzvy0kukumA=;
	b=S32hGCrzURZu5RYRa5u9c07U/fp3Bk3C7fDBtoKtta/V0uJ6eE1suZwUPDDYRiLBRA
	k52OUvD/VlTkIhz9YOqpC3VOrxqz4v92VoZ8RigMp6oXvY4hU5KjzPAvcrKvuU81ba4e
	ETfrmH6cjTrruxnktTyfuDnuXAEYh6xCeEsBKYXsS1pw3opvtcrsyN3EeQBpHFJ3Byq0
	WP44CEl7lzS+h9dHvsm9NLcPyQgntqxJCI77Yf+aolTb8b4/jFZdHWQE40/8Ria0sv9/
	nRCfV9uE5VHGV8gpROZl0bofNqvc0Ux6JCEnoBSthOnYmaYaO1erK+JGRI3xau0VUn+r
	W1Xw==
X-Gm-Message-State: ALoCoQkNpn3XJmS1SeXGwgdiT1POPJrc3v/flGA1Axx1w65mkmaXM2zALd8czXMuP/XGoJJVxm1e
X-Received: by 10.112.149.36 with SMTP id tx4mr7791667lbb.59.1401269530467;
	Wed, 28 May 2014 02:32:10 -0700 (PDT)
Received: from maxim-lap.localhost.onion ([92.39.133.154])
	by mx.google.com with ESMTPSA id
	go4sm17798691lbc.35.2014.05.28.02.32.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 May 2014 02:32:09 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 13:32:07 +0400
Message-Id: <1401269527-16387-1-git-send-email-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 1.8.5.1.163.gd7aced9
Subject: [PATCHv2] daq fix compilation
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
X-List-Received-Date: Wed, 28 May 2014 09:32:13 -0000

preset paths to remove that error:
/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
./config.log:cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]

Also this patch add required libdnet dependency.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 v2: use ${includedir} ${STAGING_INCDIR} and ${STAGING_LIBDIR} instead of direct
	reference to /usr/include or /usr/lib


 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index 4e85194..efdcf99 100644
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
+EXTRA_OECONF += "--includedir=${includedir} --with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
+
 SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
 SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
 
-- 
1.8.5.1.163.gd7aced9


