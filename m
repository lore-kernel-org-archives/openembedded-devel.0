Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 86318746AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 06:33:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46880226"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2018 14:33:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 37CA14B714AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 14:33:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Mon, 29 Oct 2018 14:33:25 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1534379918-51880-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 37CA14B714AF.ADFC4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [sumo] [meta-oe][PATCH] upm: Fix do_package error as following when enable multilib.
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
Date: Mon, 29 Oct 2018 06:33:23 -0000
X-Original-Date: Thu, 16 Aug 2018 08:38:38 +0800
X-List-Received-Date: Mon, 29 Oct 2018 06:33:23 -0000
Content-Type: text/plain

do_package: QA Issue: upm: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.5/site-packages/upm/pyupm_speaker.py
  /usr/lib/python3.5/site-packages/upm/pyupm_buzzer.py
  /usr/lib/python3.5/site-packages/upm/pyupm_lol.py
  /usr/lib/python3.5/site-packages/upm/_pyupm_linefinder.so
  /usr/lib/python3.5/site-packages/upm/_pyupm_mlx90614.so
  /usr/lib/python3.5/site-packages/upm/pyupm_dfrph.py
  ......

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index d742a5e..255a9bd 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -21,6 +21,7 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit distutils3-base cmake
 
+EXTRA_OECMAKE_append = " -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/python${PYTHON_BASEVERSION}/site-packages "
 
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
-- 
2.7.4




