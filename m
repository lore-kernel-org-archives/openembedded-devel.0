Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwneG-0001MZ-Mn
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 03:22:44 +0200
Received: by qw-out-1920.google.com with SMTP id 9so285072qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:date:message-id:x-mailer;
	bh=CtcwpDrh6FuGulM3vRcY7Li/GGW4rbwNUwBzIhMGQ3A=;
	b=lEg4UwY++O1BGMp95iDCqiNC6eGAinQPvddiTangHCmGQx2Dhj41z44jathbRUt2RU
	gdzfO/RBWcYelTqj6kiUwPF0HnKuebKHTQ8x2FpXlK/85MrCc54VssUs++DGig5qqLXP
	CmRprm+kFa7HzsCt/E6jzC/ddQxOYYjj4kpL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=CDOoDwIzrESejkffy3oCkm1agcQCqkzhcYZOkTAcgim6eie/BQ87Dd6JM9C21b03zl
	CDpvTlbernwPuOKQcViPUdwbsZwvMeNIXvfXWVIcIEBak5WClSXbchx7Z0PeNFUrVJIX
	COz5J8mkKrKyuQQvVOeOeeXvZdNpz0ioIsZ3o=
Received: by 10.220.86.129 with SMTP id s1mr750848vcl.109.1240449489755;
	Wed, 22 Apr 2009 18:18:09 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm1754762yws.23.2009.04.22.18.18.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 18:18:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 52A1E61006F; Wed, 22 Apr 2009 22:17:54 -0300 (BRT)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:17:35 -0300
Message-Id: <1240449461-26116-1-git-send-email-otavio@debian.org>
X-Mailer: git-send-email 1.6.2.1.303.g63699
Subject: Small patchset being used at O.S. Systems and ready for pushing
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
X-List-Received-Date: Thu, 23 Apr 2009 01:22:45 -0000

Hello,

This patchset is being in use here at O.S. Systems and we're looking
for pushing it back to OE mainline to avoid diverting for it.

All change are quite simple but I do want to get feedback from people
before going forward and pushing it.

I belive that following patches might also go to stable:

 [PATCH 1/6] qt4.inc: add translation packages to the dynamic list
 [PATCH 4/6] qt4-tools-native: add qdbusxml2cpp
 [PATCH 6/6] acpid: add 1.0.8 (with netlink support)

The diffstat from the whole patchset is:

 classes/qmake2.bbclass                    |    1 +
 conf/checksums.ini                        |    8 +
 conf/machine/geodegx.conf                 |    2 +-
 conf/machine/geodelx.conf                 |   15 +-
 conf/machine/include/tune-geodegx.inc     |    3 +-
 conf/machine/include/tune-geodelx.inc     |    6 +-
 recipes/acpid/acpid/event.c.diff          |   43 +
 recipes/acpid/acpid/fixfd.diff            |   12 +
 recipes/acpid/acpid/netlink.diff          | 2797 +++++++++++++++++++++++++++++
 recipes/acpid/acpid_1.0.8.bb              |    6 +
 recipes/gtk-engines/gtk-engines_2.18.1.bb |   30 +
 recipes/qt4/files/linux.conf              |    1 +
 recipes/qt4/qt4-tools-native.inc          |    4 +-
 recipes/qt4/qt4-tools-native_4.4.3.bb     |    2 +-
 recipes/qt4/qt4-tools-native_4.5.0.bb     |    2 +-
 recipes/qt4/qt4.inc                       |    2 +-
 16 files changed, 2915 insertions(+), 19 deletions(-)

Thanks in advance,

--
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



