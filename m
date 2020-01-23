Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93EB07FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:31:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00NMVAGA015544
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:31:31 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 23 Jan 2020 14:31:07 -0800
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 4E8DFC601A6;
	Thu, 23 Jan 2020 14:31:07 -0800 (PST)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jan 2020 14:31:06 -0800
Message-ID: <20200123223107.64233-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][RFC PATCH 1/2] xorriso: Move from meta-filesystems to meta-oe
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
X-List-Received-Date: Thu, 23 Jan 2020 22:31:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The change to the vboxguestdrivers requires the xorriso-native tool
which is only available in the meta-filesystems layer.  This keeps
meta-oe from requiring additional dependencies.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../recipes-utils/xorriso/xorriso_1.5.3.bb                        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-filesystems => meta-oe}/recipes-utils/xorriso/xorriso_1.5.3.bb (100%)

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb b/meta-oe/recipes-utils/xorriso/xorriso_1.5.3.bb
similarity index 100%
rename from meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
rename to meta-oe/recipes-utils/xorriso/xorriso_1.5.3.bb
-- 
2.23.0


