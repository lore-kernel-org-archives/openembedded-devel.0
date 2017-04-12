Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8EE72F9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 01:43:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C1hj2H013395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Apr 2017 18:43:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 18:43:44 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 12 Apr 2017 09:41:59 +0800
Message-ID: <20170412014201.23476-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/2] V3: Fix gflags and opencv build errors for multilib
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
X-List-Received-Date: Wed, 12 Apr 2017 01:43:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Tested on qemuppc and qemux86-64 with multilib.

Kai Kang (2):
  gflags: correct S and update library install directory
  opencv: correct subpackage name for multilib

 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 3 +--
 meta-oe/recipes-support/opencv/opencv_3.2.bb   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.10.1


