Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 051D96C0F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 22:07:15 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v13so5798021ljk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vd6edL725tc/DozRUTaKlgIqIiH0y8sLuUQCmgO6xL4=;
	b=uvNQRy66wYbzWMCCmvP8ZUvLPNZtf0CdbQowtrdvHcIYZybfEfmv8oaN5B2b7xl62Z
	KiPlJvJ521+l/7M67qUin0ifENTaClu5wH2OXiwrXcHnFzzznPFYDdf2U8+XYrK7jVpC
	37omhTtq4fNClYE89WvFAsRF4RMQYmdmcbnTD+9zt8O/Zl22iibVWfMNRzgrQev7PsGu
	HR1+XtoOVjOquJkYdJGoNjpALm1Iy5CzphkTOs7BIYeleoEE9VYNf7LVPi3KfEIafy/u
	UKKDv0KF7jsj3XjkSGVPDPBU/jMFJCwuPx+Uux703HVEUXq++I/1w+qPQTFUdlrBjUz/
	6YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vd6edL725tc/DozRUTaKlgIqIiH0y8sLuUQCmgO6xL4=;
	b=T9NvIOSSE+10jbDFPyEv3aeNJSXt0BGWNkWV1wgQZyJtxvRZodTuxdYIK2apsdUENr
	lIFhmu0rZB8IGKaaruUlDMUf+E9DbgQJx7mChormcDiNfet4ysEehk63ZPzv12JrWrZd
	Lkw0h/5K72F8jUvwoI5Rdsh6+zjnzdZVmR7gFwUt36wnjg2gN29P58gTdwvlO+PYwgII
	nNtyChS2MCbsU0rwWrvWuUvYTbbBXFkuzrYNcl0ErkTlX7kOQMzFEQOzogW+KfjQ5ReP
	Gye/wOpmMDQqbQ65EnVBuqofRWyvxkSG/23lbd812alqyI7aUfxM4kk89L824bs3Loty
	/DgQ==
X-Gm-Message-State: APjAAAWzIrjtz7Ch7Jup4oxHl6RtHac6TzIvWGyTjT34gb9AYXic/WK4
	U2+ki0gd2pfu+JIdcY8CqKEt3TrwbTs=
X-Google-Smtp-Source: APXvYqy9QB4sCUtv7k+7JOObZ/y2mtm85g72V/rzIbsbmLrejsFKhsM/VCXgdY3qMh0PRjUcHXiWDQ==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr18534070ljh.135.1556143636360;
	Wed, 24 Apr 2019 15:07:16 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j27sm4608430lfk.97.2019.04.24.15.07.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 15:07:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2019 00:07:13 +0200
Message-Id: <20190424220713.16076-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nftables: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 24 Apr 2019 22:07:16 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-filter/nftables/nftables_0.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
index aadf4f7f5..3ff9583fc 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 
 DEPENDS = "libmnl libnftnl readline gmp bison-native"
 
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/projects/nftables/files/"
+
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            "
 SRC_URI[md5sum] = "d4dcb61df80aa544b2e142e91d937635"
-- 
2.17.1


