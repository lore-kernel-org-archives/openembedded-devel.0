Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A9D466A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:32:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43394087"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 17:19:19 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE9MIdX027177
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 17:22:18 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 17:22:31 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 17:20:01 +0800
Message-ID: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 0/3] Porting some recipes from openembedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Nov 2014 09:32:25 -0000
Content-Type: text/plain

Porting some recipes from openembedded.

Bian Naimeng (3):
  Porting dash from openembedded and upgrade to 0.5.8
  Porting anthy from openembedded and upgrade to 9100h
  Porting eggdbus from openembedded.

 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch |   34 +
 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch |   28 +
 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb        |   41 +
 meta-oe/recipes-extended/dash/dash_0.5.8.bb        |   27 +
 .../recipes-support/anthy/anthy-native_9100h.bb    |    7 +
 meta-oe/recipes-support/anthy/anthy.inc            |   26 +
 meta-oe/recipes-support/anthy/anthy/2ch_t.patch    | 5062 ++++++++++++++++++++
 .../anthy/anthy/native-helpers.patch               |   50 +
 .../anthy/anthy/not_build_elc.patch                |   16 +
 .../anthy/anthy/target-helpers.patch               |  111 +
 meta-oe/recipes-support/anthy/anthy_9100h.bb       |   23 +
 11 files changed, 5425 insertions(+)
 create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
 create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
 create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
 create mode 100644 meta-oe/recipes-extended/dash/dash_0.5.8.bb
 create mode 100644 meta-oe/recipes-support/anthy/anthy-native_9100h.bb
 create mode 100644 meta-oe/recipes-support/anthy/anthy.inc
 create mode 100644 meta-oe/recipes-support/anthy/anthy/2ch_t.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy/native-helpers.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy/target-helpers.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy_9100h.bb

-- 
1.9.1


