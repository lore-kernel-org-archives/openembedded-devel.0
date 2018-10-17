Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D014F79B5B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 19:14:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9HJEQpu008923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:14:36 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 12:14:14 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 15:14:12 -0400
Message-ID: <20181017191413.111522-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix gstreamer changing hash for different machines
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
X-List-Received-Date: Wed, 17 Oct 2018 19:14:46 -0000
Content-Type: text/plain

While working on a system with multiple BSPs, but a single distro configuration,
I struggled with an issue of PR numbers increasing quickly and different
behavior from boot to boot.

Most of the issues were from oe-core and similar problems.  The gstreamer in
oe-core has -exactly- the same code as this patch, so this is the equivalent
version or meta-openembedded and the older gstreamer recipe.

This change makes sense in my configuration, but the only alternative I saw
was to declare gstreamer as a MACHINE ARCH package, which I don't think we
really want either.  Besides I'm not clear if that would resolve the hash/
PR issue either.

Mark Hatle (1):
  gstreamer: Remove machine specific append

 .../recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb     | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.18.0


