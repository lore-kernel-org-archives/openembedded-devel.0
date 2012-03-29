Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD8yx-0008Ic-Id
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:37:15 +0200
Received: by eaae1 with SMTP id e1so610789eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cL/qNEGB5zuWx++Fd06BkpYxH82nOJtn048P0OFVA/U=;
	b=ONIbHcQTiBNq8yPgH5pA6WGXJGYt4kYVvFXTcGQbfMpFR8JHhCrM9APivbgn1JuRGB
	4LOqABC7VKsQWYkT21btBb43RTppMtxFQ+VWwBAtRTM2BHIn7tJtSOu+IARG9qK8hcnV
	LW/Q4Ypco7EVlFJ5A3w01KgfsgbQKmV+3E0pdagkjZW9FKBRFc+/3uT2yBBjo0ReKVn1
	b8j65sMS3NJhq+zYb8ksyFgKf7TRCoo2wJ9YcJlNO22cE4+/WPMxQqyOWC8GzCcS2REF
	zKzAI9QCBnpWV71jSBFfzboxbuxQQgqfJ0LnilKRogM8Q1L3tH8l77G/paYOxiAspp7m
	zKlw==
Received: by 10.180.89.9 with SMTP id bk9mr2446405wib.11.1333002492851;
	Wed, 28 Mar 2012 23:28:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm64200753wix.8.2012.03.28.23.28.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:28:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:28:06 +0200
Message-Id: <cover.1333002292.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 0/6] Small changes 20120328 - 2 more patches
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
X-List-Received-Date: Thu, 29 Mar 2012 06:37:15 -0000

Added 2 more patches for kernel.bbclass, first 4 are the same - not resent

The following changes since commit faf10fc6f3651b687ded55b660ae62520e105512:

  xbmc: update from rc2 to final release (2012-03-26 15:05:47 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Martin Jansa (5):
  linux-kexecboot-3.2: upgrade to 3.2.12
  keymaps: import systemd support from meta-shr layer
  kernel.bbclass: touch .scmversion also in ${S}
  xinput-calibrator: add systemd service
  kernel.bbclass: unify white spaces

Richard Purdie (1):
  kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE

 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |    8 +-
 meta-oe/classes/kernel.bbclass                     |   80 ++++++++++----------
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |    9 ++
 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend   |    8 ++
 .../xinput-calibrator/xinput-calibrator.service    |   11 +++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   11 ++-
 6 files changed, 80 insertions(+), 47 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
 create mode 100644 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service

-- 
1.7.8.5



