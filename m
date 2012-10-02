Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1TJ3H0-00031W-Bh
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Oct 2012 16:16:34 +0200
Received: from fsc-480-012-88.intern.dresearch.de
	(fsc-480-012-88.internal.dresearch-fe.de [172.29.23.5])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id C5EBCE0230;
	Tue,  2 Oct 2012 13:57:38 +0000 (UTC)
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id 24A8772073; Tue,  2 Oct 2012 15:53:34 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <h.heinold@tarent.de>, Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2012 15:53:19 +0200
Message-Id: <cover.1349185326.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <505ABA13.2050109@dresearch-fe.de>
References: <505ABA13.2050109@dresearch-fe.de>
Subject: [2011.03-maintenance 0/2] pull request 20121002
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
X-List-Received-Date: Tue, 02 Oct 2012 14:16:34 -0000

Hi Tom, hi meta-java maintainers,

this pull request contains a backport of jamvm-initial from meta-java
which fixes at least the problem of endless loop in java-initial
script while running do_configure for classpath-native.

The backport works well for us, but it would be nice if we can get
some acks from the java maintainers before Tom pulls the commits to
2011.03-maintenance branch.

see also: http://thread.gmane.org/gmane.comp.handhelds.openembedded/54242

Thx,
Steffen
The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47fb:

  gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)

are available in the git repository at:

  git://github.com/sledz/oe pull-request-1
  https://github.com/sledz/oe/tree/pull-request-1

Steffen Sledz (2):
  jamvm: reorganize metadata to simplify backport from meta-java
  jamvm-initial: backport 1.4.5 from meta-java

 recipes/jamvm/files/jamvm_1.5.0-initial.patch      |   91 --------------------
 recipes/jamvm/files/java-initial                   |   17 ++++
 .../jamvm-initial.patch}                           |   19 ----
 recipes/jamvm/jamvm-initial_1.4.5.bb               |   22 ++---
 recipes/jamvm/{files => jamvm}/debian-jni.patch    |    0
 .../jamvm-1.3.1-size-defaults.patch                |    0
 .../jamvm-1.5.3-jni_h-noinst.patch                 |    0
 recipes/jamvm/jamvm/libffi.patch                   |   66 ++++++++++++++
 8 files changed, 95 insertions(+), 120 deletions(-)
 delete mode 100644 recipes/jamvm/files/jamvm_1.5.0-initial.patch
 create mode 100755 recipes/jamvm/files/java-initial
 rename recipes/jamvm/{files/jamvm_1.4.5-initial.patch => jamvm-initial/jamvm-initial.patch} (81%)
 rename recipes/jamvm/{files => jamvm}/debian-jni.patch (100%)
 rename recipes/jamvm/{files => jamvm}/jamvm-1.3.1-size-defaults.patch (100%)
 rename recipes/jamvm/{files => jamvm}/jamvm-1.5.3-jni_h-noinst.patch (100%)
 create mode 100644 recipes/jamvm/jamvm/libffi.patch

-- 
1.7.10.4



