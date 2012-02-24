Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0p9a-0001Oj-JG
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 08:01:18 +0100
Received: by eekd41 with SMTP id d41so968643eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 22:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.202.200 as permitted sender) client-ip=10.14.202.200; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.202.200 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.202.200])
	by 10.14.202.200 with SMTP id d48mr683502eeo.24.1330066376618 (num_hops
	= 1); Thu, 23 Feb 2012 22:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=esliUKyH1vrNnwCVjXmkbKNpHwlfGB85Tdg5+X62Yz8=;
	b=xdOFA2lKFauwtSYb0aW7HFdI1h5KL2i7IgJ3wGApD+SKywaZ+c936Q0gm8eNCeV/os
	qxdt5DK/s0/p7FjfxO5/z+0WztJpQuFRxNqTTYG4Cq2n5ZgDIXXVZzNNEKX7+LOftV+I
	yzI6zLJu2Pb6R5AYeGa5gEOByOp6CKgLmyLnI=
Received: by 10.14.202.200 with SMTP id d48mr510040eeo.24.1330066376512;
	Thu, 23 Feb 2012 22:52:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm14687740eem.11.2012.02.23.22.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 22:52:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 07:52:46 +0100
Message-Id: <cover.1330066140.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330041429.git.Martin.Jansa@gmail.com>
References: <cover.1330041429.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 0/4] Small updates for sstate, added fix for kmod build
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
X-List-Received-Date: Fri, 24 Feb 2012 07:01:18 -0000

First 3 are the same, not resend

Added small fix to disable man in kmod because we don't have working xsltproc

The following changes since commit 3c50d83184d58eba36f72c7e2e7116d2a8e92a71:

  toscoterm: add (2012-02-23 17:57:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (4):
  mysql5: PR bump after including *_config in default SSTATE_SCAN_FILES
  meta-oe: include pointercal-xinput in SIGGEN_EXCLUDERECIPES_ABISAFE
  meta-oe: include systemd-serialgetty in SIGGEN_EXCLUDERECIPES_ABISAFE
  kmod: disable man pages generation because we don't have working
    xsltproc

 meta-oe/conf/layer.conf                            |    2 +
 ...-man-page-generation-because-we-don-t-hav.patch |   26 ++++++++++++++++++++
 meta-oe/recipes-kernel/kmod/kmod_git.bb            |    6 +++-
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |    2 +-
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch

-- 
1.7.8.4



