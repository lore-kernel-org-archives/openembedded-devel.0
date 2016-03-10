Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED7F56FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 06:34:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2A6YaA4027701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Mar 2016 22:34:36 -0800
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 9 Mar 2016 22:34:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Mar 2016 14:33:09 +0800
Message-ID: <cover.1457591235.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/1] waf-samba.bbclass: move to meta-networking
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
X-List-Received-Date: Thu, 10 Mar 2016 06:34:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This is a follow-up from the discussion in the thread:
"Re: [oe] Still many meta-networking changes waiting in patchwork/master-next"

--
The following changes since commit a1e135a499998add7575682bf53db5e02e753580:

  Revert "toybox: upgrade to 0.7.0" (2016-03-07 13:02:19 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/t_move-waf-samba_160310-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/t_move-waf-samba_160310-0

Jackie Huang (1):
  waf-samba.bbclass: move to meta-networking

 {meta-oe => meta-networking}/classes/waf-samba.bbclass                 | 0
 meta-networking/conf/layer.conf                                        | 3 +++
 {meta-oe => meta-networking}/files/waf-cross-answers/README            | 0
 .../files/waf-cross-answers/cross-answers-aarch64.txt                  | 0
 .../files/waf-cross-answers/cross-answers-arm.txt                      | 0
 .../files/waf-cross-answers/cross-answers-i586.txt                     | 0
 .../files/waf-cross-answers/cross-answers-i686.txt                     | 0
 .../files/waf-cross-answers/cross-answers-mips.txt                     | 0
 .../files/waf-cross-answers/cross-answers-mips64.txt                   | 0
 .../files/waf-cross-answers/cross-answers-powerpc.txt                  | 0
 .../files/waf-cross-answers/cross-answers-powerpc64.txt                | 0
 .../files/waf-cross-answers/cross-answers-x86_64.txt                   | 0
 meta-oe/conf/layer.conf                                                | 1 -
 13 files changed, 3 insertions(+), 1 deletion(-)
 rename {meta-oe => meta-networking}/classes/waf-samba.bbclass (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/README (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-aarch64.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-arm.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-i586.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-i686.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-mips.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-mips64.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-powerpc.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-powerpc64.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-x86_64.txt (100%)

-- 
1.9.1


