Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA327F323
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b16so1084656wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j+o//Ebi1YBDsAvmkcjeyqPR0t5pc39NGM7NRbJfnlY=;
	b=Y6lzFqam1Qv2I4WsBfJpNA0bNwICjUj70pC2OPM9MrO2qOgao4iUe6DGf4DkgCF0Qp
	9EKTi6qLE5G1OWSoQvM8NLjdo/46t/DIl2veSnEmH7RsOOaR6ExE300DL4/8DHke3Kn7
	YYhX6vZ+nW1GooK9N5iTifjDRPCAe4coey7eHOERZGKEZUg854rIY/lbMc7nVqPhUnWD
	6Q3ZS9akMI1svuJ9n289LC1MJ7Nyhr2/HgIN0Qt5CQk0kilJBiL0ZnRhPMhnMGKPMBpf
	VeU0/g/G1S81IRX7tPPIaZ+ZBLm8+Fm/hu7UW9eXwx6cOmeIJhzWOsxFfRWtjPjQ2EpX
	/FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j+o//Ebi1YBDsAvmkcjeyqPR0t5pc39NGM7NRbJfnlY=;
	b=h0TusSa2QlT4qy429QWCNg+oBqFD0OgeADgUEphRJX+qKdclgC9I0A6+i4Y0AmzWkR
	YkI8MBYBf2qkdTWcWyeXFNai/FDVPuKpVRpnOg0trBAsSBeFeH0KeBxIwxTItJVCejld
	0dn/oVLEPx5f1m1bsdOclu3mswSK41p+MBWJyZYm4DGLC9jdd1uoYF9uLC5qRKUT/mBT
	2A1jpgcF7UQancMz52mCz2t7UZu2ANzTRvJBiz3GOZI7nOoZMYo0YCcuKuj94I4/4v4x
	OI11m2jQmbXYbyXQOlyG0NlM2vqqJDCIlxqLITAOXIp+8EGv2OBS35bhes2rsyyf38eg
	Z/7w==
X-Gm-Message-State: APjAAAUb3dWwzrNvhmT51Tduc9wgN0FRpbuvDNAdpeA7tESojg8h6KK3
	0+HvA9+NW1y5I79lYMVqm9ig9Y71bAA=
X-Google-Smtp-Source: APXvYqwQxulslmjHxeSBRd6D1nScT8mD8JCDOhrus0QCvk5HHoG1f+hUudxIX5vK+qjkKvK4t8ASkw==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr3478930wrw.186.1565951997812; 
	Fri, 16 Aug 2019 03:39:57 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	x20sm10618283wrg.10.2019.08.16.03.39.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:56 +0000
Message-Id: <20190816103958.2701581-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/7] edac-utils: add runtime dependency on perl
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
X-List-Received-Date: Fri, 16 Aug 2019 10:39:57 -0000

* fixes:
  ERROR: QA Issue: /usr/sbin/edac-ctl contained in package edac-utils requires /usr/bin/perl, but no providers found in RDEPENDS_edac-utils? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index 2c0914d30a..09e7384882 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -31,7 +31,11 @@ RDEPENDS_${PN}_aarch64 = "dmidecode"
 RDEPENDS_${PN}_powerpc = "dmidecode"
 RDEPENDS_${PN}_powerpc64 = "dmidecode"
 RDEPENDS_${PN}_append = " \
-    perl-module-file-basename perl-module-file-find perl-module-getopt-long perl-module-posix \
+    perl \
+    perl-module-file-basename \
+    perl-module-file-find \
+    perl-module-getopt-long \
+    perl-module-posix \
     perl-module-overload \
     perl-module-overloading \
     perl-module-file-glob \
-- 
2.17.1


