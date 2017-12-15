Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10CCF786F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBFKM8xH006844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:09 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:07 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:53 -0500
Message-ID: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 1/8] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:09 -0000
Content-Type: text/plain


V1 of this series was incomplete. Thus following up with a V2 which
includes additional cherry-picks from master. Cherry-pick commit IDs
are listed in the temporary comment section of the individual commits.

When building images using rocko that include python-twisted you will
get an error:
nothing provides python3-twisted-news needed by python3-twisted-17.9.0-r0.corei7_64

Basically upstream marked the -news plugin as unavailable in py3 (See
src/twisted/python/_setup.py -- notPortedModules). This leaves the
-news package empty, thus no RPM or similar is built and the
dependency can't be satisfied. Backporting patches 1,3-8 fix this
issue. Patch 1 is the main fix but also introduces missing
dependencies, which are added in patches 3-8. However, the -news
package is still available in py2 thus patch 2 re-adds this to the
RDEPENDS of ${PN} (the super package which can be used if you don't
want to select individual component packages).

Patch 2 should also be applied to master.

Mark

