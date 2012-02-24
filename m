Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S14nc-0005K7-AU
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 00:43:40 +0100
Received: by eekd41 with SMTP id d41so1362460eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 15:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.98.73 as permitted sender)
	client-ip=10.14.98.73; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.98.73 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.98.73])
	by 10.14.98.73 with SMTP id u49mr2674172eef.35.1330126517527 (num_hops
	= 1); Fri, 24 Feb 2012 15:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=aNKzCvydeEvtQOOk5mO4aV4Tcj8cRX2lB2KcgBne6cM=;
	b=npzVXXkiCLxcMXA3kY1Rg8qiB3EtxPMxgCPMDvco7lIYR8TlJbXjQk9k0uAbVdqzSM
	u43CCxR8pZIe2EgkSStKtuu44UAN5uEcQQEAmrRROJlihtwZv+m3gxrIc8bT5tvCUYo0
	6/Lci9Jj+8aom6ltv7Ov8B8wzXdf4OUOiIii8=
Received: by 10.14.98.73 with SMTP id u49mr1982862eef.35.1330126516124;
	Fri, 24 Feb 2012 15:35:16 -0800 (PST)
Received: from localhost.localdomain (p5B0A1464.dip.t-dialin.net.
	[91.10.20.100])
	by mx.google.com with ESMTPS id u11sm16588122eeb.1.2012.02.24.15.35.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 15:35:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Feb 2012 00:38:15 +0100
Message-Id: <1330126696-4716-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-mozilla, v2 2/3] firefox: change URI to fetchable ftp / bump to 10.0.2
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
X-List-Received-Date: Fri, 24 Feb 2012 23:43:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

build tested from scratch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../firefox-l10n/firefox-l10n-af_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-af_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ak_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ak_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ar_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ar_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-as_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-as_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ast_10.0.1.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-ast_10.0.2.bb        |    9 +++++++++
 .../firefox-l10n/firefox-l10n-be_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-be_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bg_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-bg_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bn-in_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-bn-in_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-br_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-br_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bs_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-bs_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ca_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ca_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-cs_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-cs_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-csb_10.0.1.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-csb_10.0.2.bb        |    9 +++++++++
 .../firefox-l10n/firefox-l10n-cy_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-cy_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-da_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-da_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-de_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-de_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-el_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-el_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-en-gb_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-en-gb_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-en-us_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-en-us_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-en-za_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-en-za_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-eo_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-eo_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-ar_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-ar_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-cl_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-cl_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-es_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-es_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-mx_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-mx_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-et_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-et_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-eu_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-eu_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fa_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fa_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fi_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fi_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fr_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fr_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gd_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-gd_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gl_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-gl_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gu-in_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-gu-in_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-he_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-he_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hi-in_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-hi-in_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hr_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-hr_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hu_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-hu_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hy-am_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-hy-am_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-id_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-id_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-is_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-is_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-it_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-it_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ja_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ja_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-kk_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-kk_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-kn_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-kn_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ko_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ko_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ku_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ku_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-lg_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-lg_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-lt_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-lt_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-lv_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-lv_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-mai_10.0.1.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-mai_10.0.2.bb        |    9 +++++++++
 .../firefox-l10n/firefox-l10n-mk_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-mk_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ml_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ml_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-mr_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-mr_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nb-no_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-nb-no_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nl_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-nl_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nn-no_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-nn-no_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nso_10.0.1.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-nso_10.0.2.bb        |    9 +++++++++
 .../firefox-l10n/firefox-l10n-or_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-or_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pa-in_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-pa-in_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pl_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-pl_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pt-br_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-pt-br_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-rm_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-rm_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ro_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ro_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ru_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ru_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-si_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-si_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sk_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sk_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sl_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sl_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-son_10.0.1.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-son_10.0.2.bb        |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sq_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sq_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sr_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sr_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sv-se_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-sv-se_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ta_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ta_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-te_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-te_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-th_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-th_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-tr_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-tr_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-uk_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-uk_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-vi_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-vi_10.0.2.bb         |    9 +++++++++
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.1.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb      |    9 +++++++++
 .../firefox-l10n/firefox-l10n-zu_10.0.1.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-zu_10.0.2.bb         |    9 +++++++++
 .../{firefox_10.0.1.bb => firefox_10.0.2.bb}       |    6 +++---
 171 files changed, 768 insertions(+), 768 deletions(-)
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.1.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb
 rename recipes-mozilla/firefox/{firefox_10.0.1.bb => firefox_10.0.2.bb} (95%)

diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.1.bb
deleted file mode 100644
index 60448d7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "2e437797a42fb4ea84750ac131618203"
-SRC_URI[sha256sum] = "987d4b6d9de72122136b6022ea5fc02956c2dc59a7718cee4f06b43a3e8c39f0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb
new file mode 100644
index 0000000..00178ae
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "7f4701eb3a8a1e62e78f47eadbf9a91a"
+SRC_URI[sha256sum] = "daa87573d904a63438398e6a974848b8c1fed735f4daaeb08ccd3f8c6a36c93b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.1.bb
deleted file mode 100644
index 747689e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "a593b37ed001fcff4e4af576ec006727"
-SRC_URI[sha256sum] = "c79ac0a55a0d6e627ecd7bcece7aa6e5260565ebedf33d404b7f91370f544828"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb
new file mode 100644
index 0000000..2c5355d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "05f2f4087edc60cf5568ebc012eeb151"
+SRC_URI[sha256sum] = "0010843264a6eb9b45a1b7bc26b202bebf77d1684de0babc3740cf399bce1799"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.1.bb
deleted file mode 100644
index ce4d7b8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3d90a674a953a333fc3eb4eac49fdc20"
-SRC_URI[sha256sum] = "2e2e90ce071d8a00db1b645e77d5448468117ddd1ec21f326a1004c71617b63a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb
new file mode 100644
index 0000000..42a5d14
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "51b177d9ec096b5dd17966b28348846b"
+SRC_URI[sha256sum] = "7b6fa8c4ff34c25149992c7ab9bc469198aa92598c6cc42554ca6f91bb75dfa3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.1.bb
deleted file mode 100644
index 2cdffa7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "f3adbd10e4e2f1092ff005d2b7d699df"
-SRC_URI[sha256sum] = "187eaef870790ff25d2e7a5f676f612989d141309553fb884dbcb99279988457"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb
new file mode 100644
index 0000000..7de6857
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "65d168befac8473619536e9929e1ee2d"
+SRC_URI[sha256sum] = "20da82bf879a19302a21ed599c5fab070f556473a37a4003c1401c66b1b35d6e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.1.bb
deleted file mode 100644
index 970dbec..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "ce86ea08545a75a2c8f40722357a9b2d"
-SRC_URI[sha256sum] = "bd9b5c0b26936133fb9a53168a53a16389db9c760c7fe834927d88b20aa18cec"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb
new file mode 100644
index 0000000..78cc024
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6eb7708684954fe6ff768852ee00aafb"
+SRC_URI[sha256sum] = "74aa3898790162e8b5d64a477683155e5fb3e5c93de04613125ea0152876e2e0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.1.bb
deleted file mode 100644
index c96331f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "dee12dd1499ca5b14cb8f1518b007a8d"
-SRC_URI[sha256sum] = "abe57b3712ac59f7585c55f899dd068e98bcba7a87c32765939ad54f76afe1cd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb
new file mode 100644
index 0000000..288f680
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4f2967d89a5a944a48685d88717dc125"
+SRC_URI[sha256sum] = "34705c150939fa8e80d096209ec358c3cb149dabedf4fdb6fe04b1fd2bfc3c77"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.1.bb
deleted file mode 100644
index f3701cf..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "0d524127e08f07bd0be5b0099cc1c45f"
-SRC_URI[sha256sum] = "d9af0b048996b5afd0dba779221abd89c5561b43e631ee87aea21a5f736492fa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb
new file mode 100644
index 0000000..39c2bc2
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "10e4703183c43a9d498826676c667a35"
+SRC_URI[sha256sum] = "41fdaa5bbde164b7b5d46f1c9274869fddcdd07f204bc986246c9224591463d1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.1.bb
deleted file mode 100644
index 76c02bb..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "b9ba6ffda7de6d9e494abb33ca73910a"
-SRC_URI[sha256sum] = "56e155204142cf07ba36d6cf3dc15db0b2c466ecd066ee35b452ed206a67fde6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb
new file mode 100644
index 0000000..7b0e324
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "abb0655ddb3f14cda06b54d7305accb5"
+SRC_URI[sha256sum] = "a1c447856394e01d5251192d4f29d0f7e9aac49c043ad1e5b4007903e766ff26"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.1.bb
deleted file mode 100644
index ae67332..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "7ad916e6dfc6e167e0c3598708c2c768"
-SRC_URI[sha256sum] = "da7c3aa7550f5c788948f2db9c1f6e4167202a25c873722a2b322c88a5904410"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb
new file mode 100644
index 0000000..b60dafc
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1ee1656e08c7cfc4b237343a11dae0d8"
+SRC_URI[sha256sum] = "330fe9a49e28b8a183bbd9d9e7d9d9cee2da654b2995bce3579312eee0da299c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.1.bb
deleted file mode 100644
index dae6d6a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "ad168d792fa899ccd4a72fe3778f3504"
-SRC_URI[sha256sum] = "9093e623b00213f0af54e3beed43920573cb59f808e9a049269eb0eba56a1a69"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb
new file mode 100644
index 0000000..8c98c79
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "fea37a88ac67ea3cb7db2a6b44bdcff5"
+SRC_URI[sha256sum] = "57b3195bd05b2c48eae3117b957f448c0cc8810b8c89ced9f690184f889656b1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.1.bb
deleted file mode 100644
index ed557fc..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "f458afdf49ba8c589bfd37a26915d5b7"
-SRC_URI[sha256sum] = "bdb438d24cabbf93c0789a4ec6665c9ee9893e81ce5aa64a993911ac6bd52abd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb
new file mode 100644
index 0000000..21d7d79
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ceb884c8969b5be251727f831b1fc3bf"
+SRC_URI[sha256sum] = "529c0973398e5f2202d40f90f3970587090397a6a3da294d3024bde8fe490383"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.1.bb
deleted file mode 100644
index d2acfb4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "48727c92bb723648ee60959351f6fbac"
-SRC_URI[sha256sum] = "9688cef04c511e503a497dc3dadf3ccda7f900c1b37d30dce7436ce128c56687"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb
new file mode 100644
index 0000000..fd2d62b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b100190d7a0a40b24236e99b031d63d6"
+SRC_URI[sha256sum] = "fd0823787e2517ef868a732956651a578b92ded60e3608c2474a776677578590"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.1.bb
deleted file mode 100644
index b53a78d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "1b45cb2adbb4f819f425c5909953d9de"
-SRC_URI[sha256sum] = "1bb457dde47871c46d795071d4a63962b83420db1555c5e3f53cba2027e00bf6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb
new file mode 100644
index 0000000..ae51aa5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ccdaf566315bb4d8108b0c400bf5b28d"
+SRC_URI[sha256sum] = "cdce3a6a1b8c2723ca748da738fd803a0130f13285009197b7f5e65b935fbd31"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.1.bb
deleted file mode 100644
index 6d39be1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "acef9754ce127085009687dc7febeb6d"
-SRC_URI[sha256sum] = "8908161f3c1dace3cbf54be15f75075bc4dd9cd3a17d939069805837581a22c6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb
new file mode 100644
index 0000000..d1471d4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "da702ed829874be13c2ab19b98764fe1"
+SRC_URI[sha256sum] = "9979c3870009dd16cec07c6c0c4ae328897aa465bc1a22a85f35b69150749e68"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.1.bb
deleted file mode 100644
index c37f526..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "12736ef82c8f829f25fa6c107ca21964"
-SRC_URI[sha256sum] = "1bdbf6ac9cb4733a6168d49d3b023e339728c847e9b7db394f8cdb0301a80865"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb
new file mode 100644
index 0000000..dd6abd1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b44b249224b023cb20cf7b787a70de4a"
+SRC_URI[sha256sum] = "46e2a3c5999e860a701795cd9f007f23ee85d172089443771993cc3f749fdc9b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.1.bb
deleted file mode 100644
index 15aaeff..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "4d51a470ba37ac63e2845d98f0810275"
-SRC_URI[sha256sum] = "1453441467a5991cdc33ec56194d801554c69b87eaf677225a79020d59cdaf1f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb
new file mode 100644
index 0000000..7813d33
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1adc9f41248a12f4e2e081fda0c81577"
+SRC_URI[sha256sum] = "9744fc961c9185c9c5585f563aa8075767ad3cfb7be310c6c48bcaec6538a3f5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.1.bb
deleted file mode 100644
index 5c14fb9..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "0f7ed48fee343b0c2eea60069714f1d9"
-SRC_URI[sha256sum] = "011a764ff081f3e6a4a44ddba104cc10680b3c37429c629f952ec702b3aa8424"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb
new file mode 100644
index 0000000..c7211c0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "e3cc6de453da650747e89fe222c7d236"
+SRC_URI[sha256sum] = "9c691c1733ef5a500f37e87b11fab6852e9bc1c0da6c6252e4e9f01e6c0ca7ac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.1.bb
deleted file mode 100644
index 284a344..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "2ce49520306a1db907af13c503a95e02"
-SRC_URI[sha256sum] = "c9a3aad5bb766f1112b433f9920ac0b8a2042b2c52817cbf23ac3eeac9e81d33"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb
new file mode 100644
index 0000000..9e7de2f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4b978b67f7e0259e22cc2b163c8ed044"
+SRC_URI[sha256sum] = "4e91ab483fa6d62c7e2aeaa418549954695ecc01c674893c90faa4803355f541"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.1.bb
deleted file mode 100644
index 0375d30..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "49a002195c26ebf44a318e8e3c359c2f"
-SRC_URI[sha256sum] = "8200d464f56f5edd6ccbf6e81620b9a444082f55b72c23382793501c31be8ab7"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb
new file mode 100644
index 0000000..88f4022
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "857009a7d9c60faf676bb42b09d4fbe5"
+SRC_URI[sha256sum] = "d2055988dd8d93d849dc2e4f6933f0d31cf025377d29d9a8a4bd7a32d8b06075"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.1.bb
deleted file mode 100644
index d436b38..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "e8726d2e25da05a270c76085f69a2193"
-SRC_URI[sha256sum] = "8dd183606ec2b69637da513a2e2e5291ce3621d38d23e1dd417df412ad861a0a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb
new file mode 100644
index 0000000..818d331
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a0cf04d0a4d808bfc20427395c110214"
+SRC_URI[sha256sum] = "5ea221d3945ce36df401d76338b809168739646c699dbc08dc77714aa7c3ac80"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.1.bb
deleted file mode 100644
index 2934df4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "22a131aa7101bf03ea961d4645820d64"
-SRC_URI[sha256sum] = "bf2fc42e2ce825c191b1daf45b045c3c74b7e4b1f4d91794370dc4f7b21b88d4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb
new file mode 100644
index 0000000..c82688f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "56644b8637d12ebbb465baefee45cdb0"
+SRC_URI[sha256sum] = "e64bee6d33633bb79111b1b3e5196adaf6dbb7c525c51146e17cef7b348f2ab5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.1.bb
deleted file mode 100644
index 7ec631c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "19c1f78f14e6bb152022ab48700f82d9"
-SRC_URI[sha256sum] = "dcd2bb4b442b20aa29e7672c76b14186f576cc785cc36f695a82741c687fdb01"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb
new file mode 100644
index 0000000..50afb6c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "95053c7f6f40caa4b63abfe5f42e3ae0"
+SRC_URI[sha256sum] = "2492cfcfa007f3c8a42a5f528b8db6a222473fb73d683e471daa7b34763e41fc"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.1.bb
deleted file mode 100644
index bc99b60..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "a09907dfcecd6ec3d703245d3ac22b56"
-SRC_URI[sha256sum] = "1eaa96672473ea0805faea4c2111c38d9e61d637b89068ef05f4577b1a3a752a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb
new file mode 100644
index 0000000..844836c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "bd7ae99d5cdf6773c44b04fe35df7e99"
+SRC_URI[sha256sum] = "115e15a7a05d8b5e10eac83d805120023eedbe222354f94ec4f22957649f076b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.1.bb
deleted file mode 100644
index 5c32423..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "fbf639e37fdfe1f33d69f6f2a7b46af0"
-SRC_URI[sha256sum] = "5593268f5c528941d639ed7e6caec84bd7439e00838b2f8d7951277d311d7b4a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb
new file mode 100644
index 0000000..ca1bf41
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "01669b3b8b1c6a197b65dd411fae6911"
+SRC_URI[sha256sum] = "1feab4d72b4dc178f6c96c13eefef8f60f8c8eddc7312d887c06cc0332b8ff78"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.1.bb
deleted file mode 100644
index 3bf5721..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "d78f80d9f8774e72205c785ca30cc70f"
-SRC_URI[sha256sum] = "09b19ba4a7c3d84d2d8016a3d5b5447800bf5e5714b4a07ef46a27307339bac8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb
new file mode 100644
index 0000000..7b7e1b9
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "d9b4ca176968c3cdf5ee9388505dd657"
+SRC_URI[sha256sum] = "b7375eca052c9d9b18a785cb36ed6e589c38420bfd1949df4cf6e8461bbf2490"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.1.bb
deleted file mode 100644
index ded6106..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "8e685d3ad253ed013b95b1fdcf094ac4"
-SRC_URI[sha256sum] = "127b23931398cde56990204e0d62e6e5b91bf30e82d978c10b598e7eed7e666c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb
new file mode 100644
index 0000000..c715cae
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a06b8bbe3d57474a6e8bbee7fc8eb054"
+SRC_URI[sha256sum] = "2f4035c80b7c2b5d8085d3a2a33e7e2e60e064843676b9571d3ed1f358bfeb7c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.1.bb
deleted file mode 100644
index 8511f36..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "e17680cc913886f87cd58f052d2a2956"
-SRC_URI[sha256sum] = "f2e1121cbee28b8f279ce06ae1018f8eeab6a99ee8a8b3393ff71a3f9ed20474"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb
new file mode 100644
index 0000000..d9e3200
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0091992f96645d70bec6689e6b416410"
+SRC_URI[sha256sum] = "f34b86859b2f39265c06d1709e2699a820e37835ff811cdf3049d9d097ff9618"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.1.bb
deleted file mode 100644
index 1f22119..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "40e67c1bbb8f398f7a3bb88f9a7ddefe"
-SRC_URI[sha256sum] = "4ffb6a1416c9aa1f1f1c32987781c2949f520976c31848f65d340a4304409442"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb
new file mode 100644
index 0000000..bb5f176
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "87a52ae34c6addc4ac96db55c63d3cfd"
+SRC_URI[sha256sum] = "cd1bf9c1e62694a1490ae4b46528aace88fd523f9f8cd51c219fab8d6cd2f81b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.1.bb
deleted file mode 100644
index 4346dad..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "9810f80352ad8d07d615510ad93c7fa2"
-SRC_URI[sha256sum] = "8d5a3ccbba009f415036abcd81165afb744548ec5bb2bc1cefd72be1e0caf0f5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb
new file mode 100644
index 0000000..0743221
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1b1d887356c414a31e295e043d75a5ae"
+SRC_URI[sha256sum] = "b5a2e077af5549fd4fcedea0d86beeb55d2badf806048eb4df83dd74e999df9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.1.bb
deleted file mode 100644
index a05b3fe..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "16cd02867207fa6da075c3853dfc5051"
-SRC_URI[sha256sum] = "14741b89eb28ea486b4d57bc0e7ad348039a469b4e7ca40b98f1f83f1b6c0b75"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb
new file mode 100644
index 0000000..5eee02d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4993448d3a7d41ebc44aeb54ac16c8d8"
+SRC_URI[sha256sum] = "e7dbdb40a6d8129bce25d65c213c0a1212ff7a092e44a7a74f241a206d8d3633"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.1.bb
deleted file mode 100644
index 8319006..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "59e0b08e13cd121c0ef98250a9de177d"
-SRC_URI[sha256sum] = "e4cf1401a5ff7f5f838862913e02b51c38157d7456d940d346997542e97ae0eb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb
new file mode 100644
index 0000000..9dbdadd
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "e99926ae86964cca90686e8bd26ea243"
+SRC_URI[sha256sum] = "621bc8ec3b8dbf8d5d2d76bf105dd306812d1f4e5c524ec5afb6ae7b039d86b9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.1.bb
deleted file mode 100644
index 04cea50..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3bd2a883284a51e49e90142537c9cd8a"
-SRC_URI[sha256sum] = "0babc0fec70fa7b170cddfd453aba5664ea0c96d8d4dba752b994c9dbb8eed66"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb
new file mode 100644
index 0000000..b596a1d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b578e7ef198c2f05e0afdefd28f66927"
+SRC_URI[sha256sum] = "84a537338c886d208a05923ab1742d029409af40017e718318b9ee10d9822315"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.1.bb
deleted file mode 100644
index 6edd2da..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "bb82903931ed1fbf8dac4e3b473a4c61"
-SRC_URI[sha256sum] = "5f338afec8b7d82b38e806cc62dbe4a8543d81007ebba9425c30a5065bcc65fa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb
new file mode 100644
index 0000000..6d3cc1c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0cd6526db231075101f19f90b759b1b8"
+SRC_URI[sha256sum] = "13bb31fc6ed5d4d3541e1d51b96d4fce797fef7be9ee0b884cb8d3d86359e499"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.1.bb
deleted file mode 100644
index 31a1596..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "198c4126991c67bbf0d172ca386e1f4d"
-SRC_URI[sha256sum] = "c49964c7be3c339f3306b0c3c4be38e284f02d59a9a7119530976a4a15d4175a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb
new file mode 100644
index 0000000..f68d8f5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a6b315502d44c8bb80334434f2f18507"
+SRC_URI[sha256sum] = "2731e8d49395e0ebadb6a7c5edfba44b7c5e3ddf3689d35fe6b358fcd5f681ad"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.1.bb
deleted file mode 100644
index bb86837..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "9d06038f9f2c5d1ee69b078daf2180aa"
-SRC_URI[sha256sum] = "312932f83d20f2353642c839667f1f2f5d82eef12e1c852858cf627e7908501b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb
new file mode 100644
index 0000000..3bfd12c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "631258d258221542bdf75d4ed9290002"
+SRC_URI[sha256sum] = "6bc2beef01163c295b2f25bb55b7e5d0a40edd0fa4a7746625388baf33ddc899"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.1.bb
deleted file mode 100644
index 38c6e7f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "0e2f1811cba9ca078e02fd253abf0435"
-SRC_URI[sha256sum] = "b490a4d8441baf734a017fd29a70710160c5e18d2e5b41c57dcbc819267bd05e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb
new file mode 100644
index 0000000..8dd3ceb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "fa0e332f3b967e21892b3b9fd70e7454"
+SRC_URI[sha256sum] = "295729f7aa69d6cbac135ca9fad1388dc73298d04dd591607480ed3eeec49196"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.1.bb
deleted file mode 100644
index 43297a4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "ef49dc011d8f3b97d41a577d58f59cac"
-SRC_URI[sha256sum] = "ed442430002b6779a29a7688a4bac1aa175923d5a69226318ce1e30040a80c14"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb
new file mode 100644
index 0000000..23b1fd5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4f22aba166f56bd528d307b0e7b541f2"
+SRC_URI[sha256sum] = "8853d4a52b1e045b29659c97fe03b4048155b54841b53e20765b220eb0af2bdd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.1.bb
deleted file mode 100644
index 80cf308..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "d641ea96aac23f30c5ccd8fb23f3c235"
-SRC_URI[sha256sum] = "56f6e3ec4d03256c438dfd4a1525601aceff82c9b803e543d4cdf7e2f63aba78"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb
new file mode 100644
index 0000000..4dd96cd
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6d00a14d6de40a098ad1bc0896e8edc7"
+SRC_URI[sha256sum] = "5ef6c1f39c331ab694a17f7054c56c3c91fb43cdfcfe14d8e24e19b299873ff0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.1.bb
deleted file mode 100644
index e38f72e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "5601c9a4efc363e3db726cc604457533"
-SRC_URI[sha256sum] = "0f626ff4d716a02474e96df485c28854a0676c3b62678ef76b5fed03e0c320da"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb
new file mode 100644
index 0000000..4d984a1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a49b79d9dfea54f15475b00d580d231d"
+SRC_URI[sha256sum] = "4558dd94f4b938c533f7205c1e48024801d63a17b0df290a9d9810234fcb1706"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.1.bb
deleted file mode 100644
index b841e44..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3114c1d68988198fff1204ea10f85878"
-SRC_URI[sha256sum] = "6c29b51b72936f915b2c8d0231afe5c557111569227bfbc8e22e9a45c6865d3b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb
new file mode 100644
index 0000000..87e5177
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4c4347cdf626e8ab384ab4a14591575b"
+SRC_URI[sha256sum] = "61ca8a31c76265353d9748f2f7a2602dcebe5b605326113fc84937a84a305785"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.1.bb
deleted file mode 100644
index 2756abe..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "94a1ecc117cf07b4d7684bcab494a871"
-SRC_URI[sha256sum] = "b5c4dd26fe506edaa3f884ac043dc12776f76be97ef81be10529bf41e5cea26d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb
new file mode 100644
index 0000000..be109ab
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "75ec28198ce998e30b14bb7711d8892f"
+SRC_URI[sha256sum] = "e07ef11f7e5f0fc0f5ca6590d3561f8c7cc55391cf68f31e3cb0a29209fa802a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.1.bb
deleted file mode 100644
index 3b6f847..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "0a0b515d29c282a08d3c87088d4776fe"
-SRC_URI[sha256sum] = "f335838a8bcb1994f03769b95508dc260d786eb049307d444a2df17f7ffd88b5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb
new file mode 100644
index 0000000..9d1fa6e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "eb8f58688655fc1d263c2329a99eb029"
+SRC_URI[sha256sum] = "c77ea31f83bc1f44d15d35031a124da263fb6a2e3ef49e3752bf2091b9eb1ea9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.1.bb
deleted file mode 100644
index f8dac2f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3ec5f60c6a08ac721f6abb161f194b92"
-SRC_URI[sha256sum] = "ef225faa4a51a5aa6f4f10726102bad4bcae0435994b2d2a75dff78623b40a0f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb
new file mode 100644
index 0000000..e637a10
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a5ce1203f5cd8860c41ed641f5076cd8"
+SRC_URI[sha256sum] = "d83fb6f13b2dc3e4d4ecdd77bc6786a42cdbbfb5e93560d3cbf068d84fc2a76e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.1.bb
deleted file mode 100644
index 309c4aa..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "57b7d802ef7e0af0dd73f10346c73cf2"
-SRC_URI[sha256sum] = "540ebd73da8ff20222a362ef25de78a41b7a123da7e80fc261bced258733c0ac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb
new file mode 100644
index 0000000..0b57214
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "42e5097e7ac595f104e295039f2868b1"
+SRC_URI[sha256sum] = "6d2556c7e4c8bb4fb1a710dce95589042dcae1866e3ecadab0f71a82af8acc76"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.1.bb
deleted file mode 100644
index 275b27f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "34ae51cdeabb137bd58285f5318b6d1b"
-SRC_URI[sha256sum] = "984d09e9bf05dcf25eaf46109fe64237763f860a6eecfb74c2352665d2e4c34f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb
new file mode 100644
index 0000000..ccd673a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2310a609bb5690c6f57d83ada587a835"
+SRC_URI[sha256sum] = "b215fff64302f79febb18b1d631eb0598f2d9fb82077f7f1679e0d4054a6ba30"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.1.bb
deleted file mode 100644
index b23ebd4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "38e2e9dd21e82318b50958a04327f1c6"
-SRC_URI[sha256sum] = "2f01fa76716bbd75b9f82fc4a5ffeec1cf87dbc5875e7860526ddbeeb4bf34d0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb
new file mode 100644
index 0000000..02189dc
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6c7ed99b39ac13319616a4fd18f211db"
+SRC_URI[sha256sum] = "7faa096832581d7de94ee092084b6a748c423e419b31692effa68ec2bb07265a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.1.bb
deleted file mode 100644
index cf2afa8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "a0373680c996376782836927d64d0fea"
-SRC_URI[sha256sum] = "ef21cac9519ec6cdcba88d5fe567262cb7682c03e268dcdd0017e98c47acb912"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb
new file mode 100644
index 0000000..6b7689b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c5df7357307d2f7ea16100ab2f763c03"
+SRC_URI[sha256sum] = "822889e8a6991e9f36a81d6faa382e44f5db7e0490fde8b66bbd85830e379b6e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.1.bb
deleted file mode 100644
index 936b87f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "e812f9147c11d955fd1241fde0acbd65"
-SRC_URI[sha256sum] = "fff73dadf6e3ee67945b816c944582a43201cee2b92234f2c55f43981c45f7a9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb
new file mode 100644
index 0000000..4b69728
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6f6ffa9946556d0da77b7c2f924882a0"
+SRC_URI[sha256sum] = "f7e137fdf10eb1b3c3f24b40b10be75daaa0fc598b96cfe3af38d4f2a2bacbef"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.1.bb
deleted file mode 100644
index 74b68d2..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "ec7b52688be006b530ac468cffe6c3d8"
-SRC_URI[sha256sum] = "cc4654f2dd1a1d3036067fc5209b298ecd5ec37f447d6be7d98a4f689213476a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb
new file mode 100644
index 0000000..eb3b10c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b6570c9ca260eed33001be4b9f916bcd"
+SRC_URI[sha256sum] = "9905f103df5f5656abaa5bd5bbbf3d0ab07512e2527c838dd7cd0137807f4f8b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.1.bb
deleted file mode 100644
index a9ea87f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "850f253f7d91a1bfb6b71faf480f84d8"
-SRC_URI[sha256sum] = "902d50e925f2dce387a30602595428ff183784d96727b7fb11a52886430476ef"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb
new file mode 100644
index 0000000..4f2051b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "49306764b7978df9f76ceed98ccd22f7"
+SRC_URI[sha256sum] = "7726b7d8669d11a03cff334aeb360944ec488cf0e8ca6d15b41e1cb59eeb8e5f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.1.bb
deleted file mode 100644
index 4c237b7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3bb7c9267a859ee25e4b4c150e043ca2"
-SRC_URI[sha256sum] = "5971027a413beb7e4f8323af913f6b3e12d767ab2d78f34e3fb45e8075479f33"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb
new file mode 100644
index 0000000..30f264e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c17b2c4fd8a2f168cc8be04b12c286ab"
+SRC_URI[sha256sum] = "9a7ce7dbfa680229653b9de4024f29629b4722624d8cc4f8c3714d52dd616116"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.1.bb
deleted file mode 100644
index 9c187e8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "880ffd11705d0da4a8bc9ac443b62154"
-SRC_URI[sha256sum] = "8db5b21e06211584a7e1078ffa2471656c278ad4203707e9aa97b87343b6038c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb
new file mode 100644
index 0000000..adb9653
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "9bc7eeea1ca1d3d94a666e49cbc0211c"
+SRC_URI[sha256sum] = "e6f7a957ba96f0502da88164055f5af61e42a4373b13689ba4e3c040af3d528c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.1.bb
deleted file mode 100644
index 0255052..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "dd782446f810c2932a0588ebd474f77a"
-SRC_URI[sha256sum] = "54c839cd610e7771a843c6c31ba83c2bddace35a26ce4e7cfd1f0fdc4e6e7f08"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb
new file mode 100644
index 0000000..ca7c418
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "f1534cc436d5260b2ce1233c0ee218cd"
+SRC_URI[sha256sum] = "19587c35b14604c5d1d558b9436803d551b148aa74852e16488c8ab072636723"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.1.bb
deleted file mode 100644
index 57c51f4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3fea35228a7a352a378482037150c953"
-SRC_URI[sha256sum] = "02dd54fe5188d0c57d0ff90f8293cf13135ff1b8d1858cd40b3085f311b1dc0f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb
new file mode 100644
index 0000000..f1f3e29
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2ebf64e05d51b50ed7aab906542967b3"
+SRC_URI[sha256sum] = "b1c8f2accecaf4ed98e09625abd377a4483321aeaea46b6a780098dffe21c2b5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.1.bb
deleted file mode 100644
index 50d5407..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "4b1e50ddf9c739c03aa5f01a37d661a8"
-SRC_URI[sha256sum] = "d4bd5dc2661787b398475d5d2f19a98257a3213e73560a76fad1c8dd1efe6410"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb
new file mode 100644
index 0000000..7151b7e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1c0072d639560da4d21a563fb0ee2d7d"
+SRC_URI[sha256sum] = "6f32259a0e8da61b0c80a7f05a0c7e495121644b57cdfbe8972951961766b468"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.1.bb
deleted file mode 100644
index e78265d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "632de7efcef6e3d31b6b3022b61b3f67"
-SRC_URI[sha256sum] = "0fd5795640498f5887b836a974d5392b2f8b83c3e3658587968aa6102aab1219"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb
new file mode 100644
index 0000000..79e764c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ea933b76c85d8bb8773df28de0b55e12"
+SRC_URI[sha256sum] = "431d2cf448041cba56245744c18a24c68679d922d1c6106e45313009072acf39"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.1.bb
deleted file mode 100644
index cac314d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "26f06545a45d3250d217db18beeb09e3"
-SRC_URI[sha256sum] = "f546cdcc2ff277253c799838e07f66fe3df7198ca071b77ccb4c123b5763ea2b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb
new file mode 100644
index 0000000..93cc69c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2430fed18db7a031d0312837d4592471"
+SRC_URI[sha256sum] = "3a869fe9bfa24d48737a1c53056303112c9185d931a6062533ab5febf7482c81"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.1.bb
deleted file mode 100644
index 05a3ec8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "e949f060ff05052e5109c3ddf81793c9"
-SRC_URI[sha256sum] = "30f32977a92c31369f1624cdef77cfc093fbb947e6b13cde006c0eb277e633c4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb
new file mode 100644
index 0000000..261eb8d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "cfee821757e3d4e3c89492f6c48a5c26"
+SRC_URI[sha256sum] = "f07ab4dd5165eeaa614e7bf396dfa6f4bd74cb316d9f67f158efe7376f3e1b96"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.1.bb
deleted file mode 100644
index 1325d85..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "febf805cbf54a95424220fd6fc03b880"
-SRC_URI[sha256sum] = "37f6e75f021a29756ad6b417a4383407a3339c75a97de594a58b654bf7efd4cd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb
new file mode 100644
index 0000000..905e7ac
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "67dfcc550adb117a55090b6dcdf71515"
+SRC_URI[sha256sum] = "f0d73dc68761a9b8e906cb4c04b551482cd53bdeb76f6aca23b80057026d4e93"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.1.bb
deleted file mode 100644
index 7b69d98..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "1cc49b5850bad48ee6b21ccb7597870c"
-SRC_URI[sha256sum] = "aa1f6df071934b0eca89abcb82a6276616dc463c4955f6a2003e27d950a02b7a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb
new file mode 100644
index 0000000..aba4253
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "e330e3fe565cc6538d3f17024c6c9387"
+SRC_URI[sha256sum] = "9fe64c82e31464747bf231b8a98482b3b8b83097df689d653fb316e2bf495ee0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.1.bb
deleted file mode 100644
index 56441e9..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "585076bdaa13bf5766db5b9d9bf9906e"
-SRC_URI[sha256sum] = "d341caa22028cd297f5231c6006d88c7d33e96efb1a20ab6521afa16063dab34"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb
new file mode 100644
index 0000000..00449c0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "50166fc7bea8714d48908abd64ac220b"
+SRC_URI[sha256sum] = "7de503c7fe755f0878c367b464a93d95863ba2b18593dfcfd6e25f43f7e6a961"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.1.bb
deleted file mode 100644
index af8a036..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "512da586d066aac6e8edb78bacb2a088"
-SRC_URI[sha256sum] = "6992f5a16db99a510cb71fd308d5ebe8cf7ae8a0fc92a842b8f7e7755bc20d49"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb
new file mode 100644
index 0000000..02b24fc
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c4b181dbda18672b371ee3ede30a3178"
+SRC_URI[sha256sum] = "fa09349dc5d7f46cc1b3a02e8bb67dd789016618a6e5d4001c63461dfc80d82a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.1.bb
deleted file mode 100644
index ed0f068..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "608a30bffbbd5b2f331bb205e1f2273c"
-SRC_URI[sha256sum] = "644e3332e1661ecd04a9d36e46be0648937cd6f7852efee20195b67c821f2f00"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb
new file mode 100644
index 0000000..c14b4f1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "440d2fdc9a6d9ff2f7d3112c79506fa4"
+SRC_URI[sha256sum] = "60b743040fbf19944ed28d075e43bb215a362f17910fd821d7b70ed329f8bf2d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.1.bb
deleted file mode 100644
index 5966d14..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "c1f595d1db20039d850638cd7e5d8d09"
-SRC_URI[sha256sum] = "d14ac8772ff65a978e6df01fad39eb93067e26a572bb0c39a00f4a205f01708e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb
new file mode 100644
index 0000000..ef4aec7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "23f06b6c1762c8f9cb1cea05efbb5ecc"
+SRC_URI[sha256sum] = "3e153fb554e5001560d76b9e8ec57fa2644a3124b8a68f9830514bacf8de4898"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.1.bb
deleted file mode 100644
index 6911ddf..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "85c8075353e0527c9fe3f34e4df22bc7"
-SRC_URI[sha256sum] = "648e52756b4c3ff986fe57b915c2cc41e5bc9cb473e16b9a7f272b806eaf9d66"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb
new file mode 100644
index 0000000..9ddba92
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "bbc3bcf2686e8d92bd7b7865c56e9615"
+SRC_URI[sha256sum] = "915a3534b42a952aad218a05ba7bd72bd74619104c9e592f8654704cd96fa4f4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.1.bb
deleted file mode 100644
index e19f85e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "7b82f3dfef8837e39019c4e36eced72c"
-SRC_URI[sha256sum] = "6d330b3644d6e7a85968955ef6fc1aa140b77f8da675b1468c5d38ba0834deb3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb
new file mode 100644
index 0000000..c4a4421
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2887b2d0791211afdfc1b0bba55c914c"
+SRC_URI[sha256sum] = "0e3f3e3208d494fb23577d88b01e8540889d041e9cff140470e87634c81fcd1b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.1.bb
deleted file mode 100644
index 6ac7cbe..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "675d02401a2f01913764073f8e46e2db"
-SRC_URI[sha256sum] = "20dff46763458f932c4d47c43a8d1b9e4dfe1dec54e169926e0c6635d8c93599"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb
new file mode 100644
index 0000000..6409c6c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1f7c0699652dc0fc4a851e41d5e73240"
+SRC_URI[sha256sum] = "bbc5c4bb14b27a9b1b28081135495a62e32e089fa958537be808fefcb96476b2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.1.bb
deleted file mode 100644
index 4b89271..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "bc6aaf0074c94539d12df8f537ed9d87"
-SRC_URI[sha256sum] = "ab7dc6ff2120c388b008514f557cc46f5fe055b651920d06d2226084b66c2086"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb
new file mode 100644
index 0000000..1e3bda0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ec6769a7a81990d063fdf48094e4adfd"
+SRC_URI[sha256sum] = "0ab72adb367b54267a6b094edeff5c9f2e99598979854f66ae12d771a6396c9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.1.bb
deleted file mode 100644
index 877fb80..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "ed58df2d9e9fca6342e177579f5ac830"
-SRC_URI[sha256sum] = "50a49c42f10daa00c9a8f293d538a9896ca8279b6c033dd90d6d9b86632b5775"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb
new file mode 100644
index 0000000..973aa40
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a8b769f4d39b22f34c693d2698005453"
+SRC_URI[sha256sum] = "fb809623835e0c1cfd6c1522dc05c5f3dedf9a04e86f63dc8d1d527f0f7deb55"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.1.bb
deleted file mode 100644
index 34b3afa..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "e25b027dc06a5a8babf0c9222d3861f6"
-SRC_URI[sha256sum] = "2e00995ab6448f8f7edb5319256fe3df50229bbe9f8ce27c23758cd5cbafe17f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb
new file mode 100644
index 0000000..f0cfb49
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6fd115213b097ac203cbfe5988e394cc"
+SRC_URI[sha256sum] = "8e5c79ef138bb89b8c35120bf44a38bfc8ff8b9b73d1ecbc839c05e7ea8139a6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.1.bb
deleted file mode 100644
index 3e46535..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "f64a5f4767f451862ab132b83aa585ea"
-SRC_URI[sha256sum] = "3e5af9a4da42c8d5d50a6d942c64191dbb8286e08eda44120e41c4d78f842e34"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb
new file mode 100644
index 0000000..9b83b58
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a0adb35944f631ce8b4756ca3b93cf68"
+SRC_URI[sha256sum] = "802aa30b5c4a8bb905929786064c5cfd56a8ba2380cf348bf04f0202e95d5ec9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.1.bb
deleted file mode 100644
index 018325c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "a0afc60ea438c11838f1baba7172f719"
-SRC_URI[sha256sum] = "642f8860faabc144c0ce2dbc76a93e635b8e977a1ee2f284947220be7498b955"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb
new file mode 100644
index 0000000..63cbc33
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "8d59aa0a3dd7296a0cdd3461455c5d1b"
+SRC_URI[sha256sum] = "9e28607f32c02f090d9c4120ea154d28ba70547d1f92ee06b38a93435846be98"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.1.bb
deleted file mode 100644
index 7978433..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "48f7fb92270ffe9d3a35d45fbb57fc8f"
-SRC_URI[sha256sum] = "446eeac115ab23355e5a5fa913484ac42d558b2a3c7b1cbcd7c83e00518f8153"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb
new file mode 100644
index 0000000..cdf3393
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "89c33e78a267c0b616ae04e00725aed8"
+SRC_URI[sha256sum] = "a5eb8a0d32fb14d631287e26a4fadc6d4a11af6524c4212afc7a09bc1b04705f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.1.bb
deleted file mode 100644
index 6be707a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "25f9482a49e64a8bc5653d6f9680e50b"
-SRC_URI[sha256sum] = "162285aceb265fa4ac2bc00437e199126355d3d9680b9c88e8764c00a5b2e1f9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb
new file mode 100644
index 0000000..12d84b6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ad6ff42d79aa736eb3dac16482c11ed7"
+SRC_URI[sha256sum] = "4c43e3daaf8609b20244c6ae731fe643ac1cbbc0ee9d9c41708181740a5ffcfa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.1.bb
deleted file mode 100644
index 6d7d288..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "36bb2c6ff6256be07885b4b47ef3ec1d"
-SRC_URI[sha256sum] = "37d7d2dde1a9d320e005b67a23cc8866efc59fa0437867f0a25f8feffe552775"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb
new file mode 100644
index 0000000..1114d25
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6bda3609ddf8d02d2d9c2214bcc9337f"
+SRC_URI[sha256sum] = "c49fb957cee13c0bcf48b65065e96bab1bee701cc7cb71f7facde6deb40efd25"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.1.bb
deleted file mode 100644
index eb19fe0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "c5de7e09eb850d199d1e521582ff3532"
-SRC_URI[sha256sum] = "a92e3ed52a308f8f72fa4d22c83048ebe1a5217c84875d22f3389f018deba270"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb
new file mode 100644
index 0000000..b5a9dc7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "f868b6d9a8a5d50f86e9c8320d791e46"
+SRC_URI[sha256sum] = "c4bcc4120d35c7dc7d5d57854b38395f6a3214736673c64528045adaca34d8c5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.1.bb
deleted file mode 100644
index 8ca1617..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "f426c025c231f30a5f9aa4b9a0b22a36"
-SRC_URI[sha256sum] = "42a0146ba3a27cbe285afa47b9a7b6ac7004f3fa791a80c2a6f21d29e46d5590"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb
new file mode 100644
index 0000000..af5dd4a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "8d04aa1d64223481ed856d028b485612"
+SRC_URI[sha256sum] = "9fbaf396db32be7f05c1f0b22a98bdacc9b79ac1ca1e808188d20659240c55e1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.1.bb
deleted file mode 100644
index db14d40..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "7460026a644fb9c09320851cbdda0d3c"
-SRC_URI[sha256sum] = "cdd662b558dd6e420a08cc0b03d3daa0d59b714243f6f5756f14ba88b2f5f328"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb
new file mode 100644
index 0000000..6d1ea07
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0fdc2f3e4ec88f58fdf2c3abe97f74bf"
+SRC_URI[sha256sum] = "db7eb0a2ac12b9f8809aee46b13477db28f90c6698b7f5b123e491186b12ea98"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.1.bb
deleted file mode 100644
index 75fda3f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "23a04abd724870dcdac1f7fc2cdb64de"
-SRC_URI[sha256sum] = "f61511ac665a500075c835fe31c903f15aee725e221509ec0af9acde6c71c1e9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb
new file mode 100644
index 0000000..5975c1a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0a27e88bdee857c0e3f5d3373404a16d"
+SRC_URI[sha256sum] = "1fa91ae74f1b5eeece382b7bc37b0038b6c9a56b47d200080e8f565bbd18e685"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.1.bb
deleted file mode 100644
index 2c23ff1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "3d93314695ec7bccf4e6ebeaa2e59c49"
-SRC_URI[sha256sum] = "2b6a8ad215194dfed9233d6e4954b014300fca96be521faae88d1dfff4c118a9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb
new file mode 100644
index 0000000..43abe92
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "274202e7fe73f70a43429dbed048b401"
+SRC_URI[sha256sum] = "686866fd17909bf10e43ec03693f16f90970e32cbf68c37f1d44fd41cf92186e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.1.bb
deleted file mode 100644
index 3cf1602..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "eed676f4bfe73af0fadd086e1a918f8e"
-SRC_URI[sha256sum] = "99b549f4f9f18e6f273f7ae4159c23b59c16b4956b7a466e35468a3639a2255d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb
new file mode 100644
index 0000000..1efcdb7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "709c3e9538cfb44ff0d07bd207176045"
+SRC_URI[sha256sum] = "de97a8491be17955c05fbc9cd19698c89cd8fec9878ea99576608db6d989d1b0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.1.bb
deleted file mode 100644
index c0e31a4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "35fa368598296c477146b56a76a48070"
-SRC_URI[sha256sum] = "08504e38560f08cf9baec0f11e0f99c4ad09b38a1abbafd70d06ccff4ed00ae9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb
new file mode 100644
index 0000000..88a0e0f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "125999659a554ba8f41572f9542679ad"
+SRC_URI[sha256sum] = "d9cf5c1f7111c3db76315b444d9ef5932d84274b6fb360b24e7e341f4295cac1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.1.bb
deleted file mode 100644
index 02db333..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "81152119e668cd7d8f52b0cd1f9739ac"
-SRC_URI[sha256sum] = "0b910abf322f75867186fb4af8d39a77a7b828e3d0d674a923f277f8ea4327bc"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb
new file mode 100644
index 0000000..f52d653
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4058aefe2988d911f62e9dd2a9d1a7f2"
+SRC_URI[sha256sum] = "6b8f03e07ad020a9ba0a6935d916ef6c707b72faefd66049da4718d08d0bf0b9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.1.bb
deleted file mode 100644
index d8bcca7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "ddd5628c65d2b3f78cc7f3f5088b2e96"
-SRC_URI[sha256sum] = "435b98d0c72b62992f5c9766d4854099a5168e9695b312b4966df646ec016286"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb
new file mode 100644
index 0000000..56bb5ce
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "01af6c3654a1211f257be2dfd1951a02"
+SRC_URI[sha256sum] = "b17a795360b8272dfdbcdf4fdd4a67f544405a0c5557fedf31448ad962c66923"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.1.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.1.bb
deleted file mode 100644
index cdad23f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "1953bd4b32e8bad15aeb490ebc7e827a"
-SRC_URI[sha256sum] = "a33f506653f8a2c166e1fe6a8af728913ef459ea59859940e641f2c442669d88"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb
new file mode 100644
index 0000000..26c698a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0aedd199ae05bdbdfbdae7dcd0776fcd"
+SRC_URI[sha256sum] = "74f0dec5c9fa7576445c2d230074218d69b62921211a0cd72c1c0a99394d8e5b"
diff --git a/recipes-mozilla/firefox/firefox_10.0.1.bb b/recipes-mozilla/firefox/firefox_10.0.2.bb
similarity index 95%
rename from recipes-mozilla/firefox/firefox_10.0.1.bb
rename to recipes-mozilla/firefox/firefox_10.0.2.bb
index f859ce0..fe66f45 100644
--- a/recipes-mozilla/firefox/firefox_10.0.1.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.2.bb
@@ -4,7 +4,7 @@ DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx"
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
 
-SRC_URI = "http://archive.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
+SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
            file://mozilla-${PN}.png \
            file://mozilla-${PN}.desktop \
            file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
@@ -51,8 +51,8 @@ SRC_URI = "http://archive.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/sou
            file://configure.patch \
            file://vendor.js"
 
-SRC_URI[archive.md5sum] = "265c53120fd923c742164b0002ebbf6c"
-SRC_URI[archive.sha256sum] = "d06dc35607e354d4c1524ca3344cd316a6d7a38c8c0578a52caee6a3adb054f5"
+SRC_URI[archive.md5sum] = "5ce038d591964f72c534fa33b75a62f5"
+SRC_URI[archive.sha256sum] = "6ec5feba56f180a6fbf437a68cf0c77146ade28b936e5187573e3d95f13a0449"
 
 S = "${WORKDIR}/mozilla-release"
 
-- 
1.7.4.4



