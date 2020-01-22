Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED167FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 16:20:24 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id w62so66699pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KoxnI58iU9bdDHc5VTYmfRh5EWjrj3imnmvYu4QUc+s=;
	b=SAD0boiCjl9e7fImCOA5r82e6i+RUeeYAjDfp5M4tcoyZH2jNXy8Fftrc3YPEmwlZX
	d/cpwrScnw8NLsS0kXV38UYYA7W1sCSGP8HDnuVypZA5aOHtChPZoMdaJevQl/QQpgA4
	zrmM2007mbHaR1PjkAmM0dOr5SCRPSim/QTTysfTOgmFD+x2YH6cs5m06fVFq1fgYcIH
	6p0sHf3roofu7+uPxU4jRT5yHOQeN6vVBgtZFfrLB380Hq9kusmUbfag4K87sFs08yUV
	vo2KSsyGpiMjDWHXUJ93o70mwSW+rPnQ5Oogu8vrEA11g7Y9SW36OuspIMry8FBSkRg4
	L01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KoxnI58iU9bdDHc5VTYmfRh5EWjrj3imnmvYu4QUc+s=;
	b=lcgZIn+11Ce+jQeAa6WpDDWyeVAW2r8Zd8o5OzAcyZHfmK61VgymM8XGuscRbaQwQG
	TiQGVjSyWWmSDHQZHwTJiw94kSzxSxRca+tq9FSxP6XObnjDLA8ZRIvO8S3fdqLkwo3C
	0yJk5entA/s65hPCCLWcVyK/pDXWdNpXT/QVFih6FBDMU8GpJiBM9L5sP6VEPqzSHIqV
	0e3ci2De2dB5s9lLQRZ1bYuOr5XYs27mRlzE6i15TGG2HFLF5W+MHmXcqWXstiibVuhQ
	bb6m0v4QAhjvo01e47HZPwyD6vs6Zf9xrXvGVFGblPTIHg7odxoaB6B7Cbui9CQAbpIG
	HK0w==
X-Gm-Message-State: APjAAAVdTUrEhyzAglPuIgnRMh1riIdW22ITgYWtqnNnk4M2VmqRM0he
	seEZtVqteeEDfR8z3rOEa2Ntrs5ujtE=
X-Google-Smtp-Source: APXvYqwoo69yZbLnBzo0ddHlKyW+zZhAyAxAXNoXEhfUGngqAWDfuiBY1dV5iGuunNS7GNrWgrMPVQ==
X-Received: by 2002:aa7:824d:: with SMTP id e13mr3241839pfn.247.1579710025190; 
	Wed, 22 Jan 2020 08:20:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	g21sm49042773pfo.126.2020.01.22.08.20.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 08:20:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 08:20:14 -0800
Message-Id: <20200122162014.1971652-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122162014.1971652-1-raj.khem@gmail.com>
References: <20200122162014.1971652-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] ntop: Move dependency to use py3
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
X-List-Received-Date: Wed, 22 Jan 2020 16:20:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 6f09937ed0..2d37969a70 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -27,7 +27,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ntop/files/ntop/Stable"
 
 inherit autotools-brokensep useradd python3native pkgconfig systemd
 
-DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
+DEPENDS = "geoip rrdtool python3 zlib libpcap gdbm"
 
 PACKAGECONFIG ??= "openssl snmp plugins"
 PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
-- 
2.25.0


