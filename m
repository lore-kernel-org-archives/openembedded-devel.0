Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2276977B45
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:42:02 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w43so2819792wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=87rDmhzhqAc0wOfhvcA9PEpHtAOpbnyxSlOYvZIp7P0=;
	b=X7JVEhcOro9zpBgD05orPQ9+ZzQoLBUHRieCN2N761niRIWvxNlRNPPR7sD/pi8E+B
	QyxXpVJDXfcBtzr+AckqPermE8PKBA/Fs/1W8jiAiMQaf3b1USgq6Cj5z4c6usesIFKQ
	mC5S10KTLo5W3rO2JLWzARMUeUZtCS2MhJgg3AYOaEtPU26fY4ifOGgbZ5VkEU3877CZ
	KbR8EUQUZAtmvMhSeeTG3WtfXRG/koLvOIZ4SXx9jJUvxz7wlTMrlvG62xVGM707g/0U
	KF7HTNYcDAadEp5buq7aVlQZ/y6YQ9Tzshigl8M4MUzBELV0h8AvVfYHRuF9IuxN3dAv
	WlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id
	:mail-followup-to:mime-version:content-disposition:user-agent;
	bh=87rDmhzhqAc0wOfhvcA9PEpHtAOpbnyxSlOYvZIp7P0=;
	b=GlnSlmhE8U4dsp8tucqG2gJssdh/VbrU94w+hZ+2piE6L83i6SIvO9jBtnfNbe6hQp
	wDO8OtqrTC/YbH0dAmpvjP6MnCc2NiQQmbpDY9bWADsEBNvD1a0xqDLwFITvZsfrPJaf
	6q4TiIzpbtv1DxaUYbUMIjnVD6B2gPGxTBy47NKkN1eckVwc1sPmxNUPYXgUrDnksJel
	EEtNJb99SA8Qa5JoNKu9t03WWsfam4hSWuqLf+lh+MsBLIyS1+aVA2OjdkXuzllNowgs
	n6NrQy0b4x4lvSDBMtL3WILdUhRxhoRXX/Ypghu8LVT6mz+8FnG6IfuvUX0exe1bvVsG
	JF8g==
X-Gm-Message-State: AFeK/H1XiL3DJETqtQ5+ueI94+UR7gydJZ6qEnvXohy0E9RPyZrV68j4dgG02S9jsjUfkw==
X-Received: by 10.28.88.129 with SMTP id m123mr20175329wmb.28.1491399723459;
	Wed, 05 Apr 2017 06:42:03 -0700 (PDT)
Received: from localhost (x55b0f68b.dyn.telefonica.de. [85.176.246.139])
	by smtp.gmail.com with ESMTPSA id
	191sm22473127wmv.25.2017.04.05.06.42.02
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:42:02 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
Date: Wed, 5 Apr 2017 15:38:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170405133857.GA15126@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] [PATCH v2] nfacct: added nfacct recipe to meta-networking
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
X-List-Received-Date: Wed, 05 Apr 2017 13:42:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

this patch adds nfacct to meta-networking

Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
new file mode 100644
index 0000000..d92f7c0
--- /dev/null
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "nfacct is the command line tool to create/retrieve/delete accounting objects"
+HOMEPAGE = "http://netfilter.org/projects/nfacct/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+SRC_URI = "ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2"
+
+SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
+SRC_URI[sha256sum] = "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac465785de5655fbd69"
+DEPENDS = "libnfnetlink libmnl libnetfilter-acct"
+
+EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+
+S = "${WORKDIR}/nfacct-${PV}"
+
+inherit autotools pkgconfig
+
-- 
1.9.1


