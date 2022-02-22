Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECE1C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:46:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.1048.1645573566317472466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lEE6GoeN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645573564; i=@fujitsu.com;
	bh=pdvoRJOOJfDVEqnlyg+vk7Px+12nuN2apU0/WN5653o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lEE6GoeNdLZaxeJxyHJZuKhEk/a7cSTdfly89x0LXtmxyUAcfgMLOLE3LqZs+Yuqs
	 N/PoBLmRY/qEPCDKW/0U3oE0GTJ168tScUxDOzP1wBltTxEr/2Xf31YDR/KuizsX01
	 7rAgHNbRS3WLk2A2z+jwVacrhAzFlfxxG96CBNw7NCQScr78YiAv+rbJNOiEPsIAj8
	 4KuaGns4NiDgMpUHwFlHC2Ez2smX1SOlUaOeEYQS33QH0PasRdPE/jJdGlBKbjxyYl
	 SQgur9/n9uhk6ngOERDz17W3VNRSBCP0ClDoiEeT3mjiZ/fbaQin3qvyiR2ieZvSFt
	 6MfQg00MLkLiA==
Received: from [100.115.32.10] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 18/C1-29321-CB575126;
 Tue, 22 Feb 2022 23:46:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRorunVDT
  JYNdRDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPVpANMBWsVK2at/87YwPhfuouRi0NIYCaT
  xOLPH5i7GDmBnBOMEid2qoLYbAJqEtNv3WAFsUUE9CWWzt4DVsMsoCLx4ncPO4gtLGAh0XrzA
  guIzSKgKrF48jUwm1fASeLc8w9gNRICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwKyRmzWpjmsDIOwtJyywkLQsYmVYxWicVZaZnlOQmZuboGhoY6Boamuoam+oaWpjoJVbpJuq
  lluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBllKsfKOHYxtq37qHWKU5GBSEuWd6y+a
  JMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV6UQKCdYlJqeWpGWmQMMeJi0BAePkgivSjFQmre4I
  DG3ODMdInWKUVFKnNewBCghAJLIKM2Da4NF2SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwr
  zzQabwZOaVwE1/BbSYCWjxlCwhkMUliQgpqQamROFqofTJsz4UsUncuZTM9vObggXnqSd80xd
  0v2AtUHvi+vv5ghtvlzh/1duVNmU+/5OMddvaFXZvL9TVbcg9I25dYHj4eLIbO3eAnWuPivIv
  MUuGK1/uKt1/KhJtNGvTQk993l+iiTdiM9vt2rab/De5O6klZnVOiKTh6cpgl8vvlt346Wj1+
  eyxBZ+XR67+FiZ86KC9dFJdf+LliRc+C77oY3/W/9fghIQuh0/UBoGAyc93L1qRUMb+ZR+npB
  3bZC25l/eSBKwKRFo1+lakX93EwGOaKuBQJXuIh7850fRJRQ5nufmV/x2RvQtdzBVSHSxcth4
  8LrMwRKxkm8O2dX+nKFw3bw1QNJowT0SJpTgj0VCLuag4EQARhpJkLQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1645573563!62923!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26630 invoked from network); 22 Feb 2022 23:46:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 23:46:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21MNjwlt007217
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:46:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 23:45:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 6.0 -> 6.2
Date: Wed, 23 Feb 2022 07:45:47 +0800
Message-ID: <1645573548-27245-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 23:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95456

Changes between v6.0 and v6.2:
------------------------------
  display: suppress the bottom-bar wiping only when the user is editing
  linter: adjust the parsing to accommodate for a modern 'pyflakes'
  syntaxes: fold a couple of regexes together, and improve a few comments
  tweaks: change the type of a variable, to avoid a compiler warning
  tweaks: consistently backslash-escape the dash in M-letter keystrokes
  tweaks: rename a misnamed variable
  tweaks: rename a variable, reshuffle five lines, and snip two comments
  tweaks: rename a variable, to be more correct, and adjust two comments
  tweaks: rename a variable, to be more fitting
  tweaks: rename two more variables, and drop unneeded initializations
  tweaks: rename two variables (to get rid of a prefix), and elide a third
  tweaks: store a result, to avoid calling a function twice
  tweaks: use an intermediate variable, to avoid using one for two purposes
  build: fix compilation when configured with --enable-tiny
  build: prevent autopoint from overwriting a newer M4 file from gnulib
  copyright: update the last year for significantly changed files
  copyright: update the years for the FSF
  docs: mention bindable function 'zero', for toggling the interface bars
  docs: mention 'set guidestripe' and 'set unix' in the sample nanorc
  docs: remove obsolete Ctrl+Z from the cheatsheet; mention Alt+X instead
  files: let ^C cancel the exiting when the file on disk was changed
  gnulib: update to its current upstream state
  help: make the description of <Tab> more accurate
  help: update the description of M-D, to match the actual order of counts
  input: instead of moving waiting keycodes, just increment a pointer
  input: suppress any spotlighting when there are more keycodes waiting
  menus: don't show M-6 in the help lines of any prompt
  prompt: allow the user to copy the answer to the cutbuffer (with M-6)
  prompt: let ^K erase text after cursor (if any), otherwise whole answer
  tweaks: add some feedback to the autogen.sh script, to ease the wait
  tweaks: add some small, clarifying comments
  tweaks: adjust a translator hint, to fit the order in the POT file
  tweaks: drop foreign M-U and M-R from among the sample CUA bindings
  tweaks: remove a redundant check -- add a different one for symmetry
  tweaks: remove two redundant checks
  tweaks: rename a function and its two parameters, for clarity
  tweaks: rename a function and reshuffle its call
  tweaks: rename a function, to not contain the name of a variable
  tweaks: rename another variable, to better fit in with its sisters
  tweaks: rename a variable and a parameter, to be more descriptive
  tweaks: rename a variable, away from an abbreviation
  tweaks: rename a variable, for clarity and contrast
  tweaks: rename a variable, to make it clearer it refers to a window
  tweaks: rename two variables, and elide a near-enough duplicate
  tweaks: reshuffle some sample bindings, to group them differently
  tweaks: reword two comments, and rename a variable (away from an abbrev)
  tweaks: stop asking the terminal for its new size -- let ncurses do it
  tweaks: use some symbolic names instead of unclear numeric values
  tweaks: when discarding keycodes, don't bother parsing them

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_6.0.bb => nano_6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_6.0.bb => nano_6.2.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_6.0.bb b/meta-oe/recipes-support/nano/nano_6.2.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_6.0.bb
rename to meta-oe/recipes-support/nano/nano_6.2.bb
index 72558644f4..3c73bfbf7d 100644
--- a/meta-oe/recipes-support/nano/nano_6.0.bb
+++ b/meta-oe/recipes-support/nano/nano_6.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "93ac8cb68b4ad10e0aaeb80a2dd15c5bb89eb665a4844f7ad01c67efcb169ea2"
+SRC_URI[sha256sum] = "2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


