Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9C6C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 09:19:30 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.29022.1632734369472152718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 02:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DB2zRDrC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632734367; i=@fujitsu.com;
	bh=oGsNDd7093iVd6NQ2IXi0ZGDimrRyfzLcLs/zaozFyA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DB2zRDrCk1FYBAz1hge5qvZg3TaKYlJ1aJwUDTnfcdx5NIB+H86OSaA50Qdr/bfeq
	 4t0MIAZwF3yV6TozTnSB8ucVY9XCOikKNu/KSxI23WU8SnpQLroIGMjMefqlj7YR0h
	 +jN5L3Rx94PKkTyEbx/i0HNMQ1PBq90CNm8DmohpdaHdZO+k0qXBeP9tvSUShVnfjm
	 hDVkZ5dgHM64F6KHfp0x0YBmSzUEqi7Lz8w19O4DKOvANSMC7UPAwrjOEwvkDeOQAQ
	 3Z9TBaHbq/t2ODfy8pXh0JVID70FrWuFToeECMTvRTxCXfGDOY0qGRpa9THon94i6H
	 jcruKghezWBpw==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id F7/51-08194-F9C81516;
 Mon, 27 Sep 2021 09:19:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqjuvJzD
  RYM9NfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNaC1fBeomK491L2BoY20W7GDk5hARmM0mc
  nqjUxcgFZO9hlPh+aQ4LSIJNQFfi3OO17CC2iIC+xNLZe5hBbGEBD4mLl56DxVkEVCV2zO4Fq
  +cFivf+/MoKYksIKEhMefieGSIuKHFy5hOwGmYBCYmDL14AxTmAahQlZk+XhyivkHh9+BLzBE
  aeWUg6ZiHpWMDItIrRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0ljXyNhEL7FKN1EvtVS3PLW4RNd
  QL7G8WK+4Mjc5J0UvL7VkEyMwhFIKDr7awbjyzQe9Q4ySHExKoryCSYGJQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR49bqAcoJFqempFWmZOcBwhklLcPAoifDWtwOleYsLEnOLM9MhUqcYFaXEe
  XW6gRICIImM0jy4NlgMXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGsEsp0nM68EbvoroM
  VMQItrJwWALC5JREhJNTCx5dgxCLnPF91sP9nCgyPiDJ/8n8BnvTs/1/NI5KYuKTnv0qNgG2Z
  yNPJao4I+n9y55VYrD36/8eR2QuVXxkf7eosk7VV9Ni/n0pb9fOy4jjavt0ZA1JnP/9R/uYSv
  4dBQ/732eKFDhErZoX/eEUzWyfM/Oa9a9cfo+4nWCiljrdbvdStOJTlKBtyQuMbl4Lhx3erlk
  UnbPbh6kz4Ke828X8uT/KpfQP7RohsLb3wznOsVGRGSKjXjVU9s7JHp3ubHFy7afSR823v2WL
  YF2W+COJdkvPpcsnj2pdDPRde+XlnuLHeA5dsXxQm3d6Vvmfv2uONFwcudSucurlYr2ZfBscH
  hpq1I0Zbyf6Flac1KLMUZiYZazEXFiQA4zVL+HAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1632734366!358358!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30886 invoked from network); 27 Sep 2021 09:19:26 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 09:19:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R9JLAN006342
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:19:26 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 10:19:19 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cmd2: upgrade 2.1.2 -> 2.2.0
Date: Tue, 28 Sep 2021 02:18:58 +0800
Message-ID: <1632766738-92325-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 09:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93139

* Bug Fixes
  * Fixed extra space appended to each alias by "alias list" command
* Enhancements
  * New function `set_default_ap_completer_type()` allows developer to extend and modify the
    behavior of `ArgparseCompleter`.
  * Added `ArgumentParser.get_ap_completer_type()` and `ArgumentParser.set_ap_completer_type()`. These
    methods allow developers to enable custom tab completion behavior for a given parser by using a custom
    `ArgparseCompleter`-based class.
  * Added `ap_completer_type` keyword arg to `Cmd2ArgumentParser.__init__()` which saves a call
    to `set_ap_completer_type()`. This keyword will also work with `add_parser()` when creating subcommands
    if the base command's parser is a `Cmd2ArgumentParser`.
  * New function `register_argparse_argument_parameter()` allows developers to specify custom
    parameters to be passed to the argparse parser's `add_argument()` method. These parameters will
    become accessible in the resulting argparse Action object when modifying `ArgparseCompleter` behavior.
  * Using `SimpleTable` in the output for the following commands to improve appearance.
    * help
    * set (command and tab completion of Settables)
    * alias tab completion
    * macro tab completion
  * Tab completion of `CompletionItems` now includes divider row comprised of `Cmd.ruler` character.
  * Removed `--verbose` flag from set command since descriptions always show now.
  * All cmd2 built-in commands now populate `self.last_result`.
  * Argparse tab completer will complete remaining flag names if there are no more positionals to complete.
  * Updated `async_alert()` to account for `self.prompt` not matching Readline's current prompt.
* Deletions (potentially breaking changes)
  * Deleted ``set_choices_provider()`` and ``set_completer()`` which were deprecated in 2.1.2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-cmd2_2.1.2.bb => python3-cmd2_2.2.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.1.2.bb => python3-cmd2_2.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.1.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.2.0.bb
index 874e7cf0c1..2632ce1c80 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c527bcb481233ebcb803de975f42701"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "25dbb2e9847aaa686a8a21e84e3d101db8b79f5cb992e044fc54210ab8c0ad41"
+SRC_URI[sha256sum] = "34cd12424d9e2835eff125146af3d9f4a4c2931c6bc5a3cea9790bd4f55756d9"
 
 inherit pypi setuptools3
 
@@ -17,6 +17,7 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-pydoc \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


