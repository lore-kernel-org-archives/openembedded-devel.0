Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D7DD5606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:27 +0000 (UTC)
Received: by wijp15 with SMTP id p15so59334118wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5/96XG1xx7Ir734NGaceX5epdvk0JRt0u2E6OhSHqfU=;
	b=dcA3XDPGyZM6t2NJVX1V3REG/TfuaM4dqIj04AIDENMMeYvbTD8+9D2ReSPL+xr63D
	WIJZoMsh2vLM+GB10G5Ow2cDCmnMx+rOuOqagHUPeXsYpch707FdAkIU585G+UN7tvas
	pqwX04143n9oygGQP9sbUvw06YXmxdltX0tRowkZS4ymgW5uiwZ2gPDQvqJqhuwrca0u
	8eTZvhr0+wzoGVsKlgT31n/BvS2iNLzl78oD1NBdB6HIEgmVDaeTeGWC2krZLnnv79I5
	dHG6C0GEzEGKbg4BwKLr0otHILPBhKK8NeLOHhzPVNLie1HyOVOq3h1+kZgEKNBfL70/
	aSuA==
X-Received: by 10.194.58.199 with SMTP id t7mr21570769wjq.45.1439754387599;
	Sun, 16 Aug 2015 12:46:27 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:26 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:15 +0200
Message-Id: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 0/8] firefox: fixes and update to 10.0.12esr
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
X-List-Received-Date: Sun, 16 Aug 2015 19:46:32 -0000

This patchset addresses issues discussed in the following thread:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-June/101954.html

- ftp server no longer exists, moves to proposed mozilla server
- fixes two issues of SIGILL seen im my Cortex-A9 setup
- updates to 10.0.12esr

Max Krummenacher (8):
  firefox: Update download server
  firefox-l10n: Update download server
  firefox: prevent SIGILL crash with arm build
  firefox: prevent SIGILL crash #2 with arm build
  firefox: stop using variable for local files
  mozilla.bbclass: do out of tree build
  firefox: Update to 10.0.12esr
  firefox-l10n: Update all languages for 10.0.12esr release

 classes/mozilla.bbclass                            |   2 +-
 recipes-mozilla/firefox-l10n/README                |  33 +++++
 .../firefox-l10n/firefox-l10n-af_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-af_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ak_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ak_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ar_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ar_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-as_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-as_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ast_10.0.11esr.bb    |   7 -
 .../firefox-l10n/firefox-l10n-ast_10.0.12esr.bb    |   7 +
 .../firefox-l10n/firefox-l10n-be_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-be_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-bg_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-bg_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-br_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-br_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-bs_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-bs_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ca_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ca_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-cs_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-cs_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-csb_10.0.11esr.bb    |   7 -
 .../firefox-l10n/firefox-l10n-csb_10.0.12esr.bb    |   7 +
 .../firefox-l10n/firefox-l10n-cy_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-cy_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-da_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-da_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-de_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-de_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-el_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-el_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-eo_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-eo_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-et_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-et_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-eu_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-eu_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-fa_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-fa_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-fi_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-fi_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-fr_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-fr_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-gd_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-gd_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-gl_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-gl_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-he_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-he_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-hr_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-hr_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-hu_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-hu_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-id_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-id_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-is_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-is_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-it_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-it_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ja_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ja_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-kk_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-kk_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-kn_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-kn_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ko_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ko_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ku_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ku_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-lg_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-lg_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-lt_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-lt_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-lv_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-lv_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-mai_10.0.11esr.bb    |   7 -
 .../firefox-l10n/firefox-l10n-mai_10.0.12esr.bb    |   7 +
 .../firefox-l10n/firefox-l10n-mk_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-mk_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ml_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ml_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-mr_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-mr_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-nl_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-nl_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-nso_10.0.11esr.bb    |   7 -
 .../firefox-l10n/firefox-l10n-nso_10.0.12esr.bb    |   7 +
 .../firefox-l10n/firefox-l10n-or_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-or_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-pl_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-pl_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-rm_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-rm_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ro_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ro_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-ru_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ru_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-si_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-si_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-sk_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-sk_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-sl_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-sl_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-son_10.0.11esr.bb    |   7 -
 .../firefox-l10n/firefox-l10n-son_10.0.12esr.bb    |   7 +
 .../firefox-l10n/firefox-l10n-sq_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-sq_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-sr_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-sr_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-ta_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-ta_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-te_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-te_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-th_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-th_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-tr_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-tr_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-uk_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-uk_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-vi_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-vi_10.0.12esr.bb     |   7 +
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb  |   7 -
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb  |   7 +
 .../firefox-l10n/firefox-l10n-zu_10.0.11esr.bb     |   7 -
 .../firefox-l10n/firefox-l10n-zu_10.0.12esr.bb     |   7 +
 recipes-mozilla/firefox-l10n/firefox-l10n.inc      |   2 +-
 ...n-ARMv6-builds-built-with-the-NDK_10.0esr.patch |  89 ++++++++++++
 recipes-mozilla/firefox/firefox/alignment.patch    |  17 +++
 recipes-mozilla/firefox/firefox_10.0.11esr.bb      | 154 --------------------
 recipes-mozilla/firefox/firefox_10.0.12esr.bb      | 156 +++++++++++++++++++++
 177 files changed, 892 insertions(+), 751 deletions(-)
 create mode 100755 recipes-mozilla/firefox-l10n/README
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch
 create mode 100644 recipes-mozilla/firefox/firefox/alignment.patch
 delete mode 100644 recipes-mozilla/firefox/firefox_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox/firefox_10.0.12esr.bb

-- 
1.8.4.5


