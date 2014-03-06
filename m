Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB856F59F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:48:09 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id l9so1816274eaj.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=SUsa19udKhMEhsfmu+x9JwjGJb9cnWu1FZXTqshWgfg=;
	b=lOIolO0iLaDaZHCH/bhNhIO/wfC0G9Zfb3piD7NMOc1GRkBBKrvPDRtHM8QkWQ3BmW
	Jnf9SOtxzhCm+RGYunQX8sPO7e+bIa1j+dLTdM890ny5qsZr/FpYcBoSQ+4Hs5lB58m0
	zhmGPK+QPJOCT/6Q8UDENlimFbyi20sU4Wr+EnrVw/bGKXKqfLTBVqqAhmIG2iFi2CX1
	4Sewlpitym3aHVVs2iceqHuaDOlsV02TvCRUIiZu+fVJ+XwX7JAuhlCOLWYNqWn/X+gC
	Ar6HZK7l/G0oatkqQ2Ct6du8PpNY5uzmS2BKLRPF8EiaaY8WjueYqXDEQhzzE8VyECVu
	Y7eg==
X-Received: by 10.14.103.134 with SMTP id f6mr13814467eeg.41.1394124490252;
	Thu, 06 Mar 2014 08:48:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm23626165eee.2.2014.03.06.08.48.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 08:48:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 17:48:10 +0100
Message-Id: <cover.1394124356.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-efl][WIP][PATCH 0/6] EFL upgrade to 1.9*
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
X-List-Received-Date: Thu, 06 Mar 2014 16:48:10 -0000

Just WIP, because it's not properly tested in runtime yet.
The changes from 1.8 aren't so big as in 1.7 -> 1.8 upgrade so I plan
to finish this soon(ish).

The following changes since commit 279ebafb9dfcc3bd5095f4880e16a2e9401e38f7:

  systemd: Rename .bbappend to match any version (2014-03-05 18:40:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (6):
  efl: upgrade to 1.9.0
  webkit-efl: upgrade to new snapshot r164189
  e-wm: upgrade to 0.18.4 and drop old 0.17.5
  e-tasks: Migrate to eldbus
  python-efl: upgrade to 1.9.0
  eve: restrict for armv7a, because upstream dropped support in
    webkit-efl

 meta-efl/recipes-devtools/python/python-efl.inc    |   2 +-
 .../recipes-devtools/python/python-efl_1.8.1.bb    |   4 -
 .../recipes-devtools/python/python-efl_1.9.0.bb    |   4 +
 .../0001-dbus-stuff-Convert-to-eldbus.patch        | 204 ++++++++
 meta-efl/recipes-efl/e17/e-tasks_git.bb            |   4 +-
 .../0001-remove-another-elm-1.8-requirement.patch  |  25 +
 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb            |  26 -
 .../e17/{e-wm_0.18.3.bb => e-wm_0.18.4.bb}         |   5 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                |   6 +
 meta-efl/recipes-efl/efl/efl.inc                   |  18 +-
 .../recipes-efl/efl/{efl_1.8.5.bb => efl_1.9.0.bb} |   6 +-
 meta-efl/recipes-efl/efl/elementary.inc            |   2 +-
 ...e-elementary_codegen-defined-in-configure.patch |  29 ++
 ...e-elm_prefs_cc-and-elementary_codegen-def.patch |  61 ---
 .../{elementary_1.8.4.bb => elementary_1.9.0.bb}   |   6 +-
 .../recipes-efl/efl/emotion-generic-players.inc    |   4 +-
 ...s_1.8.1.bb => emotion-generic-players_1.9.0.bb} |   4 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |   2 +-
 ...yers_1.8.1.bb => evas-generic-loaders_1.9.0.bb} |   4 +-
 ...bkit-efl_2.3.2+svnr159807.bb => webkit-efl.inc} |  31 +-
 ...lines.h-remove-indexingHeader-preCapacity.patch |  27 -
 ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  25 +-
 ...include-Element.h-for-hasTagName-function.patch |  58 ---
 ...r.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch |  80 +++
 .../webkit/webkit-efl/0003-Fix-linking-issue.patch |  63 +++
 .../recipes-efl/webkit/webkit-efl/bison-2.6.patch  | 558 ---------------------
 .../webkit/webkit-efl/gcc-4.8.2.fix.patch          |  15 -
 .../webkit/webkit-efl_2.3.4+svnr164189.bb          |  12 +
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  35 +-
 29 files changed, 504 insertions(+), 816 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
 rename meta-efl/recipes-efl/e17/{e-wm_0.18.3.bb => e-wm_0.18.4.bb} (68%)
 rename meta-efl/recipes-efl/efl/{efl_1.8.5.bb => efl_1.9.0.bb} (77%)
 create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
 rename meta-efl/recipes-efl/efl/{elementary_1.8.4.bb => elementary_1.9.0.bb} (47%)
 rename meta-efl/recipes-efl/efl/{evas-generic-loaders_1.8.1.bb => emotion-generic-players_1.9.0.bb} (41%)
 rename meta-efl/recipes-efl/efl/{emotion-generic-players_1.8.1.bb => evas-generic-loaders_1.9.0.bb} (41%)
 rename meta-efl/recipes-efl/webkit/{webkit-efl_2.3.2+svnr159807.bb => webkit-efl.inc} (52%)
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/bison-2.6.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb

-- 
1.9.0


