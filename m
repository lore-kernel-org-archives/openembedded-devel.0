Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 21AF265D0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 22:24:57 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2323072eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 15:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=bdk6ahZ8sBOlVFC301k/bQQcPdQBmKW1IQbWxTHB/N8=;
	b=efxFRuE642k6phW8hCOBpLRZ4yQ6K2OTa1qIh7GUZ5NjHeipua5bHkvATXgykLiLOl
	l4eUsUO7juUHhpPROruyM2NH1769J5TPGMpCbX+N5hrovDaE1zka/0WT6Pj78xV/zGk3
	4W/qDuQH2BYtZ62HhOh4Imdugy/y+pBbq3y8mIFuA1iQz05B06LjAv4v6fxwIJeStw9e
	m7dSK6HPAcKRqy1Thht2A7LWhwJW661SGo1of0h+tOBVYlRzDaAViB0mnxd4tMAa1lrl
	57Ar9CEIdVdaxi20atL8L82yNsRaftH5Sk568kmF3Jc/hmgbCBtVbDuOy2ei6XZBdKle
	+xuA==
X-Received: by 10.15.10.3 with SMTP id f3mr5042144eet.1.1398378297840;
	Thu, 24 Apr 2014 15:24:57 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	l42sm19565094eew.19.2014.04.24.15.24.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Apr 2014 15:24:57 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Apr 2014 22:24:55 +0000
Message-Id: <1398378295-24423-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][PATCH] vim: Don't build out-of-tree
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
X-List-Received-Date: Thu, 24 Apr 2014 22:25:02 -0000

Out-of-tree builds don't seem to work for vim, probably as it doesn't use
automake.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/vim_7.4.258.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 19c8abc..2d3b0c2 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -17,6 +17,7 @@ S = "${WORKDIR}/${PN}/src"
 VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
 inherit autotools update-alternatives
+inherit autotools-brokensep
 
 # vim configure.in contains functions which got 'dropped' by autotools.bbclass
 do_configure () {
-- 
1.9.2


