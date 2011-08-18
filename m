Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtxoX-0005hU-Jb
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:18:57 +0200
Received: by bkbzu17 with SMTP id zu17so1460188bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XwtpzDiu24N0yZ1WGXytIut9AWfx2/NwnIdPQcbxb0s=;
	b=usRqH/r3zQADDIU6EHyPL7oU1dAhbvMXsc97oeN/4R2BmvUVsGF1mo3rpu+wUPHs2z
	p5DY6rOFLoi3FIyDjHqPqsB3KfRVxIxanJb/esX7B3lqDSJC+kiXoFZBGrIiqneiqmX7
	lEn6PaKznhB9AcZrbI4AvyagtOJsW8HPM2XYs=
Received: by 10.204.164.2 with SMTP id c2mr182192bky.76.1313655257252;
	Thu, 18 Aug 2011 01:14:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e21sm636142bkw.56.2011.08.18.01.14.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:14:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 10:14:07 +0200
Message-Id: <cover.1313655217.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-oe][PATCH 0/3] Pull request #20
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
X-List-Received-Date: Thu, 18 Aug 2011 08:18:57 -0000

The following changes since commit 3d0b866967529a14268541b85e79cb35981e1aed:

  xdotool: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315 (2011-08-17 23:11:55 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (3):
  kexec-tools-klibc: import from meta-zaurus layer
  kexec-tools: add bbappend to keep old packaging with separate kexec
    and kdump
  bluez-hcidump: remove older 2.0

 .../remove.ntoh64.definition.patch                 |   42 ---------
 .../bluez/bluez-hcidump_2.0.bb                     |   20 ----
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 +++++++++++++++++++
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 +++
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 ++++++++++++++++++++
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 ++
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 +++++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               |   27 ++++++
 .../kexec/kexec-tools_2.0.2.bbappend               |    4 +
 9 files changed, 292 insertions(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
 create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend

-- 
1.7.6



