Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 57BF77D103
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:08:37 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x31E8bDi026493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Apr 2019 16:08:37 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x31E8bJf026122;
	Mon, 1 Apr 2019 16:08:37 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9803495182D;
	Mon,  1 Apr 2019 16:08:36 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 16:08:19 +0200
Message-Id: <20190401140821.2226-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-java][PATCH 0/2] Allow building jre from hosttools
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
X-List-Received-Date: Mon, 01 Apr 2019 14:08:37 -0000

From: Peter Marko <peter.marko@siemens.com>

Buildding whole native openjdk toolchain takes very long time
as is a waste of resources.

Following layer configuration allows to build from hosttools:
HOSTTOOLS += "java javac pack200"
ASSUME_PROVIDED += "openjdk-8-native"

This requires some changes in the recipes.

Peter Marko (2):
  openjre-8: allow build from hosttools
  openjdk-8: add missing unzip-native dependency

 recipes-core/openjdk/openjdk-8-cross.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.11.0


