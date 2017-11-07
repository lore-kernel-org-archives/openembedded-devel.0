Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE187843A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Nov 2017 05:45:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA75jxvK004983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2017 21:45:59 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 6 Nov 2017 21:45:58 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Nov 2017 13:44:22 +0800
Message-ID: <cover.1510033036.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2 v2] samba: fixes for AD DC service
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
X-List-Received-Date: Tue, 07 Nov 2017 05:45:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
* disable ad-dc and enable mitkrb5 by default to avoid an known issue.

--
The following changes since commit 5d6d21e98ed594809169d2b2f6964e90a3369a96:

  libreport: fix Nothing RPROVIDES 'lib32-python3-libreport' (2017-10-27 16:39:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_samba-ad-dc-v2_171107_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_samba-ad-dc-v2_171107_0

Jackie Huang (2):
  samba: add missing RDEPENDS
  samba: fix for AD DC service

 .../recipes-connectivity/samba/samba_4.6.7.bb      | 43 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

-- 
2.11.0


