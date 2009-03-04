Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTc-0005OE-DM
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:49 +0100
Received: (qmail 26012 invoked by uid 813007); 4 Mar 2009 15:53:31 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:31 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>) id 1LetPQ-0001Cb-Vp
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 16:53:24 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:15 +0100
Message-Id: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
Subject: Merging RPM support from Poky
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000

As some of you know Poky has RPM support written. It consists few parts:

- creating RPM packages
- creating rootfs from RPM packages
- using RPM/YUM on device to managing packages (installing from local and
  remote packages

I had one attempt to get it merged before but it had some bugs so I started
from scratch. Extracting required patches from pile of 1800 Poky changsets
took me some time.

With this patchset I managed to build 'minimal-image' for AT91SAM9263-EK
machine. As distribution I used 'minimal' to get something other then
Angstrom.

So please review it (patch 67 is already merged in .dev tree).

It is also visible on Web: http://cgit.openembedded.net/cgit.cgi?url=openembedded/log/&h=hrw/poky-merge/add-rpm-packages-support

Fetch via: git pull hrw/poky-merge/add-rpm-packages-support

 classes/base.bbclass                               |   13 +
 classes/package.bbclass                            |    6 +
 classes/package_rpm.bbclass                        |  140 +++++++--
 classes/packaged-staging.bbclass                   |   14 +
 classes/rootfs_rpm.bbclass                         |  220 ++++++++++++++
 classes/rpm_core.bbclass                           |   16 -
 packages/beecrypt/beecrypt_3.1.0.bb                |   16 +-
 packages/beecrypt/files/x64fix.patch               |   20 ++
 packages/fakechroot/fakechroot-native_2.5.bb       |    2 +-
 packages/fakechroot/fakechroot_2.5.bb              |    3 +-
 packages/fakechroot/files/fix-readlink.patch       |   32 ++
 packages/libxml/libxml2-native.inc                 |    5 +-
 packages/libxml/libxml2-native_2.7.2.bb            |    2 +-
 packages/openssl/openssl-native_0.9.7g.bb          |    1 +
 packages/openssl/openssl-native_0.9.7m.bb          |    1 +
 packages/openssl/openssl-native_0.9.8g.bb          |    1 +
 packages/python/python-iniparse-native_0.2.3.bb    |   10 +
 packages/python/python-iniparse_0.2.3.bb           |   11 +
 packages/python/python-urlgrabber-native_3.1.0.bb  |   10 +
 packages/python/python-urlgrabber_3.1.0.bb         |   11 +
 .../python/yum-metadata-parser-native_1.1.2.bb     |   12 +
 packages/python/yum-metadata-parser_1.1.2.bb       |   13 +
 packages/rpm/files/cross_libpaths.patch            |  239 +++++++++++++++-
 packages/rpm/files/extcond.patch                   |   78 +++++
 packages/rpm/files/external-tools.patch            |  108 +++++++
 packages/rpm/files/fix_mypath.patch                |   13 -
 packages/rpm/files/missingok.patch                 |   44 +++
 packages/rpm/files/tagsbackport.patch              |   37 +++
 packages/rpm/files/weakdeps.patch                  |  312 ++++++++++++++++++++
 packages/rpm/rpm-native_4.4.2.3.bb                 |    7 +
 packages/rpm/rpm_4.4.2.3.bb                        |  108 +++++++
 packages/rpm/rpm_4.4.bb                            |   44 ---
 packages/yum/createrepo-native/fix.patch           |   17 +
 packages/yum/createrepo-native/pathfix.patch       |   81 +++++
 packages/yum/createrepo-native_0.9.bb              |   17 +
 packages/yum/files/extract-postinst.awk            |   11 +
 packages/yum/files/fix                             |   18 ++
 packages/yum/files/hacks.patch                     |   81 +++++
 packages/yum/files/paths.patch                     |   96 ++++++
 packages/yum/files/paths2.patch                    |   33 ++
 packages/yum/files/yum-install-recommends.py       |   39 +++
 packages/yum/yum-native_3.2.18.bb                  |   25 ++
 packages/yum/yum_3.2.18.bb                         |   32 ++
 43 files changed, 1872 insertions(+), 127 deletions(-)





