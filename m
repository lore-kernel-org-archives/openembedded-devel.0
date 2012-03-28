Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCrZv-0005fG-94
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 14:02:15 +0200
Received: by wgbds1 with SMTP id ds1so4073603wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/9ul/5uJShWxMlFgXwsCqrfaSyO9jIGOmwvxasJzirY=;
	b=IOLO7XPUd70KDspaoqzKTmA9YgA6LlmjRAIFkIsW9BFtxkGBq8FXbOqlyhSQA5BQmX
	ftq9IejztV13hzKUHSKlU0Tjs6A5GZwPavsXf1aoZNJK5juibMCroCAl5ZEUBTQkbRft
	HctpV+c0Cxgy3EufgEwQ4f1EPG2fE3CqpbWo7J4LM8qJFVwaZCt/PfpKxUvlO9Kz5B3B
	5u3KO708MxN6vyP+HbPAMpO8rt61J7zcl1fYdJ1nghVQrSiVVoRq3HIbKOr366HHyrx5
	36dU53HdPTKED376mEOMik98tmqVYCbFAaoJJjoriO4H1l687s75k/CFcGv8ScO2kk1D
	VaWg==
Received: by 10.180.79.72 with SMTP id h8mr6525815wix.1.1332935593275;
	Wed, 28 Mar 2012 04:53:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm12485988wib.7.2012.03.28.04.53.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:53:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:53:07 +0200
Message-Id: <cover.1332935553.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-handheld][PATCH 0/2] kernel upgrade and PRINC fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 12:02:15 -0000

The following changes since commit 1a1d50a1bf39136a8c974022d63e0f119f23bbff:

  keymaps: edit script to reuse 2.6 kernel keymaps (2012-03-25 23:51:03 +0100)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/pull

Martin Jansa (2):
  linux-3.2: upgrade to 3.2.12
  formfactor, keymaps, udev: use better form of PRINC

 recipes-bsp/formfactor/formfactor_0.0.bbappend |    2 +-
 recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
 recipes-core/udev/udev_173.bbappend            |    2 +-
 recipes-kernel/linux/linux_3.2.bb              |    8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.8.5



