Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBFC6605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 09:09:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4C99KZp007758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 02:09:20 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 02:09:20 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 May 2014 17:09:17 +0800
Message-ID: <cover.1399885657.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/1] dbus: Update to 1.8.2 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 09:09:22 -0000
Content-Type: text/plain

Change since V1:
Add defect ID [YOCTO #6092] in commit log.

The following changes since commit 50067e069c8cbc0d339819494f22ae7623d47aa6:

  bitbake: fetch2/perforce: Ensure command has a default (2014-05-11 15:26:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/dbus

Chong Lu (1):
  dbus: Update to 1.8.2 version

 .../{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb}    |   3 +-
 meta/recipes-core/dbus/dbus.inc                    |   4 +-
 ...orrect-address-when-using-address-systemd.patch | 193 ---------------------
 ...y-freeing-if-error-during-listing-service.patch |  45 -----
 meta/recipes-core/dbus/dbus/ptest.patch            | 125 +++++++------
 meta/recipes-core/dbus/dbus_1.6.18.bb              |   4 -
 meta/recipes-core/dbus/dbus_1.8.2.bb               |   4 +
 7 files changed, 77 insertions(+), 301 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb} (96%)
 delete mode 100644 meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb

-- 
1.8.1.2


