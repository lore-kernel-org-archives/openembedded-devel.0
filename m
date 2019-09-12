Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA8A7E093
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:04:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 7so24961058ljw.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kl5uknN4WQWRGzwDq5yOb0v4gqmHbPRquF6GrfD2lfs=;
	b=E9CzrYyxdR0BlcQWkmP890JkOTMgY/5QM9cTfDfbmML2j9xTOce+IMJe/n/8D1Inse
	UWdIMQZuXzpkZEd8SNQBttlyaV6vqc6cYyZnu/MWnqmDOSr2qsdhlJizczcGU7gILOFR
	GItmoXhSQTXC+JHgXOwb4p8LcKGlYEplL+6RvbL0B6vbKNVMGNeMIuCJH/Fe7JGth8+i
	d7BT3amsiURJmQBtdWvQ9NM7qsfdQvZ3hgIct0Yh2h1iLZDhE/TvXgaOoZM+K/THfdyy
	G3TplwdEeRiMZQ3EDBYpT6zbB2sAbFggole6mVhr5qXENVEURGIZPySoHfqHyPslJUlx
	cB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Kl5uknN4WQWRGzwDq5yOb0v4gqmHbPRquF6GrfD2lfs=;
	b=k5aD07dDfBOzpG6J/kSmGQjRfLThtualSsrsu7DRJDu0wvZ110x16yxjKIp6Zr4IWU
	tWEuGsL7jNCRupA8veHKaUMwc1PF0v5G+6YnHLw8qXeaZyR4FrSRHztGbMhHBGdb5bDJ
	kmzqInHzHCuhh/qw92SZKMt/FHLwbnlQKVbMtSK4EYIRtumA7KNjlfCnrKlvApURDrLO
	brGfWpwpPE3DXbe5TeZZbLzg0dK+aM7ljr70XtCqjBF2r6O8gawl5wmIJ9+x9Of19GzP
	yt3Cln3Z4ddGICnl8N2e65r+fKGvzLz2N+rwQIBNSJxJzNxdfVHkJ0Psvrsrq+Id4PrD
	fTQw==
X-Gm-Message-State: APjAAAWfcfU8Y7cd3oqoK4uc56+qhpzG7u7xmZkQu/KAlnaBiRdsGA1j
	OviRddeA5Q2ozs/hSrkYCbvhUUJVLv0=
X-Google-Smtp-Source: APXvYqxuzIn5SDLiNQjuJdNVbHvnzemAw8RQTeZqnlbdyZ8wZmEe9OSgX0FHJwwmpdLcgKNOBwY+lA==
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr28336500lji.26.1568322277031; 
	Thu, 12 Sep 2019 14:04:37 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	z30sm7585002lfj.63.2019.09.12.14.04.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:04:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:04:33 +0200
Message-Id: <20190912210433.22723-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] capnproto: update to 0.7.0
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
X-List-Received-Date: Thu, 12 Sep 2019 21:04:38 -0000
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

License checksum changed due to minor change to the LICENSE file
mentioning other contributors (see @64db3a6def96453f775d).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../capnproto/{capnproto_0.6.1.bb => capnproto_0.7.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.6.1.bb => capnproto_0.7.0.bb} (81%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
similarity index 81%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
index 6ca3613db..c6bab5ec2 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "Cap’n Proto is an insanely fast data interchange format and cap
 HOMEPAGE = "https://github.com/sandstorm-io/capnproto"
 SECTION = "console/tools"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=0a5b5b742baf10cc1c158579eba7fb1d"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV}"
-SRCREV = "c949a18da5f041a36cc218c5c4b79c7705999b4f"
+SRCREV = "3f44c6db0f0f6c0cab0633f15f15d0a2acd01d19"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.17.1


