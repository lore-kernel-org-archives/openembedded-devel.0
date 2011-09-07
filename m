Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1InZ-0004qz-Bg
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:17 +0200
Received: by bkbzu17 with SMTP id zu17so214309bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=zmeBMwzDOtDB7V5Ylg8+6lNa9TBLnJeIU373Jmp06dI=;
	b=x0qnkGCcR9qfvRQ5JyUfPxsCHth4RlHZqZxHaB+C3u/ED/eJx2hqeGBbbvfpy3DHK7
	rvllqMBRAhHOr3bA2wCPAKEtBGUjHcAPywAjUxi/q1o+u7naufBWvpGrTFSDH1Dd4Fc2
	gUi6gppHTliubJNiY/l3qVk15RikavaxdbfY0=
Received: by 10.204.140.13 with SMTP id g13mr3436326bku.208.1315404194814;
	Wed, 07 Sep 2011 07:03:14 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:13 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:02:55 +0400
Message-Id: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-handheld 00/12] linux.inc cleanup
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:17 -0000

The following changes since commit 6d2d70e158e70952e78ef8ff574fb2d53ed62a50:

  linux.inc: set debug level according to oe-core (2011-09-06 00:33:32 +0100)

are available in the git repository at:
  git://github.com/lumag/meta-handheld.git linux-inc

Dmitry Eremin-Solenikov (12):
      linux.inc: drop a part of the file for the devices we don't care about
      linux.inc: drop a hack for kernels <= 2.6.29
      linux.inc: drop at91sam9263ek cmdline setting
      linux.inc: drop RPSRC - it's unused now
      linux.inc: drop devicetree settings
      linux.inc: devicetree is used on hh boxes, drop dt handling
      linux.inc: drop savedefconfig, it is provided by kernel.bbclass
      linux.inc: drop old udev check
      linux.inc: drop OABI-only support
      linux.inc: drop cortex-a8 fixup, none of meta-hh machines uses A8
      linux.inc: drop bigendian support
      linux.inc: clean up handling of config variables

 recipes-kernel/linux/linux.inc |  265 +++++++++-------------------------------
 1 files changed, 60 insertions(+), 205 deletions(-)



