Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF457D589
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:36:40 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id k18so15576975lfj.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Tdr7ZJNlcI+7pSgNmzLFhxR1y6kUwb/GlYDA3S3b+h8=;
	b=dh6cq4Do63wn98gbHIh/XvbVBulIsXAQNiV7+VKSPWow0JVmH006p1ZIR8/P19MERl
	ErG/xRNcOqkpB2tl+lSE/9DUhQhzEN80KiiVRVVxOVzdkZUHE6DPgeYHF6OFy5hmzMY7
	FXdy3rSc90x4yZL0yULsdd1BunH2s+t5CCHJ62NbcbESQ+aUNflvU+bBFtmywy0bmofU
	I/SxByRvrV8ska9tZ2LK/Q4XGPsgcj6Df86cXYg/lM0GFcseetVBihHHDhDjRTE1DaEw
	QAZULNZvmvdNxhRa1zXMPFmbXbjoixNAlEpoKf0JYvL4E3qeqycfqtdhS94FXngXfges
	CgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tdr7ZJNlcI+7pSgNmzLFhxR1y6kUwb/GlYDA3S3b+h8=;
	b=obOPWMaSQRmi9IckrixW4mW/nqewlOB3ImWiQ66VWYnu/jPOS0xGGsR6iqRvrswH+f
	6EOgjmJ+fkMn9H52KF/3drNIkUJ9Fe1S+xToMolZ7W5TRRGuWmHZ70QCDeFGWZFU0+fN
	OSGooWTvd8Cim10+WDcseqhAXuXpASm9xvjQuZ8vLtSXv5KXbUZ6rRjK0q9ijsKd+Jhj
	KYgK02ZEt5ZIkaGMixSGPXdpucufW8xT4qC6asZkorxYc6lStRPpiVQi7v0S0sL0e3HA
	bcc4IXxKU0A4DkaqQSlX0GVv6Erx3wgHZori+8cFBn/CpJXD4uRKBzPuuhR77J5N3hBZ
	okSg==
X-Gm-Message-State: APjAAAWXvbwYxlhGldIaleoar5snK+/894z+HhTnl38XgZgGYVwdiuFW
	jFogN4XNxI/vc0rE286+eTjPjTvI7K4=
X-Google-Smtp-Source: APXvYqwD6ICQD+/BHOY7Kd8g6DO5ljS82R9WJKDMme9/DAdg9GShVATNGIVTWLQFBSC8yrM+WZ9wBQ==
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr18470189lfm.160.1556134600530; 
	Wed, 24 Apr 2019 12:36:40 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q29sm4129572ljc.8.2019.04.24.12.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 12:36:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:36:37 +0200
Message-Id: <20190424193637.32506-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] traceroute: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 24 Apr 2019 19:36:40 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 8f17d3fdb..19bbf03f1 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit update-alternatives
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/traceroute/"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
            file://filter-out-the-patches-from-subdirs.patch \
 "
-- 
2.17.1


