Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OdYe8-0003hb-Mf
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 03:07:54 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id BF7B343D18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:37 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz BF7B343D18
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280192857; i=@fjfi.cvut.cz; bh=Fi+oBBEzJ+Wa3VgEv5Z2EkV53jU=;
	h=From:Date:Subject:To:Message-Id;
	b=vIW9kjsXo9cEh/BafPliBRtRu7TdyURA6utHSJH5bqpQxd8faqVaYkXtrNAoVKgFE
	rfRL3kWsboNzPtzUS7Gvw==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id tC1RmeHOHgEo
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 7249443D0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 7249443D0B
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 7249443D0B
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 0763546774; Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Tue, 27 Jul 2010 02:51:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100727010733.0763546774@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] Update webkit-efl
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
X-List-Received-Date: Tue, 27 Jul 2010 01:08:04 -0000

Hi,

the following three patches contain the necessary changes to update the
webkit-efl recipe to a recent svn rev. 64079.

The first two patches are needed in order for the third one to work -
webkit-efl needs cmake 2.8 and checks CMAKE_SYSTEM_PROCESSOR value.

I eventually gave up on trying to merge the cmake native and non-native
recipes (mainly due to the fact that non-native cmake is built using
native cmake and uses inherit cmake). That's why only cmake-native_2.8.2 is
added.

Regards,
David


David Kozub (3):
  cmake-native: add recipe for cmake 2.8.2.
  cmake.bbclass: add CMAKE_SYSTEM_PROCESSOR into generated toolchain
    file
  webkit-efl: update to recent webkit-efl (r64079), package launcher
    too

 classes/cmake.bbclass                              |    1 +
 recipes/cmake/cmake-native_2.8.2.bb                |    5 +
 recipes/webkit/webkit-efl/CMakeLists.txt           |  121 ++++++++++++++++++++
 recipes/webkit/webkit-efl/cmakeconfig.h.cmake      |   40 +++++++
 .../webkit-efl/fix-build-with-newer-ecore.patch    |   10 --
 .../webkit-efl/fix-build-with-newer-evas.patch     |   26 ----
 .../webkit/webkit-efl/install-efl-launcher.patch   |   10 ++
 recipes/webkit/webkit-efl/set-so-version.patch     |   11 ++
 recipes/webkit/webkit-efl_git.bb                   |   24 ----
 recipes/webkit/webkit-efl_svn.bb                   |   46 ++++++++
 10 files changed, 234 insertions(+), 60 deletions(-)
 create mode 100644 recipes/cmake/cmake-native_2.8.2.bb
 create mode 100644 recipes/webkit/webkit-efl/CMakeLists.txt
 create mode 100644 recipes/webkit/webkit-efl/cmakeconfig.h.cmake
 delete mode 100644 recipes/webkit/webkit-efl/fix-build-with-newer-ecore.patch
 delete mode 100644 recipes/webkit/webkit-efl/fix-build-with-newer-evas.patch
 create mode 100644 recipes/webkit/webkit-efl/install-efl-launcher.patch
 create mode 100644 recipes/webkit/webkit-efl/set-so-version.patch
 delete mode 100644 recipes/webkit/webkit-efl_git.bb
 create mode 100644 recipes/webkit/webkit-efl_svn.bb



