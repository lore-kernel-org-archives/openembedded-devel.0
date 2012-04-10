Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHUG2-0007d1-9U
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 08:08:50 +0200
Received: by wgbdr12 with SMTP id dr12so3941342wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 22:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NROJvOaoLwqf+81SvtWHpxufYPhzdFclIBM3bwOao1g=;
	b=cnYvjEMRmMzirR3Jl4z9DRZzvl9sLg2ohEnSt2bBaidkGPlv8GkSxr6MYdUVdFRfDV
	s2AsvDSUeRUmkphvr+1vCwP+fAFDWNUCCMFWRfJNNG9AuF8zjpzVZYAIcvIMEbEQzbx8
	QSIttZfTzhGMKR/PbA7JALJt6bieRQRhkwx7/rgrN4TbD6xkZQIOd0YhJ3TLChdekTHa
	VoT3SgVfy5H8Cf7/RcnbrRlZSHp5u9sajtUiIrPH+a4rbzO/1MyxZNlC8LDpTpaK2fLz
	XHX9ex6Eljd/dkfIxbdFZHUkaiZ2N9+7bVkpUiIjagF/DFPXycbMXgTDl3oIILc0f9ZJ
	I38w==
Received: by 10.216.136.13 with SMTP id v13mr5410817wei.32.1334037572985;
	Mon, 09 Apr 2012 22:59:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm35390335wia.11.2012.04.09.22.59.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 22:59:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2012 07:59:25 +0200
Message-Id: <cover.1334037469.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH 0/2] Small fixex for xserver-nodm-init-systemd
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
X-List-Received-Date: Tue, 10 Apr 2012 06:08:50 -0000

The following changes since commit 9fb576a0d53d4bd511eee64f44d4ed187acdd83c:

  gcc-4.6: Update to 2012.03 linaro release (2012-04-08 07:48:16 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/xorg
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/xorg

Denis 'GNUtoo' Carikli (1):
  xserver-nodm-init: use /etc/X11/Xserver from service file instead of
    Xorg directly

Martin Jansa (1):
  xserver-nodm-init: add EnvironmentFile

 .../xserver-nodm-init-2.0/xserver-nodm.conf        |    1 +
 .../xserver-nodm-init-2.0/xserver-nodm.service     |    3 ++-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    7 ++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf

-- 
1.7.8.5



