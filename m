Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UNzc9-0005rN-Hc
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 07:55:11 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id A9574EA040
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2013 07:46:25 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 8D280A406A3; Fri,  5 Apr 2013 07:38:14 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2013 07:37:53 +0200
Message-Id: <cover.1365116038.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-handheld][PATCH 0/2] Pull request 20130405
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
X-List-Received-Date: Fri, 05 Apr 2013 05:55:20 -0000
X-List-Received-Date: Fri, 05 Apr 2013 05:55:20 -0000

Hello,

Following the patches I sent to the meta-handheld layer a few days ago
to add machine support for the Ben Nanonote, I found out that the
corresponding kernel recipe fails to build on oe-core (builds fine on
oe-classic).
A few settings were missing and, more importantly, the version of gcc
in oe-core seems to enable the -Wunused-but-set-variable switch, which
makes it error on many variables that were indeed 'unused but
set'. After trying to solve this issue the easy way, by setting
'CFLAGS=-Wno-error=unused-but-set-variable -Wno-error=unused-but-set-parameter'
to no avail, I chose to annotate the aforementioned variables in the
kernel code with __attribute__((__unused__)).

The patches that come as a follow-up of this message are what it's all
about; sorry for the inconvenience in the first place.
Please pull into meta-handheld.

The following changes since commit a9b2b63d1f40a75638ee6ddb3599501c6974deb9:

  ben-nanonote: import ben-nanonote machine support (2013-04-03 18:13:48 +0100)

are available in the git repository at:

  git://seketeli.fr/~apelete/meta-handheld.git fix-nanonote-kernel-build

Apelete Seketeli (2):
  linux-jlime-ben-nanonote: fix build errors
  ben-nanonote: add DEFAULTTUNE to machine configuration

 conf/machine/ben-nanonote.conf                     |    1 +
 .../gcc-attribute-unused.patch                     |   87 ++++++++++++++++++++
 .../linux/linux-jlime-ben-nanonote_2.6.36.bb       |    4 +-
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/gcc-attribute-unused.patch

-- 
1.7.10.4



