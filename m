Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id BBD5C6D15E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 05:14:53 +0000 (UTC)
Received: from localhost (83.252.255.124) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Fri, 18 Oct 2013
	07:14:55 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 07:14:48 +0200
Message-ID: <cover.1382073165.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 0/2] Breakpad and ktap recipes
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
X-List-Received-Date: Fri, 18 Oct 2013 05:14:54 -0000
Content-Type: text/plain

[Resending with meta-oe in subject.]

These are a couple of recipes that we've been using internally for some time. They
were developed and mostly used on a dylan-based setup. Testing has primarily been 
performed on ARM, both qemuarm and our custom machine.

Breakpad is a crash reporting tool, that's getting a wider use.
Please, let me know if there's a more efficient way (or otherwise better way) to 
have the bbclass generate the symbol file.

Ktap is a new scripting dynamic tracing tool for Linux. This recipe will be of
use until everyone is on 3.13+ kernels (ktap has been merged for the 3.13 series).

The following changes since commit f8903f53db717294d63a8d79b5ef7ca34b3c189e:

  libhugetlbfs: install perl lib to directory perl instead of perl5 (2013-10-15 13:43:53 +0200)

are available in the git repository at:

  git://github.com/darander/meta-oe breakpad-ktap
  https://github.com/darander/meta-oe/tree/breakpad-ktap

Anders Darander (2):
  breakpad: add initial recipe
  ktap: add initial recipe

 meta-oe/classes/breakpad.bbclass                  | 32 ++++++++++
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 72 +++++++++++++++++++++++
 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb    | 19 ++++++
 meta-oe/recipes-kernel/ktap/ktap.inc              | 11 ++++
 meta-oe/recipes-kernel/ktap/ktap_0.3.bb           | 17 ++++++
 5 files changed, 151 insertions(+)
 create mode 100644 meta-oe/classes/breakpad.bbclass
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
 create mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
 create mode 100644 meta-oe/recipes-kernel/ktap/ktap.inc
 create mode 100644 meta-oe/recipes-kernel/ktap/ktap_0.3.bb

-- 
1.8.4.rc3


