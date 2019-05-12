Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id A07237D38A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2019 09:40:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j187so10998267wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2019 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8zfv1zFFLGXzxjVBclxVPjyc8jGfPoSWYDkmqqoXWx8=;
	b=du/+mHiPLiVncgHYEeGWug/GLXHIgL6TzJhE7efOsoJkjrY3lpomcqdxn61Lu5/xcS
	HtfL1FJgoL+91KqaH/8oMxXvAmZEuAnm+jkrVg1p+NRsc9ooZ2xzGM2Pc6FO+RfmZRnz
	z48+guTWEVYO0cr/wmW/VKfsWtVinBF7uT8qTz4fnqzcIbawKAzxxDJxF/vIIbish+Id
	1ZDSnIKS0MQzcWaZcy6H9ZmfhbmkXjz5l0IbVYf/NRx23HNUpQufiDPwP6yR10HXaxe0
	HRCN25A1xTtTXpMLLKJfahacW4YUxI8qq9AjYe4X+ux46hv0aMPFUjBFFRYM+d3Wyvpo
	ck2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8zfv1zFFLGXzxjVBclxVPjyc8jGfPoSWYDkmqqoXWx8=;
	b=e2dNL5HnsfNgfpAHj5VeuTP3cF0lu2d2txyfHodb8OVMxU/uYzaAFGWMYYNJE+t6ca
	L7nyQUMQWQxUqTnlgtg93Qd7QkVSlk0olrEEoPjBiQNQ1WCs/5MnUVxF8Kp2ZhOrCbTR
	5+UWDkwPnwxw59ujzXfSs3DC3V6UdE7mZj9R10CWCYfYEUCENh0sb9XIg4ZTR2uC2MFv
	S66fSvVi6egzecHHBClCFZ/4ydQhRvENR4abb4XSR0Sae4fRDeoYy+7kxwzm57qj+Dk/
	YLQOfwolqt9yPPXhiTuG7TiL5rSVqVn3s+qhb8gln7U8ZWwpvDBWJhp41tC5oVthZbuS
	I6KA==
X-Gm-Message-State: APjAAAVASXq+8JI4RfPg9d3UTwWMAHcMoom8KX59iD/gJojt9Z7nuqfU
	cSDfGdnYbqR49O6LwpHE2JMoxExk
X-Google-Smtp-Source: APXvYqyLBkx+IjHEKe23vBiqFGnb0s4TJjuPJZTSNNBFHv+iucAEd0xqk4YpXKOtDu8472qrEgBx9w==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr11905057wmd.36.1557654040027;
	Sun, 12 May 2019 02:40:40 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x9sm8700224wmf.27.2019.05.12.02.40.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 12 May 2019 02:40:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2019 09:40:35 +0000
Message-Id: <20190512094035.13949-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512094035.13949-1-Martin.Jansa@gmail.com>
References: <20190512094035.13949-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] libdbi-perl: prevent native libdbi-perl depending on target perl
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
X-List-Received-Date: Sun, 12 May 2019 09:40:39 -0000

* detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm" --targets="libdbi-perl-native" --analyze
  ...
  ERROR: libdbi-perl-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemuarm
  Hash for dependent task perl-sanity/perl_5.28.2.bb.do_populate_sysroot changed from 00c0f30e40a144255fc3054e9a71ce73170a89832318774bd2a8fc5e8dcd20ad to e22ff8375c4ee6bda646dae8a1d6b1ddeb6d373678fc036fdc406e91a026b497

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
index 3c031646b6..ff4a9d0610 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
@@ -7,10 +7,11 @@ database interface independent of the actual database being used. \
 HOMEPAGE = "http://search.cpan.org/dist/DBI/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-RDEPENDS_${PN} = " perl-module-carp \
-                   perl-module-exporter \
-                   perl-module-exporter-heavy \
-                   perl-module-dynaloader \
+RDEPENDS_${PN}_class-target = " \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-exporter-heavy \
+    perl-module-dynaloader \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
-- 
2.17.1


