Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E8BC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 05:17:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.23777.1641187060958723868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 21:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hVpoq10J;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641187058; i=@fujitsu.com;
	bh=tSHg6Bxh/nWua2fzsCkPY3HcXi640gk/qUEKIiReVUc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hVpoq10J8KRzF8DpMp1/HHq8m50eHxuyl1H8U/Awnq+fUAm+YKK+bVX9IEd+52+PR
	 tCT6NC9pja9tatxaLGK1q/F2BJ9kDkTkFBLRs3KAOcU0wnSLWkHptkRWRU5B7LjPS0
	 x6HNkdZurLaPwniJt0mJuuGarf7eBtP2Z8atJGO5zyF0NJxaU84fW1KC242h75Onw9
	 Aip30rPxqbw2/hVHIGjJl/hpRx2iWte//n01hM9Iogrj+YugYK4sBUc/E02UXZ1dnx
	 nLYFAdNGvRBji/qgUfYvgBGHMdTXiOtb2W2dmY42oD6kMlUx0mGDp8WA9QqeofZwhQ
	 P42RfXefWOwLw==
Received: from [100.115.35.72] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id E7/5C-27579-2F682D16;
 Mon, 03 Jan 2022 05:17:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MxRfd926V
  Egx/bLC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owtJw+yFvRpVXT2pDQw7lbtYuTiEBKYwSSx
  +uo7RgjnOKPEui2v2bsYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHrEZYwFli5+1tY
  HEWoPiyE0cYQWxeASeJ/jUTwXolBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3MwCYV
  dIzJrVxjSBkXcWkpZZSFoWMDKtYrROKspMzyjJTczM0TU0MNA1NDTVNTbSNbSw1Eus0k3USy3
  VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAyylGKFvTsYL6/8qXeIUZKDSUmUt1LpYqIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4jTZcShQSLUtNTK9Iyc4ABD5OW4OBREuHd0gqU5i0uS
  MwtzkyHSJ1i1OW4fH3eImYhlrz8vFQpcd63IEUCIEUZpXlwI2DRd4lRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMG8ryBSezLwSuE2vgI5gAjqCV+s8yBEliQgpqQamwAWrs7e65pfuTwxl8JW
  JfmjH9EPPO9zcbeVNjcXuck3qK/c8TnpR7Sp/vfj1xOiKTVIZ/zo/PclyvnhXlSPpfKx/UdqP
  FU43j1nMPnz9wmfD3YtM5ye7ebb1KYQnTNugceaDD4vcJ53K0x8XXXjI9Me11q92x+HCwhvHG
  Bq3lrAW5j+3D1gRuDTz6cwnvyTm7wrd3RPIkHFzswyz1+XOyseKb4KZJSfqNt5hdHkTMP1Mk9
  lvrztdZVez9k7ovuLIPPeNxMxL7FF75kZp3PpRxuPFmv/MRjvrV9vfoumqmnditxXuEPuuznb
  zRuSafTHqgsdX7A9IlHrVnT6XWzuc/UxO43GnI9LP+nt2Zk9SYinOSDTUYi4qTgQAszWdGjkD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1641187055!534896!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31604 invoked from network); 3 Jan 2022 05:17:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 05:17:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2035HUkm025039
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jan 2022 05:17:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 05:17:28 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 3.0 -> 3.4
Date: Mon, 3 Jan 2022 13:17:14 +0800
Message-ID: <1641187036-41392-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jan 2022 05:17:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94646

refresh 0001-use-pkg-config-for-gcrypt-instead.patch

License-Update:
Url changed
from "https://www.gnu.org/philosophy/why-not-lgpl.html"
to "https://www.gnu.org/licenses/why-not-lgpl.html"

Changelog:
=========
New features
----------------
core: add support of static arrays in hdata
core: add command /toggle
api: add parameters pointers, extra_vars and options in function hdata_search
api: add user variables in evaluation of expressions with "define:name,value"
api: add IRC message parameters "param1" to "paramN" and "num_params" in output of irc_message_parse
irc: allow quotes around IRC message in command /server fakerecv
trigger: hide key and password in command "/msg nickserv setpass nick key password"
trigger: add support of option "-server" when hiding passwords in command /msg nickserv register

Bug fixes
---------------
core: fix memory leak in evaluated expression "split:number,seps,flags,xxx" when multiple "strip_items" are given
core: fix random integer number with large range in evaluation of expressions on GNU/Hurd
core: fix access to integer/long/time arrays in hdata
api: fix search of option when the section is not given in functions config_search_option and config_search_section_option
irc: fix join of channels with long name (issue #1717)
irc: fix parsing of parameters in all IRC messages (issue #1666)
irc: fix parsing of CAP message when there is no prefix (issue #1707)
irc: fix parsing of TAGMSG message when there is a colon before the channel

Documentation
---------------
doc: remove tester's guide
doc: add dark theme (automatic, following browser/desktop settings)
doc: make build reproducible
doc: disable web fonts
doc: switch from prettify to pygments for syntax highlighting

Tests
--------------
core: add build with CMake and Ninja in CI
core: add build on macOS 11 in CI

Build
------------
ruby: add detection of Ruby 3.0 (issue #1721, issue #1605)
core: add targets "changelog" and "rn" to build HTML version of ChangeLog and release notes (CMake build only)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-use-pkg-config-for-gcrypt-instead.patch   | 14 +++++++-------
 .../weechat/{weechat_3.0.bb => weechat_3.4.bb}     |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-irc/weechat/{weechat_3.0.bb => weechat_3.4.bb} (87%)

diff --git a/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch b/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
index 0717e9654..4a33dd720 100644
--- a/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
+++ b/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
@@ -28,10 +28,10 @@ Index: weechat-2.7.1/cmake/FindGCRYPT.cmake
  
  if(LIBGCRYPT_CONFIG_EXECUTABLE)
  
--   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS --libs RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS)
--   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS --cflags RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS)
-+   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS libgcrypt --libs RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS)
-+   exec_program(${LIBGCRYPT_CONFIG_EXECUTABLE} ARGS libgcrypt --cflags RETURN_VALUE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS)
- 
-    if(${GCRYPT_CFLAGS} MATCHES "\n")
-       set(GCRYPT_CFLAGS " ")
+-  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} --libs RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
+-  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} --cflags RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
++  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} libgcrypt --libs RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
++  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} libgcrypt --cflags RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
+
+   if(NOT DEFINED ${GCRYPT_CFLAGS})
+     set(GCRYPT_CFLAGS " ")
diff --git a/meta-networking/recipes-irc/weechat/weechat_3.0.bb b/meta-networking/recipes-irc/weechat/weechat_3.4.bb
similarity index 87%
rename from meta-networking/recipes-irc/weechat/weechat_3.0.bb
rename to meta-networking/recipes-irc/weechat/weechat_3.4.bb
index 9f7e39297..ca404ebc8 100644
--- a/meta-networking/recipes-irc/weechat/weechat_3.0.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_3.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Full-featured IRC plugin: multi-servers, proxy support, IPv6, SASL au
 HOMEPAE = "https://weechat.org/"
 SECTION = "net"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "openssl zlib icu libgcrypt gnutls curl aspell"
 
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "6cb7d25a363b66b835f1b9f29f3580d6f09ac7d38505b46a62c178b618d9f1fb"
+SRC_URI[sha256sum] = "7cd3dcc7029e888de49e13ebbcc3749586ff59c9d97f89f5eeb611067c7bb94c"
 
 inherit cmake pkgconfig
 
-- 
2.25.1


