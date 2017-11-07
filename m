Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04680782A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Nov 2017 05:38:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA75cmvF028922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Nov 2017 21:38:48 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 6 Nov 2017 21:38:47 -0800
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Tue, 7 Nov 2017 13:22:02 +0800
Message-ID: <20171107052203.26227-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2: 0/1] Upgrade corosync
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
X-List-Received-Date: Tue, 07 Nov 2017 05:38:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* remove gcc option '-fpie' by append configure cache value 'ap_cv_cc_pie=no'
  to fix TEXTREL QA issue for linker gold. Build for both ld.gold and ld.bfd

Kai Kang (1):
  corosync: 2.4.2 -> 2.4.3

 ...001-Include-fcntl.h-for-F_-and-O_-defines.patch | 28 ----------------------
 .../{corosync_2.4.2.bb => corosync_2.4.3.bb}       | 21 ++++++++--------
 2 files changed, 10 insertions(+), 39 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
 rename meta-networking/recipes-extended/corosync/{corosync_2.4.2.bb => corosync_2.4.3.bb} (82%)

-- 
2.14.1


