Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id EE7297665F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 12:27:42 +0000 (UTC)
Received: by qkao63 with SMTP id o63so109839988qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 04:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=aEz04yHjxqjIkEGoIRIzRiSgWAnIFM6N8Behp05EEU8=;
	b=HQyZLYdsijIwh8Uk6IAP4NElnZ6MaGZ9ucwwgPFwXHPod1R9B0fpe83JweL4vKP+ZL
	L8f/Ycd0gD1byaZSsuNSZ6ffZoCikq9wxHDKjXqKUVPm+QtceuC/s8v+WU5NeDNO6XsH
	oaiYVvFIENiWn6cpG/+RLvewTAagsRwIZpFVvJszlJWZoxCN2swvLELgnRltbi7ioPgd
	WWXf9GMmoi6QQJn3H9gPr8/wPYIlIAiXgjsW1m6MpOlQkG/CQKLTUXMgWWpaXfwmOqvg
	kDoWpoYZO0WPQpznOtIDqNRKIEJ4lpGgVJ7QQBr3OX7aFV0mjUkHryTBLNgfkoIC/F64
	MWwA==
X-Received: by 10.141.7.67 with SMTP id j64mr38193266qhd.2.1447676862481;
	Mon, 16 Nov 2015 04:27:42 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	p98sm8603549qge.25.2015.11.16.04.27.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 04:27:40 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 10:27:25 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Nov 2015 10:27:11 -0200
Message-Id: <1447676831-2933-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447676831-2933-1-git-send-email-otavio@ossystems.com.br>
References: <1447676831-2933-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] firefox: Update to version 38.2.1esr
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
X-List-Received-Date: Mon, 16 Nov 2015 12:27:44 -0000

From: Fabio Berton <fabio.berton@ossystems.com.br>

Update Firefox from 10.0.12esr to 38.2.1esr with the
following changes:

Add yasm-native, icu, pulseaudio as dependeies of Firefox.

Update Debian patches debian-hacks, fixes, iceweasel-branding, porting and
prefs from Debian release. This Debian patches can be found here:
http://anonscm.debian.org/cgit/pkg-mozilla/iceweasel.git

Add patches fix-python-path to fix python path used by mozilla build
system, and freetype-2-6 to add some missing freetype headers.

Update all languages for 38.2.1esr

Add function do_install_append to install additional files needed by
firefox.

Set variable PN to match correct files

Create a variable MOZ_APP_BASE_VERSION to append base version to package
name. The installation path used by firefox is
/usr/lib/firefox-{MOZ_APP_BASE_VERSION}

Update mozconfig file with settings used by new Firefox.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../firefox-l10n/firefox-l10n-ach_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-af_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-af_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ak_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-an_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ar_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ar_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-as_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-as_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ast_10.0.12esr.bb    |    7 -
 .../firefox-l10n/firefox-l10n-ast_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-az_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-be_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-be_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-bg_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-bg_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-br_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-br_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-bs_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-bs_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ca_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ca_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-cs_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-cs_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-csb_10.0.12esr.bb    |    7 -
 .../firefox-l10n/firefox-l10n-cy_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-cy_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-da_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-da_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-de_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-de_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-el_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-el_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-eo_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-eo_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-et_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-et_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-eu_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-eu_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-fa_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-fa_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ff_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-fi_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-fi_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-fr_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-fr_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-gd_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-gl_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-gl_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-he_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-he_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-hr_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-hr_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-hu_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-hu_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-id_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-id_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-is_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-is_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-it_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-it_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ja_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ja_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-kk_10.0.12esr.bb     |    7 -
 ..._10.0.12esr.bb => firefox-l10n-kk_38.2.1esr.bb} |    6 +-
 .../firefox-l10n/firefox-l10n-km_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-kn_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-kn_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ko_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ko_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ku_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-lg_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-lij_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-lt_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-lt_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-lv_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-lv_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-mai_10.0.12esr.bb    |    7 -
 .../firefox-l10n/firefox-l10n-mai_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-mk_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-mk_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ml_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ml_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-mr_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-mr_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ms_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-nl_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-nl_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-nso_10.0.12esr.bb    |    7 -
 .../firefox-l10n/firefox-l10n-or_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-or_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-pl_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-pl_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-rm_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-rm_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ro_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ro_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-ru_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ru_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-si_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-si_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-sk_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-sk_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-sl_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-sl_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-son_10.0.12esr.bb    |    7 -
 .../firefox-l10n/firefox-l10n-son_38.2.1esr.bb     |    7 +
 .../firefox-l10n/firefox-l10n-sq_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-sq_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-sr_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-sr_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-ta_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-ta_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-te_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-te_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-th_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-th_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-tr_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-tr_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-uk_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-uk_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-uz_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-vi_10.0.12esr.bb     |    7 -
 .../firefox-l10n/firefox-l10n-vi_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-xh_38.2.1esr.bb      |    7 +
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb  |    7 -
 .../firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb   |    7 +
 .../firefox-l10n/firefox-l10n-zu_10.0.12esr.bb     |    7 -
 ...n-ARMv6-builds-built-with-the-NDK_10.0esr.patch |   89 -
 recipes-mozilla/firefox/firefox/alignment.patch    |   17 -
 recipes-mozilla/firefox/firefox/configure.patch    | 7345 --------------------
 ...Add-a-2-minutes-timeout-on-xpcshell-tests.patch |   74 +-
 ...r-preferences-directory-for-applications.patch} |   21 +-
 ...bian-extra-stuff-to-upstream-build-system.patch |   20 +
 .../Add-soname-to-appropriate-libraries.patch      |  168 -
 ...com-being-excluded-from-linked-libraries-.patch |   25 -
 ...-sessionstore-data-to-keep-windows-out-of.patch |   21 +-
 ...Use-Preprocessor.py-filters-in-defines-an.patch |  117 -
 .../Bump-search-engine-max-icon-size-to-35kB.patch |   22 +
 ...things-during-configure-when-using-libxul.patch |  149 -
 .../Disable-Firefox-Health-Report.patch            |   26 +
 ...me-detection-of-2-bytes-wchar_t-and-char1.patch |   69 -
 .../Don-t-build-example-component.patch            |   20 -
 ...ut-when-run-time-libsqlite-is-older-than.patch} |   17 +-
 .../Don-t-install-system-profile.patch             |   21 -
 ...r-plugins-if-the-MOZILLA_DISABLE_PLUGINS.patch} |   15 +-
 ...t-to-build-against-nanojit-headers-in-dis.patch |   36 -
 ...round-to-avoid-installing-test-idl-and-in.patch |   71 -
 ...-transition-to-etc-appname-searchplugins.patch} |   29 +-
 ...em-libjpeg-libpng-and-zlib-version-checki.patch |   42 -
 ...shell-when-running-make-install-from-js-s.patch |   32 -
 ...sing-nanojit-and-.tbl-headers-from-js-src.patch |   85 -
 ...=> Load-distribution-search-plugins-from.patch} |   24 +-
 ...ream-build-system-create-debian-installer.patch |   19 +
 ...e-SPI-Inc.-and-CAcert.org-CA-certificates.patch |  571 ++
 .../Preprocess-appstrings.properties.patch         |   27 +
 ...-Bump-search-engine-max-icon-size-to-35kB.patch |   27 +
 ...ble-for-xulrunner-base-version-in-various.patch |   54 +-
 .../Work-around-binutils-assertion-on-mips.patch   |   39 +
 ...files-don-t-need-to-require-the-version-o.patch |   47 -
 .../firefox/firefox/fix-python-path.patch          |   26 +
 ...reference-files-to-set-locked-prefs-with-.patch |   71 +-
 ...-with-mesa-assuming-users-will-have-updat.patch |   26 -
 ...urious-Run-items-in-application-handlers.patch} |   20 +-
 ...4-Set-browser.newtabpage.enhanced-default.patch |   77 +
 ...part-1-support-sticky-preferences-meaning.patch |  399 ++
 ...Remove-duplicate-SkDiscardableMemory_none.patch |   26 +
 ...243-Remove-build-function-from-js-and-xpc.patch |  102 +
 .../Bug-1166538-Use-dozip.py-for-langpacks.patch   |   26 +
 .../Bug-1168231-Normalize-file-mode-in-jars.patch  |   35 +
 ...Try-getting-general.useragent.locale-as-a.patch |   41 -
 ...Use-YARR-interpreter-instead-of-PCRE-on-p.patch |  285 -
 ...Block-OpenGL-1-drivers-explicitly-to-stee.patch |   69 -
 ...Fix-for-error-ftruncate-was-not-declared-.patch |   26 -
 ...Try-creating-a-named-cursor-before-a-bitm.patch |   85 -
 ...Don-t-crash-an-app-using-libxul-because-o.patch |   23 -
 ...Bump-required-libvpx-version-to-1.0.0.-r-.patch |   47 -
 ...gcc-4.7-build-failures-missing-headers-.-.patch |   52 -
 ...Allow-to-build-with-system-python-ply-lib.patch |   82 -
 ...Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch |   24 -
 ...Block-the-Nouveau-3D-driver-as-it-s-insta.patch |   56 -
 ...fix-build-failures-with-Clang-and-GCC-4.7.patch |   76 -
 ...47322-Fix-jemalloc-mmap-wrapper-for-s390x.patch |   25 -
 ...Only-export-TabMessageUtils.h-in-mozilla-.patch |   49 -
 ...or-in-MIPS-SIMD-when-compiling-with-mfpxx.patch |  545 ++
 ...sts-using-CurProcD-where-GreD-should-be-u.patch |   49 -
 ...ent-libraries-with-their-real-path-to-avo.patch |   23 -
 ...-launch-applications-set-in-HOME-.mailcap.patch |   47 -
 ...a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch |  351 -
 recipes-mozilla/firefox/firefox/freetype-2.5.patch |   73 -
 recipes-mozilla/firefox/firefox/freetype-2.6.patch |   26 +
 ...hich-phishing-shavar-to-use-depending-on-.patch |   74 -
 ...which-phishing-shavar-to-use-depending-on.patch |   42 +
 ...-search-plugins-depending-on-MOZ_APP_NAME.patch |   39 +
 ...ISPLAYNAME-to-fill-appstrings.properties.patch} |   23 +-
 ...instead-of-MOZ_APP_NAME-for-profile-reset.patch |   40 +
 recipes-mozilla/firefox/firefox/mozconfig          |   83 +-
 .../Add-xptcall-support-for-SH4-processors.patch   |   46 +-
 .../Allow-ipc-code-to-build-on-GNU-Hurd.patch      |   48 -
 .../Allow-ipc-code-to-build-on-GNU-kfreebsd.patch  |   52 -
 ...Don-t-require-16-bytes-alignment-for-VMFr.patch |   21 -
 ...-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch |   25 -
 ...Fix-build-failure-on-platforms-without-YA.patch |   20 -
 ...Avoid-invalid-conversion-from-const-size_.patch |   24 -
 ...Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch |   29 -
 ...Crash-on-s390x-nsXPCComponents-AttachNewC.patch |   78 -
 ...Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch |   23 -
 ...Properly-align-XPCLazyCallContext-mData.-.patch |   40 -
 ...-Linux-failure-to-build-because-of-ipc-ch.patch |   31 -
 ...-not-use-static-page-sizes-in-mozjemalloc.patch |   26 +
 ...S-Fix-FTBFS-on-Hurd-because-of-MAXPATHLEN.patch |   68 +
 .../firefox/porting/NSS-GNU-kFreeBSD-support.patch |  165 +
 .../firefox/firefox/powerpc_va_list.patch          |   44 -
 ...-disable-extensions-in-system-directories.patch |   16 +-
 ....locale.matchOS-and-report-the-locale-cor.patch |   23 -
 ...ral.useragent.locale-prefs-from-firefox-..patch |   31 -
 .../firefox/prefs/Set-DPI-to-system-settings.patch |   16 +-
 .../Set-javascript.options.showInConsole.patch     |   26 +-
 recipes-mozilla/firefox/firefox/x86_64-fix.patch   |   16 -
 recipes-mozilla/firefox/firefox_10.0.12esr.bb      |  156 -
 recipes-mozilla/firefox/firefox_38.2.1esr.bb       |  115 +
 266 files changed, 3420 insertions(+), 11431 deletions(-)
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
 rename recipes-mozilla/firefox-l10n/{firefox-l10n-gd_10.0.12esr.bb => firefox-l10n-kk_38.2.1esr.bb} (52%)
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/alignment.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/configure.patch
 rename recipes-mozilla/firefox/firefox/debian-hacks/{Add-another-preferences-directory-for-applications-p.patch => Add-another-preferences-directory-for-applications.patch} (66%)
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Add-debian-extra-stuff-to-upstream-build-system.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Bump-search-engine-max-icon-size-to-35kB.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Disable-Firefox-Health-Report.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch
 rename recipes-mozilla/firefox/firefox/debian-hacks/{Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch => Don-t-error-out-when-run-time-libsqlite-is-older-than.patch} (65%)
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch
 rename recipes-mozilla/firefox/firefox/debian-hacks/{Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch => Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGINS.patch} (63%)
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch
 rename recipes-mozilla/firefox/firefox/debian-hacks/{Handle-transition-to-etc-appname-searchplugins-more-.patch => Handle-transition-to-etc-appname-searchplugins.patch} (82%)
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch
 rename recipes-mozilla/firefox/firefox/debian-hacks/{Load-distribution-search-plugins-from-etc-appname-se.patch => Load-distribution-search-plugins-from.patch} (72%)
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Make-upstream-build-system-create-debian-installer.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/NSS-Adds-the-SPI-Inc.-and-CAcert.org-CA-certificates.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Preprocess-appstrings.properties.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Work-around-binutils-assertion-on-mips.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fix-python-path.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch
 rename recipes-mozilla/firefox/firefox/fixes/{Avoid-spurious-Run-items-in-application-handlers-con.patch => Avoid-spurious-Run-items-in-application-handlers.patch} (80%)
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-1094324-Set-browser.newtabpage.enhanced-default.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-1098343-part-1-support-sticky-preferences-meaning.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-1136958-Remove-duplicate-SkDiscardableMemory_none.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-1166243-Remove-build-function-from-js-and-xpc.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-1166538-Use-dozip.py-for-langpacks.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-1168231-Normalize-file-mode-in-jars.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Fix-build-error-in-MIPS-SIMD-when-compiling-with-mfpxx.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/freetype-2.5.patch
 create mode 100644 recipes-mozilla/firefox/firefox/freetype-2.6.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on.patch
 create mode 100644 recipes-mozilla/firefox/firefox/iceweasel-branding/Modify-search-plugins-depending-on-MOZ_APP_NAME.patch
 rename recipes-mozilla/firefox/firefox/iceweasel-branding/{Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch => Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.properties.patch} (82%)
 create mode 100644 recipes-mozilla/firefox/firefox/iceweasel-branding/Use-firefox-instead-of-MOZ_APP_NAME-for-profile-reset.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch
 create mode 100644 recipes-mozilla/firefox/firefox/porting/Make-powerpc-not-use-static-page-sizes-in-mozjemalloc.patch
 create mode 100644 recipes-mozilla/firefox/firefox/porting/NSS-Fix-FTBFS-on-Hurd-because-of-MAXPATHLEN.patch
 create mode 100644 recipes-mozilla/firefox/firefox/porting/NSS-GNU-kFreeBSD-support.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/powerpc_va_list.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch
 delete mode 100644 recipes-mozilla/firefox/firefox/x86_64-fix.patch
 delete mode 100644 recipes-mozilla/firefox/firefox_10.0.12esr.bb
 create mode 100644 recipes-mozilla/firefox/firefox_38.2.1esr.bb

diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb
new file mode 100644
index 0000000..93d535c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ach_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b3340f36da92ddc1ccae6d31251b7090"
+SRC_URI[sha256sum] = "285a30026c108ad7775fde79bcf5e84c6f0af5bb6dce747bd8d4be308d83c3bd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
deleted file mode 100644
index f250a97..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ee09b5ae0b124cb02c91362fad37b08d"
-SRC_URI[sha256sum] = "e67b05f7b2586299f48e1bb2a1194300b07e1645b7a31a41d4c18a3810d6da2a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb
new file mode 100644
index 0000000..11c6364
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-af_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "04ef0f30c7a80add9d098f700318d0ed"
+SRC_URI[sha256sum] = "2939af5389d2d480ad9b0b5fd4e13d725a07b47f1e025d7abe232e25bd6f93f3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
deleted file mode 100644
index ce843ab..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "3b4bbc907198a0e7d0e7919347b34a9f"
-SRC_URI[sha256sum] = "1f001cada0cdb54f475aff5d4b565396ec7d17c4523aa7b25e359199661530c6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb
new file mode 100644
index 0000000..4f582b7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-an_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "bb214d187b1b5f0421f514db1eb97202"
+SRC_URI[sha256sum] = "61c2b5e3037fca2759313b6a21c6abc056e8bd9f31f9781f5c6ef1289af5cf61"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
deleted file mode 100644
index fda65da..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b71a07fa3242aa52ca624fa5da3b3bc6"
-SRC_URI[sha256sum] = "31fe7aa9932fc554924bb034d9345ed9b57b9df2cc802e34621d037ee16737e9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb
new file mode 100644
index 0000000..af44927
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "cbedb047d348391c9ff448222b757a14"
+SRC_URI[sha256sum] = "840e732a96c8478d0815888c79496d1c62dcbd6133d2304b0920f93d0f6eb3db"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
deleted file mode 100644
index 97c06a1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "fbb0fe62d7b57ccfe04181d454cae8aa"
-SRC_URI[sha256sum] = "26e61ee3a18eac733e5c8b8feb55df78a97c1d3b0c619c78531deeb7c4bf5f95"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb
new file mode 100644
index 0000000..e337c89
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-as_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "4caf5cac426b0a05b9bf558624a197d0"
+SRC_URI[sha256sum] = "3aad4f54d6b17a1e50ecff8f88d43723fa7d423ef5523a01e80b2eedd4d40ca4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
deleted file mode 100644
index 5378ac4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "110129c392ed671452cee74b9707f09d"
-SRC_URI[sha256sum] = "0cff3692db8cbe875a22114f61319ac7e43e9d39c3f70c8656a2354ab3da5650"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb
new file mode 100644
index 0000000..7eaa382
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "bd81bcb212d21eabc1af24a87d7b14e1"
+SRC_URI[sha256sum] = "9a3dad64dd09a11293936ad421d9cf54a112363497fcf2263e56fe4dc059b648"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb
new file mode 100644
index 0000000..c9d21c2
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-az_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "0b331d3504012e6c04ee07bd10ab6736"
+SRC_URI[sha256sum] = "17a2771c37d08b1635de6bfbffb125191c046c21cf159b33fb596d9cd5ebfda0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
deleted file mode 100644
index 917c20d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b29eee5ae05473eb3e2ca791539bf76a"
-SRC_URI[sha256sum] = "17a5d58a3866567b93e16fdbe6e6ee1815dd0d1911461576bf68a0b77515dd42"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb
new file mode 100644
index 0000000..029e2fb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-be_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "1b6b016e358a09f2d6bf54ddbc8620f7"
+SRC_URI[sha256sum] = "fd6d9e058da409985c1f9e04b608c897e3ccf81cff733029c4c6571e7d128022"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
deleted file mode 100644
index ed1b0b5..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "79360625be246e46145179566d46fc64"
-SRC_URI[sha256sum] = "d6057c0c72987fd3cad6c8fd5866e5c65db5c54755674c745a2d76f3b5dd8d01"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb
new file mode 100644
index 0000000..fc33644
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "252af6625a65ffa20f315fdb196eb430"
+SRC_URI[sha256sum] = "389edc15450db4664667237ce42a7f207278777bf13fb7531ebba54a09df460d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
deleted file mode 100644
index e9290b6..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "fa9dba9b48585e5dc0a9bc8b6346f300"
-SRC_URI[sha256sum] = "d55143b3a14e88c24a58fed3865884c23e24194b4ad253624d5d45b7d59d4ac3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb
new file mode 100644
index 0000000..be8bca2
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "618a629f13f44c171f38ec16835699bf"
+SRC_URI[sha256sum] = "8acb41f8dce61a494f04e2d3f43eb0a23e7f21179928b803d6f0fac42ee1b4a3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
deleted file mode 100644
index ecbb73c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "4912298aa808c4c5982687540e790554"
-SRC_URI[sha256sum] = "50aaa09a46d1de6909fe2a9affab6b82a356837b2d6bddc82ee3dc3271dd917c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb
new file mode 100644
index 0000000..d6f83ff
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ed59a8ec211f063e1e08992bb8c4c3dc"
+SRC_URI[sha256sum] = "bab25d7ce5747110b39b2b99685853a5931f340daa2cb88a4d53b01b0534f211"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
deleted file mode 100644
index f4e276f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "fc9b36fc2d1124e9f75d05cf1800bcd3"
-SRC_URI[sha256sum] = "d91bf32eeb9de681e216964cd095229ff89cee79fa636edd3b0f4ae263a36d6f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb
new file mode 100644
index 0000000..85e82af
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-br_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "e8b5700de5aa3f914e33b8eb8d775b09"
+SRC_URI[sha256sum] = "a5cbd1cbacdd7d17c7f0d5d62583a0174e69e0905ffb22d0b7a4e936729862c7"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
deleted file mode 100644
index e594823..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "657afba75647ed1e0fb65b4056994f3e"
-SRC_URI[sha256sum] = "85890bca4c0e415d4888f9b2e66cf47237fe07a5fc7132b8578492a8d3454f68"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb
new file mode 100644
index 0000000..d338019
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "987cdb03a568ce28195105d4b808090b"
+SRC_URI[sha256sum] = "0b2752ae75b2306d5b01731cf470cc02da75b759ac7fd4b0bfbad76e85214b50"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
deleted file mode 100644
index 0d02663..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "dd6ee6e45308d75fd544b6ed0a42854c"
-SRC_URI[sha256sum] = "df940cb5e7169740f0d3604e5954dd79f255e54578d6931e6fa7a5c1117f5f9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb
new file mode 100644
index 0000000..c8ea2e1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7bff27fdb28a69dc89b3e1e65add1d9c"
+SRC_URI[sha256sum] = "9a7838b932bf3c356da9af568718ab058c86076e435f5d0be4a082bbaff190bf"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
deleted file mode 100644
index dd97c1c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8de8521ae43fea74760145104beed758"
-SRC_URI[sha256sum] = "844ae2069a614fb33beb18d95659bae3af62dcb497ae4d67e155ce5ec05dedd2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb
new file mode 100644
index 0000000..4862235
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "292daba64a998206ad3780995eb9457e"
+SRC_URI[sha256sum] = "d8c4ba79e4725029dc4073e065c65a8ba1d97fca9e2ab53f7147184211801178"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
deleted file mode 100644
index a3c7645..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8c2fb294898ce50c30c59c74e9794e10"
-SRC_URI[sha256sum] = "97d829a2c7f31575f8c6ef010d1568ebf17b046ae2cc2e3a06a229910e6a5a93"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
deleted file mode 100644
index 5864e10..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "849ccebe1734608daaf100d76af642af"
-SRC_URI[sha256sum] = "b6d3c5d340c5adad2859d57ef9879d70b515f03da07006152e78e1d84ed9210f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb
new file mode 100644
index 0000000..fff1c7d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "02366aa12fff5d3aff879521e32498c6"
+SRC_URI[sha256sum] = "8916066abc92d6ddff59b248ffe79bc09e42ae2e553abee68cd96f81f7c9881f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
deleted file mode 100644
index f4469ba..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "1e26c844241378906d4a659ffbd4cfcf"
-SRC_URI[sha256sum] = "a46e30922068dd1e74d9a2acc6c5136c4b55a344bc9d7c52afc3336fb0db9b4e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb
new file mode 100644
index 0000000..b3fba18
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-da_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "db46087a504e5f6057e602fd6cd501da"
+SRC_URI[sha256sum] = "269107b93e0f7df8b9860672ae5cddeb816bc184d8b083dbb0c12af4723da666"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
deleted file mode 100644
index 2ef30d7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "3fb6ae874a60c9613f84bdb442350f7e"
-SRC_URI[sha256sum] = "d901f4a9f1067682058d9129b7bb95a9cc9ef87ef509719fd45e6f8de942adff"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb
new file mode 100644
index 0000000..30f12b0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-de_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "4e88eec6d43dff85472a81e2c5e19e6c"
+SRC_URI[sha256sum] = "3875513fb280bf215f37062078f3dee9e19b49cf43db4a1722975d086700fb9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb
new file mode 100644
index 0000000..2f3bef1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8992dde7c72291223751fd471a281ffe"
+SRC_URI[sha256sum] = "f925101d6416e20725e7f20632d4e3c3c22131b2becfb393e7811d5dd8e849fe"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
deleted file mode 100644
index 09e45ce..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "480fea7e61c3b0d7eff0541ea0ddb853"
-SRC_URI[sha256sum] = "d21b0687c2650829fd1e055331a3bb1810a11f9da59fcb8a503390074d299817"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb
new file mode 100644
index 0000000..abbfd50
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-el_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "f71e2a26dec562f72d1e00b7f090d248"
+SRC_URI[sha256sum] = "b0bece2e1762b042044e676b13ab33b5d8dc6397c84974ba485e656bfa859fed"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
deleted file mode 100644
index a889870..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ea8b587ae206d988c34b970ac0eb6c88"
-SRC_URI[sha256sum] = "4d74084f6b1a95594f4fdfadbce98bb795ef6419bc3cc6d83f019de16674dd44"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb
new file mode 100644
index 0000000..c48cac4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "1b3bfb37f153df5b6c6fe00a632d39d3"
+SRC_URI[sha256sum] = "8f5dbb40d08afd368f74204ace917bc13e384fa305b5a588f87aabd7da741177"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
deleted file mode 100644
index 03d0224..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b13987e7ef607946556f5110d4ffd797"
-SRC_URI[sha256sum] = "6d5b7decc1b537153b40c8fc31081da50122268ba8f7a7e87df7b4c2ad819a09"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb
new file mode 100644
index 0000000..1edb4ee
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "076e73314f9e24d78dd9eb5ff8f7a7b4"
+SRC_URI[sha256sum] = "44e81da1c90cf56e4190145e981c7bab9d6cdc559366c7b707c01e0df84db7a2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
deleted file mode 100644
index af4b762..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8d6fb025dc26d5d8920e94542dbe917b"
-SRC_URI[sha256sum] = "2963f434230260f29bb1f69a1e2638568f6c10080d1c4179bd5669d537a6fbce"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb
new file mode 100644
index 0000000..aaaf239
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "041d513db4293296835935d814679400"
+SRC_URI[sha256sum] = "d4d06c2c80202f06a837dcea7e0431f8556a58e7a97e5e1bdd41ef8cd575f8db"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
deleted file mode 100644
index 711a2a6..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b269bd02363bb28ddb6881b25fa50939"
-SRC_URI[sha256sum] = "567f923ab879afbda71121a5b52660fd179c67e97e43ea5908bf155d5a4c99dd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb
new file mode 100644
index 0000000..117ab31
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "e91ecbe1d03e81c70c813fc9503dd99c"
+SRC_URI[sha256sum] = "34d5455052f0f7e43561795998b9a9f20683bbdac54d740e2ccc952dbe35840a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
deleted file mode 100644
index 7f4020f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "027ab81e8fa06c4e92bd514fc8b38535"
-SRC_URI[sha256sum] = "0b008ed2230d7646858411d0b2225458e319f14661330e90ed11cf4955a31aa3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb
new file mode 100644
index 0000000..2a87a65
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8e2f2b4843c0336c2839706937740881"
+SRC_URI[sha256sum] = "1539d6b82a8a475fab958de03819b9ab866531d826248882f70dbedb52caa095"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
deleted file mode 100644
index d58c0ce..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "4158a2ffc07f753fb31066258142d43d"
-SRC_URI[sha256sum] = "ecf68a7a48908246a24b6a1e498da76312dfe8375576e604f327899c241aa660"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb
new file mode 100644
index 0000000..d1757d7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "e2982afa0e676243ea54d47187f25202"
+SRC_URI[sha256sum] = "987c370767ef39c784977f15768a79833052cfccf53b90ab0ade524270fc299a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
deleted file mode 100644
index 9fedcdc..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "7d8482919d5c6ef6965c442bb84d0e62"
-SRC_URI[sha256sum] = "4dd4676e59048de312bd3fe6084663281076dd90ab63725b2bdfe3862089b686"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb
new file mode 100644
index 0000000..add7fff
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "3456c9c9e05ec0c5cf867e19fa599112"
+SRC_URI[sha256sum] = "db861b6fb4eb4b46cf21e3fc56ec3ba98303cf0aa8c2d5c1fa4efacc93342400"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
deleted file mode 100644
index 4c59a6d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "58dad5b3a614b161156f7642c4522890"
-SRC_URI[sha256sum] = "a17d54a81de9a3f81a7f56adc25f4f040b7e29a28ab946834c5a2a08152fe0d6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb
new file mode 100644
index 0000000..1c23d3a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7db3ffbf3758d76bf267aaf64166dfeb"
+SRC_URI[sha256sum] = "b78492a8826850ef2a3f7d7c192c15af573b59c64871a2b849c98277eea28234"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
deleted file mode 100644
index 2d08406..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ee8e35e6bfee1814610ba195fd936789"
-SRC_URI[sha256sum] = "4e04dabb3f5dbe5e763f764e48f647f152eda393b0f525aa32f2c0cb42531e9c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb
new file mode 100644
index 0000000..b466f07
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-et_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "aba46aee29fdb4b476e36f9cc6bc28e7"
+SRC_URI[sha256sum] = "fe133da93e7c1e88f1c39321de56f679db228e7a0b7c6cd08ccbec09579cb9ac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
deleted file mode 100644
index 9dd0f42..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "10369d737299aea54b734a369ac72a1a"
-SRC_URI[sha256sum] = "86047af8b5ac6e372c9a5b061fb3df6287a48aa28ec8c379d0cd40cf1a630efa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb
new file mode 100644
index 0000000..ec43245
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "9c0872f6e5841b512cb27be095dfeabf"
+SRC_URI[sha256sum] = "4b34e8fcc664fc47de1ee7fe1b8c4054a8416288a89198f1e772d37bdb0d6dad"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
deleted file mode 100644
index fb6d9c0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5a569b5e667bdcc0bc21b6cdf89f7fd2"
-SRC_URI[sha256sum] = "c596082d60d9db633f0228eccac07efb257a222b606f9a388aef2d4906fad7df"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb
new file mode 100644
index 0000000..d0cb43c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "5883de41dc730131ba2ee3cf401a04a6"
+SRC_URI[sha256sum] = "6525afff18f0e5e76ba8daa67ee86121998ba3fa199215aa207b83759a7ca616"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb
new file mode 100644
index 0000000..e8dbb4f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ff_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "af64233de09fd19b9d54dac5ecc51e23"
+SRC_URI[sha256sum] = "bf57f779d89cf4e72ed1d4c7b6100facf28ed829dc96f60dd5de52d4289bed04"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
deleted file mode 100644
index b2c2297..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ecfc9f86287eb154aef8a370692443f5"
-SRC_URI[sha256sum] = "b2e7e8507789c75135582bb8f7a56fe1ac866fce75d4f353b0e613170c9dd4a6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb
new file mode 100644
index 0000000..9dbef81
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7b531ebf00d31f19dd17e408f5208115"
+SRC_URI[sha256sum] = "0930c3a33eb29d31789e7a880a018912da6ca4e9a51013e08bc311d775f4021a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
deleted file mode 100644
index 488558b..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "283cedef2bde143989e1161c7dbcd650"
-SRC_URI[sha256sum] = "e6a6f455e9b0325fc836060d2e2cca71acfb13296017293f018437346d79c19c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb
new file mode 100644
index 0000000..859b2f9
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "63bb96395ae1544d28d8db39a056f63c"
+SRC_URI[sha256sum] = "459b100943ac236091e5945aa84047c7a0b540769c8d63cf2f527cbbf645b401"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
deleted file mode 100644
index 6d83974..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "72fa2c81af3b3d7831fb43fec8e35a44"
-SRC_URI[sha256sum] = "470ed8f1d8fe386bc3675f67680a3c935f6b5cdc7d08ea8ae4e010739f10cf90"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb
new file mode 100644
index 0000000..aac9839
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b6e26926d38ee8299227b18d2e902abc"
+SRC_URI[sha256sum] = "23cc544e74606aa72e9ad2d9c3bc2ae835c82a2bec5787a531e5913dce110d18"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
deleted file mode 100644
index 30065d7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "867dd8d96873c1ff4604b1fda84e4bea"
-SRC_URI[sha256sum] = "d82c95941c6820a878f37c6bf2e4070a855d3e8b13ee2635f88e65473c9bf7de"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb
new file mode 100644
index 0000000..fbbc436
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "acb74472744f8f3046e9122a7bcb92c0"
+SRC_URI[sha256sum] = "0e45539bd39deb9315070726b44c01a8c12c9edb0d1773dc62bc606c45263500"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb
new file mode 100644
index 0000000..f0350ff
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "3d260ad74005ede4cfa5d2ae59e47614"
+SRC_URI[sha256sum] = "7d0af6433a55c2b066f136de7cb2e19182f2357d7e48ac7711dc0dea17c27f8e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
deleted file mode 100644
index c7e67bb..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8d8c3493a07b9082860cf84bd945e5b2"
-SRC_URI[sha256sum] = "f5b4a1884103fbf70869cc0c6e0971d6cc14f0ba7c70ecfe9763460024ca6487"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb
new file mode 100644
index 0000000..5d22052
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "f8e55dd851264f7e63120034c6f9a813"
+SRC_URI[sha256sum] = "9253cb864e13ad8f86350e3560a08705e3b411f5afb69b66fcc739571a5a9697"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
deleted file mode 100644
index 63774e1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b3da4d1a61f01f48126f73451403e8ee"
-SRC_URI[sha256sum] = "9de19db6fee44f52c838dfe28b823b6420ec01ab771c6c967528cfd0015c5ccc"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb
new file mode 100644
index 0000000..1d5e762
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "481187abc298353846d90fb7b087dcfe"
+SRC_URI[sha256sum] = "e926a61de3fbc8f7120bb07fb0450cce81d9da6842bcd5fa7a8df1499fa11013"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
deleted file mode 100644
index 7123c7e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "19ab7f1e68ffe50f6f40a8e8c46f133e"
-SRC_URI[sha256sum] = "ff8c9cc6568a556c01e47eb398be44f4ff5fae1507272c01f77b7f31210fd2ad"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb
new file mode 100644
index 0000000..b006d1d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-he_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "499ae56c575e652c582d203db87143c3"
+SRC_URI[sha256sum] = "b14462221fde67c0fffd2fa0469e6c5a476540111088456842a59809e1e6812d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
deleted file mode 100644
index 4ee1cc8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "db60a38982509666a2202ca513d8cf6f"
-SRC_URI[sha256sum] = "bb86e201c5eb5395eab16edfa2ab4453cf2d0a1053a6ef8392ee3da5883e39d4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb
new file mode 100644
index 0000000..449d4d1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7ca721d0d07bce558b9258fee37b5558"
+SRC_URI[sha256sum] = "df8683b412ccb2d4142099354b0759e59306eb96be12760c7c0f58b7b48d9411"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
deleted file mode 100644
index 5e632ee..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "dc35837bbd4961f3e13972c67072a82a"
-SRC_URI[sha256sum] = "b4559dec7bad9ed97798498cfe386b3a475e2efc67e97d378ebc6711082d1010"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb
new file mode 100644
index 0000000..32c654a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ed01e4d1a2bd26767578b62c10063207"
+SRC_URI[sha256sum] = "2405e5459c45abbf455845eee66bef90460f4c5c34aa1abede38737d2d8bbbd1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb
new file mode 100644
index 0000000..9a43418
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "d7386677d411dcc060054bca07f448aa"
+SRC_URI[sha256sum] = "a6852cdcecddcdc36ddcb33513bf6df0f39734f8ee174c52c3b46c0e4284d06a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
deleted file mode 100644
index 4f010bd..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c30cf67ce1b16a657aa1b1734ad5c4d1"
-SRC_URI[sha256sum] = "605d8bf0293967b7e55ff3b7107106230817249726c1bdbf513a18e4cd6a4adf"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb
new file mode 100644
index 0000000..4f9a647
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "401716d1fb94ec5b4ae6cdba3751a298"
+SRC_URI[sha256sum] = "7dbbebe69ff4ae414909e02eadefd1db7b7585ebbf450c6906e515cd55ef5144"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
deleted file mode 100644
index 6e36849..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "327f2ea498b08bb119630a23ba81c395"
-SRC_URI[sha256sum] = "e0606d14afc0607dc4308aabac6c660146571e4494520fc97158dcd71fdbef1f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb
new file mode 100644
index 0000000..4f99b3f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8129c59bce70314602fd91bf7676ca19"
+SRC_URI[sha256sum] = "20a4c0b5abad43617850551aeb00c303fb74a11cb0ffc88a5f6a21500e0c707f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
deleted file mode 100644
index a5625f5..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "0a51785e7122a08ac93db806c58f1450"
-SRC_URI[sha256sum] = "70d123916f587b933ee1724565bdcd5033ac270b2556b7342886fd76cae56235"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb
new file mode 100644
index 0000000..f9e3d2b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-id_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "f9cc484a6054bf50a39c88aaf03fb9d4"
+SRC_URI[sha256sum] = "bfc5fe681d846d57ff34b69916a2a67182a020652d7c4949f6835e84ea296f22"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
deleted file mode 100644
index a758f47..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "784cdc9f2f8ed756783597eb1fd204c7"
-SRC_URI[sha256sum] = "29ba39f7c363bbbac34a95d7d2af610f1e05a140ad04246eaee8d50dee1b9c73"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb
new file mode 100644
index 0000000..03a5e13
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-is_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "80062bac297bc0f5046bf90fe3c2cf38"
+SRC_URI[sha256sum] = "7db45517845cb2c10240e8bc208aa98eb59ca9f7e4ac63458ff73b01c6f81feb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
deleted file mode 100644
index cd66340..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8cc49edb54910ca782ea14c0d166a51e"
-SRC_URI[sha256sum] = "6e533b3610fde4b917f924154f6ef5b7f9593128d05df655dc7e1e46b4cec10d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb
new file mode 100644
index 0000000..511e44e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-it_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7f56b9af9523ff1e23cb558dfaa6aff7"
+SRC_URI[sha256sum] = "0b34622317c71e5d4ef73a2c91103c81bb93e00ec6745d815f5b5c5e0a4a80a4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
deleted file mode 100644
index 96b3120..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5ab9664966f502711f3703a60896a971"
-SRC_URI[sha256sum] = "3b2e1008033f8e80c135e4f7ee9cd96472be87d7041078cf99575e37c29caa12"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb
new file mode 100644
index 0000000..4f742c4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "fca95afd94c93c298efaee1f202d7fa8"
+SRC_URI[sha256sum] = "7df70432dfaf748eea5edfad608a3fcce377f1c3d06d1012f2fb28042f872ae8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
deleted file mode 100644
index 8ccf8d6..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "51633b555e17c58703db80a3183206dd"
-SRC_URI[sha256sum] = "1e32dfd312adbba86e06e88790cc934c4d1dab6c1a1d611f0bac4cb5fa05456e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb
similarity index 52%
rename from recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb
rename to recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb
index 9a34182..800fa4e 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_38.2.1esr.bb
@@ -1,7 +1,7 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 require firefox-l10n.inc
 
-SRC_URI[md5sum] = "7cf6eeba11bee78f1db75d44bd498dca"
-SRC_URI[sha256sum] = "62b166368da8b91a7c593801c2fb8c791e0579c6a12685bff5389301b9692a7c"
+SRC_URI[md5sum] = "ecb7c10c79629c19d9fdb5d18fcff6e5"
+SRC_URI[sha256sum] = "07131063fc5caa3a3f20d9f6140d3e0640c81e842389cd77c26ed722ddb195b0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb
new file mode 100644
index 0000000..95ed77a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-km_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "c598844b8bc47b95a2b7d1dad6084f18"
+SRC_URI[sha256sum] = "35c67ac083036edbc00351f3c75b6bd59a57f49b8f49326b966e49ed1c440769"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
deleted file mode 100644
index 56520e0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "934dbb4d5982ed1f32597d7709cdf895"
-SRC_URI[sha256sum] = "295ebccf2462e33facc6018f1124a888e12fd1ba23563bf9545ce4588669ec4e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb
new file mode 100644
index 0000000..7c6fb0d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8c54e90044ed34b49585ef268cd62228"
+SRC_URI[sha256sum] = "b88e298f2e884a027a993b1e08bed8d4b693cc86d0cd9593570cc83561e9ebc1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
deleted file mode 100644
index 5da6f96..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8dc5155cba07ad55849175a2b551c333"
-SRC_URI[sha256sum] = "7613f6fed1915aa2f9eb19d3b0457c15fd1a871a8e08b090db90c131defc36d6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb
new file mode 100644
index 0000000..efbfa3b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b166bbbe2be2034d9f2e7b928960e296"
+SRC_URI[sha256sum] = "bb7f4562361941f1f6cb5f157b52a0c8584e52eb8b1e0d643b00dd7bb0b5c51e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
deleted file mode 100644
index a6de9d8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ea842f8bb93e6182ad41772051754acf"
-SRC_URI[sha256sum] = "f5a5d768af61c1336c1f532f1cfc68e847799c19561591015b70551aba7ccc44"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
deleted file mode 100644
index bdc504b..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "44fb84f92a3d6e2c4ab6db71868af786"
-SRC_URI[sha256sum] = "127028d15502046ed87efa35d47bbc9ec705c09ceb26cd65c37ae1793e4ae4fb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb
new file mode 100644
index 0000000..63bcc7d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lij_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "2ef0c41cfb132fe867b7e9a0d5a752c5"
+SRC_URI[sha256sum] = "c5ee43e5a4a14d8476dfc7299a6f87ccb91aca8c954b85168a9248d91b3e3fde"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
deleted file mode 100644
index 086cfb4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8394c1a81a79d4c87433da4e2514e8a1"
-SRC_URI[sha256sum] = "64c3cd285a2d6e489513c48d7c6819459329d38e1d0fb83be97094ce7240b065"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb
new file mode 100644
index 0000000..942a133
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "2bfe6afc4cb4ff57d992b47684cdbebd"
+SRC_URI[sha256sum] = "285abdd84d600b7aef0eb17371879573772e357d147178d02cbb9004cfd01d70"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
deleted file mode 100644
index fdddf7d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "dec5d2d3c954ff9a4c0bee17f237685f"
-SRC_URI[sha256sum] = "eea9ca25dd45f1257131e32474ce0f46a04b5327b333afa77c1809d7a017bf10"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb
new file mode 100644
index 0000000..7820bac
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "da470c7f53420628a3331ff8050776e7"
+SRC_URI[sha256sum] = "b5b427806e1b7172110b0570fe381bd40486790c415dfe8720343c2a34c41a64"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
deleted file mode 100644
index 34ad951..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "2cbcb8c7f0213d74ccf3322d2545459c"
-SRC_URI[sha256sum] = "cb7731bbd18f44f53ef79134e29b47c1b6df75c811b2d2514b7d2ece6442d855"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb
new file mode 100644
index 0000000..a87b4bd
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "a51f1b1d44f493a1d2320530b56b4f82"
+SRC_URI[sha256sum] = "443c2edd6fec5e81d19552ba514b2dfc8330285fb0f984fc735f4a1b5de6a4f5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
deleted file mode 100644
index e31e04d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "48a3962aebd8cf08a29cd290f95175b5"
-SRC_URI[sha256sum] = "15c5cf3bddf26c5d54e88a6806a730ac1816694fe5b946930307097bcfa3224d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb
new file mode 100644
index 0000000..269e173
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "e1ffc30646f180eab48f0f59b1f37715"
+SRC_URI[sha256sum] = "b57c5314d1b3824396a0cf6a4bc7d8cb70bc01730443dfa791bb393969841daa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
deleted file mode 100644
index 2614634..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c5fbcb56c76449c628cc5ea537eb31ec"
-SRC_URI[sha256sum] = "fd8b7b2c706fb013f452d27a4b5f908504fc712458c6488b8cbdb631ccac1ba3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb
new file mode 100644
index 0000000..8d5ec0d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "40e313dbcaa09243b3edf95cd4b1de9b"
+SRC_URI[sha256sum] = "f55fecbcb7a2624dfdb557584c962b04e0b54bede3bb007cfdbb28333022fadb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
deleted file mode 100644
index 19a8844..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "99f63722c38a275a24e3e25288117414"
-SRC_URI[sha256sum] = "a1e1eef9671fa728fa59a8e682d419b30e46335f822232175f41e512e86500ca"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb
new file mode 100644
index 0000000..86d7fa8
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "f6d1f5bdeb64cd2719504875e4818fef"
+SRC_URI[sha256sum] = "16d656c2094e2ef767d4d6a3b6e290d10db4902f71dc8c2e9b1410358bddcac8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb
new file mode 100644
index 0000000..e517ce9
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ms_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "86cc118c67f34ba0bb49965db7f61b8b"
+SRC_URI[sha256sum] = "d57d83cb9ea23ab30eada256ad77648a8a922bff52016ddd0956c223011d99a2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
deleted file mode 100644
index 26a3d2e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5ac2f7fe64fe4c89a32f63791135eb3f"
-SRC_URI[sha256sum] = "193730e08a92f2bff40c900193a800adf5298436ffb7fcf605f9ae03b75fd884"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb
new file mode 100644
index 0000000..861128e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8118e13a6890a350c7829adf15863566"
+SRC_URI[sha256sum] = "ff22df16587ed823ddbd422ef92492737e5a995a776413017c688f7b2f5cfb6b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
deleted file mode 100644
index 941825f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "4133d8cbf2bc90721a902e3abf8d700b"
-SRC_URI[sha256sum] = "7413cda659eb5b8d18b00b300d214b2d6912a1174ba09055710ef4243fa235b1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb
new file mode 100644
index 0000000..b956e1d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7454d404a0fd129dc26ddda889e18c81"
+SRC_URI[sha256sum] = "294d298024e333812504bbd269f104ac362e32f5b71b4bcc21591acd05cb52a1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
deleted file mode 100644
index 55ec070..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "45606f08a063ecca7a18d3aa7172a0b9"
-SRC_URI[sha256sum] = "968c1256ae207b2c972a97a6d80f675521bab2d9a63f1487c65c1488cdaaa9e0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb
new file mode 100644
index 0000000..65231bd
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "995e5b9cb696606596c4225ba9700ff9"
+SRC_URI[sha256sum] = "c445a5f538cec05c69d2a7838f22e18123f34d7217454984ff9c02a7072364f6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
deleted file mode 100644
index 5957d8d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "033bf193c4251a1d3a333ee781d65b02"
-SRC_URI[sha256sum] = "3913b62c517495eb80f15d47d0a8a27db3d42031ebdeb8c9eb6e8af0a05d5518"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
deleted file mode 100644
index f03ed57..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8f3dc3354297906d74ece9218feb8ee6"
-SRC_URI[sha256sum] = "b29ff9654b439a487fd8c195fc710f0e7c7151cd0dfaa881d6b3cdebd7ee5a8c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb
new file mode 100644
index 0000000..989a1a1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-or_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "1e0740a8cd00bd617decbca128e2cfc9"
+SRC_URI[sha256sum] = "af6d63813c6870ac5993860940f06c91611fed21cab87da34f7dc58d566fc751"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
deleted file mode 100644
index 3466818..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "d9e7e14145c99cc6d73b8fa5cc4ec9d0"
-SRC_URI[sha256sum] = "3392b9dab192d4c6844e4927f81a8b45ad7f099a4eee64025f0f917d9448da1a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb
new file mode 100644
index 0000000..be4888e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "14e1cfad168a0a3ed575ef6918deaf9e"
+SRC_URI[sha256sum] = "adfea7204e49f629aa1432364cbe876b2a40b339e4279fa9801d650d17920aaf"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
deleted file mode 100644
index e3d54fa..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "f64c928d07b745642aa3e7fb7adc56e5"
-SRC_URI[sha256sum] = "6b2387cc699b80360ec43e48f44a2600bff1bdf6c424ef3cdd6ed13813802b51"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb
new file mode 100644
index 0000000..afcd982
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "2a87ee81792fe17e0aaefbce043fa9b6"
+SRC_URI[sha256sum] = "651bdae9f95b09fa28db0dc6c47aec3271d628d2ba508797750a5dfbfdb6af8a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
deleted file mode 100644
index 9944c12..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "077f3e424ae219176c4a39cbc21f36b4"
-SRC_URI[sha256sum] = "4bcdd89faa32fcb5e0d51a5e6987de58250437191cb8f44d248ce03dd6b7cc11"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb
new file mode 100644
index 0000000..2524662
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "4ac6860f8dc1d4fd4eca3d4724d805d0"
+SRC_URI[sha256sum] = "c4c0744d55113c5cf6ecf9c4ca2a283f7b63a4d6ebd952b0c271f5932cb50120"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
deleted file mode 100644
index 00410d3..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5bf54a3c9081ab713dd2dc65b90364ad"
-SRC_URI[sha256sum] = "540c41fa445af03b6b8567cc268c55fd5923d4179c40c6b1dcdad51cfc264c0a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb
new file mode 100644
index 0000000..1d9cbbb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "9e34fb9be6d4875ab5f93221ef27d38b"
+SRC_URI[sha256sum] = "6f950c7eea881dbcd2f4ae4cce41f6ece38add5e511c741a6192c1431b6dc49f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
deleted file mode 100644
index 89ea185..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "d4f2b425ed92c865cf2460b86248e3b8"
-SRC_URI[sha256sum] = "9cf6980f8db99b1994c0bb93cb98b52022fe3acbb1ca669cdd00adda501903f9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb
new file mode 100644
index 0000000..224d76c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b24520463c1ea8f25eceb197620a5199"
+SRC_URI[sha256sum] = "5beeafba0a7a1cf2bb14de27cac8284ac713712c3584e2d056bda5fa10d754ae"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
deleted file mode 100644
index 1fa5e1c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "23af6ecc67918d668407f65352088060"
-SRC_URI[sha256sum] = "a0058912493ce8f9f8103a7f0d006ea55297af86c23932bf4c1df0f0f6065fd1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb
new file mode 100644
index 0000000..0db9efc
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "1989bc8f199424924d03987fb93eda72"
+SRC_URI[sha256sum] = "d086f67dc27bb06c194e12bc0f47e52b58584637916da61c42da977204d6739f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
deleted file mode 100644
index 23fa0e3..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "40319a20c369399a1a95b597c50cabc9"
-SRC_URI[sha256sum] = "20a6c9f6ffe85900bdc615e7f833586fbc51e49d0a68d46cc637f1af978515ef"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb
new file mode 100644
index 0000000..82900f3
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "402b2412a87c468a2ab5c106f40decd6"
+SRC_URI[sha256sum] = "d61806e7f8080d3fe3b57baf9448ccbf74fb9a668365518322b0fd2fe67a75e2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
deleted file mode 100644
index 5d5a807..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "90999b92bb9c55127416effde548cdaa"
-SRC_URI[sha256sum] = "88b5b496bc14b392ff9f0d4105cc89cee74663f7976101ceb36052a89121ce16"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb
new file mode 100644
index 0000000..2b26f93
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-si_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "c05a70a624034541c4300429820db864"
+SRC_URI[sha256sum] = "4d48d93f3a97a0b2853c1aacffb726bf49c32822069904fe419ff3fb9f04bcbd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
deleted file mode 100644
index c497a9e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "939d58242cd50b247e6293705519e955"
-SRC_URI[sha256sum] = "2f58012a0f4cd304a920392674096db784bceee5fd5b6e2766130836fe080d55"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb
new file mode 100644
index 0000000..231bd7d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "a9e5ba044e1be63c712b4918eab512bb"
+SRC_URI[sha256sum] = "f1b47a7c848a1d25f5bb3744497a94807e550c96e2ce34f06a07055e0eb5879b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
deleted file mode 100644
index b2e6d1e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "7ef90cf8408341bf6d94efffb96275d6"
-SRC_URI[sha256sum] = "b5ea8d81cecf8dd0608dda3c54d07d928d5fdb235ff689338e8baf127a47ccb2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb
new file mode 100644
index 0000000..51354e5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "75ef053f058810024dec94035b0c93ef"
+SRC_URI[sha256sum] = "c663bf7ec450a45c3c1ee7a46e89facfc43717831e014f077e4fb994bbcfbd1b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
deleted file mode 100644
index 8de1434..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "3deaa5b6f52d5e5677da30f1a66c03ac"
-SRC_URI[sha256sum] = "f636b42f13657546f6086f52aea799f899f4d0c316dc825240b759db7e41c08e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb
new file mode 100644
index 0000000..10e814a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-son_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "40edd000dc65fd886a562908cb1d8546"
+SRC_URI[sha256sum] = "305df206828887322e4f3d4c689224e1187e2a13b16dbcad898b2a3aeff5f25e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
deleted file mode 100644
index 51e7c94..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "aed0b2c05e4ba8145182122ee1f7e391"
-SRC_URI[sha256sum] = "c3a8d6154da20f45417cbc2a8ea1506426c84b604d6d5f4e0b2e1c4ff3ed4597"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb
new file mode 100644
index 0000000..aef40ba
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "be9dfcfad0864437c7e3556c99f8ac9a"
+SRC_URI[sha256sum] = "2674faca4612734588e56946796c58725016082689e026ca8b805249447c97c2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
deleted file mode 100644
index fa65efb..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "dd559e81b95d9743d585b8b843a88c89"
-SRC_URI[sha256sum] = "47eb3ae29732d71408eaacd2d2346f3b8d6a844eb3c058e26f62f18057081e3b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb
new file mode 100644
index 0000000..4104cfe
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "2703e285bbfc2a622ae0d112516eed73"
+SRC_URI[sha256sum] = "499f11c6a5f8dad76dda59bab9007daddae5a878e16e2a6fc4da46319dc66644"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
deleted file mode 100644
index 5ee613e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "851871dc4c8f5a83cc4cf98ff6e53e08"
-SRC_URI[sha256sum] = "b8c52caed67af9850c4b54d1ab8ab84a984d361c1531260d6560aab23b002553"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb
new file mode 100644
index 0000000..61193af
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "1249eae2178150978dd699dda16a65d1"
+SRC_URI[sha256sum] = "536084e596a969fc8d26c497b1155a3a41f393cd86fb8c962e75b142247dbe11"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
deleted file mode 100644
index db77c7d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "71551c25e780f052547d7ccc648a5640"
-SRC_URI[sha256sum] = "c8b0774f386e378237af65aa7bb034bb1abda1e4b6b02b53d30fa4b50c09fbdb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
deleted file mode 100644
index ddc3cff..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "3a688b30114da995660462f0cf8751b4"
-SRC_URI[sha256sum] = "122e636e6f32e5fca5c99a4bb088e5f9eaffd71d0aca739a8e19fb9a339adf23"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb
new file mode 100644
index 0000000..de61cd0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "66331b24b78504b6852a03f28e3cb0de"
+SRC_URI[sha256sum] = "639fb75e4d13ac50db0e70d35a92571353339c004a8bcf2ebb5e348896f57d67"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
deleted file mode 100644
index 9ac073a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "fb34a6ce053fd6d5134e1304f853ef25"
-SRC_URI[sha256sum] = "1664e90a12b04ce01de0a496ff844cedfc3c99a781067f823f1ef2d6c7dad36d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb
new file mode 100644
index 0000000..5ff9f41
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-te_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "495cf4ef07cfeaa8cadf67e9c3fce19c"
+SRC_URI[sha256sum] = "3b73a6b26d29260599d2d2b24a7bc0809a644de1e8347e60ffd4c5014109d0dc"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
deleted file mode 100644
index 30b64ac..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "911b8d155e48215f6fbf1ae839a4acec"
-SRC_URI[sha256sum] = "c8e771db33a32763d9772e8c7e27887d15ca2bf9068415d21d8dff8147fcccca"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb
new file mode 100644
index 0000000..b75d181
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-th_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ed06d876015e36233d1c0fedc7f0fd5b"
+SRC_URI[sha256sum] = "a5975df8f977fcfc7e36a2ea53db17d15d1a409f1757922cf02e08895564a054"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
deleted file mode 100644
index 3d59f6a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ea3fa8983c858f090dbefe7ab0b4e10b"
-SRC_URI[sha256sum] = "2b05d41c7e8013166b69f5d89387760636efc44a23cb30f6dd822ece6442c9d2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb
new file mode 100644
index 0000000..29f0139
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "0e23be6e06d6fb4bc489dffa377be071"
+SRC_URI[sha256sum] = "9f508923bdcd00b802bb9fb6d20cbd69ca87ba441e9119ffb76b243d7ebb78b4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
deleted file mode 100644
index c75b7cf..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "59fb5f10fcece7167021840b4856beed"
-SRC_URI[sha256sum] = "ab75b09462fe0addde32aebbf57a905c7f248e43aab130fbcce0d5450684d3aa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb
new file mode 100644
index 0000000..2d8d596
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "180b92774aa07443f551806db7695635"
+SRC_URI[sha256sum] = "7b7b1216c9a5633ff4b4cb2eabbc3b36c01e81e7a46d3261e9251fef330a8311"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb
new file mode 100644
index 0000000..3afd95c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uz_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ad4ad50ffb633eeaff2a51642840eeaa"
+SRC_URI[sha256sum] = "a3665c8972749057b3cc68a7191d2b358a96ed05e9f3dd21a05fc83dc8e2559d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
deleted file mode 100644
index bb0f12d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "842bf546fcdf02f6d8ee46f808e3bf5c"
-SRC_URI[sha256sum] = "000dead139dbff4415ad2d926f669e5a22afa9de8ffb209c47cb61c6c6322f87"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb
new file mode 100644
index 0000000..e3b1531
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "e32df30e19a4d93f9d0b59ba5090f34c"
+SRC_URI[sha256sum] = "99abed00052cce52ddcd65a2edaa95b0311c75d3522b4784760d947ec7c2e41f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb
new file mode 100644
index 0000000..17b13fe
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-xh_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "a4d081d68debdc63d48ad3b5ae486858"
+SRC_URI[sha256sum] = "625db0cf3bc1b23a1fb1b49c21bfbb1671c4fea84db64ca6d0582d817efda419"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
deleted file mode 100644
index f5b329d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "198b459a7b52d4a7488a7e47b1231f5b"
-SRC_URI[sha256sum] = "229e4467145b3f44b0eaef711e1c79b60aff5cd48691ebeb5d73a171d911e3e9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb
new file mode 100644
index 0000000..6146820
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "31f5800936c2b7b1f104e5c4013bf265"
+SRC_URI[sha256sum] = "02ac98674f658a239c264b0631d1339e8c454f444fa9261db64f250033eccfac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
deleted file mode 100644
index 1e71a37..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "f503ea2dd25203e70c9faf2a65e20fa3"
-SRC_URI[sha256sum] = "2a51a0440d67c3e5067fab99ffed2f8142f058f10910d72b0fec4a461c33d04c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb
new file mode 100644
index 0000000..726fad0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_38.2.1esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "bd5474f4afe478a3ef54f0df8356c4f7"
+SRC_URI[sha256sum] = "3fe5c8582898d0b7a030028700a58f0d7313a0c9edf88568d176175dd7c3f40c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb
deleted file mode 100644
index c319a2b..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "7d9d9d7a48a7e4bec69bc12a554210d2"
-SRC_URI[sha256sum] = "c91bfecf01d45e6c36dd31a5eacee1e5b6a2262dafb19a43da60beb8da6da747"
diff --git a/recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch b/recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch
deleted file mode 100644
index e00d2d5..0000000
--- a/recipes-mozilla/firefox/firefox/Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-firefox crashes with a fix SIGILL abort on start.
-
-This seems to happen only in some setups. (e.g. with gcc provided from
-meta-linaro, 4.8.3, with a meta-fsl-arm setup + meta-browser firefox
-starts correctly (with gcc from oe, meta-oe, 4.8.2))
-
-The following patch fixes this:
-https://hg.mozilla.org/integration/mozilla-inbound/rev/f9be5a3d9b3c
-
-Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
-
-# HG changeset patch
-# User Kartikaya Gupta <kgupta@mozilla.com>
-# Date 1356843815 18000
-# Node ID f9be5a3d9b3ce26ad94e31a4c0275fee19db7ca8
-# Parent  414b431ad3fa831ecf5bf69abd3b5cb8670781db
-Bug 803601 - Prevent SIGILL crashes on ARMv6 builds built with the NDK r8c toolchain (gcc-4.6, gold). r=mjrosenb
-
-diff --git a/js/src/methodjit/MethodJIT.cpp b/js/src/methodjit/MethodJIT.cpp
---- a/js/src/methodjit/MethodJIT.cpp
-+++ b/js/src/methodjit/MethodJIT.cpp
-@@ -671,8 +671,10 @@
-   ".align 2\n" \
-   ".thumb\n" \
-   ".thumb_func\n"
-+#define BRANCH_AND_LINK(x) "blx " x
- #else
- #define FUNCTION_HEADER_EXTRA
-+#define BRANCH_AND_LINK(x) "bl " x
- #endif
- 
- asm (
-@@ -731,9 +733,9 @@
- "   mov     r10, r1"                            "\n"
- 
- "   mov     r0, sp"                             "\n"
--"   blx  " SYMBOL_STRING_VMFRAME(SetVMFrameRegs)   "\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(SetVMFrameRegs)) "\n "
- "   mov     r0, sp"                             "\n"
--"   blx  " SYMBOL_STRING_VMFRAME(PushActiveVMFrame)"\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PushActiveVMFrame)) "\n"
- 
-     /* Call the compiled JavaScript function. */
- "   bx     r4"                                  "\n"
-@@ -748,7 +750,7 @@
- 
-     /* Tidy up. */
- "   mov     r0, sp"                         "\n"
--"   blx  " SYMBOL_STRING_VMFRAME(PopActiveVMFrame) "\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PopActiveVMFrame)) "\n"
- 
-     /* Skip past the parameters we pushed (such as cx and the like). */
- "   add     sp, sp, #(4*7 + 4*6)"           "\n"
-@@ -767,7 +769,7 @@
- "   mov     r0, sp"                         "\n"
- 
-     /* Call the utility function that sets up the internal throw routine. */
--"   blx  " SYMBOL_STRING_RELOC(js_InternalThrow) "\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_RELOC(js_InternalThrow)) "\n"
-     
-     /* If js_InternalThrow found a scripted handler, jump to it. Otherwise, tidy
-      * up and return. */
-@@ -777,7 +779,7 @@
- 
-     /* Tidy up, then return '0' to represent an unhandled exception. */
- "   mov     r0, sp"                         "\n"
--"   blx  " SYMBOL_STRING_VMFRAME(PopActiveVMFrame) "\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PopActiveVMFrame)) "\n"
- "   add     sp, sp, #(4*7 + 4*6)"           "\n"
- "   mov     r0, #0"                         "\n"
- "   pop     {r4-r11,pc}"                    "\n"
-@@ -801,7 +803,7 @@
- "   mov     r2, r0"                         "\n"    /* returnReg */
- "   mov     r1, r5"                         "\n"    /* returnType */
- "   mov     r0, r4"                         "\n"    /* returnData */
--"   blx  " SYMBOL_STRING_RELOC(js_InternalInterpret) "\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_RELOC(js_InternalInterpret)) "\n"
- "   cmp     r0, #0"                         "\n"
- "   ldr     r10, [sp, #(4*7)]"              "\n"    /* Load (StackFrame*)f->regs->fp_ */
- "   ldrd    r4, r5, [r10, #(4*6)]"          "\n"    /* Load rval payload and type. */
-@@ -810,7 +812,7 @@
- "   bxne    r0"                             "\n"
-     /* Tidy up, then return 0. */
- "   mov     r0, sp"                         "\n"
--"   blx  " SYMBOL_STRING_VMFRAME(PopActiveVMFrame) "\n"
-+"   " BRANCH_AND_LINK(SYMBOL_STRING_VMFRAME(PopActiveVMFrame)) "\n"
- "   add     sp, sp, #(4*7 + 4*6)"           "\n"
- "   mov     r0, #0"                         "\n"
- "   pop     {r4-r11,pc}"                    "\n"
diff --git a/recipes-mozilla/firefox/firefox/alignment.patch b/recipes-mozilla/firefox/firefox/alignment.patch
deleted file mode 100644
index f5d5b7c..0000000
--- a/recipes-mozilla/firefox/firefox/alignment.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-In some setups firefox crashes because of wrongly aligned variables
-Observed on a ARM Cortex-A9 target.
-
-Upstream-Status: Pending
-
-Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
---- mozilla-release/ipc/ipdl/ipdl/cxx/cgen.py~	2012-07-29 11:14:45.000000000 +0200
-+++ mozilla-release/ipc/ipdl/ipdl/cxx/cgen.py	2012-07-29 11:13:36.000000000 +0200
-@@ -107,7 +107,7 @@
-             self.println(';')
-         self.dedent()
- 
--        self.printdent('}')
-+        self.printdent('} __attribute__ ((aligned (__BIGGEST_ALIGNMENT__)))')
- 
- 
-     def visitTypedef(self, td):
diff --git a/recipes-mozilla/firefox/firefox/configure.patch b/recipes-mozilla/firefox/firefox/configure.patch
deleted file mode 100644
index 966b728..0000000
--- a/recipes-mozilla/firefox/firefox/configure.patch
+++ /dev/null
@@ -1,7345 +0,0 @@
-diff --git a/configure b/configure
-index 4855c99..a5282b6 100755
---- a/configure
-+++ b/configure
-@@ -54,6 +54,8 @@ ac_help="$ac_help
-                               600: Windows Vista
-                               601: Windows 7"
- ac_help="$ac_help
-+  --with-system-ply       Use system installed python ply library"
-+ac_help="$ac_help
-   --enable-macos-target=VER (default=10.5)
-                           Set the minimum MacOS version needed at runtime"
- ac_help="$ac_help
-@@ -998,7 +1000,7 @@ else { echo "configure: error: can not run $ac_config_sub" 1>&2; exit 1; }
- fi
- 
- echo $ac_n "checking host system type""... $ac_c" 1>&6
--echo "configure:1002: checking host system type" >&5
-+echo "configure:1004: checking host system type" >&5
- 
- host_alias=$host
- case "$host_alias" in
-@@ -1019,7 +1021,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
- echo "$ac_t""$host" 1>&6
- 
- echo $ac_n "checking target system type""... $ac_c" 1>&6
--echo "configure:1023: checking target system type" >&5
-+echo "configure:1025: checking target system type" >&5
- 
- target_alias=$target
- case "$target_alias" in
-@@ -1037,7 +1039,7 @@ target_os=`echo $target | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
- echo "$ac_t""$target" 1>&6
- 
- echo $ac_n "checking build system type""... $ac_c" 1>&6
--echo "configure:1041: checking build system type" >&5
-+echo "configure:1043: checking build system type" >&5
- 
- build_alias=$build
- case "$build_alias" in
-@@ -1117,7 +1119,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1121: checking for $ac_word" >&5
-+echo "configure:1123: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_AWK'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1247,7 +1249,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1251: checking for $ac_word" >&5
-+echo "configure:1253: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PERL'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1405,7 +1407,7 @@ case "$target" in
- 
-     if test -z "$android_toolchain" ; then
-         echo $ac_n "checking for android toolchain directory""... $ac_c" 1>&6
--echo "configure:1409: checking for android toolchain directory" >&5
-+echo "configure:1411: checking for android toolchain directory" >&5
- 
-         kernel_name=`uname -s | tr "[:upper:]" "[:lower:]"`
- 
-@@ -1425,7 +1427,7 @@ echo "configure:1409: checking for android toolchain directory" >&5
- 
-     if test -z "$android_platform" ; then
-         echo $ac_n "checking for android platform directory""... $ac_c" 1>&6
--echo "configure:1429: checking for android platform directory" >&5
-+echo "configure:1431: checking for android platform directory" >&5
- 
-         android_platform="$android_ndk"/build/platforms/android-"$android_version"/arch-"$target_cpu"
- 
-@@ -1497,7 +1499,7 @@ EOF
-     # Extract the first word of "objcopy", so it can be a program name with args.
- set dummy objcopy; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1501: checking for $ac_word" >&5
-+echo "configure:1503: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_OBJCOPY'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1554,13 +1556,13 @@ if test -n "$CROSS_COMPILE" -a "$target" != "$host"; then
-     _SAVE_LDFLAGS="$LDFLAGS"
- 
-     echo $ac_n "checking for host c compiler""... $ac_c" 1>&6
--echo "configure:1558: checking for host c compiler" >&5
-+echo "configure:1560: checking for host c compiler" >&5
-     for ac_prog in $HOST_CC gcc cc /usr/ucb/cc cl icc
- do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1564: checking for $ac_word" >&5
-+echo "configure:1566: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_HOST_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1595,13 +1597,13 @@ test -n "$HOST_CC" || HOST_CC=""""
-     fi
-     echo "$ac_t""$HOST_CC" 1>&6
-     echo $ac_n "checking for host c++ compiler""... $ac_c" 1>&6
--echo "configure:1599: checking for host c++ compiler" >&5
-+echo "configure:1601: checking for host c++ compiler" >&5
-     for ac_prog in $HOST_CXX $CCC c++ g++ gcc CC cxx cc++ cl icc
- do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1605: checking for $ac_word" >&5
-+echo "configure:1607: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_HOST_CXX'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1653,7 +1655,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1657: checking for $ac_word" >&5
-+echo "configure:1659: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_HOST_RANLIB'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1688,7 +1690,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1692: checking for $ac_word" >&5
-+echo "configure:1694: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_HOST_AR'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1723,16 +1725,16 @@ test -n "$HOST_AR" || HOST_AR="ar"
-     LDFLAGS="$HOST_LDFLAGS"
- 
-     echo $ac_n "checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works""... $ac_c" 1>&6
--echo "configure:1727: checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works" >&5
-+echo "configure:1729: checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works" >&5
-     cat > conftest.$ac_ext <<EOF
--#line 1729 "configure"
-+#line 1731 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:1736: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:1738: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_prog_hostcc_works=1 echo "$ac_t""yes" 1>&6
- else
-@@ -1747,16 +1749,16 @@ rm -f conftest*
-     CFLAGS="$HOST_CXXFLAGS"
- 
-     echo $ac_n "checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works""... $ac_c" 1>&6
--echo "configure:1751: checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works" >&5
-+echo "configure:1753: checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works" >&5
-     cat > conftest.$ac_ext <<EOF
--#line 1753 "configure"
-+#line 1755 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:1760: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:1762: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_prog_hostcxx_works=1 echo "$ac_t""yes" 1>&6
- else
-@@ -1785,7 +1787,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1789: checking for $ac_word" >&5
-+echo "configure:1791: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1819,7 +1821,7 @@ test -n "$CC" || CC=":"
-     # Extract the first word of "gcc", so it can be a program name with args.
- set dummy gcc; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1823: checking for $ac_word" >&5
-+echo "configure:1825: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1849,7 +1851,7 @@ if test -z "$CC"; then
-   # Extract the first word of "cc", so it can be a program name with args.
- set dummy cc; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1853: checking for $ac_word" >&5
-+echo "configure:1855: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1900,7 +1902,7 @@ fi
-       # Extract the first word of "cl", so it can be a program name with args.
- set dummy cl; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:1904: checking for $ac_word" >&5
-+echo "configure:1906: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1932,7 +1934,7 @@ fi
- fi
- 
- echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works""... $ac_c" 1>&6
--echo "configure:1936: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
-+echo "configure:1938: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
- 
- ac_ext=c
- # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -1943,12 +1945,12 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- cat > conftest.$ac_ext << EOF
- 
--#line 1947 "configure"
-+#line 1949 "configure"
- #include "confdefs.h"
- 
- main(){return(0);}
- EOF
--if { (eval echo configure:1952: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:1954: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   ac_cv_prog_cc_works=yes
-   # If we can't run a trivial program, we are probably using a cross compiler.
-   if (./conftest; exit) 2>/dev/null; then
-@@ -1974,12 +1976,12 @@ if test $ac_cv_prog_cc_works = no; then
-   { echo "configure: error: installation or configuration problem: C compiler cannot create executables." 1>&2; exit 1; }
- fi
- echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
--echo "configure:1978: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
-+echo "configure:1980: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
- echo "$ac_t""$ac_cv_prog_cc_cross" 1>&6
- cross_compiling=$ac_cv_prog_cc_cross
- 
- echo $ac_n "checking whether we are using GNU C""... $ac_c" 1>&6
--echo "configure:1983: checking whether we are using GNU C" >&5
-+echo "configure:1985: checking whether we are using GNU C" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_gcc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -1988,7 +1990,7 @@ else
-   yes;
- #endif
- EOF
--if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:1992: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-+if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:1994: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-   ac_cv_prog_gcc=yes
- else
-   ac_cv_prog_gcc=no
-@@ -2007,7 +2009,7 @@ ac_test_CFLAGS="${CFLAGS+set}"
- ac_save_CFLAGS="$CFLAGS"
- CFLAGS=
- echo $ac_n "checking whether ${CC-cc} accepts -g""... $ac_c" 1>&6
--echo "configure:2011: checking whether ${CC-cc} accepts -g" >&5
-+echo "configure:2013: checking whether ${CC-cc} accepts -g" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_cc_g'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2043,7 +2045,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2047: checking for $ac_word" >&5
-+echo "configure:2049: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2079,7 +2081,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2083: checking for $ac_word" >&5
-+echo "configure:2085: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2111,7 +2113,7 @@ test -n "$CXX" || CXX="gcc"
- 
- 
- echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works""... $ac_c" 1>&6
--echo "configure:2115: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
-+echo "configure:2117: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
- 
- ac_ext=C
- # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -2122,12 +2124,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
- 
- cat > conftest.$ac_ext << EOF
- 
--#line 2126 "configure"
-+#line 2128 "configure"
- #include "confdefs.h"
- 
- int main(){return(0);}
- EOF
--if { (eval echo configure:2131: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:2133: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   ac_cv_prog_cxx_works=yes
-   # If we can't run a trivial program, we are probably using a cross compiler.
-   if (./conftest; exit) 2>/dev/null; then
-@@ -2153,12 +2155,12 @@ if test $ac_cv_prog_cxx_works = no; then
-   { echo "configure: error: installation or configuration problem: C++ compiler cannot create executables." 1>&2; exit 1; }
- fi
- echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
--echo "configure:2157: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
-+echo "configure:2159: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
- echo "$ac_t""$ac_cv_prog_cxx_cross" 1>&6
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking whether we are using GNU C++""... $ac_c" 1>&6
--echo "configure:2162: checking whether we are using GNU C++" >&5
-+echo "configure:2164: checking whether we are using GNU C++" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_gxx'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2167,7 +2169,7 @@ else
-   yes;
- #endif
- EOF
--if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2171: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-+if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2173: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-   ac_cv_prog_gxx=yes
- else
-   ac_cv_prog_gxx=no
-@@ -2186,7 +2188,7 @@ ac_test_CXXFLAGS="${CXXFLAGS+set}"
- ac_save_CXXFLAGS="$CXXFLAGS"
- CXXFLAGS=
- echo $ac_n "checking whether ${CXX-g++} accepts -g""... $ac_c" 1>&6
--echo "configure:2190: checking whether ${CXX-g++} accepts -g" >&5
-+echo "configure:2192: checking whether ${CXX-g++} accepts -g" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_cxx_g'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2227,7 +2229,7 @@ for ac_declaration in \
-    'void exit (int);'
- do
-   cat > conftest.$ac_ext <<EOF
--#line 2231 "configure"
-+#line 2233 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- $ac_declaration
-@@ -2235,7 +2237,7 @@ int main() {
- exit (42);
- ; return 0; }
- EOF
--if { (eval echo configure:2239: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:2241: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -2245,14 +2247,14 @@ else
- fi
- rm -f conftest*
-   cat > conftest.$ac_ext <<EOF
--#line 2249 "configure"
-+#line 2251 "configure"
- #include "confdefs.h"
- $ac_declaration
- int main() {
- exit (42);
- ; return 0; }
- EOF
--if { (eval echo configure:2256: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:2258: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   break
- else
-@@ -2281,7 +2283,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2285: checking for $ac_word" >&5
-+echo "configure:2287: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_RANLIB'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2316,7 +2318,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2320: checking for $ac_word" >&5
-+echo "configure:2322: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_AR'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2351,7 +2353,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2355: checking for $ac_word" >&5
-+echo "configure:2357: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_AS'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2405,7 +2407,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2409: checking for $ac_word" >&5
-+echo "configure:2411: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_LD'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2440,7 +2442,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2444: checking for $ac_word" >&5
-+echo "configure:2446: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_STRIP'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2475,7 +2477,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2479: checking for $ac_word" >&5
-+echo "configure:2481: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_WINDRES'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2513,7 +2515,7 @@ else
-     # Extract the first word of "gcc", so it can be a program name with args.
- set dummy gcc; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2517: checking for $ac_word" >&5
-+echo "configure:2519: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2543,7 +2545,7 @@ if test -z "$CC"; then
-   # Extract the first word of "cc", so it can be a program name with args.
- set dummy cc; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2547: checking for $ac_word" >&5
-+echo "configure:2549: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2594,7 +2596,7 @@ fi
-       # Extract the first word of "cl", so it can be a program name with args.
- set dummy cl; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2598: checking for $ac_word" >&5
-+echo "configure:2600: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2626,7 +2628,7 @@ fi
- fi
- 
- echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works""... $ac_c" 1>&6
--echo "configure:2630: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
-+echo "configure:2632: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
- 
- ac_ext=c
- # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -2637,12 +2639,12 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- cat > conftest.$ac_ext << EOF
- 
--#line 2641 "configure"
-+#line 2643 "configure"
- #include "confdefs.h"
- 
- main(){return(0);}
- EOF
--if { (eval echo configure:2646: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:2648: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   ac_cv_prog_cc_works=yes
-   # If we can't run a trivial program, we are probably using a cross compiler.
-   if (./conftest; exit) 2>/dev/null; then
-@@ -2668,12 +2670,12 @@ if test $ac_cv_prog_cc_works = no; then
-   { echo "configure: error: installation or configuration problem: C compiler cannot create executables." 1>&2; exit 1; }
- fi
- echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
--echo "configure:2672: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
-+echo "configure:2674: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
- echo "$ac_t""$ac_cv_prog_cc_cross" 1>&6
- cross_compiling=$ac_cv_prog_cc_cross
- 
- echo $ac_n "checking whether we are using GNU C""... $ac_c" 1>&6
--echo "configure:2677: checking whether we are using GNU C" >&5
-+echo "configure:2679: checking whether we are using GNU C" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_gcc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2682,7 +2684,7 @@ else
-   yes;
- #endif
- EOF
--if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:2686: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-+if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:2688: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-   ac_cv_prog_gcc=yes
- else
-   ac_cv_prog_gcc=no
-@@ -2701,7 +2703,7 @@ ac_test_CFLAGS="${CFLAGS+set}"
- ac_save_CFLAGS="$CFLAGS"
- CFLAGS=
- echo $ac_n "checking whether ${CC-cc} accepts -g""... $ac_c" 1>&6
--echo "configure:2705: checking whether ${CC-cc} accepts -g" >&5
-+echo "configure:2707: checking whether ${CC-cc} accepts -g" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_cc_g'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2737,7 +2739,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2741: checking for $ac_word" >&5
-+echo "configure:2743: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2769,7 +2771,7 @@ test -n "$CXX" || CXX="gcc"
- 
- 
- echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works""... $ac_c" 1>&6
--echo "configure:2773: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
-+echo "configure:2775: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
- 
- ac_ext=C
- # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -2780,12 +2782,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
- 
- cat > conftest.$ac_ext << EOF
- 
--#line 2784 "configure"
-+#line 2786 "configure"
- #include "confdefs.h"
- 
- int main(){return(0);}
- EOF
--if { (eval echo configure:2789: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:2791: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   ac_cv_prog_cxx_works=yes
-   # If we can't run a trivial program, we are probably using a cross compiler.
-   if (./conftest; exit) 2>/dev/null; then
-@@ -2811,12 +2813,12 @@ if test $ac_cv_prog_cxx_works = no; then
-   { echo "configure: error: installation or configuration problem: C++ compiler cannot create executables." 1>&2; exit 1; }
- fi
- echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
--echo "configure:2815: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
-+echo "configure:2817: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
- echo "$ac_t""$ac_cv_prog_cxx_cross" 1>&6
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking whether we are using GNU C++""... $ac_c" 1>&6
--echo "configure:2820: checking whether we are using GNU C++" >&5
-+echo "configure:2822: checking whether we are using GNU C++" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_gxx'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2825,7 +2827,7 @@ else
-   yes;
- #endif
- EOF
--if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2829: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-+if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2831: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
-   ac_cv_prog_gxx=yes
- else
-   ac_cv_prog_gxx=no
-@@ -2844,7 +2846,7 @@ ac_test_CXXFLAGS="${CXXFLAGS+set}"
- ac_save_CXXFLAGS="$CXXFLAGS"
- CXXFLAGS=
- echo $ac_n "checking whether ${CXX-g++} accepts -g""... $ac_c" 1>&6
--echo "configure:2848: checking whether ${CXX-g++} accepts -g" >&5
-+echo "configure:2850: checking whether ${CXX-g++} accepts -g" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_cxx_g'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2885,7 +2887,7 @@ for ac_declaration in \
-    'void exit (int);'
- do
-   cat > conftest.$ac_ext <<EOF
--#line 2889 "configure"
-+#line 2891 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- $ac_declaration
-@@ -2893,7 +2895,7 @@ int main() {
- exit (42);
- ; return 0; }
- EOF
--if { (eval echo configure:2897: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:2899: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -2903,14 +2905,14 @@ else
- fi
- rm -f conftest*
-   cat > conftest.$ac_ext <<EOF
--#line 2907 "configure"
-+#line 2909 "configure"
- #include "confdefs.h"
- $ac_declaration
- int main() {
- exit (42);
- ; return 0; }
- EOF
--if { (eval echo configure:2914: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:2916: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   break
- else
-@@ -2929,7 +2931,7 @@ fi
-     # Extract the first word of "ranlib", so it can be a program name with args.
- set dummy ranlib; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2933: checking for $ac_word" >&5
-+echo "configure:2935: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_RANLIB'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -2961,7 +2963,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:2965: checking for $ac_word" >&5
-+echo "configure:2967: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_AS'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3015,7 +3017,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:3019: checking for $ac_word" >&5
-+echo "configure:3021: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_AR'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3050,7 +3052,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:3054: checking for $ac_word" >&5
-+echo "configure:3056: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_LD'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3085,7 +3087,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:3089: checking for $ac_word" >&5
-+echo "configure:3091: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_STRIP'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3120,7 +3122,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:3124: checking for $ac_word" >&5
-+echo "configure:3126: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_WINDRES'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3268,7 +3270,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:3272: checking for $ac_word" >&5
-+echo "configure:3274: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_MIDL'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3310,14 +3312,14 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
- cross_compiling=$ac_cv_prog_cc_cross
- 
-         cat > conftest.$ac_ext <<EOF
--#line 3314 "configure"
-+#line 3316 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
-  printf("Hello World\n"); 
- ; return 0; }
- EOF
--if { (eval echo configure:3321: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3323: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -3335,14 +3337,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-         cat > conftest.$ac_ext <<EOF
--#line 3339 "configure"
-+#line 3341 "configure"
- #include "confdefs.h"
- #include <new.h>
- int main() {
-  unsigned *test = new unsigned(42); 
- ; return 0; }
- EOF
--if { (eval echo configure:3346: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3348: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -3473,7 +3475,7 @@ EOF
-         _MIDL_REV_VERSION=`echo ${_MIDL_FULL_VERSION} | $AWK -F\. '{ print $3 }'`
-         # Add flags if necessary
-         echo $ac_n "checking for midl flags""... $ac_c" 1>&6
--echo "configure:3477: checking for midl flags" >&5
-+echo "configure:3479: checking for midl flags" >&5
-         case "$target" in
-         i*86-*)
-             if test \( "$_MIDL_MAJOR_VERSION" = "7" -a "$_MIDL_MINOR_VERSION" = "00" -a "$_MIDL_REV_VERSION" = "0499" \); then
-@@ -3500,19 +3502,19 @@ echo "configure:3477: checking for midl flags" >&5
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3504: checking for $ac_hdr" >&5
-+echo "configure:3506: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 3509 "configure"
-+#line 3511 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3516: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3518: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -3544,7 +3546,7 @@ EOF
-             # This is done because the Windows 7 beta SDK reports its
-             # NTDDI_MAXVER to be 0x06000100 instead of 0x06010000, as it should
-             echo $ac_n "checking for highest Windows version supported by this SDK""... $ac_c" 1>&6
--echo "configure:3548: checking for highest Windows version supported by this SDK" >&5
-+echo "configure:3550: checking for highest Windows version supported by this SDK" >&5
- if eval "test \"`echo '$''{'ac_cv_winsdk_maxver'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3574,19 +3576,19 @@ echo "$ac_t""$ac_cv_winsdk_maxver" 1>&6
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:3578: checking for $ac_hdr" >&5
-+echo "configure:3580: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 3583 "configure"
-+#line 3585 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:3590: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3592: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -3623,7 +3625,7 @@ EOF
-         unset _MSVC_VER_FILTER
- 
-         echo $ac_n "checking for std::_Throw""... $ac_c" 1>&6
--echo "configure:3627: checking for std::_Throw" >&5
-+echo "configure:3629: checking for std::_Throw" >&5
- if eval "test \"`echo '$''{'ac_cv_have_std__Throw'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3639,14 +3641,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-                 _SAVE_CXXFLAGS="$CXXFLAGS"
-                 CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
-                 cat > conftest.$ac_ext <<EOF
--#line 3643 "configure"
-+#line 3645 "configure"
- #include "confdefs.h"
- #include <exception>
- int main() {
- std::_Throw(std::exception()); return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:3650: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3652: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_std__Throw="yes"
- else
-@@ -3671,7 +3673,7 @@ echo "$ac_t""$ac_cv_have_std__Throw" 1>&6
- 
-         if test "$ac_cv_have_std__Throw" = "yes"; then
-             echo $ac_n "checking for |class __declspec(dllimport) exception| bug""... $ac_c" 1>&6
--echo "configure:3675: checking for |class __declspec(dllimport) exception| bug" >&5
-+echo "configure:3677: checking for |class __declspec(dllimport) exception| bug" >&5
- if eval "test \"`echo '$''{'ac_cv_have_dllimport_exception_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3687,14 +3689,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-                     _SAVE_CXXFLAGS="$CXXFLAGS"
-                     CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
-                     cat > conftest.$ac_ext <<EOF
--#line 3691 "configure"
-+#line 3693 "configure"
- #include "confdefs.h"
- #include <vector>
- int main() {
- std::vector<int> v; return v.at(1);
- ; return 0; }
- EOF
--if { (eval echo configure:3698: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:3700: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_dllimport_exception_bug="no"
- else
-@@ -3726,7 +3728,7 @@ EOF
-             fi
-         else
-             echo $ac_n "checking for overridable _RAISE""... $ac_c" 1>&6
--echo "configure:3730: checking for overridable _RAISE" >&5
-+echo "configure:3732: checking for overridable _RAISE" >&5
- if eval "test \"`echo '$''{'ac_cv_have__RAISE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -3742,7 +3744,7 @@ cross_compiling=$ac_cv_prog_cxx_cross
-                     _SAVE_CXXFLAGS="$CXXFLAGS"
-                     CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
-                     cat > conftest.$ac_ext <<EOF
--#line 3746 "configure"
-+#line 3748 "configure"
- #include "confdefs.h"
- #include <xstddef>
-                                     #undef _RAISE
-@@ -3753,7 +3755,7 @@ int main() {
- std::vector<int> v; return v.at(1);
- ; return 0; }
- EOF
--if { (eval echo configure:3757: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3759: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have__RAISE="no"
- else
-@@ -3795,9 +3797,9 @@ EOF
-         _W32API_MAJOR_VERSION=`echo $W32API_VERSION | $AWK -F\. '{ print $1 }'`
-         _W32API_MINOR_VERSION=`echo $W32API_VERSION | $AWK -F\. '{ print $2 }'`
-         echo $ac_n "checking for w32api version >= $W32API_VERSION""... $ac_c" 1>&6
--echo "configure:3799: checking for w32api version >= $W32API_VERSION" >&5
-+echo "configure:3801: checking for w32api version >= $W32API_VERSION" >&5
-         cat > conftest.$ac_ext <<EOF
--#line 3801 "configure"
-+#line 3803 "configure"
- #include "confdefs.h"
- #include <w32api.h>
- int main() {
-@@ -3809,7 +3811,7 @@ int main() {
-             
- ; return 0; }
- EOF
--if { (eval echo configure:3813: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:3815: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-    res=yes 
- else
-@@ -3825,7 +3827,7 @@ rm -f conftest*
-         fi
-         # Check windres version
-         echo $ac_n "checking for windres version >= $WINDRES_VERSION""... $ac_c" 1>&6
--echo "configure:3829: checking for windres version >= $WINDRES_VERSION" >&5
-+echo "configure:3831: checking for windres version >= $WINDRES_VERSION" >&5
-         _WINDRES_VERSION=`${WINDRES} --version 2>&1 | grep -i windres 2>/dev/null | $AWK '{ print $3 }'`
-         echo "$ac_t""$_WINDRES_VERSION" 1>&6
-         _WINDRES_MAJOR_VERSION=`echo $_WINDRES_VERSION | $AWK -F\. '{ print $1 }'`
-@@ -3864,7 +3866,7 @@ EOF
-     # If the maximum version supported by this SDK is lower than the target
-     # version, error out
-     echo $ac_n "checking for Windows SDK being recent enough""... $ac_c" 1>&6
--echo "configure:3868: checking for Windows SDK being recent enough" >&5
-+echo "configure:3870: checking for Windows SDK being recent enough" >&5
-     if $PERL -e "exit(0x$MOZ_WINSDK_TARGETVER > $MOZ_WINSDK_MAXVER)"; then
-         echo "$ac_t"""yes"" 1>&6
-     else
-@@ -3893,7 +3895,7 @@ EOF
- esac
- 
- echo $ac_n "checking how to run the C preprocessor""... $ac_c" 1>&6
--echo "configure:3897: checking how to run the C preprocessor" >&5
-+echo "configure:3899: checking how to run the C preprocessor" >&5
- # On Suns, sometimes $CPP names a directory.
- if test -n "$CPP" && test -d "$CPP"; then
-   CPP=
-@@ -3908,13 +3910,13 @@ else
-   # On the NeXT, cc -E runs the code through the compiler's parser,
-   # not just through cpp.
-   cat > conftest.$ac_ext <<EOF
--#line 3912 "configure"
-+#line 3914 "configure"
- #include "confdefs.h"
- #include <assert.h>
- Syntax Error
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3918: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3920: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   :
-@@ -3925,13 +3927,13 @@ else
-   rm -rf conftest*
-   CPP="${CC-cc} -E -traditional-cpp"
-   cat > conftest.$ac_ext <<EOF
--#line 3929 "configure"
-+#line 3931 "configure"
- #include "confdefs.h"
- #include <assert.h>
- Syntax Error
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3935: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3937: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   :
-@@ -3942,13 +3944,13 @@ else
-   rm -rf conftest*
-   CPP="${CC-cc} -nologo -E"
-   cat > conftest.$ac_ext <<EOF
--#line 3946 "configure"
-+#line 3948 "configure"
- #include "confdefs.h"
- #include <assert.h>
- Syntax Error
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3952: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3954: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   :
-@@ -3973,7 +3975,7 @@ fi
- echo "$ac_t""$CPP" 1>&6
- 
- echo $ac_n "checking how to run the C++ preprocessor""... $ac_c" 1>&6
--echo "configure:3977: checking how to run the C++ preprocessor" >&5
-+echo "configure:3979: checking how to run the C++ preprocessor" >&5
- if test -z "$CXXCPP"; then
- if eval "test \"`echo '$''{'ac_cv_prog_CXXCPP'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -3986,12 +3988,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
-   CXXCPP="${CXX-g++} -E"
-   cat > conftest.$ac_ext <<EOF
--#line 3990 "configure"
-+#line 3992 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:3995: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:3997: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   :
-@@ -4068,7 +4070,7 @@ fi # COMPILE_ENVIRONMENT
- # SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
- # ./install, which can be erroneously created by make from ./install.sh.
- echo $ac_n "checking for a BSD compatible install""... $ac_c" 1>&6
--echo "configure:4072: checking for a BSD compatible install" >&5
-+echo "configure:4074: checking for a BSD compatible install" >&5
- if test -z "$INSTALL"; then
- if eval "test \"`echo '$''{'ac_cv_path_install'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -4121,7 +4123,7 @@ test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL_PROGRAM}'
- test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
- 
- echo $ac_n "checking whether ln -s works""... $ac_c" 1>&6
--echo "configure:4125: checking whether ln -s works" >&5
-+echo "configure:4127: checking whether ln -s works" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_LN_S'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4144,7 +4146,7 @@ fi
- 
- if test -z "$TINDERBOX_SKIP_PERL_VERSION_CHECK"; then
- echo $ac_n "checking for minimum required perl version >= $PERL_VERSION""... $ac_c" 1>&6
--echo "configure:4148: checking for minimum required perl version >= $PERL_VERSION" >&5
-+echo "configure:4150: checking for minimum required perl version >= $PERL_VERSION" >&5
- _perl_version=`PERL_VERSION=$PERL_VERSION $PERL -e 'print "$]"; if ($] >= $ENV{PERL_VERSION}) { exit(0); } else { exit(1); }' 2>&5`
- _perl_res=$?
- echo "$ac_t""$_perl_version" 1>&6
-@@ -4155,7 +4157,7 @@ fi
- fi
- 
- echo $ac_n "checking for full perl installation""... $ac_c" 1>&6
--echo "configure:4159: checking for full perl installation" >&5
-+echo "configure:4161: checking for full perl installation" >&5
- _perl_archlib=`$PERL -e 'use Config; if ( -d $Config{archlib} ) { exit(0); } else { exit(1); }' 2>&5`
- _perl_res=$?
- if test "$_perl_res" != 0; then
-@@ -4170,7 +4172,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4174: checking for $ac_word" >&5
-+echo "configure:4176: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PYTHON'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4222,6 +4224,25 @@ if test -z "$PYTHON"; then
-     { echo "configure: error: python was not found in \$PATH" 1>&2; exit 1; }
- fi
- 
-+# Check whether --with-system-ply or --without-system-ply was given.
-+if test "${with_system_ply+set}" = set; then
-+  withval="$with_system_ply"
-+  if test "$withval" = "yes"; then
-+    if $PYTHON -c 'import ply' 2>&5; then
-+         MOZ_SYSTEM_PLY=1
-+     else
-+         { echo "configure: error: python ply library is not found but --with-system-ply was requested" 1>&2; exit 1; }
-+     fi
-+  elif test "$withval" = "no"; then
-+    :
-+  else
-+    { echo "configure: error: Option, system-ply, does not take an argument ($withval)." 1>&2; exit 1; }
-+  fi
-+fi
-+
-+
-+
-+
- if test -z "$COMPILE_ENVIRONMENT"; then
-     NSINSTALL_BIN='$(PYTHON) $(topsrcdir)/config/nsinstall.py'
- fi
-@@ -4230,7 +4251,7 @@ fi
-  # Extract the first word of "doxygen", so it can be a program name with args.
- set dummy doxygen; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4234: checking for $ac_word" >&5
-+echo "configure:4255: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_DOXYGEN'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4279,7 +4300,7 @@ fi
-  # Extract the first word of "autoconf", so it can be a program name with args.
- set dummy autoconf; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4283: checking for $ac_word" >&5
-+echo "configure:4304: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_AUTOCONF'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4330,7 +4351,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4334: checking for $ac_word" >&5
-+echo "configure:4355: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_UNZIP'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4386,7 +4407,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4390: checking for $ac_word" >&5
-+echo "configure:4411: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_ZIP'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4440,7 +4461,7 @@ fi
-  # Extract the first word of "makedepend", so it can be a program name with args.
- set dummy makedepend; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4444: checking for $ac_word" >&5
-+echo "configure:4465: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_SYSTEM_MAKEDEPEND'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4488,7 +4509,7 @@ fi
-  # Extract the first word of "xargs", so it can be a program name with args.
- set dummy xargs; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4492: checking for $ac_word" >&5
-+echo "configure:4513: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_XARGS'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4540,7 +4561,7 @@ fi
-  # Extract the first word of "rpmbuild", so it can be a program name with args.
- set dummy rpmbuild; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4544: checking for $ac_word" >&5
-+echo "configure:4565: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_RPMBUILD'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4613,7 +4634,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4617: checking for $ac_word" >&5
-+echo "configure:4638: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PBBUILD'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4665,7 +4686,7 @@ done
-              # Extract the first word of "sdp", so it can be a program name with args.
- set dummy sdp; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4669: checking for $ac_word" >&5
-+echo "configure:4690: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_SDP'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4786,7 +4807,7 @@ tools are selected during the Xcode/Developer Tools installation." 1>&2; exit 1;
- 
-   
-   echo $ac_n "checking for valid compiler/Mac OS X SDK combination""... $ac_c" 1>&6
--echo "configure:4790: checking for valid compiler/Mac OS X SDK combination" >&5
-+echo "configure:4811: checking for valid compiler/Mac OS X SDK combination" >&5
-   ac_ext=C
- # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
- ac_cpp='$CXXCPP $CPPFLAGS'
-@@ -4795,14 +4816,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-   cat > conftest.$ac_ext <<EOF
--#line 4799 "configure"
-+#line 4820 "configure"
- #include "confdefs.h"
- #include <new>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:4806: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:4827: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   result=yes
- else
-@@ -4829,7 +4850,7 @@ fi
- fi # COMPILE_ENVIRONMENT
- 
- echo $ac_n "checking whether the C compiler is clang older than version 2.9""... $ac_c" 1>&6
--echo "configure:4833: checking whether the C compiler is clang older than version 2.9" >&5
-+echo "configure:4854: checking whether the C compiler is clang older than version 2.9" >&5
- 
- ac_ext=c
- # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -4839,7 +4860,7 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
- cross_compiling=$ac_cv_prog_cc_cross
- 
- cat > conftest.$ac_ext <<EOF
--#line 4843 "configure"
-+#line 4864 "configure"
- #include "confdefs.h"
- 
- #if defined(__clang__)
-@@ -4852,7 +4873,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:4856: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:4877: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   result="no"
- else
-@@ -4874,7 +4895,7 @@ if test "$result" = "yes"; then
-   MOZ_NO_THEORA_ASM=1
- fi
- echo $ac_n "checking bad gcc versions""... $ac_c" 1>&6
--echo "configure:4878: checking bad gcc versions" >&5
-+echo "configure:4899: checking bad gcc versions" >&5
- if `$CC --version | grep -q "Apple Inc. build 5658"`; then
-   echo "$ac_t""Apple build 5658" 1>&6
-   MOZ_NO_THEORA_ASM=1
-@@ -4901,7 +4922,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4905: checking for $ac_word" >&5
-+echo "configure:4926: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_GMAKE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -4957,7 +4978,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:4961: checking for $ac_word" >&5
-+echo "configure:4982: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_GMAKE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -5020,7 +5041,7 @@ if test "$COMPILE_ENVIRONMENT"; then
- # Uses ac_ vars as temps to allow command line to override cache and checks.
- # --without-x overrides everything else, but does not touch the cache.
- echo $ac_n "checking for X""... $ac_c" 1>&6
--echo "configure:5024: checking for X" >&5
-+echo "configure:5045: checking for X" >&5
- 
- # Check whether --with-x or --without-x was given.
- if test "${with_x+set}" = set; then
-@@ -5082,12 +5103,12 @@ if test "$ac_x_includes" = NO; then
- 
-   # First, try using that file with no special directory specified.
- cat > conftest.$ac_ext <<EOF
--#line 5086 "configure"
-+#line 5107 "configure"
- #include "confdefs.h"
- #include <$x_direct_test_include>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:5091: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:5112: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -5156,14 +5177,14 @@ if test "$ac_x_libraries" = NO; then
-   ac_save_LIBS="$LIBS"
-   LIBS="-l$x_direct_test_library $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5160 "configure"
-+#line 5181 "configure"
- #include "confdefs.h"
- 
- int main() {
- ${x_direct_test_function}()
- ; return 0; }
- EOF
--if { (eval echo configure:5167: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5188: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   LIBS="$ac_save_LIBS"
- # We can link X programs with no special library path.
-@@ -5269,17 +5290,17 @@ else
-     case "`(uname -sr) 2>/dev/null`" in
-     "SunOS 5"*)
-       echo $ac_n "checking whether -R must be followed by a space""... $ac_c" 1>&6
--echo "configure:5273: checking whether -R must be followed by a space" >&5
-+echo "configure:5294: checking whether -R must be followed by a space" >&5
-       ac_xsave_LIBS="$LIBS"; LIBS="$LIBS -R$x_libraries"
-       cat > conftest.$ac_ext <<EOF
--#line 5276 "configure"
-+#line 5297 "configure"
- #include "confdefs.h"
- 
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5283: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5304: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_R_nospace=yes
- else
-@@ -5295,14 +5316,14 @@ rm -f conftest*
-       else
- 	LIBS="$ac_xsave_LIBS -R $x_libraries"
- 	cat > conftest.$ac_ext <<EOF
--#line 5299 "configure"
-+#line 5320 "configure"
- #include "confdefs.h"
- 
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5306: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5327: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_R_space=yes
- else
-@@ -5334,7 +5355,7 @@ rm -f conftest*
-     # libraries were built with DECnet support.  And karl@cs.umb.edu says
-     # the Alpha needs dnet_stub (dnet does not exist).
-     echo $ac_n "checking for dnet_ntoa in -ldnet""... $ac_c" 1>&6
--echo "configure:5338: checking for dnet_ntoa in -ldnet" >&5
-+echo "configure:5359: checking for dnet_ntoa in -ldnet" >&5
- ac_lib_var=`echo dnet'_'dnet_ntoa | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5342,7 +5363,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-ldnet  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5346 "configure"
-+#line 5367 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5353,7 +5374,7 @@ int main() {
- dnet_ntoa()
- ; return 0; }
- EOF
--if { (eval echo configure:5357: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5378: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5375,7 +5396,7 @@ fi
- 
-     if test $ac_cv_lib_dnet_dnet_ntoa = no; then
-       echo $ac_n "checking for dnet_ntoa in -ldnet_stub""... $ac_c" 1>&6
--echo "configure:5379: checking for dnet_ntoa in -ldnet_stub" >&5
-+echo "configure:5400: checking for dnet_ntoa in -ldnet_stub" >&5
- ac_lib_var=`echo dnet_stub'_'dnet_ntoa | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5383,7 +5404,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-ldnet_stub  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5387 "configure"
-+#line 5408 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5394,7 +5415,7 @@ int main() {
- dnet_ntoa()
- ; return 0; }
- EOF
--if { (eval echo configure:5398: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5419: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5423,12 +5444,12 @@ fi
-     # The nsl library prevents programs from opening the X display
-     # on Irix 5.2, according to dickey@clark.net.
-     echo $ac_n "checking for gethostbyname""... $ac_c" 1>&6
--echo "configure:5427: checking for gethostbyname" >&5
-+echo "configure:5448: checking for gethostbyname" >&5
- if eval "test \"`echo '$''{'ac_cv_func_gethostbyname'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5432 "configure"
-+#line 5453 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char gethostbyname(); below.  */
-@@ -5451,7 +5472,7 @@ gethostbyname();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5455: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5476: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_gethostbyname=yes"
- else
-@@ -5472,7 +5493,7 @@ fi
- 
-     if test $ac_cv_func_gethostbyname = no; then
-       echo $ac_n "checking for gethostbyname in -lnsl""... $ac_c" 1>&6
--echo "configure:5476: checking for gethostbyname in -lnsl" >&5
-+echo "configure:5497: checking for gethostbyname in -lnsl" >&5
- ac_lib_var=`echo nsl'_'gethostbyname | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5480,7 +5501,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lnsl  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5484 "configure"
-+#line 5505 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5491,7 +5512,7 @@ int main() {
- gethostbyname()
- ; return 0; }
- EOF
--if { (eval echo configure:5495: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5516: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5521,12 +5542,12 @@ fi
-     # -lsocket must be given before -lnsl if both are needed.
-     # We assume that if connect needs -lnsl, so does gethostbyname.
-     echo $ac_n "checking for connect""... $ac_c" 1>&6
--echo "configure:5525: checking for connect" >&5
-+echo "configure:5546: checking for connect" >&5
- if eval "test \"`echo '$''{'ac_cv_func_connect'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5530 "configure"
-+#line 5551 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char connect(); below.  */
-@@ -5549,7 +5570,7 @@ connect();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5553: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5574: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_connect=yes"
- else
-@@ -5570,7 +5591,7 @@ fi
- 
-     if test $ac_cv_func_connect = no; then
-       echo $ac_n "checking for connect in -lsocket""... $ac_c" 1>&6
--echo "configure:5574: checking for connect in -lsocket" >&5
-+echo "configure:5595: checking for connect in -lsocket" >&5
- ac_lib_var=`echo socket'_'connect | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5578,7 +5599,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lsocket $X_EXTRA_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5582 "configure"
-+#line 5603 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5589,7 +5610,7 @@ int main() {
- connect()
- ; return 0; }
- EOF
--if { (eval echo configure:5593: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5614: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5613,12 +5634,12 @@ fi
- 
-     # gomez@mi.uni-erlangen.de says -lposix is necessary on A/UX.
-     echo $ac_n "checking for remove""... $ac_c" 1>&6
--echo "configure:5617: checking for remove" >&5
-+echo "configure:5638: checking for remove" >&5
- if eval "test \"`echo '$''{'ac_cv_func_remove'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5622 "configure"
-+#line 5643 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char remove(); below.  */
-@@ -5641,7 +5662,7 @@ remove();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5645: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5666: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_remove=yes"
- else
-@@ -5662,7 +5683,7 @@ fi
- 
-     if test $ac_cv_func_remove = no; then
-       echo $ac_n "checking for remove in -lposix""... $ac_c" 1>&6
--echo "configure:5666: checking for remove in -lposix" >&5
-+echo "configure:5687: checking for remove in -lposix" >&5
- ac_lib_var=`echo posix'_'remove | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5670,7 +5691,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lposix  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5674 "configure"
-+#line 5695 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5681,7 +5702,7 @@ int main() {
- remove()
- ; return 0; }
- EOF
--if { (eval echo configure:5685: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5706: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5705,12 +5726,12 @@ fi
- 
-     # BSDI BSD/OS 2.1 needs -lipc for XOpenDisplay.
-     echo $ac_n "checking for shmat""... $ac_c" 1>&6
--echo "configure:5709: checking for shmat" >&5
-+echo "configure:5730: checking for shmat" >&5
- if eval "test \"`echo '$''{'ac_cv_func_shmat'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 5714 "configure"
-+#line 5735 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char shmat(); below.  */
-@@ -5733,7 +5754,7 @@ shmat();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:5737: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5758: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_shmat=yes"
- else
-@@ -5754,7 +5775,7 @@ fi
- 
-     if test $ac_cv_func_shmat = no; then
-       echo $ac_n "checking for shmat in -lipc""... $ac_c" 1>&6
--echo "configure:5758: checking for shmat in -lipc" >&5
-+echo "configure:5779: checking for shmat in -lipc" >&5
- ac_lib_var=`echo ipc'_'shmat | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5762,7 +5783,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lipc  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5766 "configure"
-+#line 5787 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5773,7 +5794,7 @@ int main() {
- shmat()
- ; return 0; }
- EOF
--if { (eval echo configure:5777: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5798: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -5806,7 +5827,7 @@ fi
-   # libraries we check for below, so use a different variable.
-   #  --interran@uluru.Stanford.EDU, kb@cs.umb.edu.
-   echo $ac_n "checking for IceConnectionNumber in -lICE""... $ac_c" 1>&6
--echo "configure:5810: checking for IceConnectionNumber in -lICE" >&5
-+echo "configure:5831: checking for IceConnectionNumber in -lICE" >&5
- ac_lib_var=`echo ICE'_'IceConnectionNumber | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -5814,7 +5835,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lICE $X_EXTRA_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 5818 "configure"
-+#line 5839 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -5825,7 +5846,7 @@ int main() {
- IceConnectionNumber()
- ; return 0; }
- EOF
--if { (eval echo configure:5829: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:5850: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -6220,14 +6241,14 @@ no)
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$arch_flag"
-     cat > conftest.$ac_ext <<EOF
--#line 6224 "configure"
-+#line 6245 "configure"
- #include "confdefs.h"
- 
- int main() {
- return sizeof(__thumb2__);
- ; return 0; }
- EOF
--if { (eval echo configure:6231: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6252: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   MOZ_THUMB2=1
- else
-@@ -6296,16 +6317,16 @@ if test -n "$all_flags"; then
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$all_flags"
-     echo $ac_n "checking whether the chosen combination of compiler flags ($all_flags) works""... $ac_c" 1>&6
--echo "configure:6300: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
-+echo "configure:6321: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
-     cat > conftest.$ac_ext <<EOF
--#line 6302 "configure"
-+#line 6323 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:6309: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6330: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   echo "$ac_t""yes" 1>&6
- else
-@@ -6328,18 +6349,18 @@ fi
- 
- if test "$CPU_ARCH" = "arm"; then
-   echo $ac_n "checking for ARM SIMD support in compiler""... $ac_c" 1>&6
--echo "configure:6332: checking for ARM SIMD support in compiler" >&5
-+echo "configure:6353: checking for ARM SIMD support in compiler" >&5
-   # We try to link so that this also fails when
-   # building with LTO.
-   cat > conftest.$ac_ext <<EOF
--#line 6336 "configure"
-+#line 6357 "configure"
- #include "confdefs.h"
- 
- int main() {
- asm("uqadd8 r1, r1, r2");
- ; return 0; }
- EOF
--if { (eval echo configure:6343: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:6364: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   result="yes"
- else
-@@ -6359,18 +6380,18 @@ EOF
-   fi
- 
-   echo $ac_n "checking for ARM NEON support in compiler""... $ac_c" 1>&6
--echo "configure:6363: checking for ARM NEON support in compiler" >&5
-+echo "configure:6384: checking for ARM NEON support in compiler" >&5
-   # We try to link so that this also fails when
-   # building with LTO.
-   cat > conftest.$ac_ext <<EOF
--#line 6367 "configure"
-+#line 6388 "configure"
- #include "confdefs.h"
- 
- int main() {
- asm(".fpu neon\n vadd.i8 d0, d0, d0");
- ; return 0; }
- EOF
--if { (eval echo configure:6374: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:6395: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   result="yes"
- else
-@@ -6521,7 +6542,7 @@ if test "$GNU_CXX"; then
-     _USE_CPP_INCLUDE_FLAG=1
- 
-     echo $ac_n "checking whether the compiler supports -Wno-invalid-offsetof""... $ac_c" 1>&6
--echo "configure:6525: checking whether the compiler supports -Wno-invalid-offsetof" >&5
-+echo "configure:6546: checking whether the compiler supports -Wno-invalid-offsetof" >&5
- if eval "test \"`echo '$''{'ac_has_wno_invalid_offsetof'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6537,14 +6558,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS ${_COMPILER_PREFIX}-Wno-invalid-offsetof"
-             cat > conftest.$ac_ext <<EOF
--#line 6541 "configure"
-+#line 6562 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6548: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6569: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_has_wno_invalid_offsetof="yes"
- else
-@@ -6571,7 +6592,7 @@ echo "$ac_t""$ac_has_wno_invalid_offsetof" 1>&6
-     fi
- 
-     echo $ac_n "checking whether the compiler supports -Wno-variadic-macros""... $ac_c" 1>&6
--echo "configure:6575: checking whether the compiler supports -Wno-variadic-macros" >&5
-+echo "configure:6596: checking whether the compiler supports -Wno-variadic-macros" >&5
- if eval "test \"`echo '$''{'ac_has_wno_variadic_macros'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6587,14 +6608,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS ${_COMPILER_PREFIX}-Wno-variadic-macros"
-             cat > conftest.$ac_ext <<EOF
--#line 6591 "configure"
-+#line 6612 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6598: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6619: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_has_wno_variadic_macros="yes"
- else
-@@ -6621,7 +6642,7 @@ echo "$ac_t""$ac_has_wno_variadic_macros" 1>&6
-     fi
- 
-     echo $ac_n "checking whether the compiler supports -Werror=return-type""... $ac_c" 1>&6
--echo "configure:6625: checking whether the compiler supports -Werror=return-type" >&5
-+echo "configure:6646: checking whether the compiler supports -Werror=return-type" >&5
- if eval "test \"`echo '$''{'ac_has_werror_return_type'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6637,14 +6658,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
-             _SAVE_CXXFLAGS="$CXXFLAGS"
-             CXXFLAGS="$CXXFLAGS -Werror=return-type"
-             cat > conftest.$ac_ext <<EOF
--#line 6641 "configure"
-+#line 6662 "configure"
- #include "confdefs.h"
- 
- int main() {
- return(0);
- ; return 0; }
- EOF
--if { (eval echo configure:6648: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6669: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_has_werror_return_type="yes"
- else
-@@ -6680,7 +6701,7 @@ MKSHLIB_UNFORCE_ALL=
- if test "$COMPILE_ENVIRONMENT"; then
- if test "$GNU_CC"; then
-   echo $ac_n "checking whether ld has archive extraction flags""... $ac_c" 1>&6
--echo "configure:6684: checking whether ld has archive extraction flags" >&5
-+echo "configure:6705: checking whether ld has archive extraction flags" >&5
-   if eval "test \"`echo '$''{'ac_cv_mkshlib_force_and_unforce'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6697,14 +6718,14 @@ LOOP_INPUT
-       LDFLAGS=$force
-       LIBS=$unforce
-       cat > conftest.$ac_ext <<EOF
--#line 6701 "configure"
-+#line 6722 "configure"
- #include "confdefs.h"
- 
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:6708: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:6729: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_mkshlib_force_and_unforce=$line; break
- else
-@@ -6737,7 +6758,7 @@ configure_static_assert_macros='
- '
- 
- echo $ac_n "checking that static assertion macros used in autoconf tests work""... $ac_c" 1>&6
--echo "configure:6741: checking that static assertion macros used in autoconf tests work" >&5
-+echo "configure:6762: checking that static assertion macros used in autoconf tests work" >&5
- if eval "test \"`echo '$''{'ac_cv_static_assertion_macros_work'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -6751,14 +6772,14 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
-   ac_cv_static_assertion_macros_work="yes"
-   cat > conftest.$ac_ext <<EOF
--#line 6755 "configure"
-+#line 6776 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(1)
- ; return 0; }
- EOF
--if { (eval echo configure:6762: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6783: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -6768,14 +6789,14 @@ else
- fi
- rm -f conftest*
-   cat > conftest.$ac_ext <<EOF
--#line 6772 "configure"
-+#line 6793 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(0)
- ; return 0; }
- EOF
--if { (eval echo configure:6779: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6800: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_static_assertion_macros_work="no"
- else
-@@ -6791,14 +6812,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-   cat > conftest.$ac_ext <<EOF
--#line 6795 "configure"
-+#line 6816 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(1)
- ; return 0; }
- EOF
--if { (eval echo configure:6802: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6823: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -6808,14 +6829,14 @@ else
- fi
- rm -f conftest*
-   cat > conftest.$ac_ext <<EOF
--#line 6812 "configure"
-+#line 6833 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(0)
- ; return 0; }
- EOF
--if { (eval echo configure:6819: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6840: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_static_assertion_macros_work="no"
- else
-@@ -6849,16 +6870,16 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
- cross_compiling=$ac_cv_prog_cc_cross
- 
- echo $ac_n "checking for 64-bit OS""... $ac_c" 1>&6
--echo "configure:6853: checking for 64-bit OS" >&5
-+echo "configure:6874: checking for 64-bit OS" >&5
- cat > conftest.$ac_ext <<EOF
--#line 6855 "configure"
-+#line 6876 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(sizeof(void*) == 8)
- ; return 0; }
- EOF
--if { (eval echo configure:6862: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6883: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   result="yes"
- else
-@@ -6929,19 +6950,19 @@ fi
- if test -n "$MOZ_VALGRIND"; then
-        ac_safe=`echo "valgrind/valgrind.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for valgrind/valgrind.h""... $ac_c" 1>&6
--echo "configure:6933: checking for valgrind/valgrind.h" >&5
-+echo "configure:6954: checking for valgrind/valgrind.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 6938 "configure"
-+#line 6959 "configure"
- #include "confdefs.h"
- #include <valgrind/valgrind.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:6945: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:6966: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -7129,7 +7150,7 @@ case "$host" in
- esac
- 
- echo $ac_n "checking for Python version >= $PYTHON_VERSION but not 3.x""... $ac_c" 1>&6
--echo "configure:7133: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
-+echo "configure:7154: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
- 
- $PYTHON -c "import sys; sys.exit(sys.version[:3] < sys.argv[1] or sys.version[:2] != '2.')" $PYTHON_VERSION
- _python_res=$?
-@@ -7207,9 +7228,9 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-             echo $ac_n "checking for IBM XLC/C++ compiler version >= 9.0.0.7""... $ac_c" 1>&6
--echo "configure:7211: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
-+echo "configure:7232: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
-             cat > conftest.$ac_ext <<EOF
--#line 7213 "configure"
-+#line 7234 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -7218,7 +7239,7 @@ int main() {
-                  #endif
- ; return 0; }
- EOF
--if { (eval echo configure:7222: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7243: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _BAD_COMPILER=
- else
-@@ -7256,19 +7277,19 @@ cross_compiling=$ac_cv_prog_cc_cross
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:7260: checking for $ac_hdr" >&5
-+echo "configure:7281: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 7265 "configure"
-+#line 7286 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:7272: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7293: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -7335,12 +7356,12 @@ EOF
-     STRIP="$STRIP -x -S"
-     # Check whether we're targeting OS X or iOS
-     echo $ac_n "checking for iOS target""... $ac_c" 1>&6
--echo "configure:7339: checking for iOS target" >&5
-+echo "configure:7360: checking for iOS target" >&5
- if eval "test \"`echo '$''{'ac_cv_ios_target'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 7344 "configure"
-+#line 7365 "configure"
- #include "confdefs.h"
- #include <TargetConditionals.h>
- #if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
-@@ -7350,7 +7371,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:7354: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7375: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_ios_target="yes"
- else
-@@ -7397,18 +7418,18 @@ EOF
-         echo "Skipping -dead_strip because DTrace is enabled. See bug 403132."
-     else
-                 echo $ac_n "checking for -dead_strip option to ld""... $ac_c" 1>&6
--echo "configure:7401: checking for -dead_strip option to ld" >&5
-+echo "configure:7422: checking for -dead_strip option to ld" >&5
-         _SAVE_LDFLAGS=$LDFLAGS
-         LDFLAGS="$LDFLAGS -Wl,-dead_strip"
-         cat > conftest.$ac_ext <<EOF
--#line 7405 "configure"
-+#line 7426 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:7412: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:7433: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   _HAVE_DEAD_STRIP=1
- else
-@@ -7731,19 +7752,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:7735: checking for $ac_hdr" >&5
-+echo "configure:7756: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 7740 "configure"
-+#line 7761 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:7747: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7768: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -7904,19 +7925,19 @@ EOF
-     _DEFINES_CXXFLAGS="$_DEFINES_CXXFLAGS -Uunix -U__unix -U__unix__"
- 
-     echo $ac_n "checking for __declspec(dllexport)""... $ac_c" 1>&6
--echo "configure:7908: checking for __declspec(dllexport)" >&5
-+echo "configure:7929: checking for __declspec(dllexport)" >&5
- if eval "test \"`echo '$''{'ac_os2_declspec'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 7913 "configure"
-+#line 7934 "configure"
- #include "confdefs.h"
- __declspec(dllexport) void ac_os2_declspec(void) {}
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:7920: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:7941: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_os2_declspec="yes"
- else
-@@ -7958,14 +7979,14 @@ EOF
-            _SAVE_LDFLAGS=$LDFLAGS
-            LDFLAGS="-M /usr/lib/ld/map.noexstk $LDFLAGS"
-            cat > conftest.$ac_ext <<EOF
--#line 7962 "configure"
-+#line 7983 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:7969: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:7990: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -7993,7 +8014,7 @@ rm -f conftest*
-        CC_VERSION=`$CC -V 2>&1 | grep '^cc:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
-        CXX_VERSION=`$CXX -V 2>&1 | grep '^CC:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
-        echo $ac_n "checking for Sun C++ compiler version >= 5.9""... $ac_c" 1>&6
--echo "configure:7997: checking for Sun C++ compiler version >= 5.9" >&5
-+echo "configure:8018: checking for Sun C++ compiler version >= 5.9" >&5
-        
-        ac_ext=C
- # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
-@@ -8003,7 +8024,7 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
-        cat > conftest.$ac_ext <<EOF
--#line 8007 "configure"
-+#line 8028 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -8012,7 +8033,7 @@ int main() {
-            #endif
- ; return 0; }
- EOF
--if { (eval echo configure:8016: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8037: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _BAD_COMPILER=
- else
-@@ -8029,7 +8050,7 @@ rm -f conftest*
-            _res="yes"
-        fi
-        cat > conftest.$ac_ext <<EOF
--#line 8033 "configure"
-+#line 8054 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -8038,7 +8059,7 @@ int main() {
-            #endif
- ; return 0; }
- EOF
--if { (eval echo configure:8042: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8063: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _ABOVE_SS12U1=
- else
-@@ -8166,12 +8187,12 @@ fi
- 
- if test -z "$SKIP_COMPILER_CHECKS"; then
- echo $ac_n "checking for ANSI C header files""... $ac_c" 1>&6
--echo "configure:8170: checking for ANSI C header files" >&5
-+echo "configure:8191: checking for ANSI C header files" >&5
- if eval "test \"`echo '$''{'ac_cv_header_stdc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8175 "configure"
-+#line 8196 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- #include <stdarg.h>
-@@ -8179,7 +8200,7 @@ else
- #include <float.h>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:8183: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:8204: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -8196,7 +8217,7 @@ rm -f conftest*
- if test $ac_cv_header_stdc = yes; then
-   # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
- cat > conftest.$ac_ext <<EOF
--#line 8200 "configure"
-+#line 8221 "configure"
- #include "confdefs.h"
- #include <string.h>
- EOF
-@@ -8214,7 +8235,7 @@ fi
- if test $ac_cv_header_stdc = yes; then
-   # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
- cat > conftest.$ac_ext <<EOF
--#line 8218 "configure"
-+#line 8239 "configure"
- #include "confdefs.h"
- #include <stdlib.h>
- EOF
-@@ -8235,7 +8256,7 @@ if test "$cross_compiling" = yes; then
-   :
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8239 "configure"
-+#line 8260 "configure"
- #include "confdefs.h"
- #include <ctype.h>
- #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
-@@ -8246,7 +8267,7 @@ if (XOR (islower (i), ISLOWER (i)) || toupper (i) != TOUPPER (i)) exit(2);
- exit (0); }
- 
- EOF
--if { (eval echo configure:8250: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:8271: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   :
- else
-@@ -8270,12 +8291,12 @@ EOF
- fi
- 
- echo $ac_n "checking for working const""... $ac_c" 1>&6
--echo "configure:8274: checking for working const" >&5
-+echo "configure:8295: checking for working const" >&5
- if eval "test \"`echo '$''{'ac_cv_c_const'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8279 "configure"
-+#line 8300 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -8324,7 +8345,7 @@ ccp = (char const *const *) p;
- 
- ; return 0; }
- EOF
--if { (eval echo configure:8328: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8349: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_c_const=yes
- else
-@@ -8345,12 +8366,12 @@ EOF
- fi
- 
- echo $ac_n "checking for mode_t""... $ac_c" 1>&6
--echo "configure:8349: checking for mode_t" >&5
-+echo "configure:8370: checking for mode_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_mode_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8354 "configure"
-+#line 8375 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8378,12 +8399,12 @@ EOF
- fi
- 
- echo $ac_n "checking for off_t""... $ac_c" 1>&6
--echo "configure:8382: checking for off_t" >&5
-+echo "configure:8403: checking for off_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_off_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8387 "configure"
-+#line 8408 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8411,12 +8432,12 @@ EOF
- fi
- 
- echo $ac_n "checking for pid_t""... $ac_c" 1>&6
--echo "configure:8415: checking for pid_t" >&5
-+echo "configure:8436: checking for pid_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_pid_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8420 "configure"
-+#line 8441 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8444,12 +8465,12 @@ EOF
- fi
- 
- echo $ac_n "checking for size_t""... $ac_c" 1>&6
--echo "configure:8448: checking for size_t" >&5
-+echo "configure:8469: checking for size_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_size_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8453 "configure"
-+#line 8474 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #if STDC_HEADERS
-@@ -8484,12 +8505,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking for __stdcall""... $ac_c" 1>&6
--echo "configure:8488: checking for __stdcall" >&5
-+echo "configure:8509: checking for __stdcall" >&5
- if eval "test \"`echo '$''{'ac_cv___stdcall'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8493 "configure"
-+#line 8514 "configure"
- #include "confdefs.h"
- template <typename Method> struct foo;
-                   template <> struct foo<void (*)()> {};
-@@ -8498,7 +8519,7 @@ int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:8502: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8523: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv___stdcall=true
- else
-@@ -8527,12 +8548,12 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
- cross_compiling=$ac_cv_prog_cc_cross
- 
- echo $ac_n "checking for ssize_t""... $ac_c" 1>&6
--echo "configure:8531: checking for ssize_t" >&5
-+echo "configure:8552: checking for ssize_t" >&5
- if eval "test \"`echo '$''{'ac_cv_type_ssize_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8536 "configure"
-+#line 8557 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8540,7 +8561,7 @@ int main() {
- ssize_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8544: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8565: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_type_ssize_t=true
- else
-@@ -8562,12 +8583,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for st_blksize in struct stat""... $ac_c" 1>&6
--echo "configure:8566: checking for st_blksize in struct stat" >&5
-+echo "configure:8587: checking for st_blksize in struct stat" >&5
- if eval "test \"`echo '$''{'ac_cv_struct_st_blksize'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8571 "configure"
-+#line 8592 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -8575,7 +8596,7 @@ int main() {
- struct stat s; s.st_blksize;
- ; return 0; }
- EOF
--if { (eval echo configure:8579: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8600: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_struct_st_blksize=yes
- else
-@@ -8596,12 +8617,12 @@ EOF
- fi
- 
- echo $ac_n "checking for siginfo_t""... $ac_c" 1>&6
--echo "configure:8600: checking for siginfo_t" >&5
-+echo "configure:8621: checking for siginfo_t" >&5
- if eval "test \"`echo '$''{'ac_cv_siginfo_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8605 "configure"
-+#line 8626 "configure"
- #include "confdefs.h"
- #define _POSIX_C_SOURCE 199506L
-                   #include <signal.h>
-@@ -8609,7 +8630,7 @@ int main() {
- siginfo_t* info;
- ; return 0; }
- EOF
--if { (eval echo configure:8613: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8634: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_siginfo_t=true
- else
-@@ -8632,12 +8653,12 @@ else
- fi
- 
- echo $ac_n "checking for int16_t""... $ac_c" 1>&6
--echo "configure:8636: checking for int16_t" >&5
-+echo "configure:8657: checking for int16_t" >&5
- if eval "test \"`echo '$''{'ac_cv_int16_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8641 "configure"
-+#line 8662 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8645,7 +8666,7 @@ int main() {
- int16_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8649: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8670: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_int16_t=true
- else
-@@ -8667,12 +8688,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for int32_t""... $ac_c" 1>&6
--echo "configure:8671: checking for int32_t" >&5
-+echo "configure:8692: checking for int32_t" >&5
- if eval "test \"`echo '$''{'ac_cv_int32_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8676 "configure"
-+#line 8697 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8680,7 +8701,7 @@ int main() {
- int32_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8684: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8705: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_int32_t=true
- else
-@@ -8702,12 +8723,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for int64_t""... $ac_c" 1>&6
--echo "configure:8706: checking for int64_t" >&5
-+echo "configure:8727: checking for int64_t" >&5
- if eval "test \"`echo '$''{'ac_cv_int64_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8711 "configure"
-+#line 8732 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8715,7 +8736,7 @@ int main() {
- int64_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8719: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8740: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_int64_t=true
- else
-@@ -8737,12 +8758,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for int64""... $ac_c" 1>&6
--echo "configure:8741: checking for int64" >&5
-+echo "configure:8762: checking for int64" >&5
- if eval "test \"`echo '$''{'ac_cv_int64'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8746 "configure"
-+#line 8767 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8750,7 +8771,7 @@ int main() {
- int64 foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8754: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8775: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_int64=true
- else
-@@ -8772,12 +8793,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for uint""... $ac_c" 1>&6
--echo "configure:8776: checking for uint" >&5
-+echo "configure:8797: checking for uint" >&5
- if eval "test \"`echo '$''{'ac_cv_uint'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8781 "configure"
-+#line 8802 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8785,7 +8806,7 @@ int main() {
- uint foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8789: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8810: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_uint=true
- else
-@@ -8807,12 +8828,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for uint_t""... $ac_c" 1>&6
--echo "configure:8811: checking for uint_t" >&5
-+echo "configure:8832: checking for uint_t" >&5
- if eval "test \"`echo '$''{'ac_cv_uint_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8816 "configure"
-+#line 8837 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8820,7 +8841,7 @@ int main() {
- uint_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8824: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8845: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_uint_t=true
- else
-@@ -8842,12 +8863,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- echo $ac_n "checking for uint16_t""... $ac_c" 1>&6
--echo "configure:8846: checking for uint16_t" >&5
-+echo "configure:8867: checking for uint16_t" >&5
- if eval "test \"`echo '$''{'ac_cv_uint16_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8851 "configure"
-+#line 8872 "configure"
- #include "confdefs.h"
- #include <stdio.h>
-                   #include <sys/types.h>
-@@ -8855,7 +8876,7 @@ int main() {
- uint16_t foo = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:8859: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8880: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_uint16_t=true
- else
-@@ -8886,12 +8907,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
- 
- 
- echo $ac_n "checking for uname.domainname""... $ac_c" 1>&6
--echo "configure:8890: checking for uname.domainname" >&5
-+echo "configure:8911: checking for uname.domainname" >&5
- if eval "test \"`echo '$''{'ac_cv_have_uname_domainname_field'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8895 "configure"
-+#line 8916 "configure"
- #include "confdefs.h"
- #include <sys/utsname.h>
- int main() {
-@@ -8899,7 +8920,7 @@ int main() {
-             (void)uname(res);  if (res != 0) { domain = res->domainname; } 
- ; return 0; }
- EOF
--if { (eval echo configure:8903: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8924: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_uname_domainname_field=true
- else
-@@ -8923,12 +8944,12 @@ else
- fi
- 
- echo $ac_n "checking for uname.__domainname""... $ac_c" 1>&6
--echo "configure:8927: checking for uname.__domainname" >&5
-+echo "configure:8948: checking for uname.__domainname" >&5
- if eval "test \"`echo '$''{'ac_cv_have_uname_us_domainname_field'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 8932 "configure"
-+#line 8953 "configure"
- #include "confdefs.h"
- #include <sys/utsname.h>
- int main() {
-@@ -8936,7 +8957,7 @@ int main() {
-             (void)uname(res);  if (res != 0) { domain = res->__domainname; } 
- ; return 0; }
- EOF
--if { (eval echo configure:8940: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:8961: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_uname_us_domainname_field=true
- else
-@@ -8996,19 +9017,19 @@ if test "$GNU_CXX"; then
-     if test -z "$_MOZ_USE_RTTI"; then
-         CXXFLAGS="$CXXFLAGS $_MOZ_RTTI_FLAGS"
-         echo $ac_n "checking for gcc c++0x headers bug without rtti""... $ac_c" 1>&6
--echo "configure:9000: checking for gcc c++0x headers bug without rtti" >&5
-+echo "configure:9021: checking for gcc c++0x headers bug without rtti" >&5
- if eval "test \"`echo '$''{'ac_cv_cxx0x_headers_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9005 "configure"
-+#line 9026 "configure"
- #include "confdefs.h"
- #include <memory>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9012: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9033: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cxx0x_headers_bug="no"
- else
-@@ -9029,12 +9050,12 @@ echo "$ac_t""$ac_cv_cxx0x_headers_bug" 1>&6
- fi
- 
- echo $ac_n "checking for usable char16_t (2 bytes, unsigned)""... $ac_c" 1>&6
--echo "configure:9033: checking for usable char16_t (2 bytes, unsigned)" >&5
-+echo "configure:9054: checking for usable char16_t (2 bytes, unsigned)" >&5
- if eval "test \"`echo '$''{'ac_cv_have_usable_char16_t'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9038 "configure"
-+#line 9059 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
-@@ -9045,7 +9066,7 @@ CONFIGURE_STATIC_ASSERT(sizeof(char16_t) == 2);
-                      CONFIGURE_STATIC_ASSERT(u'\xFFFF' > u'\x0')
- ; return 0; }
- EOF
--if { (eval echo configure:9049: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9070: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_usable_char16_t="yes"
- else
-@@ -9070,12 +9091,12 @@ fi
- 
- 
- echo $ac_n "checking for usable wchar_t (2 bytes, unsigned)""... $ac_c" 1>&6
--echo "configure:9074: checking for usable wchar_t (2 bytes, unsigned)" >&5
-+echo "configure:9095: checking for usable wchar_t (2 bytes, unsigned)" >&5
- if eval "test \"`echo '$''{'ac_cv_have_usable_wchar_v2'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9079 "configure"
-+#line 9100 "configure"
- #include "confdefs.h"
- #include <stddef.h>
-                      $configure_static_assert_macros
-@@ -9084,7 +9105,7 @@ CONFIGURE_STATIC_ASSERT(sizeof(wchar_t) == 2);
-                      CONFIGURE_STATIC_ASSERT((wchar_t)-1 > (wchar_t) 0)
- ; return 0; }
- EOF
--if { (eval echo configure:9088: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9109: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_have_usable_wchar_v2="yes"
- else
-@@ -9109,12 +9130,12 @@ elif test "$ac_cv_have_usable_char16_t" != "yes"; then
-     CXXFLAGS="$CXXFLAGS -fshort-wchar"
- 
-     echo $ac_n "checking for compiler -fshort-wchar option""... $ac_c" 1>&6
--echo "configure:9113: checking for compiler -fshort-wchar option" >&5
-+echo "configure:9134: checking for compiler -fshort-wchar option" >&5
- if eval "test \"`echo '$''{'ac_cv_have_usable_wchar_option_v2'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9118 "configure"
-+#line 9139 "configure"
- #include "confdefs.h"
- #include <stddef.h>
-                       $configure_static_assert_macros
-@@ -9123,7 +9144,7 @@ CONFIGURE_STATIC_ASSERT(sizeof(wchar_t) == 2);
-                       CONFIGURE_STATIC_ASSERT((wchar_t)-1 > (wchar_t) 0)
- ; return 0; }
- EOF
--if { (eval echo configure:9127: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:9148: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_usable_wchar_option_v2="yes"
- else
-@@ -9166,7 +9187,7 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- if test "$GNU_CC"; then
-   echo $ac_n "checking for visibility(hidden) attribute""... $ac_c" 1>&6
--echo "configure:9170: checking for visibility(hidden) attribute" >&5
-+echo "configure:9191: checking for visibility(hidden) attribute" >&5
- if eval "test \"`echo '$''{'ac_cv_visibility_hidden'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9191,7 +9212,7 @@ EOF
- 
- 
-     echo $ac_n "checking for visibility(default) attribute""... $ac_c" 1>&6
--echo "configure:9195: checking for visibility(default) attribute" >&5
-+echo "configure:9216: checking for visibility(default) attribute" >&5
- if eval "test \"`echo '$''{'ac_cv_visibility_default'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9216,7 +9237,7 @@ EOF
- 
- 
-       echo $ac_n "checking for visibility pragma support""... $ac_c" 1>&6
--echo "configure:9220: checking for visibility pragma support" >&5
-+echo "configure:9241: checking for visibility pragma support" >&5
- if eval "test \"`echo '$''{'ac_cv_visibility_pragma'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9241,7 +9262,7 @@ fi
- echo "$ac_t""$ac_cv_visibility_pragma" 1>&6
-       if test "$ac_cv_visibility_pragma" = "yes"; then
-         echo $ac_n "checking For gcc visibility bug with class-level attributes (GCC bug 26905)""... $ac_c" 1>&6
--echo "configure:9245: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
-+echo "configure:9266: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
- if eval "test \"`echo '$''{'ac_cv_have_visibility_class_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9269,7 +9290,7 @@ fi
- echo "$ac_t""$ac_cv_have_visibility_class_bug" 1>&6
- 
-         echo $ac_n "checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)""... $ac_c" 1>&6
--echo "configure:9273: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
-+echo "configure:9294: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
- if eval "test \"`echo '$''{'ac_cv_have_visibility_builtin_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -9323,7 +9344,7 @@ fi         # Sun Studio on Solaris
- if test "$GNU_CC"; then
- 
- echo $ac_n "checking for gcc PR49911""... $ac_c" 1>&6
--echo "configure:9327: checking for gcc PR49911" >&5
-+echo "configure:9348: checking for gcc PR49911" >&5
- ac_have_gcc_pr49911="no"
- 
- ac_ext=C
-@@ -9340,7 +9361,7 @@ if test "$cross_compiling" = yes; then
-   true
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9344 "configure"
-+#line 9365 "configure"
- #include "confdefs.h"
- 
- extern "C" void abort(void);
-@@ -9381,7 +9402,7 @@ int main(void) {
- }
- 
- EOF
--if { (eval echo configure:9385: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:9406: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   true
- else
-@@ -9417,19 +9438,19 @@ if test "$GNU_CC"; then
-   CFLAGS_save="${CFLAGS}"
-   CFLAGS="${CFLAGS} -Werror"
-   echo $ac_n "checking for __force_align_arg_pointer__ attribute""... $ac_c" 1>&6
--echo "configure:9421: checking for __force_align_arg_pointer__ attribute" >&5
-+echo "configure:9442: checking for __force_align_arg_pointer__ attribute" >&5
- if eval "test \"`echo '$''{'ac_cv_force_align_arg_pointer'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9426 "configure"
-+#line 9447 "configure"
- #include "confdefs.h"
- __attribute__ ((__force_align_arg_pointer__)) void test() {}
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9433: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9454: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_force_align_arg_pointer="yes"
- else
-@@ -9456,12 +9477,12 @@ for ac_hdr in dirent.h sys/ndir.h sys/dir.h ndir.h
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr that defines DIR""... $ac_c" 1>&6
--echo "configure:9460: checking for $ac_hdr that defines DIR" >&5
-+echo "configure:9481: checking for $ac_hdr that defines DIR" >&5
- if eval "test \"`echo '$''{'ac_cv_header_dirent_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 9465 "configure"
-+#line 9486 "configure"
- #include "confdefs.h"
- #include <sys/types.h>
- #include <$ac_hdr>
-@@ -9469,7 +9490,7 @@ int main() {
- DIR *dirp = 0;
- ; return 0; }
- EOF
--if { (eval echo configure:9473: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9494: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_dirent_$ac_safe=yes"
- else
-@@ -9494,7 +9515,7 @@ done
- # Two versions of opendir et al. are in -ldir and -lx on SCO Xenix.
- if test $ac_header_dirent = dirent.h; then
- echo $ac_n "checking for opendir in -ldir""... $ac_c" 1>&6
--echo "configure:9498: checking for opendir in -ldir" >&5
-+echo "configure:9519: checking for opendir in -ldir" >&5
- ac_lib_var=`echo dir'_'opendir | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -9502,7 +9523,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-ldir  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 9506 "configure"
-+#line 9527 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -9513,7 +9534,7 @@ int main() {
- opendir()
- ; return 0; }
- EOF
--if { (eval echo configure:9517: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:9538: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -9535,7 +9556,7 @@ fi
- 
- else
- echo $ac_n "checking for opendir in -lx""... $ac_c" 1>&6
--echo "configure:9539: checking for opendir in -lx" >&5
-+echo "configure:9560: checking for opendir in -lx" >&5
- ac_lib_var=`echo x'_'opendir | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -9543,7 +9564,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lx  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 9547 "configure"
-+#line 9568 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -9554,7 +9575,7 @@ int main() {
- opendir()
- ; return 0; }
- EOF
--if { (eval echo configure:9558: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:9579: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -9586,19 +9607,19 @@ esac
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9590: checking for $ac_hdr" >&5
-+echo "configure:9611: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9595 "configure"
-+#line 9616 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9602: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9623: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9628,19 +9649,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9632: checking for $ac_hdr" >&5
-+echo "configure:9653: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9637 "configure"
-+#line 9658 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9644: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9665: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9670,19 +9691,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9674: checking for $ac_hdr" >&5
-+echo "configure:9695: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9679 "configure"
-+#line 9700 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9686: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9707: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9712,19 +9733,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9716: checking for $ac_hdr" >&5
-+echo "configure:9737: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9721 "configure"
-+#line 9742 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9728: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9749: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9754,19 +9775,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9758: checking for $ac_hdr" >&5
-+echo "configure:9779: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9763 "configure"
-+#line 9784 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9770: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9791: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9796,19 +9817,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9800: checking for $ac_hdr" >&5
-+echo "configure:9821: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9805 "configure"
-+#line 9826 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9812: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9833: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9839,19 +9860,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9843: checking for $ac_hdr" >&5
-+echo "configure:9864: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9848 "configure"
-+#line 9869 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9855: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9876: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9882,19 +9903,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9886: checking for $ac_hdr" >&5
-+echo "configure:9907: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9891 "configure"
-+#line 9912 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9898: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9919: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9924,19 +9945,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9928: checking for $ac_hdr" >&5
-+echo "configure:9949: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9933 "configure"
-+#line 9954 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9940: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:9961: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -9967,19 +9988,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:9971: checking for $ac_hdr" >&5
-+echo "configure:9992: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 9976 "configure"
-+#line 9997 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:9983: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10004: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10016,19 +10037,19 @@ cross_compiling=$ac_cv_prog_cxx_cross
- NEW_H=new.h
-    ac_safe=`echo "new" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for new""... $ac_c" 1>&6
--echo "configure:10020: checking for new" >&5
-+echo "configure:10041: checking for new" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10025 "configure"
-+#line 10046 "configure"
- #include "confdefs.h"
- #include <new>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10032: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10053: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10069,19 +10090,19 @@ fi
- if test "x$enable_dtrace" = "xyes"; then
-      ac_safe=`echo "sys/sdt.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for sys/sdt.h""... $ac_c" 1>&6
--echo "configure:10073: checking for sys/sdt.h" >&5
-+echo "configure:10094: checking for sys/sdt.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10078 "configure"
-+#line 10099 "configure"
- #include "confdefs.h"
- #include <sys/sdt.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10085: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10106: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10120,19 +10141,19 @@ case $target in
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:10124: checking for $ac_hdr" >&5
-+echo "configure:10145: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10129 "configure"
-+#line 10150 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10136: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10157: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10166,7 +10187,7 @@ case $target in
- 	;;
- *)
- 	echo $ac_n "checking for gethostbyname_r in -lc_r""... $ac_c" 1>&6
--echo "configure:10170: checking for gethostbyname_r in -lc_r" >&5
-+echo "configure:10191: checking for gethostbyname_r in -lc_r" >&5
- ac_lib_var=`echo c_r'_'gethostbyname_r | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10174,7 +10195,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lc_r  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10178 "configure"
-+#line 10199 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10185,7 +10206,7 @@ int main() {
- gethostbyname_r()
- ; return 0; }
- EOF
--if { (eval echo configure:10189: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10210: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10223,14 +10244,14 @@ case $target in
- *)
-     
- echo $ac_n "checking for library containing dlopen""... $ac_c" 1>&6
--echo "configure:10227: checking for library containing dlopen" >&5
-+echo "configure:10248: checking for library containing dlopen" >&5
- if eval "test \"`echo '$''{'ac_cv_search_dlopen'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   ac_func_search_save_LIBS="$LIBS"
- ac_cv_search_dlopen="no"
- cat > conftest.$ac_ext <<EOF
--#line 10234 "configure"
-+#line 10255 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10241,7 +10262,7 @@ int main() {
- dlopen()
- ; return 0; }
- EOF
--if { (eval echo configure:10245: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10266: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_search_dlopen="none required"
- else
-@@ -10252,7 +10273,7 @@ rm -f conftest*
- test "$ac_cv_search_dlopen" = "no" && for i in dl; do
- LIBS="-l$i  $ac_func_search_save_LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10256 "configure"
-+#line 10277 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10263,7 +10284,7 @@ int main() {
- dlopen()
- ; return 0; }
- EOF
--if { (eval echo configure:10267: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10288: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_search_dlopen="-l$i"
- break
-@@ -10281,19 +10302,19 @@ if test "$ac_cv_search_dlopen" != "no"; then
-   test "$ac_cv_search_dlopen" = "none required" || LIBS="$ac_cv_search_dlopen $LIBS"
-      ac_safe=`echo "dlfcn.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for dlfcn.h""... $ac_c" 1>&6
--echo "configure:10285: checking for dlfcn.h" >&5
-+echo "configure:10306: checking for dlfcn.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10290 "configure"
-+#line 10311 "configure"
- #include "confdefs.h"
- #include <dlfcn.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10297: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10318: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10327,12 +10348,12 @@ CFLAGS="$CFLAGS -D_GNU_SOURCE"
- for ac_func in dladdr memmem
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:10331: checking for $ac_func" >&5
-+echo "configure:10352: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 10336 "configure"
-+#line 10357 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -10355,7 +10376,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10359: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10380: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -10386,7 +10407,7 @@ if test ! "$GNU_CXX"; then
-     case $target in
-     *-aix*)
- 	echo $ac_n "checking for demangle in -lC_r""... $ac_c" 1>&6
--echo "configure:10390: checking for demangle in -lC_r" >&5
-+echo "configure:10411: checking for demangle in -lC_r" >&5
- ac_lib_var=`echo C_r'_'demangle | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10394,7 +10415,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lC_r  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10398 "configure"
-+#line 10419 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10405,7 +10426,7 @@ int main() {
- demangle()
- ; return 0; }
- EOF
--if { (eval echo configure:10409: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10430: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10435,7 +10456,7 @@ fi
- 	;;
-      *)
- 	echo $ac_n "checking for demangle in -lC""... $ac_c" 1>&6
--echo "configure:10439: checking for demangle in -lC" >&5
-+echo "configure:10460: checking for demangle in -lC" >&5
- ac_lib_var=`echo C'_'demangle | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10443,7 +10464,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lC  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10447 "configure"
-+#line 10468 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10454,7 +10475,7 @@ int main() {
- demangle()
- ; return 0; }
- EOF
--if { (eval echo configure:10458: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10479: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10490,7 +10511,7 @@ case $target in
-     ;;
- *)
-     echo $ac_n "checking for socket in -lsocket""... $ac_c" 1>&6
--echo "configure:10494: checking for socket in -lsocket" >&5
-+echo "configure:10515: checking for socket in -lsocket" >&5
- ac_lib_var=`echo socket'_'socket | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10498,7 +10519,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lsocket  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10502 "configure"
-+#line 10523 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10509,7 +10530,7 @@ int main() {
- socket()
- ; return 0; }
- EOF
--if { (eval echo configure:10513: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10534: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10555,7 +10576,7 @@ EOF
- 	_SAVE_LDFLAGS="$LDFLAGS"
- 	LDFLAGS="$XLDFLAGS $LDFLAGS"
- 	echo $ac_n "checking for XDrawLines in -lX11""... $ac_c" 1>&6
--echo "configure:10559: checking for XDrawLines in -lX11" >&5
-+echo "configure:10580: checking for XDrawLines in -lX11" >&5
- ac_lib_var=`echo X11'_'XDrawLines | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10563,7 +10584,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lX11 $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10567 "configure"
-+#line 10588 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10574,7 +10595,7 @@ int main() {
- XDrawLines()
- ; return 0; }
- EOF
--if { (eval echo configure:10578: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10599: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10596,7 +10617,7 @@ MISSING_X="$MISSING_X -lX11"
- fi
- 
- 	echo $ac_n "checking for XextAddDisplay in -lXext""... $ac_c" 1>&6
--echo "configure:10600: checking for XextAddDisplay in -lXext" >&5
-+echo "configure:10621: checking for XextAddDisplay in -lXext" >&5
- ac_lib_var=`echo Xext'_'XextAddDisplay | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10604,7 +10625,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lXext $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10608 "configure"
-+#line 10629 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10615,7 +10636,7 @@ int main() {
- XextAddDisplay()
- ; return 0; }
- EOF
--if { (eval echo configure:10619: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10640: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10638,7 +10659,7 @@ fi
- 
- 
- 	echo $ac_n "checking for XtFree in -lXt""... $ac_c" 1>&6
--echo "configure:10642: checking for XtFree in -lXt" >&5
-+echo "configure:10663: checking for XtFree in -lXt" >&5
- ac_lib_var=`echo Xt'_'XtFree | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10646,7 +10667,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lXt  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10650 "configure"
-+#line 10671 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10657,7 +10678,7 @@ int main() {
- XtFree()
- ; return 0; }
- EOF
--if { (eval echo configure:10661: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10682: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10678,7 +10699,7 @@ else
- 
-         unset ac_cv_lib_Xt_XtFree
- 	    echo $ac_n "checking for IceFlush in -lICE""... $ac_c" 1>&6
--echo "configure:10682: checking for IceFlush in -lICE" >&5
-+echo "configure:10703: checking for IceFlush in -lICE" >&5
- ac_lib_var=`echo ICE'_'IceFlush | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10686,7 +10707,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lICE $XT_LIBS $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10690 "configure"
-+#line 10711 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10697,7 +10718,7 @@ int main() {
- IceFlush()
- ; return 0; }
- EOF
--if { (eval echo configure:10701: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10722: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10718,7 +10739,7 @@ else
- fi
- 
- 	    echo $ac_n "checking for SmcCloseConnection in -lSM""... $ac_c" 1>&6
--echo "configure:10722: checking for SmcCloseConnection in -lSM" >&5
-+echo "configure:10743: checking for SmcCloseConnection in -lSM" >&5
- ac_lib_var=`echo SM'_'SmcCloseConnection | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10726,7 +10747,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lSM $XT_LIBS $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10730 "configure"
-+#line 10751 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10737,7 +10758,7 @@ int main() {
- SmcCloseConnection()
- ; return 0; }
- EOF
--if { (eval echo configure:10741: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10762: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10758,7 +10779,7 @@ else
- fi
- 
-         echo $ac_n "checking for XtFree in -lXt""... $ac_c" 1>&6
--echo "configure:10762: checking for XtFree in -lXt" >&5
-+echo "configure:10783: checking for XtFree in -lXt" >&5
- ac_lib_var=`echo Xt'_'XtFree | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10766,7 +10787,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lXt $X_PRE_LIBS $XT_LIBS $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10770 "configure"
-+#line 10791 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10777,7 +10798,7 @@ int main() {
- XtFree()
- ; return 0; }
- EOF
--if { (eval echo configure:10781: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10802: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10811,7 +10832,7 @@ fi
-     esac
- 
-                 echo $ac_n "checking for XShmCreateImage in -lXext""... $ac_c" 1>&6
--echo "configure:10815: checking for XShmCreateImage in -lXext" >&5
-+echo "configure:10836: checking for XShmCreateImage in -lXext" >&5
- ac_lib_var=`echo Xext'_'XShmCreateImage | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10819,7 +10840,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lXext $XLIBS $XEXT_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10823 "configure"
-+#line 10844 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10830,7 +10851,7 @@ int main() {
- XShmCreateImage()
- ; return 0; }
- EOF
--if { (eval echo configure:10834: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10855: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10853,19 +10874,19 @@ fi
- 
-                    ac_safe=`echo "X11/extensions/scrnsaver.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for X11/extensions/scrnsaver.h""... $ac_c" 1>&6
--echo "configure:10857: checking for X11/extensions/scrnsaver.h" >&5
-+echo "configure:10878: checking for X11/extensions/scrnsaver.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 10862 "configure"
-+#line 10883 "configure"
- #include "confdefs.h"
- #include <X11/extensions/scrnsaver.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:10869: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:10890: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -10880,7 +10901,7 @@ fi
-   if eval "test \"`echo '$ac_cv_header_'$ac_safe`\" = yes"; then
-     echo "$ac_t""yes" 1>&6
-     echo $ac_n "checking for XScreenSaverQueryInfo in -lXss""... $ac_c" 1>&6
--echo "configure:10884: checking for XScreenSaverQueryInfo in -lXss" >&5
-+echo "configure:10905: checking for XScreenSaverQueryInfo in -lXss" >&5
- ac_lib_var=`echo Xss'_'XScreenSaverQueryInfo | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -10888,7 +10909,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lXss $XEXT_LIBS $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 10892 "configure"
-+#line 10913 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -10899,7 +10920,7 @@ int main() {
- XScreenSaverQueryInfo()
- ; return 0; }
- EOF
--if { (eval echo configure:10903: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:10924: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -10971,7 +10992,7 @@ fi
- # Extract the first word of "freetype-config", so it can be a program name with args.
- set dummy freetype-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:10975: checking for $ac_word" >&5
-+echo "configure:10996: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_FT2_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11007,7 +11028,7 @@ fi
- 
- min_ft_version=6.1.0
- echo $ac_n "checking for FreeType - version >= $min_ft_version""... $ac_c" 1>&6
--echo "configure:11011: checking for FreeType - version >= $min_ft_version" >&5
-+echo "configure:11032: checking for FreeType - version >= $min_ft_version" >&5
- no_ft=""
- if test "$FT2_CONFIG" = "no" ; then
-   no_ft=yes
-@@ -11055,7 +11076,7 @@ else
-   echo $ac_n "cross compiling; assumed OK... $ac_c"
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11059 "configure"
-+#line 11080 "configure"
- #include "confdefs.h"
- 
- #include <ft2build.h>
-@@ -11081,7 +11102,7 @@ main()
- }
- 
- EOF
--if { (eval echo configure:11085: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11106: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   :
- else
-@@ -11131,12 +11152,12 @@ fi
-     	CFLAGS="$CFLAGS $FT2_CFLAGS"
- 
-         echo $ac_n "checking for FT_Bitmap_Size.y_ppem""... $ac_c" 1>&6
--echo "configure:11135: checking for FT_Bitmap_Size.y_ppem" >&5
-+echo "configure:11156: checking for FT_Bitmap_Size.y_ppem" >&5
- if eval "test \"`echo '$''{'ac_cv_member_FT_Bitmap_Size_y_ppem'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11140 "configure"
-+#line 11161 "configure"
- #include "confdefs.h"
- #include <ft2build.h>
-                              #include FT_FREETYPE_H
-@@ -11146,7 +11167,7 @@ FT_Bitmap_Size s;
-                              return 1
- ; return 0; }
- EOF
--if { (eval echo configure:11150: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:11171: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_member_FT_Bitmap_Size_y_ppem=yes
- else
-@@ -11172,12 +11193,12 @@ EOF
-         for ac_func in FT_GlyphSlot_Embolden FT_Load_Sfnt_Table FT_Select_Size
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:11176: checking for $ac_func" >&5
-+echo "configure:11197: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11181 "configure"
-+#line 11202 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -11200,7 +11221,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:11204: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11225: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -11245,7 +11266,7 @@ darwin*)
- *)
-     
- echo $ac_n "checking for pthread_create in -lpthreads""... $ac_c" 1>&6
--echo "configure:11249: checking for pthread_create in -lpthreads" >&5
-+echo "configure:11270: checking for pthread_create in -lpthreads" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -11268,7 +11289,7 @@ echo "
-         echo "$ac_t""no" 1>&6
-         
- echo $ac_n "checking for pthread_create in -lpthread""... $ac_c" 1>&6
--echo "configure:11272: checking for pthread_create in -lpthread" >&5
-+echo "configure:11293: checking for pthread_create in -lpthread" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -11291,7 +11312,7 @@ echo "
-         echo "$ac_t""no" 1>&6
-         
- echo $ac_n "checking for pthread_create in -lc_r""... $ac_c" 1>&6
--echo "configure:11295: checking for pthread_create in -lc_r" >&5
-+echo "configure:11316: checking for pthread_create in -lc_r" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -11314,7 +11335,7 @@ echo "
-         echo "$ac_t""no" 1>&6
-         
- echo $ac_n "checking for pthread_create in -lc""... $ac_c" 1>&6
--echo "configure:11318: checking for pthread_create in -lc" >&5
-+echo "configure:11339: checking for pthread_create in -lc" >&5
- echo "
-     #include <pthread.h>
-     #include <stdlib.h>
-@@ -11373,7 +11394,7 @@ then
- 				rm -f conftest*
- 	ac_cv_have_dash_pthread=no
- 	echo $ac_n "checking whether ${CC-cc} accepts -pthread""... $ac_c" 1>&6
--echo "configure:11377: checking whether ${CC-cc} accepts -pthread" >&5
-+echo "configure:11398: checking whether ${CC-cc} accepts -pthread" >&5
- 	echo 'int main() { return 0; }' | cat > conftest.c
- 	${CC-cc} -pthread -o conftest conftest.c > conftest.out 2>&1
- 	if test $? -eq 0; then
-@@ -11396,7 +11417,7 @@ echo "configure:11377: checking whether ${CC-cc} accepts -pthread" >&5
- 			    ac_cv_have_dash_pthreads=no
-     if test "$ac_cv_have_dash_pthread" = "no"; then
- 	    echo $ac_n "checking whether ${CC-cc} accepts -pthreads""... $ac_c" 1>&6
--echo "configure:11400: checking whether ${CC-cc} accepts -pthreads" >&5
-+echo "configure:11421: checking whether ${CC-cc} accepts -pthreads" >&5
-     	echo 'int main() { return 0; }' | cat > conftest.c
- 	    ${CC-cc} -pthreads -o conftest conftest.c > conftest.out 2>&1
-     	if test $? -eq 0; then
-@@ -11479,13 +11500,13 @@ fi
- 
- if test $ac_cv_prog_gcc = yes; then
-     echo $ac_n "checking whether ${CC-cc} needs -traditional""... $ac_c" 1>&6
--echo "configure:11483: checking whether ${CC-cc} needs -traditional" >&5
-+echo "configure:11504: checking whether ${CC-cc} needs -traditional" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_gcc_traditional'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-     ac_pattern="Autoconf.*'x'"
-   cat > conftest.$ac_ext <<EOF
--#line 11489 "configure"
-+#line 11510 "configure"
- #include "confdefs.h"
- #include <sgtty.h>
- Autoconf TIOCGETP
-@@ -11503,7 +11524,7 @@ rm -f conftest*
- 
-   if test $ac_cv_prog_gcc_traditional = no; then
-     cat > conftest.$ac_ext <<EOF
--#line 11507 "configure"
-+#line 11528 "configure"
- #include "confdefs.h"
- #include <termio.h>
- Autoconf TCGETA
-@@ -11525,7 +11546,7 @@ echo "$ac_t""$ac_cv_prog_gcc_traditional" 1>&6
- fi
- 
- echo $ac_n "checking for 8-bit clean memcmp""... $ac_c" 1>&6
--echo "configure:11529: checking for 8-bit clean memcmp" >&5
-+echo "configure:11550: checking for 8-bit clean memcmp" >&5
- if eval "test \"`echo '$''{'ac_cv_func_memcmp_clean'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -11533,7 +11554,7 @@ else
-   ac_cv_func_memcmp_clean=no
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11537 "configure"
-+#line 11558 "configure"
- #include "confdefs.h"
- 
- main()
-@@ -11543,7 +11564,7 @@ main()
- }
- 
- EOF
--if { (eval echo configure:11547: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:11568: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_func_memcmp_clean=yes
- else
-@@ -11563,12 +11584,12 @@ test $ac_cv_func_memcmp_clean = no && LIBOBJS="$LIBOBJS memcmp.${ac_objext}"
- for ac_func in random strerror lchown fchmod snprintf statvfs memmove rint stat64 lstat64 truncate64 statvfs64 setbuf isatty
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:11567: checking for $ac_func" >&5
-+echo "configure:11588: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11572 "configure"
-+#line 11593 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -11591,7 +11612,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:11595: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11616: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -11618,12 +11639,12 @@ done
- for ac_func in flockfile getpagesize
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:11622: checking for $ac_func" >&5
-+echo "configure:11643: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11627 "configure"
-+#line 11648 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -11646,7 +11667,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:11650: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11671: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -11673,12 +11694,12 @@ done
- for ac_func in localtime_r strtok_r
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:11677: checking for $ac_func" >&5
-+echo "configure:11698: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11682 "configure"
-+#line 11703 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -11701,7 +11722,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:11705: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11726: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -11729,12 +11750,12 @@ done
- _SAVE_LDFLAGS=$LDFLAGS
- LDFLAGS="$LDFLAGS -lrt"
- echo $ac_n "checking for clock_gettime(CLOCK_MONOTONIC) and -lrt""... $ac_c" 1>&6
--echo "configure:11733: checking for clock_gettime(CLOCK_MONOTONIC) and -lrt" >&5
-+echo "configure:11754: checking for clock_gettime(CLOCK_MONOTONIC) and -lrt" >&5
- if eval "test \"`echo '$''{'ac_cv_have_clock_monotonic'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11738 "configure"
-+#line 11759 "configure"
- #include "confdefs.h"
- #include <time.h>
- int main() {
-@@ -11742,7 +11763,7 @@ int main() {
-                               clock_gettime(CLOCK_MONOTONIC, &ts); 
- ; return 0; }
- EOF
--if { (eval echo configure:11746: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11767: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_clock_monotonic=yes
- else
-@@ -11777,19 +11798,19 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking for wcrtomb""... $ac_c" 1>&6
--echo "configure:11781: checking for wcrtomb" >&5
-+echo "configure:11802: checking for wcrtomb" >&5
- if eval "test \"`echo '$''{'ac_cv_have_wcrtomb'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11786 "configure"
-+#line 11807 "configure"
- #include "confdefs.h"
- #include <wchar.h>
- int main() {
- mbstate_t ps={0};wcrtomb(0,'f',&ps);
- ; return 0; }
- EOF
--if { (eval echo configure:11793: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11814: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_wcrtomb="yes"
- else
-@@ -11809,19 +11830,19 @@ EOF
- 
- fi
- echo $ac_n "checking for mbrtowc""... $ac_c" 1>&6
--echo "configure:11813: checking for mbrtowc" >&5
-+echo "configure:11834: checking for mbrtowc" >&5
- if eval "test \"`echo '$''{'ac_cv_have_mbrtowc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11818 "configure"
-+#line 11839 "configure"
- #include "confdefs.h"
- #include <wchar.h>
- int main() {
- mbstate_t ps={0};mbrtowc(0,0,0,&ps);
- ; return 0; }
- EOF
--if { (eval echo configure:11825: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11846: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_have_mbrtowc="yes"
- else
-@@ -11850,12 +11871,12 @@ cross_compiling=$ac_cv_prog_cc_cross
- fi
- 
- echo $ac_n "checking for res_ninit()""... $ac_c" 1>&6
--echo "configure:11854: checking for res_ninit()" >&5
-+echo "configure:11875: checking for res_ninit()" >&5
- if eval "test \"`echo '$''{'ac_cv_func_res_ninit'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11859 "configure"
-+#line 11880 "configure"
- #include "confdefs.h"
- 
-         #ifdef linux
-@@ -11867,7 +11888,7 @@ int main() {
- int foo = res_ninit(&_res);
- ; return 0; }
- EOF
--if { (eval echo configure:11871: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11892: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_func_res_ninit=yes
- else
-@@ -11897,12 +11918,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
- cross_compiling=$ac_cv_prog_cxx_cross
- 
- echo $ac_n "checking for gnu_get_libc_version()""... $ac_c" 1>&6
--echo "configure:11901: checking for gnu_get_libc_version()" >&5
-+echo "configure:11922: checking for gnu_get_libc_version()" >&5
- if eval "test \"`echo '$''{'ac_cv_func_gnu_get_libc_version'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 11906 "configure"
-+#line 11927 "configure"
- #include "confdefs.h"
- 
-         #ifdef HAVE_GNU_LIBC_VERSION_H
-@@ -11913,7 +11934,7 @@ int main() {
- const char *glibc_version = gnu_get_libc_version();
- ; return 0; }
- EOF
--if { (eval echo configure:11917: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11938: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_func_gnu_get_libc_version=yes
- else
-@@ -11942,7 +11963,7 @@ case $target_os in
-     *)
- 
- echo $ac_n "checking for iconv in -lc""... $ac_c" 1>&6
--echo "configure:11946: checking for iconv in -lc" >&5
-+echo "configure:11967: checking for iconv in -lc" >&5
- ac_lib_var=`echo c'_'iconv | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -11950,7 +11971,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lc  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 11954 "configure"
-+#line 11975 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- #ifdef __cplusplus
-@@ -11964,7 +11985,7 @@ int main() {
- iconv()
- ; return 0; }
- EOF
--if { (eval echo configure:11968: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:11989: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -11983,7 +12004,7 @@ if eval "test \"`echo '$ac_cv_lib_'$ac_lib_var`\" = yes"; then
- else
-   echo "$ac_t""no" 1>&6
- echo $ac_n "checking for iconv in -liconv""... $ac_c" 1>&6
--echo "configure:11987: checking for iconv in -liconv" >&5
-+echo "configure:12008: checking for iconv in -liconv" >&5
- ac_lib_var=`echo iconv'_'iconv | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -11991,7 +12012,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-liconv  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 11995 "configure"
-+#line 12016 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- #ifdef __cplusplus
-@@ -12005,7 +12026,7 @@ int main() {
- iconv()
- ; return 0; }
- EOF
--if { (eval echo configure:12009: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12030: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -12024,7 +12045,7 @@ if eval "test \"`echo '$ac_cv_lib_'$ac_lib_var`\" = yes"; then
- else
-   echo "$ac_t""no" 1>&6
- echo $ac_n "checking for libiconv in -liconv""... $ac_c" 1>&6
--echo "configure:12028: checking for libiconv in -liconv" >&5
-+echo "configure:12049: checking for libiconv in -liconv" >&5
- ac_lib_var=`echo iconv'_'libiconv | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -12032,7 +12053,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-liconv  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 12036 "configure"
-+#line 12057 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- #ifdef __cplusplus
-@@ -12046,7 +12067,7 @@ int main() {
- libiconv()
- ; return 0; }
- EOF
--if { (eval echo configure:12050: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12071: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -12073,12 +12094,12 @@ fi
- _SAVE_LIBS=$LIBS
- LIBS="$LIBS $_ICONV_LIBS"
- echo $ac_n "checking for iconv()""... $ac_c" 1>&6
--echo "configure:12077: checking for iconv()" >&5
-+echo "configure:12098: checking for iconv()" >&5
- if eval "test \"`echo '$''{'ac_cv_func_iconv'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12082 "configure"
-+#line 12103 "configure"
- #include "confdefs.h"
- 
-         #include <stdlib.h>
-@@ -12092,7 +12113,7 @@ int main() {
-         
- ; return 0; }
- EOF
--if { (eval echo configure:12096: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12117: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_func_iconv=yes
- else
-@@ -12116,12 +12137,12 @@ EOF
-     LIBXUL_LIBS="$LIBXUL_LIBS $_ICONV_LIBS"
-     LIBICONV="$_ICONV_LIBS"
-     echo $ac_n "checking for iconv() with const input""... $ac_c" 1>&6
--echo "configure:12120: checking for iconv() with const input" >&5
-+echo "configure:12141: checking for iconv() with const input" >&5
- if eval "test \"`echo '$''{'ac_cv_func_const_iconv'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12125 "configure"
-+#line 12146 "configure"
- #include "confdefs.h"
- 
-             #include <stdlib.h>
-@@ -12136,7 +12157,7 @@ int main() {
-             
- ; return 0; }
- EOF
--if { (eval echo configure:12140: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12161: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_func_const_iconv=yes
- else
-@@ -12165,19 +12186,19 @@ esac
- 
- 
-   echo $ac_n "checking for nl_langinfo and CODESET""... $ac_c" 1>&6
--echo "configure:12169: checking for nl_langinfo and CODESET" >&5
-+echo "configure:12190: checking for nl_langinfo and CODESET" >&5
- if eval "test \"`echo '$''{'am_cv_langinfo_codeset'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12174 "configure"
-+#line 12195 "configure"
- #include "confdefs.h"
- #include <langinfo.h>
- int main() {
- char* cs = nl_langinfo(CODESET);
- ; return 0; }
- EOF
--if { (eval echo configure:12181: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12202: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   am_cv_langinfo_codeset=yes
- else
-@@ -12209,7 +12230,7 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- 
- echo $ac_n "checking for an implementation of va_copy()""... $ac_c" 1>&6
--echo "configure:12213: checking for an implementation of va_copy()" >&5
-+echo "configure:12234: checking for an implementation of va_copy()" >&5
- if eval "test \"`echo '$''{'ac_cv_va_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12219,7 +12240,7 @@ else
-     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12223 "configure"
-+#line 12244 "configure"
- #include "confdefs.h"
- 
-         #include <stdarg.h>
-@@ -12233,7 +12254,7 @@ else
-         }
-         int main() { f (0, 42); return 0; }
- EOF
--if { (eval echo configure:12237: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:12258: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_va_copy=yes
- else
-@@ -12250,7 +12271,7 @@ fi
- 
- echo "$ac_t""$ac_cv_va_copy" 1>&6
- echo $ac_n "checking for an implementation of __va_copy()""... $ac_c" 1>&6
--echo "configure:12254: checking for an implementation of __va_copy()" >&5
-+echo "configure:12275: checking for an implementation of __va_copy()" >&5
- if eval "test \"`echo '$''{'ac_cv___va_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12260,7 +12281,7 @@ else
-     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12264 "configure"
-+#line 12285 "configure"
- #include "confdefs.h"
- 
-         #include <stdarg.h>
-@@ -12274,7 +12295,7 @@ else
-         }
-         int main() { f (0, 42); return 0; }
- EOF
--if { (eval echo configure:12278: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:12299: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv___va_copy=yes
- else
-@@ -12291,7 +12312,7 @@ fi
- 
- echo "$ac_t""$ac_cv___va_copy" 1>&6
- echo $ac_n "checking whether va_lists can be copied by value""... $ac_c" 1>&6
--echo "configure:12295: checking whether va_lists can be copied by value" >&5
-+echo "configure:12316: checking whether va_lists can be copied by value" >&5
- if eval "test \"`echo '$''{'ac_cv_va_val_copy'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12301,7 +12322,7 @@ else
-     
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12305 "configure"
-+#line 12326 "configure"
- #include "confdefs.h"
- 
-         #include <stdarg.h>
-@@ -12315,7 +12336,7 @@ else
-         }
-         int main() { f (0, 42); return 0; }
- EOF
--if { (eval echo configure:12319: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:12340: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_va_val_copy=yes
- else
-@@ -12370,12 +12391,12 @@ ARM_ABI_PREFIX=
- if test "$GNU_CC"; then
-   if test "$CPU_ARCH" = "arm" ; then
-     echo $ac_n "checking for ARM EABI""... $ac_c" 1>&6
--echo "configure:12374: checking for ARM EABI" >&5
-+echo "configure:12395: checking for ARM EABI" >&5
- if eval "test \"`echo '$''{'ac_cv_gcc_arm_eabi'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12379 "configure"
-+#line 12400 "configure"
- #include "confdefs.h"
- 
- int main() {
-@@ -12388,7 +12409,7 @@ int main() {
-                         
- ; return 0; }
- EOF
--if { (eval echo configure:12392: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12413: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_gcc_arm_eabi="yes"
- else
-@@ -12413,12 +12434,12 @@ echo "$ac_t""$ac_cv_gcc_arm_eabi" 1>&6
- fi
- 
- echo $ac_n "checking for modern C++ template specialization syntax support""... $ac_c" 1>&6
--echo "configure:12417: checking for modern C++ template specialization syntax support" >&5
-+echo "configure:12438: checking for modern C++ template specialization syntax support" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_modern_specialize_template_syntax'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12422 "configure"
-+#line 12443 "configure"
- #include "confdefs.h"
- template <class T> struct X { int a; };
-                                class Y {};
-@@ -12428,7 +12449,7 @@ X<int> int_x;
-                                X<Y> y_x;
- ; return 0; }
- EOF
--if { (eval echo configure:12432: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12453: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cpp_modern_specialize_template_syntax=yes
- else
-@@ -12450,12 +12471,12 @@ fi
- 
- 
- echo $ac_n "checking whether partial template specialization works""... $ac_c" 1>&6
--echo "configure:12454: checking whether partial template specialization works" >&5
-+echo "configure:12475: checking whether partial template specialization works" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_partial_specialization'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12459 "configure"
-+#line 12480 "configure"
- #include "confdefs.h"
- template <class T> class Foo {};
-                                template <class T> class Foo<T*> {};
-@@ -12463,7 +12484,7 @@ int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:12467: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12488: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cpp_partial_specialization=yes
- else
-@@ -12484,12 +12505,12 @@ EOF
- fi
- 
- echo $ac_n "checking whether the C++ \"using\" keyword resolves ambiguity""... $ac_c" 1>&6
--echo "configure:12488: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
-+echo "configure:12509: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_ambiguity_resolving_using'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12493 "configure"
-+#line 12514 "configure"
- #include "confdefs.h"
- class X {
-                                  public: int go(const X&) {return 3;}
-@@ -12505,7 +12526,7 @@ int main() {
- X x; Y y; y.jo(x);
- ; return 0; }
- EOF
--if { (eval echo configure:12509: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12530: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_cpp_ambiguity_resolving_using=yes
- else
-@@ -12526,7 +12547,7 @@ EOF
- fi
- 
- echo $ac_n "checking for C++ dynamic_cast to void*""... $ac_c" 1>&6
--echo "configure:12530: checking for C++ dynamic_cast to void*" >&5
-+echo "configure:12551: checking for C++ dynamic_cast to void*" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_dynamic_cast_void_ptr'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -12534,7 +12555,7 @@ else
-   ac_cv_cpp_dynamic_cast_void_ptr=no
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12538 "configure"
-+#line 12559 "configure"
- #include "confdefs.h"
- class X { int i; public: virtual ~X() { } };
-                             class Y { int j; public: virtual ~Y() { } };
-@@ -12550,7 +12571,7 @@ class X { int i; public: virtual ~X() { } };
-                                            ((void*)&mdo == dynamic_cast<void*>(suby))));
-                             }
- EOF
--if { (eval echo configure:12554: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:12575: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_cpp_dynamic_cast_void_ptr=yes
- else
-@@ -12574,19 +12595,19 @@ fi
- 
- 
- echo $ac_n "checking whether C++ requires implementation of unused virtual methods""... $ac_c" 1>&6
--echo "configure:12578: checking whether C++ requires implementation of unused virtual methods" >&5
-+echo "configure:12599: checking whether C++ requires implementation of unused virtual methods" >&5
- if eval "test \"`echo '$''{'ac_cv_cpp_unused_required'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12583 "configure"
-+#line 12604 "configure"
- #include "confdefs.h"
- class X {private: virtual void never_called();};
- int main() {
- X x;
- ; return 0; }
- EOF
--if { (eval echo configure:12590: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12611: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_cpp_unused_required=no
- else
-@@ -12609,12 +12630,12 @@ fi
- 
- 
- echo $ac_n "checking for trouble comparing to zero near std::operator!=()""... $ac_c" 1>&6
--echo "configure:12613: checking for trouble comparing to zero near std::operator!=()" >&5
-+echo "configure:12634: checking for trouble comparing to zero near std::operator!=()" >&5
- if eval "test \"`echo '$''{'ac_cv_trouble_comparing_to_zero'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12618 "configure"
-+#line 12639 "configure"
- #include "confdefs.h"
- #include <algorithm>
-                                 template <class T> class Foo {};
-@@ -12625,7 +12646,7 @@ int main() {
- Foo<int> f; return (0 != f);
- ; return 0; }
- EOF
--if { (eval echo configure:12629: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12650: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_trouble_comparing_to_zero=no
- else
-@@ -12652,19 +12673,19 @@ fi
- _SAVE_LDFLAGS=$LDFLAGS
- LDFLAGS="$LDFLAGS $DSO_PIC_CFLAGS $DSO_LDOPTS $MOZ_OPTIMIZE_LDFLAGS"
- echo $ac_n "checking for __thread keyword for TLS variables""... $ac_c" 1>&6
--echo "configure:12656: checking for __thread keyword for TLS variables" >&5
-+echo "configure:12677: checking for __thread keyword for TLS variables" >&5
- if eval "test \"`echo '$''{'ac_cv_thread_keyword'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12661 "configure"
-+#line 12682 "configure"
- #include "confdefs.h"
- __thread bool tlsIsMainThread = false;
- int main() {
- return tlsIsMainThread;
- ; return 0; }
- EOF
--if { (eval echo configure:12668: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12689: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv_thread_keyword=yes
- else
-@@ -12701,19 +12722,19 @@ fi
- MALLOC_H=
-    ac_safe=`echo "malloc.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for malloc.h""... $ac_c" 1>&6
--echo "configure:12705: checking for malloc.h" >&5
-+echo "configure:12726: checking for malloc.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 12710 "configure"
-+#line 12731 "configure"
- #include "confdefs.h"
- #include <malloc.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12717: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12738: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -12736,19 +12757,19 @@ fi
- if test "$MALLOC_H" = ""; then
-      ac_safe=`echo "malloc/malloc.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for malloc/malloc.h""... $ac_c" 1>&6
--echo "configure:12740: checking for malloc/malloc.h" >&5
-+echo "configure:12761: checking for malloc/malloc.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 12745 "configure"
-+#line 12766 "configure"
- #include "confdefs.h"
- #include <malloc/malloc.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12752: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12773: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -12771,19 +12792,19 @@ fi
-   if test "$MALLOC_H" = ""; then
-        ac_safe=`echo "sys/malloc.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for sys/malloc.h""... $ac_c" 1>&6
--echo "configure:12775: checking for sys/malloc.h" >&5
-+echo "configure:12796: checking for sys/malloc.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 12780 "configure"
-+#line 12801 "configure"
- #include "confdefs.h"
- #include <sys/malloc.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12787: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12808: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -12816,12 +12837,12 @@ MOZ_ALLOCATING_FUNCS="strndup posix_memalign memalign valloc"
- for ac_func in strndup posix_memalign memalign valloc
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:12820: checking for $ac_func" >&5
-+echo "configure:12841: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12825 "configure"
-+#line 12846 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -12847,7 +12868,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12851: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:12872: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -12874,19 +12895,19 @@ done
- 
- 
- echo $ac_n "checking for __attribute__((always_inline))""... $ac_c" 1>&6
--echo "configure:12878: checking for __attribute__((always_inline))" >&5
-+echo "configure:12899: checking for __attribute__((always_inline))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_always_inline'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12883 "configure"
-+#line 12904 "configure"
- #include "confdefs.h"
- inline void f(void) __attribute__((always_inline));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12890: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12911: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_always_inline=yes
- else
-@@ -12901,19 +12922,19 @@ fi
- echo "$ac_t""$ac_cv_attribute_always_inline" 1>&6
- 
- echo $ac_n "checking for __attribute__((malloc))""... $ac_c" 1>&6
--echo "configure:12905: checking for __attribute__((malloc))" >&5
-+echo "configure:12926: checking for __attribute__((malloc))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_malloc'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12910 "configure"
-+#line 12931 "configure"
- #include "confdefs.h"
- void* f(int) __attribute__((malloc));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12917: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12938: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_malloc=yes
- else
-@@ -12928,19 +12949,19 @@ fi
- echo "$ac_t""$ac_cv_attribute_malloc" 1>&6
- 
- echo $ac_n "checking for __attribute__((warn_unused_result))""... $ac_c" 1>&6
--echo "configure:12932: checking for __attribute__((warn_unused_result))" >&5
-+echo "configure:12953: checking for __attribute__((warn_unused_result))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_warn_unused'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12937 "configure"
-+#line 12958 "configure"
- #include "confdefs.h"
- int f(void) __attribute__((warn_unused_result));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12944: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12965: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_warn_unused=yes
- else
-@@ -12955,19 +12976,19 @@ fi
- echo "$ac_t""$ac_cv_attribute_warn_unused" 1>&6
- 
- echo $ac_n "checking for __attribute__((noreturn))""... $ac_c" 1>&6
--echo "configure:12959: checking for __attribute__((noreturn))" >&5
-+echo "configure:12980: checking for __attribute__((noreturn))" >&5
- if eval "test \"`echo '$''{'ac_cv_attribute_noreturn'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 12964 "configure"
-+#line 12985 "configure"
- #include "confdefs.h"
- void f(void) __attribute__((noreturn));
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:12971: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:12992: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_attribute_noreturn=yes
- else
-@@ -12991,19 +13012,19 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- 
- echo $ac_n "checking for LC_MESSAGES""... $ac_c" 1>&6
--echo "configure:12995: checking for LC_MESSAGES" >&5
-+echo "configure:13016: checking for LC_MESSAGES" >&5
- if eval "test \"`echo '$''{'ac_cv_i18n_lc_messages'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 13000 "configure"
-+#line 13021 "configure"
- #include "confdefs.h"
- #include <locale.h>
- int main() {
- int category = LC_MESSAGES;
- ; return 0; }
- EOF
--if { (eval echo configure:13007: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13028: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_i18n_lc_messages=yes
- else
-@@ -13026,12 +13047,12 @@ fi
- for ac_func in localeconv
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:13030: checking for $ac_func" >&5
-+echo "configure:13051: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 13035 "configure"
-+#line 13056 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -13054,7 +13075,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:13058: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13079: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -13173,6 +13194,7 @@ fi
- 
- if test -n "$LIBXUL_SDK"; then
-     LIBXUL_DIST="$LIBXUL_SDK"
-+    SKIP_LIBRARY_CHECKS=1
- else
-     LIBXUL_DIST="$MOZ_BUILD_ROOT/dist"
- fi
-@@ -13243,7 +13265,7 @@ fi
- 	# Extract the first word of "nspr-config", so it can be a program name with args.
- set dummy nspr-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:13247: checking for $ac_word" >&5
-+echo "configure:13269: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_NSPR_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -13278,7 +13300,7 @@ fi
- 
- 	min_nspr_version=4.8.8
- 	echo $ac_n "checking for NSPR - version >= $min_nspr_version""... $ac_c" 1>&6
--echo "configure:13282: checking for NSPR - version >= $min_nspr_version" >&5
-+echo "configure:13304: checking for NSPR - version >= $min_nspr_version" >&5
- 
- 	no_nspr=""
- 	if test "$NSPR_CONFIG" != "no"; then
-@@ -13337,7 +13359,7 @@ if test -n "$MOZ_NATIVE_NSPR"; then
-     _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $NSPR_CFLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 13341 "configure"
-+#line 13363 "configure"
- #include "confdefs.h"
- #include "prtypes.h"
- int main() {
-@@ -13346,7 +13368,7 @@ int main() {
-                  #endif
- ; return 0; }
- EOF
--if { (eval echo configure:13350: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13372: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   MOZ_NATIVE_NSPR=1
- else
-@@ -13358,6 +13380,10 @@ fi
- rm -f conftest*
-     CFLAGS=$_SAVE_CFLAGS
- else
-+  if test -n "$LIBXUL_SDK"; then
-+      NSPR_CFLAGS="-I$LIBXUL_SDK_DIR/sdk/include"
-+      NSPR_LIBS="-L$LIBXUL_SDK_DIR/sdk/lib -lnspr$NSPR_VERSION -lplc$NSPR_VERSION -lplds$NSPR_VERSION"
-+  else
-     if test "$OS_ARCH" = "WINNT"; then
-         NSPR_CFLAGS="-I${LIBXUL_DIST}/include/nspr"
-         if test -n "$GNU_CC"; then
-@@ -13369,6 +13395,7 @@ else
-         NSPR_CFLAGS='`$(LIBXUL_DIST)/sdk/bin/nspr-config --prefix='${LIBXUL_DIST}' --includedir='${LIBXUL_DIST}'/include/nspr --cflags`'
-         NSPR_LIBS='`$(LIBXUL_DIST)/sdk/bin/nspr-config --prefix='${LIBXUL_DIST}' --libdir='${LIBXUL_DIST}'/lib --libs`'
-     fi
-+  fi
- fi
- 
- # Check whether --with-system-libevent or --without-system-libevent was given.
-@@ -13391,19 +13418,19 @@ else
-     LDFLAGS="-L${LIBEVENT_DIR}/lib $LDFLAGS"
-        ac_safe=`echo "event.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for event.h""... $ac_c" 1>&6
--echo "configure:13395: checking for event.h" >&5
-+echo "configure:13422: checking for event.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 13400 "configure"
-+#line 13427 "configure"
- #include "confdefs.h"
- #include <event.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:13407: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13434: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -13426,7 +13453,7 @@ fi
-   fi
- 
-     echo $ac_n "checking for event_init in -levent""... $ac_c" 1>&6
--echo "configure:13430: checking for event_init in -levent" >&5
-+echo "configure:13457: checking for event_init in -levent" >&5
- ac_lib_var=`echo event'_'event_init | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13434,7 +13461,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-levent  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 13438 "configure"
-+#line 13465 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -13445,7 +13472,7 @@ int main() {
- event_init()
- ; return 0; }
- EOF
--if { (eval echo configure:13449: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13476: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -13528,7 +13555,7 @@ fi
- 	# Extract the first word of "nss-config", so it can be a program name with args.
- set dummy nss-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:13532: checking for $ac_word" >&5
-+echo "configure:13559: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_NSS_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -13563,7 +13590,7 @@ fi
- 
- 	min_nss_version=3.13.1
- 	echo $ac_n "checking for NSS - version >= $min_nss_version""... $ac_c" 1>&6
--echo "configure:13567: checking for NSS - version >= $min_nss_version" >&5
-+echo "configure:13594: checking for NSS - version >= $min_nss_version" >&5
- 
- 	no_nss=""
- 	if test "$NSS_CONFIG" = "no"; then
-@@ -13636,13 +13663,13 @@ fi
- 
- 
- echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
--echo "configure:13640: checking for YASM assembler" >&5
-+echo "configure:13667: checking for YASM assembler" >&5
- for ac_prog in yasm
- do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:13646: checking for $ac_word" >&5
-+echo "configure:13673: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_YASM'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -13704,7 +13731,7 @@ if test -z "$JPEG_DIR" -o "$JPEG_DIR" = no; then
-     SYSTEM_JPEG=
- else
-     echo $ac_n "checking for jpeg_destroy_compress in -ljpeg""... $ac_c" 1>&6
--echo "configure:13708: checking for jpeg_destroy_compress in -ljpeg" >&5
-+echo "configure:13735: checking for jpeg_destroy_compress in -ljpeg" >&5
- ac_lib_var=`echo jpeg'_'jpeg_destroy_compress | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13712,7 +13739,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-ljpeg $JPEG_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 13716 "configure"
-+#line 13743 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -13723,7 +13750,7 @@ int main() {
- jpeg_destroy_compress()
- ; return 0; }
- EOF
--if { (eval echo configure:13727: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13754: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -13746,10 +13773,10 @@ fi
- 
- fi
- 
--if test "$SYSTEM_JPEG" = 1; then
-+if test "$SYSTEM_JPEG" = 0; then
-     LIBS="$JPEG_LIBS $LIBS"
-     cat > conftest.$ac_ext <<EOF
--#line 13753 "configure"
-+#line 13780 "configure"
- #include "confdefs.h"
-  #include <stdio.h>
-                      #include <sys/types.h>
-@@ -13760,7 +13787,7 @@ int main() {
-                      #endif 
- ; return 0; }
- EOF
--if { (eval echo configure:13764: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13791: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   SYSTEM_JPEG=1
- else
-@@ -13798,7 +13825,7 @@ if test -z "$ZLIB_DIR" -o "$ZLIB_DIR" = no; then
-     SYSTEM_ZLIB=
- else
-     echo $ac_n "checking for gzread in -lz""... $ac_c" 1>&6
--echo "configure:13802: checking for gzread in -lz" >&5
-+echo "configure:13829: checking for gzread in -lz" >&5
- ac_lib_var=`echo z'_'gzread | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13806,7 +13833,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lz $ZLIB_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 13810 "configure"
-+#line 13837 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -13817,7 +13844,7 @@ int main() {
- gzread()
- ; return 0; }
- EOF
--if { (eval echo configure:13821: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13848: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -13839,10 +13866,10 @@ SYSTEM_ZLIB= ZLIB_CFLAGS= ZLIB_LIBS=
- fi
- 
- fi
--if test "$SYSTEM_ZLIB" = 1; then
-+if test "$SYSTEM_ZLIB" = 0; then
-     LIBS="$ZLIB_LIBS $LIBS"
-     cat > conftest.$ac_ext <<EOF
--#line 13846 "configure"
-+#line 13873 "configure"
- #include "confdefs.h"
-  #include <stdio.h>
-                      #include <string.h>
-@@ -13853,7 +13880,7 @@ int main() {
-                      #endif 
- ; return 0; }
- EOF
--if { (eval echo configure:13857: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13884: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   SYSTEM_ZLIB=1
- else
-@@ -13891,7 +13918,7 @@ if test -z "$BZ2_DIR" -o "$BZ2_DIR" = no; then
-     SYSTEM_BZ2=
- else
-     echo $ac_n "checking for BZ2_bzread in -lbz2""... $ac_c" 1>&6
--echo "configure:13895: checking for BZ2_bzread in -lbz2" >&5
-+echo "configure:13922: checking for BZ2_bzread in -lbz2" >&5
- ac_lib_var=`echo bz2'_'BZ2_bzread | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13899,7 +13926,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lbz2  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 13903 "configure"
-+#line 13930 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -13910,7 +13937,7 @@ int main() {
- BZ2_bzread()
- ; return 0; }
- EOF
--if { (eval echo configure:13914: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13941: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -13962,7 +13989,7 @@ if test -z "$PNG_DIR" -o "$PNG_DIR" = no; then
- else
-     _SAVE_PNG_LIBS=$PNG_LIBS
-     echo $ac_n "checking for png_get_valid in -lpng""... $ac_c" 1>&6
--echo "configure:13966: checking for png_get_valid in -lpng" >&5
-+echo "configure:13993: checking for png_get_valid in -lpng" >&5
- ac_lib_var=`echo png'_'png_get_valid | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13970,7 +13997,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lpng $PNG_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 13974 "configure"
-+#line 14001 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -13981,7 +14008,7 @@ int main() {
- png_get_valid()
- ; return 0; }
- EOF
--if { (eval echo configure:13985: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14012: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -14003,7 +14030,7 @@ else
- fi
- 
-     echo $ac_n "checking for png_get_acTL in -lpng""... $ac_c" 1>&6
--echo "configure:14007: checking for png_get_acTL in -lpng" >&5
-+echo "configure:14034: checking for png_get_acTL in -lpng" >&5
- ac_lib_var=`echo png'_'png_get_acTL | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -14011,7 +14038,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lpng $_SAVE_PNG_LIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 14015 "configure"
-+#line 14042 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -14022,7 +14049,7 @@ int main() {
- png_get_acTL()
- ; return 0; }
- EOF
--if { (eval echo configure:14026: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14053: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -14051,10 +14078,10 @@ else
- fi
- 
- fi
--if test "$SYSTEM_PNG" = 1; then
-+if test "$SYSTEM_PNG" = 0; then
-     LIBS="$PNG_LIBS $LIBS"
-     cat > conftest.$ac_ext <<EOF
--#line 14058 "configure"
-+#line 14085 "configure"
- #include "confdefs.h"
-  #include <stdio.h>
-                      #include <sys/types.h>
-@@ -14068,7 +14095,7 @@ int main() {
-                      #endif 
- ; return 0; }
- EOF
--if { (eval echo configure:14072: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14099: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   SYSTEM_PNG=1
- else
-@@ -14110,7 +14137,7 @@ if test -n "$SYSTEM_HUNSPELL"; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:14114: checking for $ac_word" >&5
-+echo "configure:14141: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14154,19 +14181,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for hunspell""... $ac_c" 1>&6
--echo "configure:14158: checking for hunspell" >&5
-+echo "configure:14185: checking for hunspell" >&5
- 
-         if $PKG_CONFIG --exists "hunspell" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_HUNSPELL_CFLAGS""... $ac_c" 1>&6
--echo "configure:14165: checking MOZ_HUNSPELL_CFLAGS" >&5
-+echo "configure:14192: checking MOZ_HUNSPELL_CFLAGS" >&5
-             MOZ_HUNSPELL_CFLAGS=`$PKG_CONFIG --cflags "hunspell"`
-             echo "$ac_t""$MOZ_HUNSPELL_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_HUNSPELL_LIBS""... $ac_c" 1>&6
--echo "configure:14170: checking MOZ_HUNSPELL_LIBS" >&5
-+echo "configure:14197: checking MOZ_HUNSPELL_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_HUNSPELL_LIBS="`$PKG_CONFIG --libs \"hunspell\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_HUNSPELL_LIBS" 1>&6
-@@ -14222,7 +14249,7 @@ if test -n "$MOZ_NATIVE_FFI"; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:14226: checking for $ac_word" >&5
-+echo "configure:14253: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14266,19 +14293,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libffi > 3.0.9""... $ac_c" 1>&6
--echo "configure:14270: checking for libffi > 3.0.9" >&5
-+echo "configure:14297: checking for libffi > 3.0.9" >&5
- 
-         if $PKG_CONFIG --exists "libffi > 3.0.9" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_FFI_CFLAGS""... $ac_c" 1>&6
--echo "configure:14277: checking MOZ_FFI_CFLAGS" >&5
-+echo "configure:14304: checking MOZ_FFI_CFLAGS" >&5
-             MOZ_FFI_CFLAGS=`$PKG_CONFIG --cflags "libffi > 3.0.9"`
-             echo "$ac_t""$MOZ_FFI_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_FFI_LIBS""... $ac_c" 1>&6
--echo "configure:14282: checking MOZ_FFI_LIBS" >&5
-+echo "configure:14309: checking MOZ_FFI_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_FFI_LIBS="`$PKG_CONFIG --libs \"libffi > 3.0.9\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_FFI_LIBS" 1>&6
-@@ -14314,7 +14341,7 @@ echo "configure:14282: checking MOZ_FFI_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:14318: checking for $ac_word" >&5
-+echo "configure:14345: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14358,19 +14385,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libffi >= 3.0.9""... $ac_c" 1>&6
--echo "configure:14362: checking for libffi >= 3.0.9" >&5
-+echo "configure:14389: checking for libffi >= 3.0.9" >&5
- 
-         if $PKG_CONFIG --exists "libffi >= 3.0.9" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_FFI_CFLAGS""... $ac_c" 1>&6
--echo "configure:14369: checking MOZ_FFI_CFLAGS" >&5
-+echo "configure:14396: checking MOZ_FFI_CFLAGS" >&5
-             MOZ_FFI_CFLAGS=`$PKG_CONFIG --cflags "libffi >= 3.0.9"`
-             echo "$ac_t""$MOZ_FFI_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_FFI_LIBS""... $ac_c" 1>&6
--echo "configure:14374: checking MOZ_FFI_LIBS" >&5
-+echo "configure:14401: checking MOZ_FFI_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_FFI_LIBS="`$PKG_CONFIG --libs \"libffi >= 3.0.9\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_FFI_LIBS" 1>&6
-@@ -14542,7 +14569,7 @@ fi
- 
- 
- echo $ac_n "checking for application to build""... $ac_c" 1>&6
--echo "configure:14546: checking for application to build" >&5
-+echo "configure:14573: checking for application to build" >&5
- if test -z "$MOZ_BUILD_APP"; then
-   echo "$ac_t""browser" 1>&6
-   MOZ_BUILD_APP=browser
-@@ -14560,7 +14587,7 @@ fi
- # Allow the application to influence configure with a confvars.sh script.
- 
- echo $ac_n "checking if app-specific confvars.sh exists""... $ac_c" 1>&6
--echo "configure:14564: checking if app-specific confvars.sh exists" >&5
-+echo "configure:14591: checking if app-specific confvars.sh exists" >&5
- if test -f "${srcdir}/${MOZ_BUILD_APP}/confvars.sh" ; then
-   echo "$ac_t""${srcdir}/${MOZ_BUILD_APP}/confvars.sh" 1>&6
-   . "${srcdir}/${MOZ_BUILD_APP}/confvars.sh"
-@@ -14828,7 +14855,7 @@ if test "$COMPILE_ENVIRONMENT"; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:14832: checking for $ac_word" >&5
-+echo "configure:14859: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14872,19 +14899,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for directfb >= 1.1.0""... $ac_c" 1>&6
--echo "configure:14876: checking for directfb >= 1.1.0" >&5
-+echo "configure:14903: checking for directfb >= 1.1.0" >&5
- 
-         if $PKG_CONFIG --exists "directfb >= 1.1.0" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_DFB_CFLAGS""... $ac_c" 1>&6
--echo "configure:14883: checking MOZ_DFB_CFLAGS" >&5
-+echo "configure:14910: checking MOZ_DFB_CFLAGS" >&5
-             MOZ_DFB_CFLAGS=`$PKG_CONFIG --cflags "directfb >= 1.1.0"`
-             echo "$ac_t""$MOZ_DFB_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_DFB_LIBS""... $ac_c" 1>&6
--echo "configure:14888: checking MOZ_DFB_LIBS" >&5
-+echo "configure:14915: checking MOZ_DFB_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_DFB_LIBS="`$PKG_CONFIG --libs \"directfb >= 1.1.0\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_DFB_LIBS" 1>&6
-@@ -14922,7 +14949,7 @@ echo "configure:14888: checking MOZ_DFB_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:14926: checking for $ac_word" >&5
-+echo "configure:14953: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -14966,19 +14993,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES""... $ac_c" 1>&6
--echo "configure:14970: checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" >&5
-+echo "configure:14997: checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" >&5
- 
-         if $PKG_CONFIG --exists "gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GTK2_CFLAGS""... $ac_c" 1>&6
--echo "configure:14977: checking MOZ_GTK2_CFLAGS" >&5
-+echo "configure:15004: checking MOZ_GTK2_CFLAGS" >&5
-             MOZ_GTK2_CFLAGS=`$PKG_CONFIG --cflags "gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES"`
-             echo "$ac_t""$MOZ_GTK2_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GTK2_LIBS""... $ac_c" 1>&6
--echo "configure:14982: checking MOZ_GTK2_LIBS" >&5
-+echo "configure:15009: checking MOZ_GTK2_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GTK2_LIBS="`$PKG_CONFIG --libs \"gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GTK2_LIBS" 1>&6
-@@ -15033,6 +15060,7 @@ EOF
- fi
- 
- 
-+if test -z "$LIBXUL_SDK"; then
- if test "$MOZ_ENABLE_GTK2"
- then
-     MOZ_ENABLE_STARTUP_NOTIFICATION=
-@@ -15057,7 +15085,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15061: checking for $ac_word" >&5
-+echo "configure:15089: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15101,19 +15129,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION""... $ac_c" 1>&6
--echo "configure:15105: checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" >&5
-+echo "configure:15133: checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_STARTUP_NOTIFICATION_CFLAGS""... $ac_c" 1>&6
--echo "configure:15112: checking MOZ_STARTUP_NOTIFICATION_CFLAGS" >&5
-+echo "configure:15140: checking MOZ_STARTUP_NOTIFICATION_CFLAGS" >&5
-             MOZ_STARTUP_NOTIFICATION_CFLAGS=`$PKG_CONFIG --cflags "libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION"`
-             echo "$ac_t""$MOZ_STARTUP_NOTIFICATION_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_STARTUP_NOTIFICATION_LIBS""... $ac_c" 1>&6
--echo "configure:15117: checking MOZ_STARTUP_NOTIFICATION_LIBS" >&5
-+echo "configure:15145: checking MOZ_STARTUP_NOTIFICATION_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_STARTUP_NOTIFICATION_LIBS="`$PKG_CONFIG --libs \"libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_STARTUP_NOTIFICATION_LIBS" 1>&6
-@@ -15159,6 +15187,7 @@ EOF
- 
-     TK_LIBS="$TK_LIBS $MOZ_STARTUP_NOTIFICATION_LIBS"
- fi
-+fi
- 
- 
- 
-@@ -15179,7 +15208,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15183: checking for $ac_word" >&5
-+echo "configure:15212: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15223,19 +15252,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for QtGui QtNetwork QtCore QtOpenGL""... $ac_c" 1>&6
--echo "configure:15227: checking for QtGui QtNetwork QtCore QtOpenGL" >&5
-+echo "configure:15256: checking for QtGui QtNetwork QtCore QtOpenGL" >&5
- 
-         if $PKG_CONFIG --exists "QtGui QtNetwork QtCore QtOpenGL" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_QT_CFLAGS""... $ac_c" 1>&6
--echo "configure:15234: checking MOZ_QT_CFLAGS" >&5
-+echo "configure:15263: checking MOZ_QT_CFLAGS" >&5
-             MOZ_QT_CFLAGS=`$PKG_CONFIG --cflags "QtGui QtNetwork QtCore QtOpenGL"`
-             echo "$ac_t""$MOZ_QT_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_QT_LIBS""... $ac_c" 1>&6
--echo "configure:15239: checking MOZ_QT_LIBS" >&5
-+echo "configure:15268: checking MOZ_QT_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_QT_LIBS="`$PKG_CONFIG --libs \"QtGui QtNetwork QtCore QtOpenGL\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_QT_LIBS" 1>&6
-@@ -15269,7 +15298,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15273: checking for $ac_word" >&5
-+echo "configure:15302: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_HOST_MOC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15324,7 +15353,7 @@ incorrect" 1>&2; exit 1; }
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15328: checking for $ac_word" >&5
-+echo "configure:15357: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15368,19 +15397,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for qmsystem2""... $ac_c" 1>&6
--echo "configure:15372: checking for qmsystem2" >&5
-+echo "configure:15401: checking for qmsystem2" >&5
- 
-         if $PKG_CONFIG --exists "qmsystem2" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking _QMSYSTEM2_CFLAGS""... $ac_c" 1>&6
--echo "configure:15379: checking _QMSYSTEM2_CFLAGS" >&5
-+echo "configure:15408: checking _QMSYSTEM2_CFLAGS" >&5
-             _QMSYSTEM2_CFLAGS=`$PKG_CONFIG --cflags "qmsystem2"`
-             echo "$ac_t""$_QMSYSTEM2_CFLAGS" 1>&6
- 
-             echo $ac_n "checking _QMSYSTEM2_LIBS""... $ac_c" 1>&6
--echo "configure:15384: checking _QMSYSTEM2_LIBS" >&5
-+echo "configure:15413: checking _QMSYSTEM2_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             _QMSYSTEM2_LIBS="`$PKG_CONFIG --libs \"qmsystem2\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$_QMSYSTEM2_LIBS" 1>&6
-@@ -15427,7 +15456,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15431: checking for $ac_word" >&5
-+echo "configure:15460: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15471,19 +15500,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for QtNetwork >= 4.7""... $ac_c" 1>&6
--echo "configure:15475: checking for QtNetwork >= 4.7" >&5
-+echo "configure:15504: checking for QtNetwork >= 4.7" >&5
- 
-         if $PKG_CONFIG --exists "QtNetwork >= 4.7" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking _QTNETWORK_CFLAGS""... $ac_c" 1>&6
--echo "configure:15482: checking _QTNETWORK_CFLAGS" >&5
-+echo "configure:15511: checking _QTNETWORK_CFLAGS" >&5
-             _QTNETWORK_CFLAGS=`$PKG_CONFIG --cflags "QtNetwork >= 4.7"`
-             echo "$ac_t""$_QTNETWORK_CFLAGS" 1>&6
- 
-             echo $ac_n "checking _QTNETWORK_LIBS""... $ac_c" 1>&6
--echo "configure:15487: checking _QTNETWORK_LIBS" >&5
-+echo "configure:15516: checking _QTNETWORK_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             _QTNETWORK_LIBS="`$PKG_CONFIG --libs \"QtNetwork >= 4.7\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$_QTNETWORK_LIBS" 1>&6
-@@ -15528,7 +15557,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15532: checking for $ac_word" >&5
-+echo "configure:15561: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15572,19 +15601,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for QtSensors QtFeedback QtLocation""... $ac_c" 1>&6
--echo "configure:15576: checking for QtSensors QtFeedback QtLocation" >&5
-+echo "configure:15605: checking for QtSensors QtFeedback QtLocation" >&5
- 
-         if $PKG_CONFIG --exists "QtSensors QtFeedback QtLocation" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking _QTMOBILITY_CFLAGS""... $ac_c" 1>&6
--echo "configure:15583: checking _QTMOBILITY_CFLAGS" >&5
-+echo "configure:15612: checking _QTMOBILITY_CFLAGS" >&5
-             _QTMOBILITY_CFLAGS=`$PKG_CONFIG --cflags "QtSensors QtFeedback QtLocation"`
-             echo "$ac_t""$_QTMOBILITY_CFLAGS" 1>&6
- 
-             echo $ac_n "checking _QTMOBILITY_LIBS""... $ac_c" 1>&6
--echo "configure:15588: checking _QTMOBILITY_LIBS" >&5
-+echo "configure:15617: checking _QTMOBILITY_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             _QTMOBILITY_LIBS="`$PKG_CONFIG --libs \"QtSensors QtFeedback QtLocation\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$_QTMOBILITY_LIBS" 1>&6
-@@ -15619,7 +15648,7 @@ echo "configure:15588: checking _QTMOBILITY_LIBS" >&5
-        MOZ_QT_LIBS="$MOZ_QT_LIBS $_QTMOBILITY_LIBS"
-     else
-        echo $ac_n "checking for main in -lQtSensors""... $ac_c" 1>&6
--echo "configure:15623: checking for main in -lQtSensors" >&5
-+echo "configure:15652: checking for main in -lQtSensors" >&5
- ac_lib_var=`echo QtSensors'_'main | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -15627,14 +15656,14 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lQtSensors  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 15631 "configure"
-+#line 15660 "configure"
- #include "confdefs.h"
- 
- int main() {
- main()
- ; return 0; }
- EOF
--if { (eval echo configure:15638: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:15667: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -15689,6 +15718,15 @@ fi
- 
- 
- 
-+if test "$MOZ_ENABLE_GTK2" && test -z "$LIBXUL_SDK"
-+then
-+    cat >> confdefs.h <<\EOF
-+#define MOZ_X11 1
-+EOF
-+
-+    MOZ_X11=1
-+fi
-+
- 
- # Components and Features
- 
-@@ -15778,7 +15816,7 @@ if test "${enable_pango+set}" = set; then
- fi
- 
- 
--if test "$MOZ_ENABLE_GTK2"
-+if test "$MOZ_ENABLE_GTK2" && test -z "$LIBXUL_SDK"
- then
-     
- 
-@@ -15788,7 +15826,7 @@ then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15792: checking for $ac_word" >&5
-+echo "configure:15830: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15832,19 +15870,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for pango >= $PANGO_VERSION""... $ac_c" 1>&6
--echo "configure:15836: checking for pango >= $PANGO_VERSION" >&5
-+echo "configure:15874: checking for pango >= $PANGO_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "pango >= $PANGO_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking _PANGOCHK_CFLAGS""... $ac_c" 1>&6
--echo "configure:15843: checking _PANGOCHK_CFLAGS" >&5
-+echo "configure:15881: checking _PANGOCHK_CFLAGS" >&5
-             _PANGOCHK_CFLAGS=`$PKG_CONFIG --cflags "pango >= $PANGO_VERSION"`
-             echo "$ac_t""$_PANGOCHK_CFLAGS" 1>&6
- 
-             echo $ac_n "checking _PANGOCHK_LIBS""... $ac_c" 1>&6
--echo "configure:15848: checking _PANGOCHK_LIBS" >&5
-+echo "configure:15886: checking _PANGOCHK_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             _PANGOCHK_LIBS="`$PKG_CONFIG --libs \"pango >= $PANGO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$_PANGOCHK_LIBS" 1>&6
-@@ -15880,7 +15918,7 @@ echo "configure:15848: checking _PANGOCHK_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15884: checking for $ac_word" >&5
-+echo "configure:15922: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -15924,19 +15962,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION""... $ac_c" 1>&6
--echo "configure:15928: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
-+echo "configure:15966: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_PANGO_CFLAGS""... $ac_c" 1>&6
--echo "configure:15935: checking MOZ_PANGO_CFLAGS" >&5
-+echo "configure:15973: checking MOZ_PANGO_CFLAGS" >&5
-             MOZ_PANGO_CFLAGS=`$PKG_CONFIG --cflags "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION"`
-             echo "$ac_t""$MOZ_PANGO_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_PANGO_LIBS""... $ac_c" 1>&6
--echo "configure:15940: checking MOZ_PANGO_LIBS" >&5
-+echo "configure:15978: checking MOZ_PANGO_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_PANGO_LIBS="`$PKG_CONFIG --libs \"pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_PANGO_LIBS" 1>&6
-@@ -15980,7 +16018,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:15984: checking for $ac_word" >&5
-+echo "configure:16022: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16024,19 +16062,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for freetype2 > 6.1.0 fontconfig""... $ac_c" 1>&6
--echo "configure:16028: checking for freetype2 > 6.1.0 fontconfig" >&5
-+echo "configure:16066: checking for freetype2 > 6.1.0 fontconfig" >&5
- 
-         if $PKG_CONFIG --exists "freetype2 > 6.1.0 fontconfig" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking FT2_CFLAGS""... $ac_c" 1>&6
--echo "configure:16035: checking FT2_CFLAGS" >&5
-+echo "configure:16073: checking FT2_CFLAGS" >&5
-             FT2_CFLAGS=`$PKG_CONFIG --cflags "freetype2 > 6.1.0 fontconfig"`
-             echo "$ac_t""$FT2_CFLAGS" 1>&6
- 
-             echo $ac_n "checking FT2_LIBS""... $ac_c" 1>&6
--echo "configure:16040: checking FT2_LIBS" >&5
-+echo "configure:16078: checking FT2_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             FT2_LIBS="`$PKG_CONFIG --libs \"freetype2 > 6.1.0 fontconfig\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$FT2_LIBS" 1>&6
-@@ -16080,7 +16118,7 @@ then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16084: checking for $ac_word" >&5
-+echo "configure:16122: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16124,19 +16162,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION""... $ac_c" 1>&6
--echo "configure:16128: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
-+echo "configure:16166: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_PANGO_CFLAGS""... $ac_c" 1>&6
--echo "configure:16135: checking MOZ_PANGO_CFLAGS" >&5
-+echo "configure:16173: checking MOZ_PANGO_CFLAGS" >&5
-             MOZ_PANGO_CFLAGS=`$PKG_CONFIG --cflags "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION"`
-             echo "$ac_t""$MOZ_PANGO_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_PANGO_LIBS""... $ac_c" 1>&6
--echo "configure:16140: checking MOZ_PANGO_LIBS" >&5
-+echo "configure:16178: checking MOZ_PANGO_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_PANGO_LIBS="`$PKG_CONFIG --libs \"pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_PANGO_LIBS" 1>&6
-@@ -16180,6 +16218,7 @@ EOF
- fi
- 
- 
-+if test -z "$LIBXUL_SDK"; then
- if test "$MOZ_X11"
- then
-             if test "$MOZ_ENABLE_GTK2"
-@@ -16209,7 +16248,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16213: checking for $ac_word" >&5
-+echo "configure:16252: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16253,19 +16292,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION""... $ac_c" 1>&6
--echo "configure:16257: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
-+echo "configure:16296: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GNOMEVFS_CFLAGS""... $ac_c" 1>&6
--echo "configure:16264: checking MOZ_GNOMEVFS_CFLAGS" >&5
-+echo "configure:16303: checking MOZ_GNOMEVFS_CFLAGS" >&5
-             MOZ_GNOMEVFS_CFLAGS=`$PKG_CONFIG --cflags "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION"`
-             echo "$ac_t""$MOZ_GNOMEVFS_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GNOMEVFS_LIBS""... $ac_c" 1>&6
--echo "configure:16269: checking MOZ_GNOMEVFS_LIBS" >&5
-+echo "configure:16308: checking MOZ_GNOMEVFS_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GNOMEVFS_LIBS="`$PKG_CONFIG --libs \"gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GNOMEVFS_LIBS" 1>&6
-@@ -16315,7 +16354,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16319: checking for $ac_word" >&5
-+echo "configure:16358: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16359,19 +16398,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION""... $ac_c" 1>&6
--echo "configure:16363: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
-+echo "configure:16402: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GNOMEVFS_CFLAGS""... $ac_c" 1>&6
--echo "configure:16370: checking MOZ_GNOMEVFS_CFLAGS" >&5
-+echo "configure:16409: checking MOZ_GNOMEVFS_CFLAGS" >&5
-             MOZ_GNOMEVFS_CFLAGS=`$PKG_CONFIG --cflags "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION"`
-             echo "$ac_t""$MOZ_GNOMEVFS_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GNOMEVFS_LIBS""... $ac_c" 1>&6
--echo "configure:16375: checking MOZ_GNOMEVFS_LIBS" >&5
-+echo "configure:16414: checking MOZ_GNOMEVFS_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GNOMEVFS_LIBS="`$PKG_CONFIG --libs \"gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GNOMEVFS_LIBS" 1>&6
-@@ -16430,7 +16469,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16434: checking for $ac_word" >&5
-+echo "configure:16473: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16474,19 +16513,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gtk+-2.0 >= 2.14""... $ac_c" 1>&6
--echo "configure:16478: checking for gtk+-2.0 >= 2.14" >&5
-+echo "configure:16517: checking for gtk+-2.0 >= 2.14" >&5
- 
-         if $PKG_CONFIG --exists "gtk+-2.0 >= 2.14" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking _GTKCHECK_CFLAGS""... $ac_c" 1>&6
--echo "configure:16485: checking _GTKCHECK_CFLAGS" >&5
-+echo "configure:16524: checking _GTKCHECK_CFLAGS" >&5
-             _GTKCHECK_CFLAGS=`$PKG_CONFIG --cflags "gtk+-2.0 >= 2.14"`
-             echo "$ac_t""$_GTKCHECK_CFLAGS" 1>&6
- 
-             echo $ac_n "checking _GTKCHECK_LIBS""... $ac_c" 1>&6
--echo "configure:16490: checking _GTKCHECK_LIBS" >&5
-+echo "configure:16529: checking _GTKCHECK_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             _GTKCHECK_LIBS="`$PKG_CONFIG --libs \"gtk+-2.0 >= 2.14\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$_GTKCHECK_LIBS" 1>&6
-@@ -16521,7 +16560,7 @@ echo "configure:16490: checking _GTKCHECK_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16525: checking for $ac_word" >&5
-+echo "configure:16564: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16565,19 +16604,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gio-2.0 >= $GIO_VERSION""... $ac_c" 1>&6
--echo "configure:16569: checking for gio-2.0 >= $GIO_VERSION" >&5
-+echo "configure:16608: checking for gio-2.0 >= $GIO_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "gio-2.0 >= $GIO_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GIO_CFLAGS""... $ac_c" 1>&6
--echo "configure:16576: checking MOZ_GIO_CFLAGS" >&5
-+echo "configure:16615: checking MOZ_GIO_CFLAGS" >&5
-             MOZ_GIO_CFLAGS=`$PKG_CONFIG --cflags "gio-2.0 >= $GIO_VERSION"`
-             echo "$ac_t""$MOZ_GIO_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GIO_LIBS""... $ac_c" 1>&6
--echo "configure:16581: checking MOZ_GIO_LIBS" >&5
-+echo "configure:16620: checking MOZ_GIO_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GIO_LIBS="`$PKG_CONFIG --libs \"gio-2.0 >= $GIO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GIO_LIBS" 1>&6
-@@ -16646,7 +16685,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16650: checking for $ac_word" >&5
-+echo "configure:16689: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16690,19 +16729,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 ""... $ac_c" 1>&6
--echo "configure:16694: checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 " >&5
-+echo "configure:16733: checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 " >&5
- 
-         if $PKG_CONFIG --exists "gconf-2.0 >= $GCONF_VERSION gobject-2.0 " ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GCONF_CFLAGS""... $ac_c" 1>&6
--echo "configure:16701: checking MOZ_GCONF_CFLAGS" >&5
-+echo "configure:16740: checking MOZ_GCONF_CFLAGS" >&5
-             MOZ_GCONF_CFLAGS=`$PKG_CONFIG --cflags "gconf-2.0 >= $GCONF_VERSION gobject-2.0 "`
-             echo "$ac_t""$MOZ_GCONF_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GCONF_LIBS""... $ac_c" 1>&6
--echo "configure:16706: checking MOZ_GCONF_LIBS" >&5
-+echo "configure:16745: checking MOZ_GCONF_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GCONF_LIBS="`$PKG_CONFIG --libs \"gconf-2.0 >= $GCONF_VERSION gobject-2.0 \" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GCONF_LIBS" 1>&6
-@@ -16780,7 +16819,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16784: checking for $ac_word" >&5
-+echo "configure:16823: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16824,19 +16863,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libproxy-1.0""... $ac_c" 1>&6
--echo "configure:16828: checking for libproxy-1.0" >&5
-+echo "configure:16867: checking for libproxy-1.0" >&5
- 
-         if $PKG_CONFIG --exists "libproxy-1.0" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_LIBPROXY_CFLAGS""... $ac_c" 1>&6
--echo "configure:16835: checking MOZ_LIBPROXY_CFLAGS" >&5
-+echo "configure:16874: checking MOZ_LIBPROXY_CFLAGS" >&5
-             MOZ_LIBPROXY_CFLAGS=`$PKG_CONFIG --cflags "libproxy-1.0"`
-             echo "$ac_t""$MOZ_LIBPROXY_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_LIBPROXY_LIBS""... $ac_c" 1>&6
--echo "configure:16840: checking MOZ_LIBPROXY_LIBS" >&5
-+echo "configure:16879: checking MOZ_LIBPROXY_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_LIBPROXY_LIBS="`$PKG_CONFIG --libs \"libproxy-1.0\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_LIBPROXY_LIBS" 1>&6
-@@ -16914,7 +16953,7 @@ then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:16918: checking for $ac_word" >&5
-+echo "configure:16957: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -16958,19 +16997,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libnotify >= $LIBNOTIFY_VERSION""... $ac_c" 1>&6
--echo "configure:16962: checking for libnotify >= $LIBNOTIFY_VERSION" >&5
-+echo "configure:17001: checking for libnotify >= $LIBNOTIFY_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "libnotify >= $LIBNOTIFY_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_LIBNOTIFY_CFLAGS""... $ac_c" 1>&6
--echo "configure:16969: checking MOZ_LIBNOTIFY_CFLAGS" >&5
-+echo "configure:17008: checking MOZ_LIBNOTIFY_CFLAGS" >&5
-             MOZ_LIBNOTIFY_CFLAGS=`$PKG_CONFIG --cflags "libnotify >= $LIBNOTIFY_VERSION"`
-             echo "$ac_t""$MOZ_LIBNOTIFY_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_LIBNOTIFY_LIBS""... $ac_c" 1>&6
--echo "configure:16974: checking MOZ_LIBNOTIFY_LIBS" >&5
-+echo "configure:17013: checking MOZ_LIBNOTIFY_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_LIBNOTIFY_LIBS="`$PKG_CONFIG --libs \"libnotify >= $LIBNOTIFY_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_LIBNOTIFY_LIBS" 1>&6
-@@ -17045,7 +17084,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:17049: checking for $ac_word" >&5
-+echo "configure:17088: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -17089,19 +17128,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libgnomeui-2.0 >= $GNOMEUI_VERSION""... $ac_c" 1>&6
--echo "configure:17093: checking for libgnomeui-2.0 >= $GNOMEUI_VERSION" >&5
-+echo "configure:17132: checking for libgnomeui-2.0 >= $GNOMEUI_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "libgnomeui-2.0 >= $GNOMEUI_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GNOMEUI_CFLAGS""... $ac_c" 1>&6
--echo "configure:17100: checking MOZ_GNOMEUI_CFLAGS" >&5
-+echo "configure:17139: checking MOZ_GNOMEUI_CFLAGS" >&5
-             MOZ_GNOMEUI_CFLAGS=`$PKG_CONFIG --cflags "libgnomeui-2.0 >= $GNOMEUI_VERSION"`
-             echo "$ac_t""$MOZ_GNOMEUI_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GNOMEUI_LIBS""... $ac_c" 1>&6
--echo "configure:17105: checking MOZ_GNOMEUI_LIBS" >&5
-+echo "configure:17144: checking MOZ_GNOMEUI_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GNOMEUI_LIBS="`$PKG_CONFIG --libs \"libgnomeui-2.0 >= $GNOMEUI_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GNOMEUI_LIBS" 1>&6
-@@ -17179,7 +17218,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:17183: checking for $ac_word" >&5
-+echo "configure:17222: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -17223,19 +17262,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for dbus-1 >= $DBUS_VERSION""... $ac_c" 1>&6
--echo "configure:17227: checking for dbus-1 >= $DBUS_VERSION" >&5
-+echo "configure:17266: checking for dbus-1 >= $DBUS_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "dbus-1 >= $DBUS_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_DBUS_CFLAGS""... $ac_c" 1>&6
--echo "configure:17234: checking MOZ_DBUS_CFLAGS" >&5
-+echo "configure:17273: checking MOZ_DBUS_CFLAGS" >&5
-             MOZ_DBUS_CFLAGS=`$PKG_CONFIG --cflags "dbus-1 >= $DBUS_VERSION"`
-             echo "$ac_t""$MOZ_DBUS_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_DBUS_LIBS""... $ac_c" 1>&6
--echo "configure:17239: checking MOZ_DBUS_LIBS" >&5
-+echo "configure:17278: checking MOZ_DBUS_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_DBUS_LIBS="`$PKG_CONFIG --libs \"dbus-1 >= $DBUS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_DBUS_LIBS" 1>&6
-@@ -17270,7 +17309,7 @@ echo "configure:17239: checking MOZ_DBUS_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:17274: checking for $ac_word" >&5
-+echo "configure:17313: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -17314,19 +17353,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for dbus-glib-1 >= $DBUS_VERSION""... $ac_c" 1>&6
--echo "configure:17318: checking for dbus-glib-1 >= $DBUS_VERSION" >&5
-+echo "configure:17357: checking for dbus-glib-1 >= $DBUS_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "dbus-glib-1 >= $DBUS_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_DBUS_GLIB_CFLAGS""... $ac_c" 1>&6
--echo "configure:17325: checking MOZ_DBUS_GLIB_CFLAGS" >&5
-+echo "configure:17364: checking MOZ_DBUS_GLIB_CFLAGS" >&5
-             MOZ_DBUS_GLIB_CFLAGS=`$PKG_CONFIG --cflags "dbus-glib-1 >= $DBUS_VERSION"`
-             echo "$ac_t""$MOZ_DBUS_GLIB_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_DBUS_GLIB_LIBS""... $ac_c" 1>&6
--echo "configure:17330: checking MOZ_DBUS_GLIB_LIBS" >&5
-+echo "configure:17369: checking MOZ_DBUS_GLIB_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_DBUS_GLIB_LIBS="`$PKG_CONFIG --libs \"dbus-glib-1 >= $DBUS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_DBUS_GLIB_LIBS" 1>&6
-@@ -17367,6 +17406,9 @@ fi
- 
- 
- 
-+fi # LIBXUL_SDK
-+
-+
- # Check whether --enable-crypto or --disable-crypto was given.
- if test "${enable_crypto+set}" = set; then
-   enableval="$enable_crypto"
-@@ -17556,7 +17598,7 @@ EOF
-     esac
- 
-         echo $ac_n "checking __attribute__ ((aligned ())) support""... $ac_c" 1>&6
--echo "configure:17560: checking __attribute__ ((aligned ())) support" >&5
-+echo "configure:17602: checking __attribute__ ((aligned ())) support" >&5
- if eval "test \"`echo '$''{'ac_cv_c_attribute_aligned'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -17566,14 +17608,14 @@ else
-          for ac_cv_c_attr_align_try in 64 32 16 8; do
-            echo "trying $ac_cv_c_attr_align_try"
-            cat > conftest.$ac_ext <<EOF
--#line 17570 "configure"
-+#line 17612 "configure"
- #include "confdefs.h"
- 
- int main() {
- static char c __attribute__ ((aligned(${ac_cv_c_attr_align_try}))) = 0; return c;
- ; return 0; }
- EOF
--if { (eval echo configure:17577: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:17619: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_cv_c_attribute_aligned="${ac_cv_c_attr_align_try}"
- else
-@@ -17651,19 +17693,19 @@ EOF
-         MOZ_NATIVE_LIBVPX_DEC_TEST=
-            ac_safe=`echo "vpx/vpx_decoder.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for vpx/vpx_decoder.h""... $ac_c" 1>&6
--echo "configure:17655: checking for vpx/vpx_decoder.h" >&5
-+echo "configure:17697: checking for vpx/vpx_decoder.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 17660 "configure"
-+#line 17702 "configure"
- #include "confdefs.h"
- #include <vpx/vpx_decoder.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:17667: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:17709: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -17686,7 +17728,7 @@ fi
-   fi
- 
-         echo $ac_n "checking for vpx_codec_dec_init_ver in -lvpx""... $ac_c" 1>&6
--echo "configure:17690: checking for vpx_codec_dec_init_ver in -lvpx" >&5
-+echo "configure:17732: checking for vpx_codec_dec_init_ver in -lvpx" >&5
- ac_lib_var=`echo vpx'_'vpx_codec_dec_init_ver | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -17694,7 +17736,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lvpx  $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 17698 "configure"
-+#line 17740 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -17705,7 +17747,7 @@ int main() {
- vpx_codec_dec_init_ver()
- ; return 0; }
- EOF
--if { (eval echo configure:17709: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:17751: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -17727,14 +17769,14 @@ else
- fi
- 
-         if test -n "$MOZ_NATIVE_LIBVPX_DEC_TEST" ; then
--            echo $ac_n "checking for libvpx version >= v0.9.7""... $ac_c" 1>&6
--echo "configure:17732: checking for libvpx version >= v0.9.7" >&5
-+            echo $ac_n "checking for libvpx version >= v1.0.0""... $ac_c" 1>&6
-+echo "configure:17774: checking for libvpx version >= v1.0.0" >&5
-                                                                                                                                     cat > conftest.$ac_ext <<EOF
--#line 17734 "configure"
-+#line 17776 "configure"
- #include "confdefs.h"
- 
-                 #include <vpx/vpx_decoder.h>
--                #if !defined(VPX_CODEC_USE_INPUT_PARTITION)
-+                #if !defined(VPX_CODEC_USE_INPUT_FRAGMENTS)
-                     #error "test failed."
-                 #endif
-                 
-@@ -17742,7 +17784,7 @@ int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:17746: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:17788: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   echo "$ac_t""yes" 1>&6
-                  MOZ_NATIVE_LIBVPX=1
-@@ -17753,7 +17795,7 @@ else
-   cat conftest.$ac_ext >&5
-   rm -rf conftest*
-   echo "$ac_t""no" 1>&6
--                 { echo "configure: error: --with-system-libvpx requested but it is not v0.9.7 or later" 1>&2; exit 1; }
-+                 { echo "configure: error: --with-system-libvpx requested but it is not v1.0.0 or later" 1>&2; exit 1; }
- fi
- rm -f conftest*
-         fi
-@@ -17918,6 +17960,7 @@ EOF
- fi
- 
- 
-+if test -z "$LIBXUL_SDK"; then
- if test -n "$MOZ_SYDNEYAUDIO"; then
-    case "$target_os" in
- linux*)
-@@ -17927,7 +17970,7 @@ linux*)
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:17931: checking for $ac_word" >&5
-+echo "configure:17974: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -17971,19 +18014,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for alsa""... $ac_c" 1>&6
--echo "configure:17975: checking for alsa" >&5
-+echo "configure:18018: checking for alsa" >&5
- 
-         if $PKG_CONFIG --exists "alsa" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_ALSA_CFLAGS""... $ac_c" 1>&6
--echo "configure:17982: checking MOZ_ALSA_CFLAGS" >&5
-+echo "configure:18025: checking MOZ_ALSA_CFLAGS" >&5
-             MOZ_ALSA_CFLAGS=`$PKG_CONFIG --cflags "alsa"`
-             echo "$ac_t""$MOZ_ALSA_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_ALSA_LIBS""... $ac_c" 1>&6
--echo "configure:17987: checking MOZ_ALSA_LIBS" >&5
-+echo "configure:18030: checking MOZ_ALSA_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_ALSA_LIBS="`$PKG_CONFIG --libs \"alsa\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_ALSA_LIBS" 1>&6
-@@ -18016,6 +18059,7 @@ echo "configure:17987: checking MOZ_ALSA_LIBS" >&5
-       ;;
-    esac
- fi
-+fi
- 
- # Check whether --enable-permissions or --disable-permissions was given.
- if test "${enable_permissions+set}" = set; then
-@@ -18117,7 +18161,7 @@ fi
-  # Extract the first word of "java", so it can be a program name with args.
- set dummy java; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18121: checking for $ac_word" >&5
-+echo "configure:18165: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_JAVA'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18166,7 +18210,7 @@ fi
-  # Extract the first word of "javac", so it can be a program name with args.
- set dummy javac; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18170: checking for $ac_word" >&5
-+echo "configure:18214: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_JAVAC'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18215,7 +18259,7 @@ fi
-  # Extract the first word of "jar", so it can be a program name with args.
- set dummy jar; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18219: checking for $ac_word" >&5
-+echo "configure:18263: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_JAR'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18405,7 +18449,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18409: checking for $ac_word" >&5
-+echo "configure:18453: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18449,19 +18493,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for gthread-2.0""... $ac_c" 1>&6
--echo "configure:18453: checking for gthread-2.0" >&5
-+echo "configure:18497: checking for gthread-2.0" >&5
- 
-         if $PKG_CONFIG --exists "gthread-2.0" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_GTHREAD_CFLAGS""... $ac_c" 1>&6
--echo "configure:18460: checking MOZ_GTHREAD_CFLAGS" >&5
-+echo "configure:18504: checking MOZ_GTHREAD_CFLAGS" >&5
-             MOZ_GTHREAD_CFLAGS=`$PKG_CONFIG --cflags "gthread-2.0"`
-             echo "$ac_t""$MOZ_GTHREAD_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_GTHREAD_LIBS""... $ac_c" 1>&6
--echo "configure:18465: checking MOZ_GTHREAD_LIBS" >&5
-+echo "configure:18509: checking MOZ_GTHREAD_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_GTHREAD_LIBS="`$PKG_CONFIG --libs \"gthread-2.0\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_GTHREAD_LIBS" 1>&6
-@@ -18497,19 +18541,19 @@ echo "configure:18465: checking MOZ_GTHREAD_LIBS" >&5
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:18501: checking for $ac_hdr" >&5
-+echo "configure:18545: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 18506 "configure"
-+#line 18550 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:18513: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:18557: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -18622,13 +18666,13 @@ fi
- 
- if test -n "$LIBJPEG_TURBO_X86_ASM" -o -n "$LIBJPEG_TURBO_X64_ASM" ; then
-     echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
--echo "configure:18626: checking for YASM assembler" >&5
-+echo "configure:18670: checking for YASM assembler" >&5
-     for ac_prog in yasm
- do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18632: checking for $ac_word" >&5
-+echo "configure:18676: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_LIBJPEG_TURBO_AS'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18832,7 +18876,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18836: checking for $ac_word" >&5
-+echo "configure:18880: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_MAKENSISU'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18891,7 +18935,7 @@ done
-         MAKENSISU_MINOR_VER=`echo $MAKENSISU_VER | $AWK -F\. '{ print $2 }'`
-     fi
-     echo $ac_n "checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER""... $ac_c" 1>&6
--echo "configure:18895: checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER" >&5
-+echo "configure:18939: checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER" >&5
-     if test "$MAKENSISU_VER" = "" ||
-        test ! "$MAKENSISU_MAJOR_VER" = "$REQ_NSIS_MAJOR_VER" -o \
-             ! "$MAKENSISU_MINOR_VER" -ge $MIN_NSIS_MINOR_VER; then
-@@ -18904,13 +18948,13 @@ fi
- 
- 
- echo $ac_n "checking for tar archiver""... $ac_c" 1>&6
--echo "configure:18908: checking for tar archiver" >&5
-+echo "configure:18952: checking for tar archiver" >&5
- for ac_prog in gnutar gtar tar
- do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18914: checking for $ac_word" >&5
-+echo "configure:18958: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_TAR'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -18947,13 +18991,13 @@ echo "$ac_t""$TAR" 1>&6
- 
- 
- echo $ac_n "checking for wget""... $ac_c" 1>&6
--echo "configure:18951: checking for wget" >&5
-+echo "configure:18995: checking for wget" >&5
- for ac_prog in wget
- do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:18957: checking for $ac_word" >&5
-+echo "configure:19001: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_prog_WGET'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -19145,7 +19189,7 @@ else
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:19149: checking for $ac_word" >&5
-+echo "configure:19193: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -19189,19 +19233,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for sqlite3 >= $SQLITE_VERSION""... $ac_c" 1>&6
--echo "configure:19193: checking for sqlite3 >= $SQLITE_VERSION" >&5
-+echo "configure:19237: checking for sqlite3 >= $SQLITE_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "sqlite3 >= $SQLITE_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking SQLITE_CFLAGS""... $ac_c" 1>&6
--echo "configure:19200: checking SQLITE_CFLAGS" >&5
-+echo "configure:19244: checking SQLITE_CFLAGS" >&5
-             SQLITE_CFLAGS=`$PKG_CONFIG --cflags "sqlite3 >= $SQLITE_VERSION"`
-             echo "$ac_t""$SQLITE_CFLAGS" 1>&6
- 
-             echo $ac_n "checking SQLITE_LIBS""... $ac_c" 1>&6
--echo "configure:19205: checking SQLITE_LIBS" >&5
-+echo "configure:19249: checking SQLITE_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             SQLITE_LIBS="`$PKG_CONFIG --libs \"sqlite3 >= $SQLITE_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$SQLITE_LIBS" 1>&6
-@@ -19232,7 +19276,7 @@ echo "configure:19205: checking SQLITE_LIBS" >&5
- 
- 
-                         echo $ac_n "checking for SQLITE_SECURE_DELETE support in system SQLite""... $ac_c" 1>&6
--echo "configure:19236: checking for SQLITE_SECURE_DELETE support in system SQLite" >&5
-+echo "configure:19280: checking for SQLITE_SECURE_DELETE support in system SQLite" >&5
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$CFLAGS $SQLITE_CFLAGS"
-     _SAVE_LIBS="$LIBS"
-@@ -19246,7 +19290,7 @@ else
-         
- else
-   cat > conftest.$ac_ext <<EOF
--#line 19250 "configure"
-+#line 19294 "configure"
- #include "confdefs.h"
- 
-             #include "sqlite3.h"
-@@ -19255,7 +19299,7 @@ else
-               return !sqlite3_compileoption_used("SQLITE_SECURE_DELETE");
-             }
- EOF
--if { (eval echo configure:19259: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19303: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_sqlite_secure_delete=yes
- else
-@@ -19278,7 +19322,7 @@ fi
-     fi
- 
-                         echo $ac_n "checking for SQLITE_THREADSAFE support in system SQLite""... $ac_c" 1>&6
--echo "configure:19282: checking for SQLITE_THREADSAFE support in system SQLite" >&5
-+echo "configure:19326: checking for SQLITE_THREADSAFE support in system SQLite" >&5
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$CFLAGS $SQLITE_CFLAGS"
-     _SAVE_LIBS="$LIBS"
-@@ -19292,7 +19336,7 @@ else
-         
- else
-   cat > conftest.$ac_ext <<EOF
--#line 19296 "configure"
-+#line 19340 "configure"
- #include "confdefs.h"
- 
-             #include "sqlite3.h"
-@@ -19301,7 +19345,7 @@ else
-               return !sqlite3_compileoption_used("SQLITE_THREADSAFE=1");
-             }
- EOF
--if { (eval echo configure:19305: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19349: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_sqlite_threadsafe=yes
- else
-@@ -19324,7 +19368,7 @@ fi
-     fi
- 
-                         echo $ac_n "checking for SQLITE_ENABLE_FTS3 support in system SQLite""... $ac_c" 1>&6
--echo "configure:19328: checking for SQLITE_ENABLE_FTS3 support in system SQLite" >&5
-+echo "configure:19372: checking for SQLITE_ENABLE_FTS3 support in system SQLite" >&5
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$CFLAGS $SQLITE_CFLAGS"
-     _SAVE_LIBS="$LIBS"
-@@ -19338,7 +19382,7 @@ else
-         
- else
-   cat > conftest.$ac_ext <<EOF
--#line 19342 "configure"
-+#line 19386 "configure"
- #include "confdefs.h"
- 
-             #include "sqlite3.h"
-@@ -19347,7 +19391,7 @@ else
-               return !sqlite3_compileoption_used("SQLITE_ENABLE_FTS3");
-             }
- EOF
--if { (eval echo configure:19351: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19395: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_sqlite_enable_fts3=yes
- else
-@@ -19370,7 +19414,7 @@ fi
-     fi
- 
-                         echo $ac_n "checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite""... $ac_c" 1>&6
--echo "configure:19374: checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite" >&5
-+echo "configure:19418: checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite" >&5
-     _SAVE_CFLAGS="$CFLAGS"
-     CFLAGS="$CFLAGS $SQLITE_CFLAGS"
-     _SAVE_LIBS="$LIBS"
-@@ -19384,7 +19428,7 @@ else
-         
- else
-   cat > conftest.$ac_ext <<EOF
--#line 19388 "configure"
-+#line 19432 "configure"
- #include "confdefs.h"
- 
-             #include "sqlite3.h"
-@@ -19393,7 +19437,7 @@ else
-               return !sqlite3_compileoption_used("SQLITE_ENABLE_UNLOCK_NOTIFY");
-             }
- EOF
--if { (eval echo configure:19397: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19441: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_sqlite_enable_unlock_notify=yes
- else
-@@ -19516,7 +19560,7 @@ if test -n "$MOZ_ENABLE_LIBCONIC"; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:19520: checking for $ac_word" >&5
-+echo "configure:19564: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -19560,19 +19604,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for conic""... $ac_c" 1>&6
--echo "configure:19564: checking for conic" >&5
-+echo "configure:19608: checking for conic" >&5
- 
-         if $PKG_CONFIG --exists "conic" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBCONIC_CFLAGS""... $ac_c" 1>&6
--echo "configure:19571: checking LIBCONIC_CFLAGS" >&5
-+echo "configure:19615: checking LIBCONIC_CFLAGS" >&5
-             LIBCONIC_CFLAGS=`$PKG_CONFIG --cflags "conic"`
-             echo "$ac_t""$LIBCONIC_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBCONIC_LIBS""... $ac_c" 1>&6
--echo "configure:19576: checking LIBCONIC_LIBS" >&5
-+echo "configure:19620: checking LIBCONIC_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBCONIC_LIBS="`$PKG_CONFIG --libs \"conic\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBCONIC_LIBS" 1>&6
-@@ -19658,19 +19702,19 @@ EOF
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:19662: checking for $ac_hdr" >&5
-+echo "configure:19706: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 19667 "configure"
-+#line 19711 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:19674: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:19718: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -19697,7 +19741,7 @@ EOF
-   done
- 
-       echo $ac_n "checking for XCompositeRedirectWindow in -lXcomposite""... $ac_c" 1>&6
--echo "configure:19701: checking for XCompositeRedirectWindow in -lXcomposite" >&5
-+echo "configure:19745: checking for XCompositeRedirectWindow in -lXcomposite" >&5
- ac_lib_var=`echo Xcomposite'_'XCompositeRedirectWindow | sed 'y%./+-%__p_%'`
- if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
-@@ -19705,7 +19749,7 @@ else
-   ac_save_LIBS="$LIBS"
- LIBS="-lXcomposite $XLIBS $LIBS"
- cat > conftest.$ac_ext <<EOF
--#line 19709 "configure"
-+#line 19753 "configure"
- #include "confdefs.h"
- /* Override any gcc2 internal prototype to avoid an error.  */
- /* We use char because int might match the return type of a gcc2
-@@ -19716,7 +19760,7 @@ int main() {
- XCompositeRedirectWindow()
- ; return 0; }
- EOF
--if { (eval echo configure:19720: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:19764: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_lib_$ac_lib_var=yes"
- else
-@@ -19746,7 +19790,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:19750: checking for $ac_word" >&5
-+echo "configure:19794: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -19790,19 +19834,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libhildonmime""... $ac_c" 1>&6
--echo "configure:19794: checking for libhildonmime" >&5
-+echo "configure:19838: checking for libhildonmime" >&5
- 
-         if $PKG_CONFIG --exists "libhildonmime" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBHILDONMIME_CFLAGS""... $ac_c" 1>&6
--echo "configure:19801: checking LIBHILDONMIME_CFLAGS" >&5
-+echo "configure:19845: checking LIBHILDONMIME_CFLAGS" >&5
-             LIBHILDONMIME_CFLAGS=`$PKG_CONFIG --cflags "libhildonmime"`
-             echo "$ac_t""$LIBHILDONMIME_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBHILDONMIME_LIBS""... $ac_c" 1>&6
--echo "configure:19806: checking LIBHILDONMIME_LIBS" >&5
-+echo "configure:19850: checking LIBHILDONMIME_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBHILDONMIME_LIBS="`$PKG_CONFIG --libs \"libhildonmime\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBHILDONMIME_LIBS" 1>&6
-@@ -19844,7 +19888,7 @@ echo "configure:19806: checking LIBHILDONMIME_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:19848: checking for $ac_word" >&5
-+echo "configure:19892: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -19888,19 +19932,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for libosso""... $ac_c" 1>&6
--echo "configure:19892: checking for libosso" >&5
-+echo "configure:19936: checking for libosso" >&5
- 
-         if $PKG_CONFIG --exists "libosso" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBOSSO_CFLAGS""... $ac_c" 1>&6
--echo "configure:19899: checking LIBOSSO_CFLAGS" >&5
-+echo "configure:19943: checking LIBOSSO_CFLAGS" >&5
-             LIBOSSO_CFLAGS=`$PKG_CONFIG --cflags "libosso"`
-             echo "$ac_t""$LIBOSSO_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBOSSO_LIBS""... $ac_c" 1>&6
--echo "configure:19904: checking LIBOSSO_LIBS" >&5
-+echo "configure:19948: checking LIBOSSO_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBOSSO_LIBS="`$PKG_CONFIG --libs \"libosso\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBOSSO_LIBS" 1>&6
-@@ -19941,7 +19985,7 @@ echo "configure:19904: checking LIBOSSO_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:19945: checking for $ac_word" >&5
-+echo "configure:19989: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -19985,19 +20029,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for hildon-fm-2""... $ac_c" 1>&6
--echo "configure:19989: checking for hildon-fm-2" >&5
-+echo "configure:20033: checking for hildon-fm-2" >&5
- 
-         if $PKG_CONFIG --exists "hildon-fm-2" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBHILDONFM_CFLAGS""... $ac_c" 1>&6
--echo "configure:19996: checking LIBHILDONFM_CFLAGS" >&5
-+echo "configure:20040: checking LIBHILDONFM_CFLAGS" >&5
-             LIBHILDONFM_CFLAGS=`$PKG_CONFIG --cflags "hildon-fm-2"`
-             echo "$ac_t""$LIBHILDONFM_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBHILDONFM_LIBS""... $ac_c" 1>&6
--echo "configure:20001: checking LIBHILDONFM_LIBS" >&5
-+echo "configure:20045: checking LIBHILDONFM_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBHILDONFM_LIBS="`$PKG_CONFIG --libs \"hildon-fm-2\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBHILDONFM_LIBS" 1>&6
-@@ -20041,7 +20085,7 @@ echo "configure:20001: checking LIBHILDONFM_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:20045: checking for $ac_word" >&5
-+echo "configure:20089: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -20085,19 +20129,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for ContentManager QtSparql""... $ac_c" 1>&6
--echo "configure:20089: checking for ContentManager QtSparql" >&5
-+echo "configure:20133: checking for ContentManager QtSparql" >&5
- 
-         if $PKG_CONFIG --exists "ContentManager QtSparql" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBCONTENTMANAGER_CFLAGS""... $ac_c" 1>&6
--echo "configure:20096: checking LIBCONTENTMANAGER_CFLAGS" >&5
-+echo "configure:20140: checking LIBCONTENTMANAGER_CFLAGS" >&5
-             LIBCONTENTMANAGER_CFLAGS=`$PKG_CONFIG --cflags "ContentManager QtSparql"`
-             echo "$ac_t""$LIBCONTENTMANAGER_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBCONTENTMANAGER_LIBS""... $ac_c" 1>&6
--echo "configure:20101: checking LIBCONTENTMANAGER_LIBS" >&5
-+echo "configure:20145: checking LIBCONTENTMANAGER_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBCONTENTMANAGER_LIBS="`$PKG_CONFIG --libs \"ContentManager QtSparql\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBCONTENTMANAGER_LIBS" 1>&6
-@@ -20160,7 +20204,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:20164: checking for $ac_word" >&5
-+echo "configure:20208: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -20204,19 +20248,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for contentaction-0.1""... $ac_c" 1>&6
--echo "configure:20208: checking for contentaction-0.1" >&5
-+echo "configure:20252: checking for contentaction-0.1" >&5
- 
-         if $PKG_CONFIG --exists "contentaction-0.1" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBCONTENTACTION_CFLAGS""... $ac_c" 1>&6
--echo "configure:20215: checking LIBCONTENTACTION_CFLAGS" >&5
-+echo "configure:20259: checking LIBCONTENTACTION_CFLAGS" >&5
-             LIBCONTENTACTION_CFLAGS=`$PKG_CONFIG --cflags "contentaction-0.1"`
-             echo "$ac_t""$LIBCONTENTACTION_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBCONTENTACTION_LIBS""... $ac_c" 1>&6
--echo "configure:20220: checking LIBCONTENTACTION_LIBS" >&5
-+echo "configure:20264: checking LIBCONTENTACTION_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBCONTENTACTION_LIBS="`$PKG_CONFIG --libs \"contentaction-0.1\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBCONTENTACTION_LIBS" 1>&6
-@@ -20277,7 +20321,7 @@ fi
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:20281: checking for $ac_word" >&5
-+echo "configure:20325: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -20321,19 +20365,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for meegotouchcore""... $ac_c" 1>&6
--echo "configure:20325: checking for meegotouchcore" >&5
-+echo "configure:20369: checking for meegotouchcore" >&5
- 
-         if $PKG_CONFIG --exists "meegotouchcore" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking MOZ_MEEGOTOUCH_CFLAGS""... $ac_c" 1>&6
--echo "configure:20332: checking MOZ_MEEGOTOUCH_CFLAGS" >&5
-+echo "configure:20376: checking MOZ_MEEGOTOUCH_CFLAGS" >&5
-             MOZ_MEEGOTOUCH_CFLAGS=`$PKG_CONFIG --cflags "meegotouchcore"`
-             echo "$ac_t""$MOZ_MEEGOTOUCH_CFLAGS" 1>&6
- 
-             echo $ac_n "checking MOZ_MEEGOTOUCH_LIBS""... $ac_c" 1>&6
--echo "configure:20337: checking MOZ_MEEGOTOUCH_LIBS" >&5
-+echo "configure:20381: checking MOZ_MEEGOTOUCH_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             MOZ_MEEGOTOUCH_LIBS="`$PKG_CONFIG --libs \"meegotouchcore\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$MOZ_MEEGOTOUCH_LIBS" 1>&6
-@@ -20381,7 +20425,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:20385: checking for $ac_word" >&5
-+echo "configure:20429: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -20425,19 +20469,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for liblocation""... $ac_c" 1>&6
--echo "configure:20429: checking for liblocation" >&5
-+echo "configure:20473: checking for liblocation" >&5
- 
-         if $PKG_CONFIG --exists "liblocation" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBLOCATION_CFLAGS""... $ac_c" 1>&6
--echo "configure:20436: checking LIBLOCATION_CFLAGS" >&5
-+echo "configure:20480: checking LIBLOCATION_CFLAGS" >&5
-             LIBLOCATION_CFLAGS=`$PKG_CONFIG --cflags "liblocation"`
-             echo "$ac_t""$LIBLOCATION_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBLOCATION_LIBS""... $ac_c" 1>&6
--echo "configure:20441: checking LIBLOCATION_LIBS" >&5
-+echo "configure:20485: checking LIBLOCATION_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBLOCATION_LIBS="`$PKG_CONFIG --libs \"liblocation\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBLOCATION_LIBS" 1>&6
-@@ -20485,7 +20529,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:20489: checking for $ac_word" >&5
-+echo "configure:20533: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -20529,19 +20573,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri""... $ac_c" 1>&6
--echo "configure:20533: checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" >&5
-+echo "configure:20577: checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" >&5
- 
-         if $PKG_CONFIG --exists "ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking LIBMEEGOTOUCHSHARE_CFLAGS""... $ac_c" 1>&6
--echo "configure:20540: checking LIBMEEGOTOUCHSHARE_CFLAGS" >&5
-+echo "configure:20584: checking LIBMEEGOTOUCHSHARE_CFLAGS" >&5
-             LIBMEEGOTOUCHSHARE_CFLAGS=`$PKG_CONFIG --cflags "ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri"`
-             echo "$ac_t""$LIBMEEGOTOUCHSHARE_CFLAGS" 1>&6
- 
-             echo $ac_n "checking LIBMEEGOTOUCHSHARE_LIBS""... $ac_c" 1>&6
--echo "configure:20545: checking LIBMEEGOTOUCHSHARE_LIBS" >&5
-+echo "configure:20589: checking LIBMEEGOTOUCHSHARE_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             LIBMEEGOTOUCHSHARE_LIBS="`$PKG_CONFIG --libs \"ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$LIBMEEGOTOUCHSHARE_LIBS" 1>&6
-@@ -20661,18 +20705,18 @@ MOZ_DEBUG_DISABLE_DEFS="-DNDEBUG -DTRIMMED"
- 
- if test -n "$MOZ_DEBUG"; then
-     echo $ac_n "checking for valid debug flags""... $ac_c" 1>&6
--echo "configure:20665: checking for valid debug flags" >&5
-+echo "configure:20709: checking for valid debug flags" >&5
-     _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $MOZ_DEBUG_FLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 20669 "configure"
-+#line 20713 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:20676: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:20720: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _results=yes
- else
-@@ -20757,18 +20801,18 @@ fi
- if test "$COMPILE_ENVIRONMENT"; then
- if test -n "$MOZ_OPTIMIZE"; then
-     echo $ac_n "checking for valid optimization flags""... $ac_c" 1>&6
--echo "configure:20761: checking for valid optimization flags" >&5
-+echo "configure:20805: checking for valid optimization flags" >&5
-     _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $MOZ_OPTIMIZE_FLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 20765 "configure"
-+#line 20809 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:20772: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:20816: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _results=yes
- else
-@@ -20837,7 +20881,7 @@ fi
- 
- if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -z "$MOZ_DISABLE_ICF"; then
-     echo $ac_n "checking whether the linker supports Identical Code Folding""... $ac_c" 1>&6
--echo "configure:20841: checking whether the linker supports Identical Code Folding" >&5
-+echo "configure:20885: checking whether the linker supports Identical Code Folding" >&5
- if eval "test \"`echo '$''{'LD_SUPPORTS_ICF'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -20846,7 +20890,7 @@ else
-               'int main() {return foo() - bar();}' > conftest.${ac_ext}
-         # If the linker supports ICF, foo and bar symbols will have
-         # the same address
--        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:20850: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:20894: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-            test -s conftest${ac_exeext} &&
-            objdump -t conftest${ac_exeext} | awk '{a[$6] = $1} END {if (a["foo"] && (a["foo"] != a["bar"])) { exit 1 }}'; then
-             LD_SUPPORTS_ICF=yes
-@@ -20867,15 +20911,15 @@ fi
- 
- if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -n "$MOZ_DEBUG_FLAGS"; then
-       echo $ac_n "checking whether removing dead symbols breaks debugging""... $ac_c" 1>&6
--echo "configure:20871: checking whether removing dead symbols breaks debugging" >&5
-+echo "configure:20915: checking whether removing dead symbols breaks debugging" >&5
- if eval "test \"`echo '$''{'GC_SECTIONS_BREAKS_DEBUG_RANGES'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   echo 'int foo() {return 42;}' \
-              'int bar() {return 1;}' \
-              'int main() {return foo();}' > conftest.${ac_ext}
--        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -ffunction-sections -c conftest.${ac_ext} 1>&2'; { (eval echo configure:20878: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
--           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:20879: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -ffunction-sections -c conftest.${ac_ext} 1>&2'; { (eval echo configure:20922: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:20923: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-            test -s conftest${ac_exeext} -a -s conftest.${ac_objext}; then
-             if test "`$PYTHON "$_topsrcdir"/build/unix/check_debug_ranges.py conftest.${ac_objext} conftest.${ac_ext}`" = \
-                     "`$PYTHON "$_topsrcdir"/build/unix/check_debug_ranges.py conftest${ac_exeext} conftest.${ac_ext}`"; then
-@@ -21007,7 +21051,7 @@ if test "${enable_jemalloc+set}" = set; then
- fi
- 
- 
--if test "$NS_TRACE_MALLOC"; then
-+if test "$NS_TRACE_MALLOC" || test "$LIBXUL_SDK"; then
-     MOZ_MEMORY=
- fi
- 
-@@ -21045,7 +21089,7 @@ EOF
-     fi
-   else
-     echo $ac_n "checking size of int *""... $ac_c" 1>&6
--echo "configure:21049: checking size of int *" >&5
-+echo "configure:21093: checking size of int *" >&5
- if eval "test \"`echo '$''{'ac_cv_sizeof_int_p'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -21053,7 +21097,7 @@ else
-   ac_cv_sizeof_int_p=4
- else
-   cat > conftest.$ac_ext <<EOF
--#line 21057 "configure"
-+#line 21101 "configure"
- #include "confdefs.h"
- #include <stdio.h>
- int main()
-@@ -21064,7 +21108,7 @@ int main()
-   return(0);
- }
- EOF
--if { (eval echo configure:21068: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:21112: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   ac_cv_sizeof_int_p=`cat conftestval`
- else
-@@ -21365,7 +21409,7 @@ do
- # Extract the first word of "$ac_prog", so it can be a program name with args.
- set dummy $ac_prog; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:21369: checking for $ac_word" >&5
-+echo "configure:21413: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_CCACHE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -21519,12 +21563,12 @@ fi
- 
- if test "$USE_ELF_HACK" = 1; then
-                                     echo $ac_n "checking whether linker creates PT_GNU_RELRO segments""... $ac_c" 1>&6
--echo "configure:21523: checking whether linker creates PT_GNU_RELRO segments" >&5
-+echo "configure:21567: checking whether linker creates PT_GNU_RELRO segments" >&5
- if eval "test \"`echo '$''{'LINK_WITH_PT_GNU_RELRO'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   echo "int main() {return 0;}" > conftest.${ac_ext}
--         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:21528: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:21572: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-             test -s conftest${ac_exeext}; then
-             if readelf -l conftest${ac_exeext} | grep GNU_RELRO > /dev/null; then
-                 LINK_WITH_PT_GNU_RELRO=yes
-@@ -21652,12 +21696,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
-     for ac_func in __cxa_demangle
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:21656: checking for $ac_func" >&5
-+echo "configure:21700: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 21661 "configure"
-+#line 21705 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -21683,7 +21727,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:21687: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:21731: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -21731,19 +21775,19 @@ fi
- if test -z "$SKIP_LIBRARY_CHECKS"; then
-        ac_safe=`echo "unwind.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for unwind.h""... $ac_c" 1>&6
--echo "configure:21735: checking for unwind.h" >&5
-+echo "configure:21779: checking for unwind.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 21740 "configure"
-+#line 21784 "configure"
- #include "confdefs.h"
- #include <unwind.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:21747: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:21791: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -21760,12 +21804,12 @@ fi
-     for ac_func in _Unwind_Backtrace
- do
- echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
--echo "configure:21764: checking for $ac_func" >&5
-+echo "configure:21808: checking for $ac_func" >&5
- if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 21769 "configure"
-+#line 21813 "configure"
- #include "confdefs.h"
- /* System header to define __stub macros and hopefully few prototypes,
-     which can conflict with char $ac_func(); below.  */
-@@ -21788,7 +21832,7 @@ $ac_func();
- 
- ; return 0; }
- EOF
--if { (eval echo configure:21792: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:21836: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   eval "ac_cv_func_$ac_func=yes"
- else
-@@ -21949,7 +21993,7 @@ if test -z "$SKIP_COMPILER_CHECKS"; then
- # Compiler Options
- 
- echo $ac_n "checking for gcc -pipe support""... $ac_c" 1>&6
--echo "configure:21953: checking for gcc -pipe support" >&5
-+echo "configure:21997: checking for gcc -pipe support" >&5
- if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
-     echo '#include <stdio.h>' > dummy-hello.c
-     echo 'int main() { printf("Hello World\n"); exit(0); }' >> dummy-hello.c
-@@ -21964,14 +22008,14 @@ if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
-         _SAVE_CFLAGS=$CFLAGS
-         CFLAGS="$CFLAGS -pipe"
-         cat > conftest.$ac_ext <<EOF
--#line 21968 "configure"
-+#line 22012 "configure"
- #include "confdefs.h"
-  #include <stdio.h> 
- int main() {
- printf("Hello World\n");
- ; return 0; }
- EOF
--if { (eval echo configure:21975: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22019: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   _res_gcc_pipe="yes"
- else
-@@ -22001,16 +22045,16 @@ _SAVE_CFLAGS="$CFLAGS"
- CFLAGS="$CFLAGS -fprofile-generate -fprofile-correction"
- 
- echo $ac_n "checking whether C compiler supports -fprofile-generate""... $ac_c" 1>&6
--echo "configure:22005: checking whether C compiler supports -fprofile-generate" >&5
-+echo "configure:22049: checking whether C compiler supports -fprofile-generate" >&5
- cat > conftest.$ac_ext <<EOF
--#line 22007 "configure"
-+#line 22051 "configure"
- #include "confdefs.h"
- 
- int main() {
- return 0;
- ; return 0; }
- EOF
--if { (eval echo configure:22014: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22058: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-    PROFILE_GEN_CFLAGS="-fprofile-generate"
-                  result="yes" 
-@@ -22074,16 +22118,16 @@ if test "$_PEDANTIC"; then
-     _SAVE_CXXFLAGS=$CXXFLAGS
-     CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS} ${_COMPILER_PREFIX}-pedantic ${_COMPILER_PREFIX}-Wno-long-long"
-     echo $ac_n "checking whether C++ compiler has -pedantic long long bug""... $ac_c" 1>&6
--echo "configure:22078: checking whether C++ compiler has -pedantic long long bug" >&5
-+echo "configure:22122: checking whether C++ compiler has -pedantic long long bug" >&5
-     cat > conftest.$ac_ext <<EOF
--#line 22080 "configure"
-+#line 22124 "configure"
- #include "confdefs.h"
- $configure_static_assert_macros
- int main() {
- CONFIGURE_STATIC_ASSERT(sizeof(long long) == 8)
- ; return 0; }
- EOF
--if { (eval echo configure:22087: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22131: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   result="no"
- else
-@@ -22110,12 +22154,12 @@ fi
- _SAVE_CXXFLAGS=$CXXFLAGS
- CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS}"
- echo $ac_n "checking for correct overload resolution with const and templates""... $ac_c" 1>&6
--echo "configure:22114: checking for correct overload resolution with const and templates" >&5
-+echo "configure:22158: checking for correct overload resolution with const and templates" >&5
- if eval "test \"`echo '$''{'ac_nscap_nonconst_opeq_bug'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 22119 "configure"
-+#line 22163 "configure"
- #include "confdefs.h"
- 
-                       template <class T>
-@@ -22145,7 +22189,7 @@ int main() {
-                     
- ; return 0; }
- EOF
--if { (eval echo configure:22149: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22193: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   ac_nscap_nonconst_opeq_bug="no"
- else
-@@ -22182,18 +22226,18 @@ cross_compiling=$ac_cv_prog_cc_cross
- 
- 
- echo $ac_n "checking what kind of list files are supported by the linker""... $ac_c" 1>&6
--echo "configure:22186: checking what kind of list files are supported by the linker" >&5
-+echo "configure:22230: checking what kind of list files are supported by the linker" >&5
- if eval "test \"`echo '$''{'EXPAND_LIBS_LIST_STYLE'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   echo "int main() {return 0;}" > conftest.${ac_ext}
--     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&2'; { (eval echo configure:22191: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
-+     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&2'; { (eval echo configure:22235: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
-          echo "INPUT(conftest.${OBJ_SUFFIX})" > conftest.list
--         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&2'; { (eval echo configure:22193: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-+         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&2'; { (eval echo configure:22237: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-              EXPAND_LIBS_LIST_STYLE=linkerscript
-          else
-              echo "conftest.${OBJ_SUFFIX}" > conftest.list
--             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&2'; { (eval echo configure:22197: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-+             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&2'; { (eval echo configure:22241: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-                  EXPAND_LIBS_LIST_STYLE=list
-              else
-                  EXPAND_LIBS_LIST_STYLE=none
-@@ -22323,7 +22367,7 @@ XPCOM_LIBS="$LIBXUL_LIBS"
- # Standalone module options (Not for building Mozilla)
- 
- 
--if test -z "$SKIP_PATH_CHECKS"; then
-+if test -z "$SKIP_PATH_CHECKS" && test -z "$LIBXUL_SDK"; then
- if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
-     if test "$MOZ_ENABLE_GTK2" -o "$USE_ELF_DYNSTR_GC" ; then
-         succeeded=no
-@@ -22332,7 +22376,7 @@ if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:22336: checking for $ac_word" >&5
-+echo "configure:22380: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -22376,19 +22420,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for glib-2.0 >= 1.3.7 gobject-2.0""... $ac_c" 1>&6
--echo "configure:22380: checking for glib-2.0 >= 1.3.7 gobject-2.0" >&5
-+echo "configure:22424: checking for glib-2.0 >= 1.3.7 gobject-2.0" >&5
- 
-         if $PKG_CONFIG --exists "glib-2.0 >= 1.3.7 gobject-2.0" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking GLIB_CFLAGS""... $ac_c" 1>&6
--echo "configure:22387: checking GLIB_CFLAGS" >&5
-+echo "configure:22431: checking GLIB_CFLAGS" >&5
-             GLIB_CFLAGS=`$PKG_CONFIG --cflags "glib-2.0 >= 1.3.7 gobject-2.0"`
-             echo "$ac_t""$GLIB_CFLAGS" 1>&6
- 
-             echo $ac_n "checking GLIB_LIBS""... $ac_c" 1>&6
--echo "configure:22392: checking GLIB_LIBS" >&5
-+echo "configure:22436: checking GLIB_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             GLIB_LIBS="`$PKG_CONFIG --libs \"glib-2.0 >= 1.3.7 gobject-2.0\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$GLIB_LIBS" 1>&6
-@@ -22473,7 +22517,7 @@ fi
-   # Extract the first word of "glib-config", so it can be a program name with args.
- set dummy glib-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:22477: checking for $ac_word" >&5
-+echo "configure:22521: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_GLIB_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -22508,7 +22552,7 @@ fi
- 
-   min_glib_version=${GLIB_VERSION}
-   echo $ac_n "checking for GLIB - version >= $min_glib_version""... $ac_c" 1>&6
--echo "configure:22512: checking for GLIB - version >= $min_glib_version" >&5
-+echo "configure:22556: checking for GLIB - version >= $min_glib_version" >&5
-   no_glib=""
-   if test "$GLIB_CONFIG" = "no" ; then
-     no_glib=yes
-@@ -22531,7 +22575,7 @@ echo "configure:22512: checking for GLIB - version >= $min_glib_version" >&5
-   echo $ac_n "cross compiling; assumed OK... $ac_c"
- else
-   cat > conftest.$ac_ext <<EOF
--#line 22535 "configure"
-+#line 22579 "configure"
- #include "confdefs.h"
- 
- #include <glib.h>
-@@ -22607,7 +22651,7 @@ main ()
- }
- 
- EOF
--if { (eval echo configure:22611: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:22655: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
- then
-   :
- else
-@@ -22641,7 +22685,7 @@ fi
-           CFLAGS="$CFLAGS $GLIB_CFLAGS"
-           LIBS="$LIBS $GLIB_LIBS"
-           cat > conftest.$ac_ext <<EOF
--#line 22645 "configure"
-+#line 22689 "configure"
- #include "confdefs.h"
- 
- #include <glib.h>
-@@ -22651,7 +22695,7 @@ int main() {
-  return ((glib_major_version) || (glib_minor_version) || (glib_micro_version)); 
- ; return 0; }
- EOF
--if { (eval echo configure:22655: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:22699: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-    echo "*** The test program compiled, but did not run. This usually means"
-           echo "*** that the run-time linker is not finding GLIB or finding the wrong"
-@@ -22739,19 +22783,19 @@ fi
-   do
-        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:22743: checking for $ac_hdr" >&5
-+echo "configure:22787: checking for $ac_hdr" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 22748 "configure"
-+#line 22792 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:22755: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22799: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -22825,19 +22869,19 @@ EOF
- 
-            ac_safe=`echo "d3d9.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for d3d9.h""... $ac_c" 1>&6
--echo "configure:22829: checking for d3d9.h" >&5
-+echo "configure:22873: checking for d3d9.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 22834 "configure"
-+#line 22878 "configure"
- #include "confdefs.h"
- #include <d3d9.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:22841: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22885: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -22861,19 +22905,19 @@ fi
-                 if test -n "$WIN32_D2D_SURFACE_FEATURE"; then
-              ac_safe=`echo "d3d10.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for d3d10.h""... $ac_c" 1>&6
--echo "configure:22865: checking for d3d10.h" >&5
-+echo "configure:22909: checking for d3d10.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 22870 "configure"
-+#line 22914 "configure"
- #include "confdefs.h"
- #include <d3d10.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:22877: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22921: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -22957,7 +23001,7 @@ EOF
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:22961: checking for $ac_word" >&5
-+echo "configure:23005: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -23001,19 +23045,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for pixman-1 >= 0.19.2""... $ac_c" 1>&6
--echo "configure:23005: checking for pixman-1 >= 0.19.2" >&5
-+echo "configure:23049: checking for pixman-1 >= 0.19.2" >&5
- 
-         if $PKG_CONFIG --exists "pixman-1 >= 0.19.2" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking PIXMAN_CFLAGS""... $ac_c" 1>&6
--echo "configure:23012: checking PIXMAN_CFLAGS" >&5
-+echo "configure:23056: checking PIXMAN_CFLAGS" >&5
-             PIXMAN_CFLAGS=`$PKG_CONFIG --cflags "pixman-1 >= 0.19.2"`
-             echo "$ac_t""$PIXMAN_CFLAGS" 1>&6
- 
-             echo $ac_n "checking PIXMAN_LIBS""... $ac_c" 1>&6
--echo "configure:23017: checking PIXMAN_LIBS" >&5
-+echo "configure:23061: checking PIXMAN_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             PIXMAN_LIBS="`$PKG_CONFIG --libs \"pixman-1 >= 0.19.2\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$PIXMAN_LIBS" 1>&6
-@@ -23060,7 +23104,7 @@ else
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:23064: checking for $ac_word" >&5
-+echo "configure:23108: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -23104,19 +23148,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig""... $ac_c" 1>&6
--echo "configure:23108: checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" >&5
-+echo "configure:23152: checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" >&5
- 
-         if $PKG_CONFIG --exists "cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking CAIRO_CFLAGS""... $ac_c" 1>&6
--echo "configure:23115: checking CAIRO_CFLAGS" >&5
-+echo "configure:23159: checking CAIRO_CFLAGS" >&5
-             CAIRO_CFLAGS=`$PKG_CONFIG --cflags "cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig"`
-             echo "$ac_t""$CAIRO_CFLAGS" 1>&6
- 
-             echo $ac_n "checking CAIRO_LIBS""... $ac_c" 1>&6
--echo "configure:23120: checking CAIRO_LIBS" >&5
-+echo "configure:23164: checking CAIRO_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             CAIRO_LIBS="`$PKG_CONFIG --libs \"cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$CAIRO_LIBS" 1>&6
-@@ -23153,7 +23197,7 @@ echo "configure:23120: checking CAIRO_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:23157: checking for $ac_word" >&5
-+echo "configure:23201: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -23197,19 +23241,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for cairo-tee >= $CAIRO_VERSION""... $ac_c" 1>&6
--echo "configure:23201: checking for cairo-tee >= $CAIRO_VERSION" >&5
-+echo "configure:23245: checking for cairo-tee >= $CAIRO_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "cairo-tee >= $CAIRO_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking CAIRO_TEE_CFLAGS""... $ac_c" 1>&6
--echo "configure:23208: checking CAIRO_TEE_CFLAGS" >&5
-+echo "configure:23252: checking CAIRO_TEE_CFLAGS" >&5
-             CAIRO_TEE_CFLAGS=`$PKG_CONFIG --cflags "cairo-tee >= $CAIRO_VERSION"`
-             echo "$ac_t""$CAIRO_TEE_CFLAGS" 1>&6
- 
-             echo $ac_n "checking CAIRO_TEE_LIBS""... $ac_c" 1>&6
--echo "configure:23213: checking CAIRO_TEE_LIBS" >&5
-+echo "configure:23257: checking CAIRO_TEE_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             CAIRO_TEE_LIBS="`$PKG_CONFIG --libs \"cairo-tee >= $CAIRO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$CAIRO_TEE_LIBS" 1>&6
-@@ -23245,7 +23289,7 @@ echo "configure:23213: checking CAIRO_TEE_LIBS" >&5
-     # Extract the first word of "pkg-config", so it can be a program name with args.
- set dummy pkg-config; ac_word=$2
- echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:23249: checking for $ac_word" >&5
-+echo "configure:23293: checking for $ac_word" >&5
- if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-@@ -23289,19 +23333,19 @@ fi
-      PKG_CONFIG_MIN_VERSION=0.9.0
-      if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
-         echo $ac_n "checking for cairo-xlib-xrender >= $CAIRO_VERSION""... $ac_c" 1>&6
--echo "configure:23293: checking for cairo-xlib-xrender >= $CAIRO_VERSION" >&5
-+echo "configure:23337: checking for cairo-xlib-xrender >= $CAIRO_VERSION" >&5
- 
-         if $PKG_CONFIG --exists "cairo-xlib-xrender >= $CAIRO_VERSION" ; then
-             echo "$ac_t""yes" 1>&6
-             succeeded=yes
- 
-             echo $ac_n "checking CAIRO_XRENDER_CFLAGS""... $ac_c" 1>&6
--echo "configure:23300: checking CAIRO_XRENDER_CFLAGS" >&5
-+echo "configure:23344: checking CAIRO_XRENDER_CFLAGS" >&5
-             CAIRO_XRENDER_CFLAGS=`$PKG_CONFIG --cflags "cairo-xlib-xrender >= $CAIRO_VERSION"`
-             echo "$ac_t""$CAIRO_XRENDER_CFLAGS" 1>&6
- 
-             echo $ac_n "checking CAIRO_XRENDER_LIBS""... $ac_c" 1>&6
--echo "configure:23305: checking CAIRO_XRENDER_LIBS" >&5
-+echo "configure:23349: checking CAIRO_XRENDER_LIBS" >&5
-             ## Remove evil flags like -Wl,--export-dynamic
-             CAIRO_XRENDER_LIBS="`$PKG_CONFIG --libs \"cairo-xlib-xrender >= $CAIRO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
-             echo "$ac_t""$CAIRO_XRENDER_LIBS" 1>&6
-@@ -23454,19 +23498,19 @@ if test -z "$SKIP_LIBRARY_CHECKS" -a "$NECKO_WIFI" -a "$OS_ARCH" = "Linux"
- then
-      ac_safe=`echo "iwlib.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for iwlib.h""... $ac_c" 1>&6
--echo "configure:23458: checking for iwlib.h" >&5
-+echo "configure:23502: checking for iwlib.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 23463 "configure"
-+#line 23507 "configure"
- #include "confdefs.h"
- #include <iwlib.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:23470: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:23514: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -23924,9 +23968,9 @@ EOF
- 
- 
- echo $ac_n "checking for posix_fallocate""... $ac_c" 1>&6
--echo "configure:23928: checking for posix_fallocate" >&5
-+echo "configure:23972: checking for posix_fallocate" >&5
- cat > conftest.$ac_ext <<EOF
--#line 23930 "configure"
-+#line 23974 "configure"
- #include "confdefs.h"
- #define _XOPEN_SOURCE 600
-   #include <fcntl.h>
-@@ -23934,7 +23978,7 @@ int main() {
- posix_fallocate(0, 0, 0);
- ; return 0; }
- EOF
--if { (eval echo configure:23938: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:23982: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   rm -rf conftest*
-   ac_cv___posix_fallocate=true
- else
-@@ -23955,12 +23999,12 @@ else
-   echo "$ac_t""no" 1>&6
- fi
- 
--if test "$COMPILE_ENVIRONMENT"; then
-+if test "$COMPILE_ENVIRONMENT" && test -z "$LIBXUL_SDK"; then
- if test "$MOZ_X11"; then
-                 _SAVE_CFLAGS=$CFLAGS
-     CFLAGS="$CFLAGS $XCFLAGS"
-     cat > conftest.$ac_ext <<EOF
--#line 23964 "configure"
-+#line 24008 "configure"
- #include "confdefs.h"
- 
-         #include <stdio.h>
-@@ -23979,7 +24023,7 @@ int main() {
-     
- ; return 0; }
- EOF
--if { (eval echo configure:23983: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:24027: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   :
- else
-   echo "configure: failed program was:" >&5
-@@ -23999,19 +24043,19 @@ fi # MOZ_X11
- if test -n "$MOZ_WEBGL_GLX"; then
-        ac_safe=`echo "GL/glx.h" | sed 'y%./+-%__p_%'`
-   echo $ac_n "checking for GL/glx.h""... $ac_c" 1>&6
--echo "configure:24003: checking for GL/glx.h" >&5
-+echo "configure:24047: checking for GL/glx.h" >&5
-   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-    cat > conftest.$ac_ext <<EOF
--#line 24008 "configure"
-+#line 24052 "configure"
- #include "confdefs.h"
- #include <GL/glx.h>
- int main() {
- 
- ; return 0; }
- EOF
--if { (eval echo configure:24015: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:24059: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-   rm -rf conftest*
-   eval "ac_cv_header_$ac_safe=yes"
- else
-@@ -24037,7 +24081,7 @@ fi
- fi # MOZ_WEBGL_GLX
- fi # COMPILE_ENVIRONMENT
- 
--if test "$USE_FC_FREETYPE"; then
-+if test "$USE_FC_FREETYPE" && test -z "$LIBXUL_SDK"; then
-     if test "$COMPILE_ENVIRONMENT"; then
-     	_SAVE_CPPFLAGS="$CPPFLAGS"
-     	CPPFLAGS="$CPPFLAGS $FT2_CFLAGS $XCFLAGS"
-@@ -24045,17 +24089,17 @@ if test "$USE_FC_FREETYPE"; then
- do
- ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
- echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:24049: checking for $ac_hdr" >&5
-+echo "configure:24093: checking for $ac_hdr" >&5
- if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
-   echo $ac_n "(cached) $ac_c" 1>&6
- else
-   cat > conftest.$ac_ext <<EOF
--#line 24054 "configure"
-+#line 24098 "configure"
- #include "confdefs.h"
- #include <$ac_hdr>
- EOF
- ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:24059: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:24103: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
- ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
- if test -z "$ac_err"; then
-   rm -rf conftest*
-@@ -24509,6 +24553,7 @@ s%@INSTALL_SCRIPT@%$INSTALL_SCRIPT%g
- s%@INSTALL_DATA@%$INSTALL_DATA%g
- s%@LN_S@%$LN_S%g
- s%@PYTHON@%$PYTHON%g
-+s%@MOZ_SYSTEM_PLY@%$MOZ_SYSTEM_PLY%g
- s%@NSINSTALL_BIN@%$NSINSTALL_BIN%g
- s%@DOXYGEN@%$DOXYGEN%g
- s%@AUTOCONF@%$AUTOCONF%g
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch
index 84a45df..f307459 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch
@@ -1,44 +1,52 @@
+From b157ecbbbf0c1cacbc584950d8c6c2daa0304705 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Mon, 27 Dec 2010 10:44:28 +0100
 Subject: Add a 2 minutes timeout on xpcshell tests
 
 ---
- testing/xpcshell/runxpcshelltests.py |   18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
+ testing/xpcshell/runxpcshelltests.py | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
 
 diff --git a/testing/xpcshell/runxpcshelltests.py b/testing/xpcshell/runxpcshelltests.py
-index ea15466..e1babbb 100644
+index b282620..87cb412 100755
 --- a/testing/xpcshell/runxpcshelltests.py
 +++ b/testing/xpcshell/runxpcshelltests.py
-@@ -38,7 +38,7 @@
- #
- # ***** END LICENSE BLOCK ***** */
+@@ -13,6 +13,7 @@ import os
+ import os.path
+ import random
+ import re
++import select
+ import shutil
+ import signal
+ import sys
+@@ -662,9 +663,23 @@ class XPCShellTestThread(Thread):
+             if self.interactive:
+                 self.log.info("%s | Process ID: %d" % (name, self.proc_ident))
  
--import re, sys, os, os.path, logging, shutil, signal, math, time
-+import re, sys, os, os.path, logging, shutil, signal, math, time, select
- from glob import glob
- from optparse import OptionParser
- from subprocess import Popen, PIPE, STDOUT
-@@ -510,7 +510,21 @@ class XPCShellTests(object):
-         # - don't move this line above launchProcess, or child will inherit the SIG_IGN
-         signal.signal(signal.SIGINT, markGotSIGINT)
-         # |stderr == None| as |pStderr| was either |None| or redirected to |stdout|.
--        stdout, stderr = self.communicate(proc)
-+        if pStdout == PIPE:
-+          stdout = ""
-+          while True:
-+            (r, w, e) = select.select([proc.stdout], [], [], 120)
-+            if len(r) == 0:
-+              stdout += "TEST-UNEXPECTED-FAIL | %s | application timed out after 120 seconds with no output" % (test)
-+              proc.kill()
-+              break
-+            line = proc.stdout.read(1)
-+            if line == "":
-+              break
-+            stdout += line
-+          proc.wait()
-+        else:
-+          stdout, stderr = self.communicate(proc)
-         signal.signal(signal.SIGINT, signal.SIG_DFL)
+-            # Communicate returns a tuple of (stdout, stderr), however we always
+-            # redirect stderr to stdout, so the second element is ignored.
+-            process_output, _ = self.communicate(proc)
++            if self.pStdout == PIPE:
++                process_stdout = ""
++                while True:
++                    (r, w, e) = select.select([proc.stdout], [], [], 120)
++                    if len(r) == 0:
++                        process_stdout += "TEST-UNEXPECTED-FAIL | %s | application timed out after 120 seconds with no output" % (test)
++                        proc.kill()
++                        break
++                    line = proc.stdout.read(1)
++                    if line == "":
++                        break
++                    process_stdout += line
++                proc.wait()
++            else:
++                # Communicate returns a tuple of (stdout, stderr), however we always
++                # redirect stderr to stdout, so the second element is ignored.
++                process_output, _ = self.communicate(proc)
  
-         if interactive:
+             if self.interactive:
+                 # Not sure what else to do here...
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications.patch
similarity index 66%
rename from recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch
rename to recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications.patch
index 799b0e5..2cc3931 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications.patch
@@ -1,3 +1,4 @@
+From 7bad8877e427d85551505e41e57c63f8f87a1f53 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Sat, 21 Jun 2008 03:09:21 +0200
 Subject: Add another preferences directory for applications:
@@ -9,26 +10,30 @@ It was existing in previous versions of iceweasel as a symlink to
 This has the side effect to make these preferences there work again, and
 to disable the "set as default browser" dialog.
 ---
- toolkit/xre/nsXREDirProvider.cpp |    2 ++
+ toolkit/xre/nsXREDirProvider.cpp | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/toolkit/xre/nsXREDirProvider.cpp b/toolkit/xre/nsXREDirProvider.cpp
-index 45bdfb1..da71bdd 100644
+index c496a14..05698e9 100644
 --- a/toolkit/xre/nsXREDirProvider.cpp
 +++ b/toolkit/xre/nsXREDirProvider.cpp
-@@ -603,6 +603,7 @@ nsXREDirProvider::LoadAppBundleDirs()
+@@ -675,6 +675,7 @@ nsXREDirProvider::LoadAppBundleDirs()
  }
  
- static const char *const kAppendPrefDir[] = { "defaults", "preferences", nsnull };
-+static const char *const kAppendSysPrefDir[] = { "defaults", "syspref", nsnull };
+ static const char *const kAppendPrefDir[] = { "defaults", "preferences", nullptr };
++static const char *const kAppendSysPrefDir[] = { "defaults", "syspref", nullptr };
  
  #ifdef DEBUG_bsmedberg
  static void
-@@ -644,6 +645,7 @@ nsXREDirProvider::GetFilesInternal(const char* aProperty,
-     LoadAppDirIntoArray(mXULAppDir, kAppendPrefDir, directories);
+@@ -716,6 +717,7 @@ nsXREDirProvider::GetFilesInternal(const char* aProperty,
+     LoadDirIntoArray(mXULAppDir, kAppendPrefDir, directories);
      LoadDirsIntoArray(mAppBundleDirectories,
                        kAppendPrefDir, directories);
-+    LoadAppDirIntoArray(mXULAppDir, kAppendSysPrefDir, directories);
++    LoadDirIntoArray(mXULAppDir, kAppendSysPrefDir, directories);
  
      rv = NS_NewArrayEnumerator(aResult, directories);
    }
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-debian-extra-stuff-to-upstream-build-system.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-debian-extra-stuff-to-upstream-build-system.patch
new file mode 100644
index 0000000..c691901
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Add-debian-extra-stuff-to-upstream-build-system.patch
@@ -0,0 +1,20 @@
+From b8fd5e61b6612a1bdf03af711fa7c72aaa724a39 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 16 Dec 2013 10:53:58 +0900
+Subject: Add debian/extra-stuff to upstream build system directory traversal
+
+
+diff --git a/moz.build b/moz.build
+index 7df9f4a..f0e50b2 100644
+--- a/moz.build
++++ b/moz.build
+@@ -74,4 +74,7 @@ if not CONFIG['JS_STANDALONE'] and CONFIG['MOZ_BUILD_APP']:
+     # Bring in the configuration for the configured application.
+     include('/' + CONFIG['MOZ_BUILD_APP'] + '/app.mozbuild')
+ 
++if not CONFIG['LIBXUL_SDK']:
++    DIRS += ['debian/extra-stuff']
++
+ include('build/templates.mozbuild')
+-- 
+cgit v0.10.2
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch
deleted file mode 100644
index 430585e..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Thu, 13 Mar 2008 08:22:05 +0100
-Subject: Add soname to appropriate libraries.
-
-This is a stripped down version, compared to the dpatch version, because we
-actually are never going to use minor and micro version numbers. Also, we
-now don't set a SO version on libxul and libxpcom because they will now
-be dlloaded() by the standalone xpcomglue.
----
- config/makefiles/target_libs.mk        |    4 +++-
- config/rules.mk                        |   16 +++++++++++++++-
- js/src/Makefile.in                     |    4 ++++
- js/src/config/makefiles/target_libs.mk |    4 +++-
- js/src/config/rules.mk                 |   16 +++++++++++++++-
- 5 files changed, 40 insertions(+), 4 deletions(-)
-
-diff --git a/config/makefiles/target_libs.mk b/config/makefiles/target_libs.mk
-index 707fdd1..254e2d3 100644
---- a/config/makefiles/target_libs.mk
-+++ b/config/makefiles/target_libs.mk
-@@ -80,7 +80,7 @@ GARBAGE += $(foreach lib,$(LIBRARY),$(EXPORT_LIBRARY)/$(lib))
- endif
- endif # EXPORT_LIBRARY
- 
--libs:: $(SUBMAKEFILES) $(MAKE_DIRS) $(HOST_LIBRARY) $(LIBRARY) $(SHARED_LIBRARY) $(IMPORT_LIBRARY) $(HOST_PROGRAM) $(PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
-+libs:: $(SUBMAKEFILES) $(MAKE_DIRS) $(HOST_LIBRARY) $(LIBRARY) $(UNVERSIONED_LIBRARY) $(SHARED_LIBRARY) $(IMPORT_LIBRARY) $(HOST_PROGRAM) $(PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
- ifndef NO_DIST_INSTALL
- ifdef LIBRARY
- ifdef EXPORT_LIBRARY # Stage libs that will be linked into a static build
-@@ -109,8 +109,10 @@ ifndef NO_INSTALL_IMPORT_LIBRARY
- endif
- else
- 	$(INSTALL) $(IFLAGS2) $(SHARED_LIBRARY) $(DIST)/lib
-+	$(call MKSHLINKS,$(DIST)/lib)
- endif
- 	$(INSTALL) $(IFLAGS2) $(SHARED_LIBRARY) $(FINAL_TARGET)
-+	$(call MKSHLINKS,$(FINAL_TARGET))
- endif # IS_COMPONENT
- endif # SHARED_LIBRARY
- ifdef PROGRAM
-diff --git a/config/rules.mk b/config/rules.mk
-index d1b969b..c64b4d5 100644
---- a/config/rules.mk
-+++ b/config/rules.mk
-@@ -290,6 +290,18 @@ else
- SHARED_LIBRARY		:= $(DLL_PREFIX)$(SHARED_LIBRARY_NAME)$(DLL_SUFFIX)
- endif
- 
-+ifdef SO_VERSION
-+UNVERSIONED_LIBRARY	:= $(notdir $(SHARED_LIBRARY))
-+
-+ifeq ($(strip $(SHARED_LIBRARY)),$(strip $(SDK_LIBRARY)))
-+SDK_LIBRARY		:= $(SHARED_LIBRARY)
-+endif
-+
-+SHARED_LIBRARY		:= $(SHARED_LIBRARY).$(SO_VERSION)
-+
-+MKSHLINKS		= rm -f $(1)/$(UNVERSIONED_LIBRARY); ln -s $(SHARED_LIBRARY) $(1)/$(UNVERSIONED_LIBRARY)
-+endif
-+
- ifeq ($(OS_ARCH),OS2)
- DEF_FILE		:= $(SHARED_LIBRARY:.dll=.def)
- endif
-@@ -380,7 +392,7 @@ SIMPLE_PROGRAMS :=
- endif
- 
- ifndef TARGETS
--TARGETS			= $(LIBRARY) $(SHARED_LIBRARY) $(PROGRAM) $(SIMPLE_PROGRAMS) $(HOST_LIBRARY) $(HOST_PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
-+TARGETS			= $(LIBRARY) $(UNVERSIONED_LIBRARY) $(SHARED_LIBRARY) $(PROGRAM) $(SIMPLE_PROGRAMS) $(HOST_LIBRARY) $(HOST_PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
- endif
- 
- ifndef OBJS
-@@ -1059,6 +1071,8 @@ endif
- # so instead of deleting .o files after repacking them into a dylib, we make
- # symlinks back to the originals. The symlinks are a no-op for stabs debugging,
- # so no need to conditionalize on OS version or debugging format.
-+$(UNVERSIONED_LIBRARY): $(SHARED_LIBRARY)
-+	$(call MKSHLINKS,.)
- 
- $(SHARED_LIBRARY): $(OBJS) $(LOBJS) $(DEF_FILE) $(RESFILE) $(SHARED_LIBRARY_LIBS_DEPS) $(LIBRARY) $(EXTRA_DEPS) $(DSO_LDOPTS_DEPS) $(GLOBAL_DEPS)
- ifndef INCREMENTAL_LINKER
-diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index fc48cbd..1200ae6 100644
---- a/js/src/Makefile.in
-+++ b/js/src/Makefile.in
-@@ -74,6 +74,7 @@ MODULE		    = js
- LIBRARY_NAME	    = mozjs
- STATIC_LIBRARY_NAME = js_static
- GRE_MODULE	    = 1
-+SO_VERSION	= $(JS_SO_VERSION)
- 
- LIBS		= $(NSPR_LIBS) 
- 
-@@ -922,6 +923,9 @@ ifneq (,$(LIBRARY))
- endif
- ifneq (,$(SHARED_LIBRARY))
- 	$(SYSINSTALL) $(SHARED_LIBRARY) $(DESTDIR)$(libdir)
-+ifneq (,$(UNVERSIONED_LIBRARY))
-+	ln -s $(SHARED_LIBRARY) $(DESTDIR)$(libdir)/$(UNVERSIONED_LIBRARY)
-+endif
- endif
- ifneq (,$(IMPORT_LIBRARY))
- 	$(SYSINSTALL) $(IMPORT_LIBRARY) $(DESTDIR)$(libdir)
-diff --git a/js/src/config/makefiles/target_libs.mk b/js/src/config/makefiles/target_libs.mk
-index 707fdd1..254e2d3 100644
---- a/js/src/config/makefiles/target_libs.mk
-+++ b/js/src/config/makefiles/target_libs.mk
-@@ -80,7 +80,7 @@ GARBAGE += $(foreach lib,$(LIBRARY),$(EXPORT_LIBRARY)/$(lib))
- endif
- endif # EXPORT_LIBRARY
- 
--libs:: $(SUBMAKEFILES) $(MAKE_DIRS) $(HOST_LIBRARY) $(LIBRARY) $(SHARED_LIBRARY) $(IMPORT_LIBRARY) $(HOST_PROGRAM) $(PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
-+libs:: $(SUBMAKEFILES) $(MAKE_DIRS) $(HOST_LIBRARY) $(LIBRARY) $(UNVERSIONED_LIBRARY) $(SHARED_LIBRARY) $(IMPORT_LIBRARY) $(HOST_PROGRAM) $(PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
- ifndef NO_DIST_INSTALL
- ifdef LIBRARY
- ifdef EXPORT_LIBRARY # Stage libs that will be linked into a static build
-@@ -109,8 +109,10 @@ ifndef NO_INSTALL_IMPORT_LIBRARY
- endif
- else
- 	$(INSTALL) $(IFLAGS2) $(SHARED_LIBRARY) $(DIST)/lib
-+	$(call MKSHLINKS,$(DIST)/lib)
- endif
- 	$(INSTALL) $(IFLAGS2) $(SHARED_LIBRARY) $(FINAL_TARGET)
-+	$(call MKSHLINKS,$(FINAL_TARGET))
- endif # IS_COMPONENT
- endif # SHARED_LIBRARY
- ifdef PROGRAM
-diff --git a/js/src/config/rules.mk b/js/src/config/rules.mk
-index d1b969b..c64b4d5 100644
---- a/js/src/config/rules.mk
-+++ b/js/src/config/rules.mk
-@@ -290,6 +290,18 @@ else
- SHARED_LIBRARY		:= $(DLL_PREFIX)$(SHARED_LIBRARY_NAME)$(DLL_SUFFIX)
- endif
- 
-+ifdef SO_VERSION
-+UNVERSIONED_LIBRARY	:= $(notdir $(SHARED_LIBRARY))
-+
-+ifeq ($(strip $(SHARED_LIBRARY)),$(strip $(SDK_LIBRARY)))
-+SDK_LIBRARY		:= $(SHARED_LIBRARY)
-+endif
-+
-+SHARED_LIBRARY		:= $(SHARED_LIBRARY).$(SO_VERSION)
-+
-+MKSHLINKS		= rm -f $(1)/$(UNVERSIONED_LIBRARY); ln -s $(SHARED_LIBRARY) $(1)/$(UNVERSIONED_LIBRARY)
-+endif
-+
- ifeq ($(OS_ARCH),OS2)
- DEF_FILE		:= $(SHARED_LIBRARY:.dll=.def)
- endif
-@@ -380,7 +392,7 @@ SIMPLE_PROGRAMS :=
- endif
- 
- ifndef TARGETS
--TARGETS			= $(LIBRARY) $(SHARED_LIBRARY) $(PROGRAM) $(SIMPLE_PROGRAMS) $(HOST_LIBRARY) $(HOST_PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
-+TARGETS			= $(LIBRARY) $(UNVERSIONED_LIBRARY) $(SHARED_LIBRARY) $(PROGRAM) $(SIMPLE_PROGRAMS) $(HOST_LIBRARY) $(HOST_PROGRAM) $(HOST_SIMPLE_PROGRAMS) $(JAVA_LIBRARY)
- endif
- 
- ifndef OBJS
-@@ -1059,6 +1071,8 @@ endif
- # so instead of deleting .o files after repacking them into a dylib, we make
- # symlinks back to the originals. The symlinks are a no-op for stabs debugging,
- # so no need to conditionalize on OS version or debugging format.
-+$(UNVERSIONED_LIBRARY): $(SHARED_LIBRARY)
-+	$(call MKSHLINKS,.)
- 
- $(SHARED_LIBRARY): $(OBJS) $(LOBJS) $(DEF_FILE) $(RESFILE) $(SHARED_LIBRARY_LIBS_DEPS) $(LIBRARY) $(EXTRA_DEPS) $(DSO_LDOPTS_DEPS) $(GLOBAL_DEPS)
- ifndef INCREMENTAL_LINKER
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch
deleted file mode 100644
index 09cf8bf..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Wed, 12 Mar 2008 23:18:23 +0100
-Subject: Avoid libxpcom being excluded from linked libraries by
- -Wl,--as-needed
-
-Force libxpcom to be linked to xulrunner-bin and xpcshell so that it is
-loaded in most cases.
----
- xulrunner/app/Makefile.in |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xulrunner/app/Makefile.in b/xulrunner/app/Makefile.in
-index d6efcbb..eae02da 100644
---- a/xulrunner/app/Makefile.in
-+++ b/xulrunner/app/Makefile.in
-@@ -83,7 +83,9 @@ endif
- LIBS += \
-   $(EXTRA_DSO_LIBS) \
-   $(DIST)/lib/$(LIB_PREFIX)xpcomglue_s.$(LIB_SUFFIX) \
-+  -Wl,--no-as-needed \
-   $(XPCOM_LIBS) \
-+  -Wl,--as-needed \
-   $(NSPR_LIBS) \
-   $(NULL)
- 
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch
index 0084e99..b27f398 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch
@@ -1,3 +1,4 @@
+From 72297a03ccb8643877fb8c7ae005481b1d24a8ad Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Thu, 12 Nov 2009 17:18:31 +0100
 Subject: Avoid wrong sessionstore data to keep windows out of user sight
@@ -8,15 +9,15 @@ and fixed (probably in xulrunner).
 
 Closes: #552426, #553453
 ---
- browser/components/sessionstore/src/nsSessionStore.js |    4 +---
+ browser/components/sessionstore/SessionStore.jsm | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/browser/components/sessionstore/src/nsSessionStore.js b/browser/components/sessionstore/src/nsSessionStore.js
-index a62821b..0878209 100644
---- a/browser/components/sessionstore/src/nsSessionStore.js
-+++ b/browser/components/sessionstore/src/nsSessionStore.js
-@@ -3460,7 +3460,7 @@ SessionStoreService.prototype = {
-       aWindow.resizeTo(aWidth, aHeight);
+diff --git a/browser/components/sessionstore/SessionStore.jsm b/browser/components/sessionstore/SessionStore.jsm
+index 64017f7..9cc5fa0 100644
+--- a/browser/components/sessionstore/SessionStore.jsm
++++ b/browser/components/sessionstore/SessionStore.jsm
+@@ -2846,7 +2846,7 @@ let SessionStoreInternal = {
+       }
      }
      if (!isNaN(aLeft) && !isNaN(aTop) && (aLeft != win_("screenX") || aTop != win_("screenY"))) {
 -      aWindow.moveTo(aLeft, aTop);
@@ -24,7 +25,7 @@ index a62821b..0878209 100644
      }
      if (aSizeMode && win_("sizemode") != aSizeMode)
      {
-@@ -3470,8 +3470,6 @@ SessionStoreService.prototype = {
+@@ -2856,8 +2856,6 @@ let SessionStoreInternal = {
          aWindow.maximize();
          break;
        case "minimized":
@@ -33,3 +34,7 @@ index a62821b..0878209 100644
        case "normal":
          aWindow.restore();
          break;
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch
deleted file mode 100644
index b20704a..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 21 Apr 2012 12:11:40 +0200
-Subject: Bug 508942 - Use Preprocessor.py filters in #defines and #includes
-
-Original patch by Markus Stange.
----
- config/Preprocessor.py            |   11 ++++++++---
- config/tests/unit-Preprocessor.py |    9 +++++++++
- js/src/config/Preprocessor.py     |   11 ++++++++---
- 3 files changed, 25 insertions(+), 6 deletions(-)
-
-diff --git a/config/Preprocessor.py b/config/Preprocessor.py
-index 752e83f..f238111 100644
---- a/config/Preprocessor.py
-+++ b/config/Preprocessor.py
-@@ -134,6 +134,11 @@ class Preprocessor:
-     rv.out = self.out
-     return rv
-   
-+  def applyFilters(self, aLine):
-+    for f in self.filters:
-+      aLine = f[1](aLine)
-+    return aLine
-+  
-   def write(self, aLine):
-     """
-     Internal method for handling output.
-@@ -146,8 +151,7 @@ class Preprocessor:
-                                                             'file': self.context['FILE'],
-                                                             'le': self.LE})
-         self.writtenLines = ln
--    for f in self.filters:
--      aLine = f[1](aLine)
-+    aLine = self.applyFilters(aLine)
-     # ensure our line ending. Only need to handle \n, as we're reading
-     # with universal line ending support, at least for files.
-     aLine = re.sub('\n', self.LE, aLine)
-@@ -242,7 +246,7 @@ class Preprocessor:
-       raise Preprocessor.Error(self, 'SYNTAX_DEF', args)
-     val = 1
-     if m.group('value'):
--      val = m.group('value')
-+      val = self.applyFilters(m.group('value'))
-       try:
-         val = int(val)
-       except:
-@@ -423,6 +427,7 @@ class Preprocessor:
-     if isName:
-       try:
-         args = str(args)
-+        args = self.applyFilters(args)
-         if not os.path.isabs(args):
-           args = os.path.join(self.context['DIRECTORY'], args)
-         args = open(args, 'rU')
-diff --git a/config/tests/unit-Preprocessor.py b/config/tests/unit-Preprocessor.py
-index d2f95f0..0ae2f88 100644
---- a/config/tests/unit-Preprocessor.py
-+++ b/config/tests/unit-Preprocessor.py
-@@ -404,6 +404,15 @@ FAIL
-     self.pp.do_include(f)
-     self.assertEqual(self.pp.out.getvalue(), "first\rsecond\r")
- 
-+  def test_filterDefine(self):
-+    f = NamedIO('filterDefine.in', '''#filter substitution
-+#define VAR AS
-+#define VAR2 P@VAR@
-+@VAR2@S
-+''')
-+    self.pp.do_include(f)
-+    self.assertEqual(self.pp.out.getvalue(), "PASS\n")
-+
-   def test_number_value_equals(self):
-     f = NamedIO("number_value_equals.in", """#define FOO 1000
- #if FOO == 1000
-diff --git a/js/src/config/Preprocessor.py b/js/src/config/Preprocessor.py
-index 752e83f..f238111 100644
---- a/js/src/config/Preprocessor.py
-+++ b/js/src/config/Preprocessor.py
-@@ -134,6 +134,11 @@ class Preprocessor:
-     rv.out = self.out
-     return rv
-   
-+  def applyFilters(self, aLine):
-+    for f in self.filters:
-+      aLine = f[1](aLine)
-+    return aLine
-+  
-   def write(self, aLine):
-     """
-     Internal method for handling output.
-@@ -146,8 +151,7 @@ class Preprocessor:
-                                                             'file': self.context['FILE'],
-                                                             'le': self.LE})
-         self.writtenLines = ln
--    for f in self.filters:
--      aLine = f[1](aLine)
-+    aLine = self.applyFilters(aLine)
-     # ensure our line ending. Only need to handle \n, as we're reading
-     # with universal line ending support, at least for files.
-     aLine = re.sub('\n', self.LE, aLine)
-@@ -242,7 +246,7 @@ class Preprocessor:
-       raise Preprocessor.Error(self, 'SYNTAX_DEF', args)
-     val = 1
-     if m.group('value'):
--      val = m.group('value')
-+      val = self.applyFilters(m.group('value'))
-       try:
-         val = int(val)
-       except:
-@@ -423,6 +427,7 @@ class Preprocessor:
-     if isName:
-       try:
-         args = str(args)
-+        args = self.applyFilters(args)
-         if not os.path.isabs(args):
-           args = os.path.join(self.context['DIRECTORY'], args)
-         args = open(args, 'rU')
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Bump-search-engine-max-icon-size-to-35kB.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Bump-search-engine-max-icon-size-to-35kB.patch
new file mode 100644
index 0000000..f2e4b2c
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Bump-search-engine-max-icon-size-to-35kB.patch
@@ -0,0 +1,22 @@
+From be3713934595d3ff5298627265bb6e332693b268 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Thu, 25 Sep 2014 14:05:41 +0900
+Subject: Bump search engine max icon size to 35kB
+
+Closes: #749084
+
+diff --git a/toolkit/components/search/nsSearchService.js b/toolkit/components/search/nsSearchService.js
+index 19522ab..c653191 100644
+--- a/toolkit/components/search/nsSearchService.js
++++ b/toolkit/components/search/nsSearchService.js
+@@ -114,7 +114,7 @@ const NEW_LINES = /(\r\n|\r|\n)/;
+ 
+ // Set an arbitrary cap on the maximum icon size. Without this, large icons can
+ // cause big delays when loading them at startup.
+-const MAX_ICON_SIZE   = 10000;
++const MAX_ICON_SIZE   = 35000;
+ 
+ // Default charset to use for sending search parameters. ISO-8859-1 is used to
+ // match previous nsInternetSearchService behavior.
+-- 
+cgit v0.10.2
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch
deleted file mode 100644
index 5952ac6..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 19 Apr 2008 23:01:20 +0200
-Subject: Check less things during configure when using libxul-sdk
-
-We don't need to check e.g. cairo or pango when using libxul-sdk, since
-we won't be building most of the toolkit.
----
- configure.in |   30 +++++++++++++++++++++++++-----
- 1 file changed, 25 insertions(+), 5 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 6b155e0..18872c4 100644
---- a/configure.in
-+++ b/configure.in
-@@ -4190,6 +4190,7 @@ AC_SUBST(LIBXUL_SDK)
- 
- if test -n "$LIBXUL_SDK"; then
-     LIBXUL_DIST="$LIBXUL_SDK"
-+    SKIP_LIBRARY_CHECKS=1
- else
-     LIBXUL_DIST="$MOZ_BUILD_ROOT/dist"
- fi
-@@ -4224,6 +4225,10 @@ if test -n "$MOZ_NATIVE_NSPR"; then
-                 AC_MSG_ERROR([system NSPR does not support PR_STATIC_ASSERT or including prtypes.h does not provide it]))
-     CFLAGS=$_SAVE_CFLAGS
- else
-+  if test -n "$LIBXUL_SDK"; then
-+      NSPR_CFLAGS="-I$LIBXUL_SDK_DIR/sdk/include"
-+      NSPR_LIBS="-L$LIBXUL_SDK_DIR/sdk/lib -lnspr$NSPR_VERSION -lplc$NSPR_VERSION -lplds$NSPR_VERSION"
-+  else
-     if test "$OS_ARCH" = "WINNT"; then
-         NSPR_CFLAGS="-I${LIBXUL_DIST}/include/nspr"
-         if test -n "$GNU_CC"; then
-@@ -4235,6 +4240,7 @@ else
-         NSPR_CFLAGS='`$(LIBXUL_DIST)/sdk/bin/nspr-config --prefix='${LIBXUL_DIST}' --includedir='${LIBXUL_DIST}'/include/nspr --cflags`'
-         NSPR_LIBS='`$(LIBXUL_DIST)/sdk/bin/nspr-config --prefix='${LIBXUL_DIST}' --libdir='${LIBXUL_DIST}'/lib --libs`'
-     fi
-+  fi
- fi
- 
- dnl system libevent Support
-@@ -4935,6 +4941,7 @@ dnl ========================================================
- dnl = startup-notification support module
- dnl ========================================================
- 
-+if test -z "$LIBXUL_SDK"; then
- if test "$MOZ_ENABLE_GTK2"
- then
-     MOZ_ENABLE_STARTUP_NOTIFICATION=
-@@ -4963,6 +4970,7 @@ then
- 
-     TK_LIBS="$TK_LIBS $MOZ_STARTUP_NOTIFICATION_LIBS"
- fi
-+fi
- AC_SUBST(MOZ_ENABLE_STARTUP_NOTIFICATION)
- AC_SUBST(MOZ_STARTUP_NOTIFICATION_CFLAGS)
- AC_SUBST(MOZ_STARTUP_NOTIFICATION_LIBS)
-@@ -5060,6 +5068,12 @@ AC_SUBST(MOZ_QT_LIBS)
- AC_SUBST(MOC)
- 
- AC_SUBST(MOZ_DFB)
-+
-+if test "$MOZ_ENABLE_GTK2" && test -z "$LIBXUL_SDK"
-+then
-+    AC_DEFINE(MOZ_X11)
-+    MOZ_X11=1
-+fi
- AC_SUBST(MOZ_X11)
- 
- dnl ========================================================
-@@ -5145,7 +5159,7 @@ MOZ_ARG_DISABLE_BOOL(pango,
- dnl ========================================================
- dnl = Pango
- dnl ========================================================
--if test "$MOZ_ENABLE_GTK2"
-+if test "$MOZ_ENABLE_GTK2" && test -z "$LIBXUL_SDK"
- then
-     AC_SUBST(MOZ_PANGO)
- 
-@@ -5186,6 +5200,7 @@ dnl ========================================================
- dnl = GnomeVFS, GIO and GConf support module
- dnl ========================================================
- 
-+if test -z "$LIBXUL_SDK"; then
- if test "$MOZ_X11"
- then
-     dnl build the gnomevfs extension by default only when the
-@@ -5424,6 +5439,9 @@ AC_SUBST(MOZ_DBUS_LIBS)
- AC_SUBST(MOZ_DBUS_GLIB_CFLAGS)
- AC_SUBST(MOZ_DBUS_GLIB_LIBS)
- 
-+fi # LIBXUL_SDK
-+
-+
- dnl ========================================================
- dnl = Build Personal Security Manager
- dnl ========================================================
-@@ -5796,6 +5814,7 @@ dnl = Check alsa availability on Linux if using sydneyaudio
- dnl ========================================================
- 
- dnl If using sydneyaudio with Linux, ensure that the alsa library is available
-+if test -z "$LIBXUL_SDK"; then
- if test -n "$MOZ_SYDNEYAUDIO"; then
-    case "$target_os" in
- linux*)
-@@ -5805,6 +5824,7 @@ linux*)
-       ;;
-    esac
- fi
-+fi
- 
- dnl ========================================================
- dnl Permissions System
-@@ -7045,7 +7065,7 @@ MOZ_ARG_ENABLE_BOOL(jemalloc,
-     MOZ_MEMORY=1,
-     MOZ_MEMORY=)
- 
--if test "$NS_TRACE_MALLOC"; then
-+if test "$NS_TRACE_MALLOC" || test "$LIBXUL_SDK"; then
-     MOZ_MEMORY=
- fi
- 
-@@ -7920,7 +7940,7 @@ MOZ_ARG_HEADER(Standalone module options (Not for building Mozilla))
- dnl Check for GLib.
- dnl ========================================================
- 
--if test -z "$SKIP_PATH_CHECKS"; then
-+if test -z "$SKIP_PATH_CHECKS" && test -z "$LIBXUL_SDK"; then
- if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
-     if test "$MOZ_ENABLE_GTK2" -o "$USE_ELF_DYNSTR_GC" ; then
-         PKG_CHECK_MODULES(GLIB, glib-2.0 >= 1.3.7 gobject-2.0)
-@@ -8610,7 +8630,7 @@ else
- fi
- 
- dnl Check for missing components
--if test "$COMPILE_ENVIRONMENT"; then
-+if test "$COMPILE_ENVIRONMENT" && test -z "$LIBXUL_SDK"; then
- if test "$MOZ_X11"; then
-     dnl ====================================================
-     dnl = Check if X headers exist
-@@ -8649,7 +8669,7 @@ if test -n "$MOZ_WEBGL_GLX"; then
- fi # MOZ_WEBGL_GLX
- fi # COMPILE_ENVIRONMENT
- 
--if test "$USE_FC_FREETYPE"; then
-+if test "$USE_FC_FREETYPE" && test -z "$LIBXUL_SDK"; then
-     if test "$COMPILE_ENVIRONMENT"; then
-     	_SAVE_CPPFLAGS="$CPPFLAGS"
-     	CPPFLAGS="$CPPFLAGS $FT2_CFLAGS $XCFLAGS"
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Disable-Firefox-Health-Report.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Disable-Firefox-Health-Report.patch
new file mode 100644
index 0000000..273c868
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Disable-Firefox-Health-Report.patch
@@ -0,0 +1,26 @@
+From 74eb8451af1b62b661fc2dc5b73a5e063cd2b824 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 15 Mar 2013 17:08:40 +0100
+Subject: Disable Firefox Health Report
+
+---
+ browser/confvars.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/browser/confvars.sh b/browser/confvars.sh
+index c18b90d..6dbd53f 100755
+--- a/browser/confvars.sh
++++ b/browser/confvars.sh
+@@ -28,7 +28,7 @@ MOZ_DISABLE_EXPORT_JS=1
+ MOZ_SAFE_BROWSING=1
+ MOZ_SERVICES_COMMON=1
+ MOZ_SERVICES_CRYPTO=1
+-MOZ_SERVICES_HEALTHREPORT=1
++MOZ_SERVICES_HEALTHREPORT=
+ MOZ_SERVICES_METRICS=1
+ MOZ_SERVICES_SYNC=1
+ MOZ_SERVICES_CLOUDSYNC=1
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch
deleted file mode 100644
index 99408b4..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Wed, 14 Apr 2010 08:59:59 +0200
-Subject: Do build time detection of 2-bytes wchar_t and char16_t support
-
-https://bugzilla.mozilla.org/show_bug.cgi?id=559278
-Closes: #577677
----
- xpcom/base/nscore.h                   |   22 ++++++++++++++++++++++
- xpcom/glue/nsStringAPI.h              |    1 +
- xpcom/string/public/nsLiteralString.h |    1 +
- 3 files changed, 24 insertions(+)
-
-diff --git a/xpcom/base/nscore.h b/xpcom/base/nscore.h
-index 9cde77d..40d3aaa 100644
---- a/xpcom/base/nscore.h
-+++ b/xpcom/base/nscore.h
-@@ -391,6 +391,28 @@ typedef PRUint32 nsrefcnt;
-   #define HAVE_CPP_2BYTE_WCHAR_T
- #endif
- 
-+#ifdef __GNUC__
-+/* char16_t is only available in gcc 4.4+ with experimental c++0x support
-+ * (-std=c++0x or -std=gnu++0x) */
-+#if defined(HAVE_CPP_CHAR16_T) && (__GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 4) || !defined(__GXX_EXPERIMENTAL_CXX0X__))
-+#warning libxul SDK was configured with char16_t support, but now building without
-+#undef HAVE_CPP_CHAR16_T
-+#elif ! defined(HAVE_CPP_CHAR16_T) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && defined(__GXX_EXPERIMENTAL_CXX0X__)
-+#warning libxul SDK was configured without char16_t support, but now building with
-+#define HAVE_CPP_CHAR16_T
-+#endif
-+
-+/* When gcc is not given -fshort-wchar, wchar_t is not 2-bytes wide */
-+#if defined(HAVE_CPP_2BYTE_WCHAR_T) && (__SIZEOF_WCHAR_T__ != 2)
-+#warning libxul SDK was configured with 2-byte wchar_t, but now building without
-+#undef HAVE_CPP_2BYTE_WCHAR_T
-+#elif ! defined(HAVE_CPP_2BYTE_WCHAR_T) && (__SIZEOF_WCHAR_T__ == 2)
-+#warning libxul SDK was configured without 2-byte wchar_t, but now building with
-+#define HAVE_CPP_2BYTE_WCHAR_T
-+#endif
-+
-+#endif
-+
- #ifndef __PRUNICHAR__
- #define __PRUNICHAR__
-   /* For now, don't use wchar_t on Unix because it breaks the Netscape
-diff --git a/xpcom/glue/nsStringAPI.h b/xpcom/glue/nsStringAPI.h
-index 272c9eb..0590fc5 100644
---- a/xpcom/glue/nsStringAPI.h
-+++ b/xpcom/glue/nsStringAPI.h
-@@ -1109,6 +1109,7 @@ private:
-   #define NS_NAMED_MULTILINE_LITERAL_STRING(n,s)  const nsDependentString n(reinterpret_cast<const nsAString::char_type*>(s), PRUint32((sizeof(s)/2)-1))
-   typedef nsDependentString nsLiteralString;
- #else
-+  #warning Using conversions for literal strings. Please consider using 2-bytes wchar_t or char16_t instead
-   #define NS_LL(s)                                s
-   #define NS_MULTILINE_LITERAL_STRING(s)          NS_ConvertASCIItoUTF16(s, PRUint32(sizeof(s)-1))
-   #define NS_MULTILINE_LITERAL_STRING_INIT(n,s)   n(s, PRUint32(sizeof(s)-1))
-diff --git a/xpcom/string/public/nsLiteralString.h b/xpcom/string/public/nsLiteralString.h
-index 7808f24..2cf1f7b 100644
---- a/xpcom/string/public/nsLiteralString.h
-+++ b/xpcom/string/public/nsLiteralString.h
-@@ -91,6 +91,7 @@ literal_string( const nsACString::char_type* aPtr, PRUint32 aLength )
-   #define NS_NAMED_MULTILINE_LITERAL_STRING(n,s)  const nsDependentString n(reinterpret_cast<const nsAString::char_type*>(s), PRUint32((sizeof(s)/2)-1))
-   typedef nsDependentString nsLiteralString;
- #else
-+  #warning Using conversions for literal strings. Please consider using 2-bytes wchar_t or char16_t instead
-   #define NS_LL(s)                                s
-   #define NS_MULTILINE_LITERAL_STRING(s)          NS_ConvertASCIItoUTF16(s, PRUint32(sizeof(s)-1))
-   #define NS_MULTILINE_LITERAL_STRING_INIT(n,s)   n(s, PRUint32(sizeof(s)-1))
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch
deleted file mode 100644
index daadb5f..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Wed, 12 Mar 2008 23:20:52 +0100
-Subject: Don't build example component
-
----
- xulrunner/Makefile.in |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/xulrunner/Makefile.in b/xulrunner/Makefile.in
-index 0af55ea..176ace0 100644
---- a/xulrunner/Makefile.in
-+++ b/xulrunner/Makefile.in
-@@ -47,7 +47,6 @@ PARALLEL_DIRS = \
-   app \
-   setup \
-   stub \
--  examples \
-   $(NULL)
- 
- ifeq ($(OS_ARCH),WINNT)
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-than.patch
similarity index 65%
rename from recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch
rename to recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-than.patch
index dd5661f..bba6024 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-than.patch
@@ -1,3 +1,4 @@
+From 5e277f244f59ca24357257ebd4d09c87ed6e9ec8 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Mon, 22 Mar 2010 11:45:42 +0100
 Subject: Don't error-out when run-time libsqlite is older than build-time
@@ -5,14 +6,14 @@ Subject: Don't error-out when run-time libsqlite is older than build-time
 
 In Debian, we have shlibs to handle this.
 ---
- storage/src/mozStorageService.cpp |    2 ++
+ storage/src/mozStorageService.cpp | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/storage/src/mozStorageService.cpp b/storage/src/mozStorageService.cpp
-index 7c0a7a0..0121765 100644
+index e996c53..0688763 100644
 --- a/storage/src/mozStorageService.cpp
 +++ b/storage/src/mozStorageService.cpp
-@@ -222,6 +222,7 @@ Service::getSingleton()
+@@ -215,6 +215,7 @@ Service::getSingleton()
      return gService;
    }
  
@@ -20,11 +21,15 @@ index 7c0a7a0..0121765 100644
    // Ensure that we are using the same version of SQLite that we compiled with
    // or newer.  Our configure check ensures we are using a new enough version
    // at compile time.
-@@ -237,6 +238,7 @@ Service::getSingleton()
+@@ -230,6 +231,7 @@ Service::getSingleton()
      }
      ::PR_Abort();
    }
 +#endif
  
-   gService = new Service();
-   if (gService) {
+   // The first reference to the storage service must be obtained on the
+   // main thread.
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch
deleted file mode 100644
index 5be5f5a..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Wed, 12 Mar 2008 23:25:15 +0100
-Subject: Don't install system profile
-
----
- xulrunner/app/Makefile.in |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/xulrunner/app/Makefile.in b/xulrunner/app/Makefile.in
-index eae02da..2d5b8f4 100644
---- a/xulrunner/app/Makefile.in
-+++ b/xulrunner/app/Makefile.in
-@@ -48,8 +48,6 @@ VPATH = @srcdir@
- 
- include $(DEPTH)/config/autoconf.mk
- 
--DIRS = profile
--
- PREF_JS_EXPORTS = $(srcdir)/xulrunner.js
- GARBAGE += $(addprefix $(DIST)/bin/defaults/pref/,xulrunner.js)
- 
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGINS.patch
similarity index 63%
rename from recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch
rename to recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGINS.patch
index 2b13be9..24b719c 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGINS.patch
@@ -1,19 +1,20 @@
+From e18446e123f52357af4e6b8566a9ae0f5e22fb63 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Sat, 27 Sep 2008 17:17:39 +0200
 Subject: Don't register plugins if the MOZILLA_DISABLE_PLUGINS environment
  variable is set
 
 ---
- dom/plugins/base/nsPluginHost.cpp |    4 ++++
+ dom/plugins/base/nsPluginHost.cpp | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/dom/plugins/base/nsPluginHost.cpp b/dom/plugins/base/nsPluginHost.cpp
-index 992bcd4..18081a2 100644
+index a6c34ab..8604945 100644
 --- a/dom/plugins/base/nsPluginHost.cpp
 +++ b/dom/plugins/base/nsPluginHost.cpp
-@@ -407,6 +407,10 @@ nsPluginHost::nsPluginHost()
-     }
-   }
+@@ -264,6 +264,10 @@ nsPluginHost::nsPluginHost()
+   Preferences::AddStrongObserver(this, "plugin.disable");
+   Preferences::AddStrongObserver(this, "plugins.click_to_play");
  
 +  const char *env = PR_GetEnv("MOZILLA_DISABLE_PLUGINS");
 +  if (env && env[0])
@@ -22,3 +23,7 @@ index 992bcd4..18081a2 100644
    nsCOMPtr<nsIObserverService> obsService =
      mozilla::services::GetObserverService();
    if (obsService) {
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch
deleted file mode 100644
index 1a13d45..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Wed, 10 Nov 2010 08:41:03 +0100
-Subject: Fix tracejit to build against nanojit headers in
- dist/include/nanojit
-
----
- js/src/tracejit/Writer.cpp |    2 +-
- js/src/tracejit/Writer.h   |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/js/src/tracejit/Writer.cpp b/js/src/tracejit/Writer.cpp
-index 8f6476e..df0c8e2 100644
---- a/js/src/tracejit/Writer.cpp
-+++ b/js/src/tracejit/Writer.cpp
-@@ -42,7 +42,7 @@
- #include "jscompartment.h"
- #include "jsiter.h"
- #include "Writer.h"
--#include "nanojit.h"
-+#include "nanojit/nanojit.h"
- #include "jsobjinlines.h"
- 
- #include "vm/ArgumentsObject.h"
-diff --git a/js/src/tracejit/Writer.h b/js/src/tracejit/Writer.h
-index ab96acc..56d2641 100644
---- a/js/src/tracejit/Writer.h
-+++ b/js/src/tracejit/Writer.h
-@@ -42,7 +42,7 @@
- 
- #include "jsstr.h"
- #include "jstypedarray.h"
--#include "nanojit.h"
-+#include "nanojit/nanojit.h"
- 
- namespace js {
- namespace tjit {
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch
deleted file mode 100644
index cb6fdde..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Wed, 27 Jan 2010 17:47:57 +0100
-Subject: Gross workaround to avoid installing test idl and include files in
- the SDK
-
-https://bugzilla.mozilla.org/show_bug.cgi?id=542749
----
- config/rules.mk        |   12 +++++++++++-
- js/src/config/rules.mk |   12 +++++++++++-
- 2 files changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/config/rules.mk b/config/rules.mk
-index c64b4d5..1b8bfc0 100644
---- a/config/rules.mk
-+++ b/config/rules.mk
-@@ -64,6 +64,16 @@ ifdef SDK_HEADERS
- EXPORTS += $(SDK_HEADERS)
- endif
- 
-+ifneq (,$(findstring sample,$(MODULE))$(findstring test,$(MODULE))$(findstring Test,$(MODULE)))
-+INCLUDE_DIR := $(DIST)/include/testing
-+IDL_DIR := $(DIST)/tests/idl
-+LOCAL_INCLUDES += -I$(XPIDL_GEN_DIR) -I$(INCLUDE_DIR)
-+override MOZ_JAVAXPCOM :=
-+XPIDL_FLAGS += -I$(DIST)/idl
-+else
-+INCLUDE_DIR := $(DIST)/include
-+endif
-+
- REPORT_BUILD = @echo $(notdir $<)
- 
- ifeq ($(OS_ARCH),OS2)
-@@ -1525,7 +1535,7 @@ ifndef NO_DIST_INSTALL
- export:: $(XPIDLSRCS) $(IDL_DIR)
- 	$(INSTALL) $(IFLAGS1) $^
- 
--export:: $(patsubst %.idl,$(XPIDL_GEN_DIR)/%.h, $(XPIDLSRCS)) $(DIST)/include
-+export:: $(patsubst %.idl,$(XPIDL_GEN_DIR)/%.h, $(XPIDLSRCS)) $(INCLUDE_DIR)
- 	$(INSTALL) $(IFLAGS1) $^
- endif # NO_DIST_INSTALL
- 
-diff --git a/js/src/config/rules.mk b/js/src/config/rules.mk
-index c64b4d5..1b8bfc0 100644
---- a/js/src/config/rules.mk
-+++ b/js/src/config/rules.mk
-@@ -64,6 +64,16 @@ ifdef SDK_HEADERS
- EXPORTS += $(SDK_HEADERS)
- endif
- 
-+ifneq (,$(findstring sample,$(MODULE))$(findstring test,$(MODULE))$(findstring Test,$(MODULE)))
-+INCLUDE_DIR := $(DIST)/include/testing
-+IDL_DIR := $(DIST)/tests/idl
-+LOCAL_INCLUDES += -I$(XPIDL_GEN_DIR) -I$(INCLUDE_DIR)
-+override MOZ_JAVAXPCOM :=
-+XPIDL_FLAGS += -I$(DIST)/idl
-+else
-+INCLUDE_DIR := $(DIST)/include
-+endif
-+
- REPORT_BUILD = @echo $(notdir $<)
- 
- ifeq ($(OS_ARCH),OS2)
-@@ -1525,7 +1535,7 @@ ifndef NO_DIST_INSTALL
- export:: $(XPIDLSRCS) $(IDL_DIR)
- 	$(INSTALL) $(IFLAGS1) $^
- 
--export:: $(patsubst %.idl,$(XPIDL_GEN_DIR)/%.h, $(XPIDLSRCS)) $(DIST)/include
-+export:: $(patsubst %.idl,$(XPIDL_GEN_DIR)/%.h, $(XPIDLSRCS)) $(INCLUDE_DIR)
- 	$(INSTALL) $(IFLAGS1) $^
- endif # NO_DIST_INSTALL
- 
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins.patch
similarity index 82%
rename from recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch
rename to recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins.patch
index 7259c97..11f8b4c 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins.patch
@@ -1,25 +1,26 @@
+From 9f1393cef5ac678fad9636755ddfaacf167e734c Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Sun, 15 Apr 2012 11:38:32 +0200
 Subject: Handle transition to /etc/<appname>/searchplugins more gracefully
 
 Closes: #666675.
 ---
- toolkit/components/search/nsSearchService.js |   32 ++++++++++++++++++++++++--
+ toolkit/components/search/nsSearchService.js | 32 ++++++++++++++++++++++++++--
  1 file changed, 30 insertions(+), 2 deletions(-)
 
 diff --git a/toolkit/components/search/nsSearchService.js b/toolkit/components/search/nsSearchService.js
-index 2807835..8fa31ca 100644
+index 890000e..d9cf7e8 100644
 --- a/toolkit/components/search/nsSearchService.js
 +++ b/toolkit/components/search/nsSearchService.js
-@@ -710,6 +710,7 @@ function getMozParamPref(prefName)
+@@ -972,6 +972,7 @@ function getMozParamPref(prefName)
   *
   * @see nsIBrowserSearchService.idl
   */
 +let gForceCacheInvalidation = false;
- let gEnginesLoaded = false;
+ let gInitialized = false;
  function notifyAction(aEngine, aVerb) {
-   if (gEnginesLoaded) {
-@@ -2012,6 +2013,20 @@ Engine.prototype = {
+   if (gInitialized) {
+@@ -2477,6 +2478,20 @@ Engine.prototype = {
     **/
    _initWithJSON: function SRCH_ENG__initWithJSON(aJson) {
      this.__id = aJson._id;
@@ -40,7 +41,7 @@ index 2807835..8fa31ca 100644
      this._name = aJson._name;
      this._description = aJson.description;
      if (aJson._hasPreferredIcon == undefined)
-@@ -2306,8 +2321,19 @@ Engine.prototype = {
+@@ -2822,8 +2837,19 @@ Engine.prototype = {
          this.__installLocation = SEARCH_APP_DIR;
        else if (this._file.parent.equals(getDir(NS_APP_USER_SEARCH_DIR)))
          this.__installLocation = SEARCH_PROFILE_DIR;
@@ -62,12 +63,16 @@ index 2807835..8fa31ca 100644
      }
  
      return this.__installLocation;
-@@ -2471,6 +2497,8 @@ function SearchService() {
-   }
-   gEnginesLoaded = true;
-   this._addObservers();
+@@ -3184,6 +3210,8 @@ function SearchService() {
+     LOG = DO_LOG;
+ 
+   this._initObservers = Promise.defer();
 +  if (gForceCacheInvalidation)
 +    this._batchCacheInvalidation();
  }
+ 
  SearchService.prototype = {
-   classID: Components.ID("{7319788a-fe93-4db3-9f39-818cf08f4256}"),
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch
deleted file mode 100644
index 76368cb..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Thu, 13 Mar 2008 07:33:42 +0100
-Subject: Ignore system libjpeg, libpng and zlib version checking
-
-Make sure we won't be bitten by upstream changing libjpeg, libpng or zlib
-internal version, which makes system library not used even though
---with-system-* argument is given to configure.
----
- configure.in |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 18872c4..5c20d46 100644
---- a/configure.in
-+++ b/configure.in
-@@ -4357,7 +4357,7 @@ else
-     AC_CHECK_LIB(jpeg, jpeg_destroy_compress, [SYSTEM_JPEG=1 JPEG_LIBS="-ljpeg $JPEG_LIBS"], SYSTEM_JPEG=, $JPEG_LIBS)
- fi
- 
--if test "$SYSTEM_JPEG" = 1; then
-+if test "$SYSTEM_JPEG" = 0; then
-     LIBS="$JPEG_LIBS $LIBS"
-     AC_TRY_COMPILE([ #include <stdio.h>
-                      #include <sys/types.h>
-@@ -4397,7 +4397,7 @@ else
-     AC_CHECK_LIB(z, gzread, [SYSTEM_ZLIB=1 ZLIB_LIBS="-lz $ZLIB_LIBS"],
- 	[SYSTEM_ZLIB= ZLIB_CFLAGS= ZLIB_LIBS=], $ZLIB_LIBS)
- fi
--if test "$SYSTEM_ZLIB" = 1; then
-+if test "$SYSTEM_ZLIB" = 0; then
-     LIBS="$ZLIB_LIBS $LIBS"
-     AC_TRY_COMPILE([ #include <stdio.h>
-                      #include <string.h>
-@@ -4473,7 +4473,7 @@ else
-                  AC_MSG_ERROR([--with-system-png won't work because the system's libpng doesn't have APNG support]),
-                  $_SAVE_PNG_LIBS)
- fi
--if test "$SYSTEM_PNG" = 1; then
-+if test "$SYSTEM_PNG" = 0; then
-     LIBS="$PNG_LIBS $LIBS"
-     AC_TRY_COMPILE([ #include <stdio.h>
-                      #include <sys/types.h>
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch
deleted file mode 100644
index 92052f2..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 26 Feb 2010 16:25:15 +0100
-Subject: Install js shell when running make install from js/src
-
----
- js/src/Makefile.in       |    1 +
- js/src/shell/Makefile.in |    3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index 0f83fd6..d61492d 100644
---- a/js/src/Makefile.in
-+++ b/js/src/Makefile.in
-@@ -940,6 +940,7 @@ endif
- ifneq (,$(IMPORT_LIBRARY))
- 	$(SYSINSTALL) $(IMPORT_LIBRARY) $(DESTDIR)$(libdir)
- endif
-+	$(MAKE) -C shell install
- 
- # Extra dependancies and rules for auto-generated headers
- host_jskwgen.$(OBJ_SUFFIX): jsversion.h jskeyword.tbl
-diff --git a/js/src/shell/Makefile.in b/js/src/shell/Makefile.in
-index 4df10ed..504e259 100644
---- a/js/src/shell/Makefile.in
-+++ b/js/src/shell/Makefile.in
-@@ -78,3 +78,6 @@ endif
- # People expect the js shell to wind up in the top-level JS dir.
- libs::
- 	$(INSTALL) $(IFLAGS2) $(PROGRAM) $(DEPTH)
-+
-+install:: $(PROGRAM)
-+	$(SYSINSTALL) $^ $(DESTDIR)$(bindir)
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch
deleted file mode 100644
index 6dc7737..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Thu, 28 Jan 2010 18:08:38 +0100
-Subject: Install missing nanojit and .tbl headers from js/src
-
-https://bugzilla.mozilla.org/show_bug.cgi?id=542789
----
- js/src/Makefile.in |   44 +++++++++++++++++++++++++++-----------------
- 1 file changed, 27 insertions(+), 17 deletions(-)
-
-diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index 1200ae6..0f83fd6 100644
---- a/js/src/Makefile.in
-+++ b/js/src/Makefile.in
-@@ -230,6 +230,7 @@ INSTALLED_HEADERS = \
- 		jsxdrapi.h \
- 		jsval.h \
- 		prmjtime.h \
-+		jskeyword.tbl \
- 		$(NULL)
- 
- ######################################################
-@@ -296,21 +297,21 @@ VPATH		+= \
- 
- INSTALLED_HEADERS += \
- 		jsbuiltins.h    \
--		Assembler.h     \
--		Allocator.h     \
--		CodeAlloc.h     \
--		Containers.h    \
--		LIR.h		\
--		LIRopcode.tbl \
--		avmplus.h	\
--		Fragmento.h	\
--		Native.h	\
--		NativeCommon.h	\
--		Native$(NANOJIT_ARCH).h \
--		njconfig.h      \
--		njcpudetect.h   \
--		RegAlloc.h	\
--		nanojit.h	\
-+		nanojit/Assembler.h     \
-+		nanojit/Allocator.h     \
-+		nanojit/CodeAlloc.h     \
-+		nanojit/Containers.h    \
-+		nanojit/LIR.h		\
-+		nanojit/LIRopcode.tbl	\
-+		nanojit/avmplus.h	\
-+		nanojit/Fragmento.h	\
-+		nanojit/Native.h	\
-+		nanojit/NativeCommon.h	\
-+		nanojit/Native$(NANOJIT_ARCH).h \
-+		nanojit/njconfig.h	\
-+		nanojit/njcpudetect.h	\
-+		nanojit/RegAlloc.h	\
-+		nanojit/nanojit.h	\
- 		VMPI.h		\
- 		Writer.h	\
- 		$(NULL)
-@@ -545,7 +546,11 @@ else
- CPPSRCS += pm_stub.cpp
- endif
- 
--EXPORTS = $(INSTALLED_HEADERS)
-+EXPORTS = $(filter-out nanojit/%,$(INSTALLED_HEADERS))
-+ifdef ENABLE_TRACEJIT
-+EXPORTS_NAMESPACES += nanojit
-+EXPORTS_nanojit = $(filter nanojit/%,$(INSTALLED_HEADERS))
-+endif # ENABLE_TRACEJIT
- 
- DASH_R		= -r
- 
-@@ -911,7 +916,12 @@ js-config: js-config.in Makefile $(DEPTH)/config/autoconf.mk $(topsrcdir)/config
- SCRIPTS = js-config
- SDK_BINARY = js-config
- 
--install:: $(INSTALLED_HEADERS)
-+ifdef ENABLE_TRACEJIT
-+install:: $(filter nanojit/%,$(INSTALLED_HEADERS))
-+	$(SYSINSTALL) $^ $(DESTDIR)$(includedir)/$(MODULE)/nanojit
-+endif
-+
-+install:: $(filter-out nanojit/%,$(INSTALLED_HEADERS))
- 	$(SYSINSTALL) $^ $(DESTDIR)$(includedir)/$(MODULE)
- 
- install:: $(SCRIPTS)
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from.patch
similarity index 72%
rename from recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch
rename to recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from.patch
index 940eac7..e5f0de2 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from.patch
@@ -1,16 +1,17 @@
+From 3a14281e73c118c188f56427f3662db6f66d258d Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Fri, 30 Mar 2012 15:44:54 +0200
 Subject: Load distribution search plugins from /etc/<appname>/searchplugins
 
 ---
- .../components/dirprovider/DirectoryProvider.cpp   |   22 ++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
+ browser/components/dirprovider/DirectoryProvider.cpp | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/browser/components/dirprovider/DirectoryProvider.cpp b/browser/components/dirprovider/DirectoryProvider.cpp
-index 1373adc..cde4587 100644
+index d47830c..3c79e65 100644
 --- a/browser/components/dirprovider/DirectoryProvider.cpp
 +++ b/browser/components/dirprovider/DirectoryProvider.cpp
-@@ -38,7 +38,8 @@
+@@ -5,7 +5,8 @@
  #include "nsIDirectoryService.h"
  #include "DirectoryProvider.h"
  
@@ -20,25 +21,22 @@ index 1373adc..cde4587 100644
  #include "nsISimpleEnumerator.h"
  #include "nsIPrefService.h"
  #include "nsIPrefBranch.h"
-@@ -166,13 +167,22 @@ AppendFileKey(const char *key, nsIProperties* aDirSvc,
- static void
+@@ -125,11 +126,21 @@ static void
  AppendDistroSearchDirs(nsIProperties* aDirSvc, nsCOMArray<nsIFile> &array)
  {
--  nsCOMPtr<nsIFile> searchPlugins;
--  nsresult rv = aDirSvc->Get(NS_XPCOM_CURRENT_PROCESS_DIR,
+   nsCOMPtr<nsIFile> searchPlugins;
+-  nsresult rv = aDirSvc->Get(XRE_APP_DISTRIBUTION_DIR,
 -                             NS_GET_IID(nsIFile),
 -                             getter_AddRefs(searchPlugins));
-+  nsCOMPtr<nsILocalFile> searchPlugins;
 +  nsresult rv = NS_NewLocalFile(NS_LITERAL_STRING("/etc"), false,
 +                                getter_AddRefs(searchPlugins));
    if (NS_FAILED(rv))
      return;
--  searchPlugins->AppendNative(NS_LITERAL_CSTRING("distribution"));
 +  nsCOMPtr<nsIXULAppInfo> appInfo = do_GetService("@mozilla.org/xre/app-info;1");
 +  if (!appInfo)
 +    return;
 +
-+  nsCAutoString name;
++  nsAutoCString name;
 +  rv = appInfo->GetName(name);
 +  if (NS_FAILED(rv))
 +    return;
@@ -48,3 +46,7 @@ index 1373adc..cde4587 100644
    searchPlugins->AppendNative(NS_LITERAL_CSTRING("searchplugins"));
  
    bool exists;
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Make-upstream-build-system-create-debian-installer.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Make-upstream-build-system-create-debian-installer.patch
new file mode 100644
index 0000000..20407ba
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Make-upstream-build-system-create-debian-installer.patch
@@ -0,0 +1,19 @@
+From 6b1a2f0adfcd737d33bc1f0298b5a75ba704c01e Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 16 Dec 2013 11:11:13 +0900
+Subject: Make upstream build system create debian/installer/Makefile
+
+
+diff --git a/moz.build b/moz.build
+index f0e50b2..50044dc 100644
+--- a/moz.build
++++ b/moz.build
+@@ -77,4 +77,6 @@ if not CONFIG['JS_STANDALONE'] and CONFIG['MOZ_BUILD_APP']:
+ if not CONFIG['LIBXUL_SDK']:
+     DIRS += ['debian/extra-stuff']
+ 
++CONFIGURE_SUBST_FILES += ['debian/installer/Makefile']
++
+ include('build/templates.mozbuild')
+-- 
+cgit v0.10.2
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/NSS-Adds-the-SPI-Inc.-and-CAcert.org-CA-certificates.patch b/recipes-mozilla/firefox/firefox/debian-hacks/NSS-Adds-the-SPI-Inc.-and-CAcert.org-CA-certificates.patch
new file mode 100644
index 0000000..8fcbb42
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/NSS-Adds-the-SPI-Inc.-and-CAcert.org-CA-certificates.patch
@@ -0,0 +1,571 @@
+From 9e6799fb7d7876e96249d7207b3d5e83960e4a91 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 13 Jan 2014 12:02:43 +0900
+Subject: [NSS] Adds the SPI Inc. and CAcert.org CA certificates
+
+
+diff --git a/security/nss/lib/ckfw/builtins/certdata.txt b/security/nss/lib/ckfw/builtins/certdata.txt
+index d3209db..a673739 100644
+--- a/security/nss/lib/ckfw/builtins/certdata.txt
++++ b/security/nss/lib/ckfw/builtins/certdata.txt
+@@ -31590,3 +31590,558 @@ CKA_TRUST_SERVER_AUTH CK_TRUST CKT_NSS_NOT_TRUSTED
+ CKA_TRUST_EMAIL_PROTECTION CK_TRUST CKT_NSS_NOT_TRUSTED
+ CKA_TRUST_CODE_SIGNING CK_TRUST CKT_NSS_NOT_TRUSTED
+ CKA_TRUST_STEP_UP_APPROVED CK_BBOOL CK_FALSE
++ 
++#
++# Certificate "CAcert.org Class 1 Root CA"
++#
++CKA_CLASS CK_OBJECT_CLASS CKO_CERTIFICATE
++CKA_TOKEN CK_BBOOL CK_TRUE
++CKA_PRIVATE CK_BBOOL CK_FALSE
++CKA_MODIFIABLE CK_BBOOL CK_FALSE
++CKA_LABEL UTF8 "CAcert.org Class 1 Root CA"
++CKA_CERTIFICATE_TYPE CK_CERTIFICATE_TYPE CKC_X_509
++CKA_SUBJECT MULTILINE_OCTAL
++\060\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157
++\164\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150
++\164\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164
++\056\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103
++\101\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101
++\165\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206
++\110\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164
++\100\143\141\143\145\162\164\056\157\162\147
++END
++CKA_ID UTF8 "0"
++CKA_ISSUER MULTILINE_OCTAL
++\060\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157
++\164\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150
++\164\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164
++\056\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103
++\101\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101
++\165\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206
++\110\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164
++\100\143\141\143\145\162\164\056\157\162\147
++END
++CKA_SERIAL_NUMBER MULTILINE_OCTAL
++\002\001\000
++END
++CKA_VALUE MULTILINE_OCTAL
++\060\202\007\075\060\202\005\045\240\003\002\001\002\002\001\000
++\060\015\006\011\052\206\110\206\367\015\001\001\004\005\000\060
++\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157\164
++\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150\164
++\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164\056
++\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103\101
++\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101\165
++\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206\110
++\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164\100
++\143\141\143\145\162\164\056\157\162\147\060\036\027\015\060\063
++\060\063\063\060\061\062\062\071\064\071\132\027\015\063\063\060
++\063\062\071\061\062\062\071\064\071\132\060\171\061\020\060\016
++\006\003\125\004\012\023\007\122\157\157\164\040\103\101\061\036
++\060\034\006\003\125\004\013\023\025\150\164\164\160\072\057\057
++\167\167\167\056\143\141\143\145\162\164\056\157\162\147\061\042
++\060\040\006\003\125\004\003\023\031\103\101\040\103\145\162\164
++\040\123\151\147\156\151\156\147\040\101\165\164\150\157\162\151
++\164\171\061\041\060\037\006\011\052\206\110\206\367\015\001\011
++\001\026\022\163\165\160\160\157\162\164\100\143\141\143\145\162
++\164\056\157\162\147\060\202\002\042\060\015\006\011\052\206\110
++\206\367\015\001\001\001\005\000\003\202\002\017\000\060\202\002
++\012\002\202\002\001\000\316\042\300\342\106\175\354\066\050\007
++\120\226\362\240\063\100\214\113\361\073\146\077\061\345\153\002
++\066\333\326\174\366\361\210\217\116\167\066\005\101\225\371\011
++\360\022\317\106\206\163\140\267\156\176\350\300\130\144\256\315
++\260\255\105\027\014\143\372\147\012\350\326\322\277\076\347\230
++\304\360\114\372\340\003\273\065\135\154\041\336\236\040\331\272
++\315\146\062\067\162\372\367\010\365\307\315\130\311\216\347\016
++\136\352\076\376\034\241\024\012\025\154\206\204\133\144\146\052
++\172\251\113\123\171\365\210\242\173\356\057\012\141\053\215\262
++\176\115\126\245\023\354\352\332\222\236\254\104\101\036\130\140
++\145\005\146\370\300\104\275\313\224\367\102\176\013\367\145\150
++\230\121\005\360\363\005\221\004\035\033\027\202\354\310\127\273
++\303\153\172\210\361\260\162\314\045\133\040\221\354\026\002\022
++\217\062\351\027\030\110\320\307\005\056\002\060\102\270\045\234
++\005\153\077\252\072\247\353\123\110\367\350\322\266\007\230\334
++\033\306\064\177\177\311\034\202\172\005\130\053\010\133\363\070
++\242\253\027\135\146\311\230\327\236\020\213\242\322\335\164\232
++\367\161\014\162\140\337\315\157\230\063\235\226\064\166\076\044
++\172\222\260\016\225\036\157\346\240\105\070\107\252\327\101\355
++\112\267\022\366\327\033\203\212\017\056\330\011\266\131\327\252
++\004\377\322\223\175\150\056\335\213\113\253\130\272\057\215\352
++\225\247\240\303\124\211\245\373\333\213\121\042\235\262\303\276
++\021\276\054\221\206\213\226\170\255\040\323\212\057\032\077\306
++\320\121\145\207\041\261\031\001\145\177\105\034\207\365\174\320
++\101\114\117\051\230\041\375\063\037\165\014\004\121\372\031\167
++\333\324\024\034\356\201\303\035\365\230\267\151\006\221\042\335
++\000\120\314\201\061\254\022\007\173\070\332\150\133\346\053\324
++\176\311\137\255\350\353\162\114\363\001\345\113\040\277\232\246
++\127\312\221\000\001\213\241\165\041\067\265\143\015\147\076\106
++\117\160\040\147\316\305\326\131\333\002\340\360\322\313\315\272
++\142\267\220\101\350\335\040\344\051\274\144\051\102\310\042\334
++\170\232\377\103\354\230\033\011\121\113\132\132\302\161\361\304
++\313\163\251\345\241\013\002\003\001\000\001\243\202\001\316\060
++\202\001\312\060\035\006\003\125\035\016\004\026\004\024\026\265
++\062\033\324\307\363\340\346\216\363\275\322\260\072\356\262\071
++\030\321\060\201\243\006\003\125\035\043\004\201\233\060\201\230
++\200\024\026\265\062\033\324\307\363\340\346\216\363\275\322\260
++\072\356\262\071\030\321\241\175\244\173\060\171\061\020\060\016
++\006\003\125\004\012\023\007\122\157\157\164\040\103\101\061\036
++\060\034\006\003\125\004\013\023\025\150\164\164\160\072\057\057
++\167\167\167\056\143\141\143\145\162\164\056\157\162\147\061\042
++\060\040\006\003\125\004\003\023\031\103\101\040\103\145\162\164
++\040\123\151\147\156\151\156\147\040\101\165\164\150\157\162\151
++\164\171\061\041\060\037\006\011\052\206\110\206\367\015\001\011
++\001\026\022\163\165\160\160\157\162\164\100\143\141\143\145\162
++\164\056\157\162\147\202\001\000\060\017\006\003\125\035\023\001
++\001\377\004\005\060\003\001\001\377\060\062\006\003\125\035\037
++\004\053\060\051\060\047\240\045\240\043\206\041\150\164\164\160
++\163\072\057\057\167\167\167\056\143\141\143\145\162\164\056\157
++\162\147\057\162\145\166\157\153\145\056\143\162\154\060\060\006
++\011\140\206\110\001\206\370\102\001\004\004\043\026\041\150\164
++\164\160\163\072\057\057\167\167\167\056\143\141\143\145\162\164
++\056\157\162\147\057\162\145\166\157\153\145\056\143\162\154\060
++\064\006\011\140\206\110\001\206\370\102\001\010\004\047\026\045
++\150\164\164\160\072\057\057\167\167\167\056\143\141\143\145\162
++\164\056\157\162\147\057\151\156\144\145\170\056\160\150\160\077
++\151\144\075\061\060\060\126\006\011\140\206\110\001\206\370\102
++\001\015\004\111\026\107\124\157\040\147\145\164\040\171\157\165
++\162\040\157\167\156\040\143\145\162\164\151\146\151\143\141\164
++\145\040\146\157\162\040\106\122\105\105\040\150\145\141\144\040
++\157\166\145\162\040\164\157\040\150\164\164\160\072\057\057\167
++\167\167\056\143\141\143\145\162\164\056\157\162\147\060\015\006
++\011\052\206\110\206\367\015\001\001\004\005\000\003\202\002\001
++\000\050\307\356\234\202\002\272\134\200\022\312\065\012\035\201
++\157\211\152\231\314\362\150\017\177\247\341\215\130\225\076\275
++\362\006\303\220\132\254\265\140\366\231\103\001\243\210\160\234
++\235\142\235\244\207\257\147\130\015\060\066\073\346\255\110\323
++\313\164\002\206\161\076\342\053\003\150\361\064\142\100\106\073
++\123\352\050\364\254\373\146\225\123\212\115\135\375\073\331\140
++\327\312\171\151\073\261\145\222\246\306\201\202\134\234\315\353
++\115\001\212\245\337\021\125\252\025\312\037\067\300\202\230\160
++\141\333\152\174\226\243\216\056\124\076\117\041\251\220\357\334
++\202\277\334\350\105\255\115\220\163\010\074\224\145\260\004\231
++\166\177\342\274\302\152\025\252\227\004\067\044\330\036\224\116
++\155\016\121\276\326\304\217\312\226\155\367\103\337\350\060\145
++\047\073\173\273\103\103\143\304\103\367\262\354\150\314\341\031
++\216\042\373\230\341\173\132\076\001\067\073\213\010\260\242\363
++\225\116\032\313\233\315\232\261\333\262\160\360\055\112\333\330
++\260\343\157\105\110\063\022\377\376\074\062\052\124\367\304\367
++\212\360\210\043\302\107\376\144\172\161\300\321\036\246\143\260
++\007\176\244\057\323\001\217\334\237\053\266\306\010\251\017\223
++\110\045\374\022\375\237\102\334\363\304\076\366\127\260\327\335
++\151\321\006\167\064\012\113\322\312\240\377\034\306\214\311\026
++\276\304\314\062\067\150\163\137\010\373\121\367\111\123\066\005
++\012\225\002\114\362\171\032\020\366\330\072\165\234\363\035\361
++\242\015\160\147\206\033\263\026\365\057\345\244\353\171\206\371
++\075\013\302\163\013\245\231\254\157\374\147\270\345\057\013\246
++\030\044\215\173\321\110\065\051\030\100\254\223\140\341\226\206
++\120\264\172\131\330\217\041\013\237\317\202\221\306\073\277\153
++\334\007\221\271\227\126\043\252\266\154\224\306\110\006\074\344
++\316\116\252\344\366\057\011\334\123\157\056\374\164\353\072\143
++\231\302\246\254\211\274\247\262\104\240\015\212\020\343\154\362
++\044\313\372\233\237\160\107\056\336\024\213\324\262\040\011\226
++\242\144\361\044\034\334\241\065\234\025\262\324\274\125\056\175
++\006\365\234\016\125\364\132\326\223\332\166\255\045\163\114\305
++\103
++END
++
++# Trust for Certificate "CAcert.org Class 1 Root CA"
++CKA_CLASS CK_OBJECT_CLASS CKO_NETSCAPE_TRUST
++CKA_TOKEN CK_BBOOL CK_TRUE
++CKA_PRIVATE CK_BBOOL CK_FALSE
++CKA_MODIFIABLE CK_BBOOL CK_FALSE
++CKA_LABEL UTF8 "CAcert.org Class 1 Root CA"
++CKA_CERT_SHA1_HASH MULTILINE_OCTAL
++\023\134\354\066\364\234\270\351\073\032\262\160\315\200\210\106
++\166\316\217\063
++END
++CKA_CERT_MD5_HASH MULTILINE_OCTAL
++\246\033\067\136\071\015\234\066\124\356\275\040\061\106\037\153
++END
++CKA_ISSUER MULTILINE_OCTAL
++\060\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157
++\164\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150
++\164\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164
++\056\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103
++\101\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101
++\165\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206
++\110\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164
++\100\143\141\143\145\162\164\056\157\162\147
++END
++CKA_SERIAL_NUMBER MULTILINE_OCTAL
++\002\001\000
++END
++CKA_TRUST_SERVER_AUTH CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_EMAIL_PROTECTION CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_CODE_SIGNING CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_STEP_UP_APPROVED CK_BBOOL CK_FALSE
++
++#
++# Certificate "CAcert.org Class 3 Root CA"
++#
++CKA_CLASS CK_OBJECT_CLASS CKO_CERTIFICATE
++CKA_TOKEN CK_BBOOL CK_TRUE
++CKA_PRIVATE CK_BBOOL CK_FALSE
++CKA_MODIFIABLE CK_BBOOL CK_FALSE
++CKA_LABEL UTF8 "CAcert.org Class 3 Root CA"
++CKA_CERTIFICATE_TYPE CK_CERTIFICATE_TYPE CKC_X_509
++CKA_SUBJECT MULTILINE_OCTAL
++\060\124\061\024\060\022\006\003\125\004\012\023\013\103\101\143
++\145\162\164\040\111\156\143\056\061\036\060\034\006\003\125\004
++\013\023\025\150\164\164\160\072\057\057\167\167\167\056\103\101
++\143\145\162\164\056\157\162\147\061\034\060\032\006\003\125\004
++\003\023\023\103\101\143\145\162\164\040\103\154\141\163\163\040
++\063\040\122\157\157\164
++END
++CKA_ID UTF8 "0"
++CKA_ISSUER MULTILINE_OCTAL
++\060\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157
++\164\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150
++\164\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164
++\056\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103
++\101\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101
++\165\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206
++\110\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164
++\100\143\141\143\145\162\164\056\157\162\147
++END
++CKA_SERIAL_NUMBER MULTILINE_OCTAL
++\002\001\001
++END
++CKA_VALUE MULTILINE_OCTAL
++\060\202\006\010\060\202\003\360\240\003\002\001\002\002\001\001
++\060\015\006\011\052\206\110\206\367\015\001\001\004\005\000\060
++\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157\164
++\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150\164
++\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164\056
++\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103\101
++\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101\165
++\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206\110
++\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164\100
++\143\141\143\145\162\164\056\157\162\147\060\036\027\015\060\065
++\061\060\061\064\060\067\063\066\065\065\132\027\015\063\063\060
++\063\062\070\060\067\063\066\065\065\132\060\124\061\024\060\022
++\006\003\125\004\012\023\013\103\101\143\145\162\164\040\111\156
++\143\056\061\036\060\034\006\003\125\004\013\023\025\150\164\164
++\160\072\057\057\167\167\167\056\103\101\143\145\162\164\056\157
++\162\147\061\034\060\032\006\003\125\004\003\023\023\103\101\143
++\145\162\164\040\103\154\141\163\163\040\063\040\122\157\157\164
++\060\202\002\042\060\015\006\011\052\206\110\206\367\015\001\001
++\001\005\000\003\202\002\017\000\060\202\002\012\002\202\002\001
++\000\253\111\065\021\110\174\322\046\176\123\224\317\103\251\335
++\050\327\102\052\213\363\207\170\031\130\174\017\236\332\211\175
++\341\373\353\162\220\015\164\241\226\144\253\237\240\044\231\163
++\332\342\125\166\307\027\173\365\004\254\106\270\303\276\177\144
++\215\020\154\044\363\141\234\300\362\220\372\121\346\365\151\001
++\143\303\017\126\342\112\102\317\342\104\214\045\050\250\305\171
++\011\175\106\271\212\363\351\363\064\051\010\105\344\034\237\313
++\224\004\034\201\250\024\263\230\145\304\103\354\116\202\215\011
++\321\275\252\133\215\222\320\354\336\220\305\177\012\302\343\353
++\346\061\132\136\164\076\227\063\131\350\303\003\075\140\063\277
++\367\321\157\107\304\315\356\142\203\122\156\056\010\232\244\331
++\025\030\221\246\205\222\107\260\256\110\353\155\267\041\354\205
++\032\150\162\065\253\377\360\020\135\300\364\224\247\152\325\073
++\222\176\114\220\005\176\223\301\054\213\244\216\142\164\025\161
++\156\013\161\003\352\257\025\070\232\324\322\005\162\157\214\371
++\053\353\132\162\045\371\071\106\343\162\033\076\004\303\144\047
++\042\020\052\212\117\130\247\003\255\276\264\056\023\355\135\252
++\110\327\325\175\324\052\173\134\372\106\004\120\344\314\016\102
++\133\214\355\333\362\317\374\226\223\340\333\021\066\124\142\064
++\070\217\014\140\233\073\227\126\070\255\363\322\133\213\240\133
++\352\116\226\270\174\327\325\240\206\160\100\323\221\051\267\242
++\074\255\365\214\273\317\032\222\212\344\064\173\300\330\154\137
++\351\012\302\303\247\040\232\132\337\054\135\122\134\272\107\325
++\233\357\044\050\160\070\040\057\325\177\051\300\262\101\003\150
++\222\314\340\234\314\227\113\105\357\072\020\012\253\160\072\230
++\225\160\255\065\261\352\205\053\244\034\200\041\061\251\256\140
++\172\200\046\110\000\270\001\300\223\143\125\042\221\074\126\347
++\257\333\072\045\363\217\061\124\352\046\213\201\131\371\241\321
++\123\021\305\173\235\003\366\164\021\340\155\261\054\077\054\206
++\221\231\161\232\246\167\213\064\140\321\024\264\054\254\235\257
++\214\020\323\237\304\152\370\157\023\374\163\131\367\146\102\164
++\036\212\343\370\334\322\157\230\234\313\107\230\225\100\005\373
++\351\002\003\001\000\001\243\201\277\060\201\274\060\017\006\003
++\125\035\023\001\001\377\004\005\060\003\001\001\377\060\135\006
++\010\053\006\001\005\005\007\001\001\004\121\060\117\060\043\006
++\010\053\006\001\005\005\007\060\001\206\027\150\164\164\160\072
++\057\057\157\143\163\160\056\103\101\143\145\162\164\056\157\162
++\147\057\060\050\006\010\053\006\001\005\005\007\060\002\206\034
++\150\164\164\160\072\057\057\167\167\167\056\103\101\143\145\162
++\164\056\157\162\147\057\143\141\056\143\162\164\060\112\006\003
++\125\035\040\004\103\060\101\060\077\006\010\053\006\001\004\001
++\201\220\112\060\063\060\061\006\010\053\006\001\005\005\007\002
++\001\026\045\150\164\164\160\072\057\057\167\167\167\056\103\101
++\143\145\162\164\056\157\162\147\057\151\156\144\145\170\056\160
++\150\160\077\151\144\075\061\060\060\015\006\011\052\206\110\206
++\367\015\001\001\004\005\000\003\202\002\001\000\177\010\210\241
++\332\032\120\111\332\211\373\241\010\162\363\212\367\036\304\072
++\264\171\133\040\060\261\105\336\302\135\323\145\151\361\302\135
++\124\124\074\205\137\271\173\102\221\302\231\375\033\121\233\253
++\106\245\241\020\123\236\155\210\254\163\156\054\063\246\360\364
++\236\340\165\301\076\210\105\251\341\146\103\376\126\132\321\172
++\101\170\367\100\332\112\072\361\013\133\245\273\026\006\346\302
++\347\223\271\205\115\227\117\261\036\070\103\200\357\233\015\214
++\357\270\247\140\000\207\127\175\036\104\034\313\043\357\233\074
++\231\235\257\265\051\034\105\171\026\226\115\047\155\361\034\154
++\303\302\125\144\263\274\024\342\363\244\037\036\062\374\047\025
++\005\317\335\056\256\076\202\141\173\360\041\020\030\366\104\352
++\123\071\371\334\320\232\040\340\306\273\340\273\132\117\304\231
++\310\007\275\265\275\242\333\056\142\015\102\064\101\274\377\213
++\212\365\121\042\252\210\060\000\342\260\324\274\276\145\272\325
++\003\127\171\233\350\334\310\115\370\120\355\221\245\122\050\242
++\254\373\066\130\076\351\224\053\221\120\207\033\326\136\326\214
++\314\367\017\020\014\122\116\320\026\141\345\345\012\154\277\027
++\307\162\106\127\234\230\365\154\140\143\172\157\136\271\116\057
++\310\271\271\273\152\205\274\230\015\355\371\076\227\204\064\224
++\256\000\257\241\345\347\222\156\116\275\363\342\331\024\213\134
++\322\353\001\154\240\027\245\055\020\353\234\172\112\275\275\356
++\316\375\355\042\100\253\160\070\210\365\012\207\152\302\253\005
++\140\311\110\005\332\123\301\336\104\167\152\263\363\074\074\355
++\200\274\246\070\112\051\044\137\376\131\073\233\045\172\126\143
++\000\144\271\135\244\142\175\127\066\117\255\203\357\037\222\123
++\240\216\167\127\335\345\141\021\075\043\000\220\114\074\372\243
++\140\223\004\243\257\065\366\016\152\217\117\112\140\247\205\005
++\154\106\241\217\364\307\166\343\241\131\127\367\161\262\304\156
++\024\134\155\155\101\146\337\033\223\261\324\000\303\356\313\317
++\074\075\041\200\251\137\143\145\374\335\340\137\244\364\053\360
++\205\161\101\324\147\045\373\032\261\227\256\326\231\202\023\101
++\322\156\245\033\231\047\200\347\013\251\250\000
++END
++
++# Trust for Certificate "CAcert.org Class 3 Root CA"
++CKA_CLASS CK_OBJECT_CLASS CKO_NETSCAPE_TRUST
++CKA_TOKEN CK_BBOOL CK_TRUE
++CKA_PRIVATE CK_BBOOL CK_FALSE
++CKA_MODIFIABLE CK_BBOOL CK_FALSE
++CKA_LABEL UTF8 "CAcert.org Class 3 Root CA"
++CKA_CERT_SHA1_HASH MULTILINE_OCTAL
++\333\114\102\151\007\077\351\302\243\175\211\012\134\033\030\304
++\030\116\052\055
++END
++CKA_CERT_MD5_HASH MULTILINE_OCTAL
++\163\077\065\124\035\104\311\351\132\112\357\121\255\003\006\266
++END
++CKA_ISSUER MULTILINE_OCTAL
++\060\171\061\020\060\016\006\003\125\004\012\023\007\122\157\157
++\164\040\103\101\061\036\060\034\006\003\125\004\013\023\025\150
++\164\164\160\072\057\057\167\167\167\056\143\141\143\145\162\164
++\056\157\162\147\061\042\060\040\006\003\125\004\003\023\031\103
++\101\040\103\145\162\164\040\123\151\147\156\151\156\147\040\101
++\165\164\150\157\162\151\164\171\061\041\060\037\006\011\052\206
++\110\206\367\015\001\011\001\026\022\163\165\160\160\157\162\164
++\100\143\141\143\145\162\164\056\157\162\147
++END
++CKA_SERIAL_NUMBER MULTILINE_OCTAL
++\002\001\001
++END
++CKA_TRUST_SERVER_AUTH CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_EMAIL_PROTECTION CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_CODE_SIGNING CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_STEP_UP_APPROVED CK_BBOOL CK_FALSE
++
++#
++# Certificate "Software in the Public Interest, Inc. Root CA (2008)"
++#
++CKA_CLASS CK_OBJECT_CLASS CKO_CERTIFICATE
++CKA_TOKEN CK_BBOOL CK_TRUE
++CKA_PRIVATE CK_BBOOL CK_FALSE
++CKA_MODIFIABLE CK_BBOOL CK_FALSE
++CKA_LABEL UTF8 "Software in the Public Interest, Inc. Root CA (2008)"
++CKA_CERTIFICATE_TYPE CK_CERTIFICATE_TYPE CKC_X_509
++CKA_SUBJECT MULTILINE_OCTAL
++\060\201\274\061\013\060\011\006\003\125\004\006\023\002\125\123
++\061\020\060\016\006\003\125\004\010\023\007\111\156\144\151\141
++\156\141\061\025\060\023\006\003\125\004\007\023\014\111\156\144
++\151\141\156\141\160\157\154\151\163\061\050\060\046\006\003\125
++\004\012\023\037\123\157\146\164\167\141\162\145\040\151\156\040
++\164\150\145\040\120\165\142\154\151\143\040\111\156\164\145\162
++\145\163\164\061\023\060\021\006\003\125\004\013\023\012\150\157
++\163\164\155\141\163\164\145\162\061\036\060\034\006\003\125\004
++\003\023\025\103\145\162\164\151\146\151\143\141\164\145\040\101
++\165\164\150\157\162\151\164\171\061\045\060\043\006\011\052\206
++\110\206\367\015\001\011\001\026\026\150\157\163\164\155\141\163
++\164\145\162\100\163\160\151\055\151\156\143\056\157\162\147
++END
++CKA_ID UTF8 "0"
++CKA_ISSUER MULTILINE_OCTAL
++\060\201\274\061\013\060\011\006\003\125\004\006\023\002\125\123
++\061\020\060\016\006\003\125\004\010\023\007\111\156\144\151\141
++\156\141\061\025\060\023\006\003\125\004\007\023\014\111\156\144
++\151\141\156\141\160\157\154\151\163\061\050\060\046\006\003\125
++\004\012\023\037\123\157\146\164\167\141\162\145\040\151\156\040
++\164\150\145\040\120\165\142\154\151\143\040\111\156\164\145\162
++\145\163\164\061\023\060\021\006\003\125\004\013\023\012\150\157
++\163\164\155\141\163\164\145\162\061\036\060\034\006\003\125\004
++\003\023\025\103\145\162\164\151\146\151\143\141\164\145\040\101
++\165\164\150\157\162\151\164\171\061\045\060\043\006\011\052\206
++\110\206\367\015\001\011\001\026\026\150\157\163\164\155\141\163
++\164\145\162\100\163\160\151\055\151\156\143\056\157\162\147
++END
++CKA_SERIAL_NUMBER MULTILINE_OCTAL
++\002\011\000\350\216\266\311\370\052\024\050
++END
++CKA_VALUE MULTILINE_OCTAL
++\060\202\010\016\060\202\005\366\240\003\002\001\002\002\011\000
++\350\216\266\311\370\052\024\050\060\015\006\011\052\206\110\206
++\367\015\001\001\005\005\000\060\201\274\061\013\060\011\006\003
++\125\004\006\023\002\125\123\061\020\060\016\006\003\125\004\010
++\023\007\111\156\144\151\141\156\141\061\025\060\023\006\003\125
++\004\007\023\014\111\156\144\151\141\156\141\160\157\154\151\163
++\061\050\060\046\006\003\125\004\012\023\037\123\157\146\164\167
++\141\162\145\040\151\156\040\164\150\145\040\120\165\142\154\151
++\143\040\111\156\164\145\162\145\163\164\061\023\060\021\006\003
++\125\004\013\023\012\150\157\163\164\155\141\163\164\145\162\061
++\036\060\034\006\003\125\004\003\023\025\103\145\162\164\151\146
++\151\143\141\164\145\040\101\165\164\150\157\162\151\164\171\061
++\045\060\043\006\011\052\206\110\206\367\015\001\011\001\026\026
++\150\157\163\164\155\141\163\164\145\162\100\163\160\151\055\151
++\156\143\056\157\162\147\060\036\027\015\060\070\060\065\061\063
++\060\070\060\067\065\066\132\027\015\061\070\060\065\061\061\060
++\070\060\067\065\066\132\060\201\274\061\013\060\011\006\003\125
++\004\006\023\002\125\123\061\020\060\016\006\003\125\004\010\023
++\007\111\156\144\151\141\156\141\061\025\060\023\006\003\125\004
++\007\023\014\111\156\144\151\141\156\141\160\157\154\151\163\061
++\050\060\046\006\003\125\004\012\023\037\123\157\146\164\167\141
++\162\145\040\151\156\040\164\150\145\040\120\165\142\154\151\143
++\040\111\156\164\145\162\145\163\164\061\023\060\021\006\003\125
++\004\013\023\012\150\157\163\164\155\141\163\164\145\162\061\036
++\060\034\006\003\125\004\003\023\025\103\145\162\164\151\146\151
++\143\141\164\145\040\101\165\164\150\157\162\151\164\171\061\045
++\060\043\006\011\052\206\110\206\367\015\001\011\001\026\026\150
++\157\163\164\155\141\163\164\145\162\100\163\160\151\055\151\156
++\143\056\157\162\147\060\202\002\042\060\015\006\011\052\206\110
++\206\367\015\001\001\001\005\000\003\202\002\017\000\060\202\002
++\012\002\202\002\001\000\334\066\346\107\102\302\304\121\165\051
++\207\100\303\330\216\041\006\322\030\116\353\357\040\275\220\074
++\205\020\023\214\051\133\224\143\366\364\055\361\006\102\221\271
++\031\304\102\151\010\277\213\066\105\352\050\005\063\111\110\240
++\047\103\223\065\212\101\330\170\263\360\357\263\156\055\335\321
++\313\175\352\364\165\046\323\076\220\072\356\327\347\054\004\265
++\174\341\365\174\305\116\357\167\275\134\242\223\063\222\316\175
++\201\110\317\153\265\042\054\010\203\375\323\325\317\073\055\375
++\265\111\220\133\366\255\115\023\312\336\323\246\235\123\121\161
++\143\106\370\112\026\134\230\356\055\155\232\026\241\166\220\342
++\140\103\231\326\211\326\154\056\172\230\262\013\003\054\343\172
++\117\307\335\343\314\343\112\152\215\171\122\372\364\301\257\056
++\217\052\010\313\033\051\202\222\162\103\274\316\210\251\252\247
++\212\121\103\125\205\232\067\003\170\223\310\360\275\264\101\310
++\007\102\232\313\065\227\172\212\201\145\336\035\124\010\001\361
++\144\134\267\027\032\121\274\036\303\131\207\166\030\026\230\356
++\277\366\147\201\213\006\065\305\113\155\131\031\307\322\306\110
++\276\156\024\050\203\112\020\234\033\365\157\274\251\216\365\151
++\376\262\301\125\314\347\024\311\371\133\024\123\121\007\352\316
++\075\344\117\050\037\074\141\011\327\063\322\156\247\156\324\307
++\023\011\157\153\135\024\356\235\211\033\245\152\362\366\370\320
++\162\216\352\162\037\057\064\152\051\012\305\012\354\034\100\205
++\022\367\246\245\323\117\255\300\205\214\114\174\163\040\314\123
++\030\361\262\130\114\001\365\277\352\144\325\134\071\305\316\154
++\314\123\132\126\272\101\017\045\337\153\120\266\307\212\240\275
++\002\302\305\073\125\245\262\144\042\204\121\050\126\256\061\356
++\136\373\013\026\115\106\005\221\200\104\355\254\155\360\127\250
++\372\353\141\110\240\313\033\263\037\216\315\305\041\167\003\204
++\036\374\254\243\103\010\143\214\355\371\047\357\264\260\135\147
++\326\117\355\320\213\076\135\133\311\221\275\226\002\204\075\305
++\115\274\102\077\164\375\074\135\254\134\110\066\136\207\061\057
++\030\154\304\150\356\241\213\311\131\320\030\343\000\200\263\124
++\047\056\231\360\025\123\002\003\001\000\001\243\202\002\017\060
++\202\002\013\060\035\006\003\125\035\016\004\026\004\024\064\161
++\321\070\327\025\066\203\107\153\327\067\144\102\073\216\215\122
++\235\253\060\201\361\006\003\125\035\043\004\201\351\060\201\346
++\200\024\064\161\321\070\327\025\066\203\107\153\327\067\144\102
++\073\216\215\122\235\253\241\201\302\244\201\277\060\201\274\061
++\013\060\011\006\003\125\004\006\023\002\125\123\061\020\060\016
++\006\003\125\004\010\023\007\111\156\144\151\141\156\141\061\025
++\060\023\006\003\125\004\007\023\014\111\156\144\151\141\156\141
++\160\157\154\151\163\061\050\060\046\006\003\125\004\012\023\037
++\123\157\146\164\167\141\162\145\040\151\156\040\164\150\145\040
++\120\165\142\154\151\143\040\111\156\164\145\162\145\163\164\061
++\023\060\021\006\003\125\004\013\023\012\150\157\163\164\155\141
++\163\164\145\162\061\036\060\034\006\003\125\004\003\023\025\103
++\145\162\164\151\146\151\143\141\164\145\040\101\165\164\150\157
++\162\151\164\171\061\045\060\043\006\011\052\206\110\206\367\015
++\001\011\001\026\026\150\157\163\164\155\141\163\164\145\162\100
++\163\160\151\055\151\156\143\056\157\162\147\202\011\000\350\216
++\266\311\370\052\024\050\060\017\006\003\125\035\023\001\001\377
++\004\005\060\003\001\001\377\060\021\006\011\140\206\110\001\206
++\370\102\001\001\004\004\003\002\000\007\060\011\006\003\125\035
++\022\004\002\060\000\060\056\006\011\140\206\110\001\206\370\102
++\001\015\004\041\026\037\123\157\146\164\167\141\162\145\040\151
++\156\040\164\150\145\040\120\165\142\154\151\143\040\111\156\164
++\145\162\145\163\164\060\060\006\011\140\206\110\001\206\370\102
++\001\004\004\043\026\041\150\164\164\160\163\072\057\057\143\141
++\056\163\160\151\055\151\156\143\056\157\162\147\057\143\141\055
++\143\162\154\056\160\145\155\060\062\006\011\140\206\110\001\206
++\370\102\001\003\004\045\026\043\150\164\164\160\163\072\057\057
++\143\141\056\163\160\151\055\151\156\143\056\157\162\147\057\143
++\145\162\164\055\143\162\154\056\160\145\155\060\041\006\003\125
++\035\021\004\032\060\030\201\026\150\157\163\164\155\141\163\164
++\145\162\100\163\160\151\055\151\156\143\056\157\162\147\060\016
++\006\003\125\035\017\001\001\377\004\004\003\002\001\006\060\015
++\006\011\052\206\110\206\367\015\001\001\005\005\000\003\202\002
++\001\000\264\315\275\340\271\352\262\003\053\176\062\351\336\162
++\077\311\113\202\136\235\342\257\125\011\242\014\124\350\317\030
++\074\050\040\035\251\273\003\002\057\122\071\042\371\027\317\255
++\147\220\263\003\177\330\025\343\153\176\273\233\126\001\257\065
++\324\332\271\307\147\027\233\324\325\016\067\263\040\101\056\014
++\001\304\133\371\145\076\302\141\350\322\360\152\225\160\303\306
++\157\325\065\244\254\131\162\341\211\337\241\240\235\044\275\051
++\171\351\141\052\331\323\036\311\106\244\010\170\101\222\162\017
++\253\024\165\355\011\360\242\360\134\357\303\012\142\040\267\302
++\050\146\256\114\057\056\217\105\143\046\226\360\356\061\346\213
++\125\233\252\072\371\202\071\035\210\074\342\007\165\032\341\017
++\261\060\274\161\062\322\072\376\372\241\211\363\103\054\326\162
++\304\171\247\025\110\005\300\330\055\162\002\343\313\075\026\152
++\272\311\270\021\020\342\111\205\314\226\107\140\005\045\056\357
++\165\131\063\365\107\031\026\357\332\154\137\007\310\246\120\266
++\035\313\146\064\045\374\146\203\353\305\266\060\101\370\106\104
++\142\250\301\014\124\346\352\114\132\050\346\256\306\267\376\177
++\073\226\250\056\356\307\150\076\335\000\075\051\257\052\143\253
++\137\356\111\052\055\305\334\373\321\306\323\321\227\126\122\206
++\266\224\353\324\140\121\267\374\036\233\314\002\233\324\037\217
++\371\112\217\266\056\050\073\027\314\305\246\005\343\322\323\265
++\306\003\311\341\110\102\233\313\077\344\027\340\376\015\001\225
++\011\272\270\015\161\344\011\160\167\102\330\115\341\102\251\140
++\203\327\027\211\103\322\324\335\247\030\266\253\324\044\045\207
++\265\324\342\374\056\042\151\275\255\150\054\377\162\265\230\252
++\006\234\347\052\152\270\241\223\166\316\260\363\177\234\341\340
++\117\270\330\206\106\245\063\002\054\045\141\067\052\222\310\254
++\201\164\150\143\207\063\166\275\005\177\136\325\325\002\155\275
++\257\377\052\132\252\111\354\230\171\107\123\221\366\016\064\132
++\311\245\306\353\262\343\305\254\266\240\160\065\273\310\121\151
++\320\362\265\242\062\156\274\077\240\067\071\174\161\066\246\005
++\337\014\022\344\026\247\305\326\313\143\243\225\160\077\346\004
++\243\140
++END
++
++# Trust for Certificate "Software in the Public Interest, Inc. Root CA (2008)"
++CKA_CLASS CK_OBJECT_CLASS CKO_NETSCAPE_TRUST
++CKA_TOKEN CK_BBOOL CK_TRUE
++CKA_PRIVATE CK_BBOOL CK_FALSE
++CKA_MODIFIABLE CK_BBOOL CK_FALSE
++CKA_LABEL UTF8 "Software in the Public Interest, Inc. Root CA (2008)"
++CKA_CERT_SHA1_HASH MULTILINE_OCTAL
++\257\160\210\103\203\202\002\025\315\141\306\274\354\375\067\044
++\251\220\103\034
++END
++CKA_CERT_MD5_HASH MULTILINE_OCTAL
++\052\107\237\140\273\203\164\157\001\003\327\013\015\366\015\170
++END
++CKA_ISSUER MULTILINE_OCTAL
++\060\201\274\061\013\060\011\006\003\125\004\006\023\002\125\123
++\061\020\060\016\006\003\125\004\010\023\007\111\156\144\151\141
++\156\141\061\025\060\023\006\003\125\004\007\023\014\111\156\144
++\151\141\156\141\160\157\154\151\163\061\050\060\046\006\003\125
++\004\012\023\037\123\157\146\164\167\141\162\145\040\151\156\040
++\164\150\145\040\120\165\142\154\151\143\040\111\156\164\145\162
++\145\163\164\061\023\060\021\006\003\125\004\013\023\012\150\157
++\163\164\155\141\163\164\145\162\061\036\060\034\006\003\125\004
++\003\023\025\103\145\162\164\151\146\151\143\141\164\145\040\101
++\165\164\150\157\162\151\164\171\061\045\060\043\006\011\052\206
++\110\206\367\015\001\011\001\026\026\150\157\163\164\155\141\163
++\164\145\162\100\163\160\151\055\151\156\143\056\157\162\147
++END
++CKA_SERIAL_NUMBER MULTILINE_OCTAL
++\002\011\000\350\216\266\311\370\052\024\050
++END
++CKA_TRUST_SERVER_AUTH CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_EMAIL_PROTECTION CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_CODE_SIGNING CK_TRUST CKT_NETSCAPE_TRUSTED_DELEGATOR
++CKA_TRUST_STEP_UP_APPROVED CK_BBOOL CK_FALSE
+-- 
+cgit v0.10.2
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Preprocess-appstrings.properties.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Preprocess-appstrings.properties.patch
new file mode 100644
index 0000000..498b759
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Preprocess-appstrings.properties.patch
@@ -0,0 +1,27 @@
+From cc06f755b91a7f59b920ce691bc973075a3e712c Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 28 Sep 2012 00:38:53 +0200
+Subject: Preprocess appstrings.properties
+
+Closes: #688987
+---
+ browser/locales/jar.mn | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/browser/locales/jar.mn b/browser/locales/jar.mn
+index 03a8cdf..ea60605 100644
+--- a/browser/locales/jar.mn
++++ b/browser/locales/jar.mn
+@@ -152,7 +152,7 @@
+     locale/browser-region/region.properties        (%chrome/browser-region/region.properties)
+ # the following files are browser-specific overrides
+     locale/browser/netError.dtd                (%chrome/overrides/netError.dtd)
+-    locale/browser/appstrings.properties       (%chrome/overrides/appstrings.properties)
++*   locale/browser/appstrings.properties       (%chrome/overrides/appstrings.properties)
+     locale/browser/downloads/settingsChange.dtd  (%chrome/overrides/settingsChange.dtd)
+ % override chrome://global/locale/netError.dtd chrome://browser/locale/netError.dtd
+ % override chrome://global/locale/appstrings.properties chrome://browser/locale/appstrings.properties
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch
new file mode 100644
index 0000000..49220b6
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch
@@ -0,0 +1,27 @@
+From 64d0bce0cdfa18aeee3afbcfe521ba949eac03aa Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Wed, 12 Aug 2015 06:30:23 +0900
+Subject: Revert "Bump search engine max icon size to 35kB"
+
+This reverts commit fa6c5003a763005fca0ab6c6c79f2602d1a7ffad.
+---
+ toolkit/components/search/nsSearchService.js | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/toolkit/components/search/nsSearchService.js b/toolkit/components/search/nsSearchService.js
+index 7ae7e01..d9cf7e8 100644
+--- a/toolkit/components/search/nsSearchService.js
++++ b/toolkit/components/search/nsSearchService.js
+@@ -114,7 +114,7 @@ const NEW_LINES = /(\r\n|\r|\n)/;
+ 
+ // Set an arbitrary cap on the maximum icon size. Without this, large icons can
+ // cause big delays when loading them at startup.
+-const MAX_ICON_SIZE   = 35000;
++const MAX_ICON_SIZE   = 10000;
+ 
+ // Default charset to use for sending search parameters. ISO-8859-1 is used to
+ // match previous nsInternetSearchService behavior.
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch
index d35c478..47b10dd 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch
@@ -1,39 +1,31 @@
+From 00ee4f7ea56a4196a0dfc4a62a2025cd00588fde Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Mon, 14 Jul 2008 15:20:46 +0200
 Subject: Use a variable for xulrunner base version in various places
 
 ---
- config/autoconf.mk.in |    9 +++++----
+ config/baseconfig.mk | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)
 
-diff --git a/config/autoconf.mk.in b/config/autoconf.mk.in
-index fccb1a9..ca251cb 100644
---- a/config/autoconf.mk.in
-+++ b/config/autoconf.mk.in
-@@ -55,6 +55,7 @@ MOZ_APP_PROFILE = @MOZ_APP_PROFILE@
- MOZ_APP_UA_NAME = @MOZ_APP_UA_NAME@
- MOZ_APP_VERSION = @MOZ_APP_VERSION@
- MOZ_APP_MAXVERSION = @MOZ_APP_MAXVERSION@
+diff --git a/config/baseconfig.mk b/config/baseconfig.mk
+index dd4af0d..f1d4b60 100644
+--- a/config/baseconfig.mk
++++ b/config/baseconfig.mk
+@@ -2,10 +2,11 @@
+ # directly in python/mozbuild/mozbuild/base.py for gmake validation.
+ # We thus use INCLUDED_AUTOCONF_MK to enable/disable some parts depending
+ # whether a normal build is happening or whether the check is running.
+-includedir := $(includedir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
+-idldir = $(datadir)/idl/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
+-installdir = $(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
+-sdkdir = $(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION)
 +MOZ_APP_BASE_VERSION = $(firstword $(subst ., ,$(MOZ_APP_VERSION))).$(word 2,$(subst ., ,$(MOZ_APP_VERSION)))
- MOZ_UA_BUILDID = @MOZ_UA_BUILDID@
- MOZ_MACBUNDLE_NAME = @MOZ_MACBUNDLE_NAME@
- 
-@@ -63,14 +64,14 @@ MOZ_PKG_SPECIAL = @MOZ_PKG_SPECIAL@
- prefix		= @prefix@
- exec_prefix	= @exec_prefix@
- bindir		= @bindir@
--includedir	= @includedir@/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
-+includedir	= @includedir@/$(MOZ_APP_NAME)-$(MOZ_APP_BASE_VERSION)
- libdir		= @libdir@
- datadir		= @datadir@
- mandir		= @mandir@
--idldir		= $(datadir)/idl/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
-+idldir		= $(datadir)/idl/$(MOZ_APP_NAME)-$(MOZ_APP_BASE_VERSION)
- 
--installdir	= $(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
--sdkdir		= $(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION)
-+installdir	= $(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_BASE_VERSION)
-+sdkdir		= $(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_BASE_VERSION)
- 
- DIST		= $(DEPTH)/dist
- LIBXUL_SDK      = @LIBXUL_SDK@
++includedir := $(includedir)/$(MOZ_APP_NAME)-$(MOZ_APP_BASE_VERSION)
++idldir = $(datadir)/idl/$(MOZ_APP_NAME)-$(MOZ_APP_BASE_VERSION)
++installdir = $(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_BASE_VERSION)
++sdkdir = $(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_BASE_VERSION)
+ ifndef TOP_DIST
+ TOP_DIST = dist
+ endif
+-- 
+cgit v0.11.2
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Work-around-binutils-assertion-on-mips.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Work-around-binutils-assertion-on-mips.patch
new file mode 100644
index 0000000..1d636b7
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Work-around-binutils-assertion-on-mips.patch
@@ -0,0 +1,39 @@
+From a4f0acf71a76f0e954e1400db8187dc2db614ce6 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Sun, 2 Nov 2014 10:26:21 +0900
+Subject: Work around binutils assertion on mips
+
+
+diff --git a/media/libcubeb/tests/moz.build b/media/libcubeb/tests/moz.build
+index bca57ba..f69f29c 100644
+--- a/media/libcubeb/tests/moz.build
++++ b/media/libcubeb/tests/moz.build
+@@ -4,16 +4,17 @@
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
+ 
+-GeckoCppUnitTests([
+-  'test_tone'
+-])
++if CONFIG['CPU_ARCH'] != 'mips':
++    GeckoCppUnitTests([
++      'test_tone'
++    ])
+ 
+-if CONFIG['OS_TARGET'] != 'Android':
+-  GeckoCppUnitTests([
+-    'test_audio',
+-    'test_latency',
+-    'test_sanity'
+-  ])
++    if CONFIG['OS_TARGET'] != 'Android':
++      GeckoCppUnitTests([
++        'test_audio',
++        'test_latency',
++        'test_sanity'
++      ])
+ 
+ LOCAL_INCLUDES += [
+     '../include'
+-- 
+cgit v0.10.2
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch b/recipes-mozilla/firefox/firefox/debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch
deleted file mode 100644
index a90e53b..0000000
--- a/recipes-mozilla/firefox/firefox/debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Tue, 7 Sep 2010 08:52:43 +0200
-Subject: pkg-config files don't need to require the version of nspr xulrunner
- was built against
-
----
- xulrunner/installer/libxul.pc.in      |    2 +-
- xulrunner/installer/mozilla-js.pc.in  |    2 +-
- xulrunner/installer/mozilla-nss.pc.in |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/xulrunner/installer/libxul.pc.in b/xulrunner/installer/libxul.pc.in
-index ccce9aa..631382d 100644
---- a/xulrunner/installer/libxul.pc.in
-+++ b/xulrunner/installer/libxul.pc.in
-@@ -6,6 +6,6 @@ idldir=%idldir%
- Name: libxul
- Description: The Mozilla Runtime and Embedding Engine
- Version: %MOZILLA_VERSION%
--Requires: %NSPR_NAME% >= %NSPR_VERSION%
-+Requires: %NSPR_NAME%
- Libs: -L${sdkdir}/lib %MOZ_XUL_LINK%
- Cflags: -I${includedir} %WCHAR_CFLAGS%
-diff --git a/xulrunner/installer/mozilla-js.pc.in b/xulrunner/installer/mozilla-js.pc.in
-index c1428f1..9eb0a79 100644
---- a/xulrunner/installer/mozilla-js.pc.in
-+++ b/xulrunner/installer/mozilla-js.pc.in
-@@ -5,6 +5,6 @@ includedir=%includedir%
- Name: JavaScript
- Description: The Mozilla JavaScript Library
- Version: %MOZILLA_VERSION%
--Requires: %NSPR_NAME% >= %NSPR_VERSION%
-+Requires: %NSPR_NAME%
- Libs: -L${sdkdir}/lib %MOZ_JS_LINK%
- Cflags: -I${includedir} -DXP_UNIX -DJS_THREADSAFE
-diff --git a/xulrunner/installer/mozilla-nss.pc.in b/xulrunner/installer/mozilla-nss.pc.in
-index 088832a..927305f 100644
---- a/xulrunner/installer/mozilla-nss.pc.in
-+++ b/xulrunner/installer/mozilla-nss.pc.in
-@@ -5,6 +5,6 @@ includedir=%includedir%
- Name: NSS
- Description: Mozilla Network Security Services
- Version: %MOZILLA_VERSION%
--Requires: %NSPR_NAME% >= %NSPR_VERSION%
-+Requires: %NSPR_NAME%
- Libs: -L${sdkdir}/lib -lsmime3 -lssl3 -lnss3 -lnssutil3
- Cflags: -I${includedir}
diff --git a/recipes-mozilla/firefox/firefox/fix-python-path.patch b/recipes-mozilla/firefox/firefox/fix-python-path.patch
new file mode 100644
index 0000000..544c611
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fix-python-path.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [configuration]
+
+Subject: [PATCH] fix python path
+
+Python path provided by configure doesn't work, use the host instead.
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ js/src/configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/configure b/js/src/configure
+index cce5430..780d201 100755
+--- a/js/src/configure
++++ b/js/src/configure
+@@ -15933,7 +15933,7 @@ echo creating $CONFIG_STATUS
+ extra_python_path=${COMM_BUILD:+"'mozilla', "}
+ 
+ cat > $CONFIG_STATUS <<EOF
+-#!${PYTHON}
++#!/usr/bin/python
+ # coding=$encoding
+ 
+ import os
+-- 
+2.1.4
diff --git a/recipes-mozilla/firefox/firefox/fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch b/recipes-mozilla/firefox/firefox/fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch
index 78190c4..cd3a2f3 100644
--- a/recipes-mozilla/firefox/firefox/fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch
+++ b/recipes-mozilla/firefox/firefox/fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch
@@ -1,19 +1,20 @@
+From e9f0b45a4aafcd4332dd92039613939c9673d841 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Sat, 21 Jun 2008 02:48:46 +0200
 Subject: Allow .js preference files to set locked prefs with lockPref()
 
 ---
- modules/libpref/src/prefapi.cpp  |    5 ++++-
- modules/libpref/src/prefapi.h    |    3 ++-
- modules/libpref/src/prefread.cpp |   11 ++++++++---
- modules/libpref/src/prefread.h   |    6 ++++--
+ modules/libpref/prefapi.cpp  |  5 ++++-
+ modules/libpref/prefapi.h    |  3 ++-
+ modules/libpref/prefread.cpp | 11 ++++++++---
+ modules/libpref/prefread.h   |  6 ++++--
  4 files changed, 18 insertions(+), 7 deletions(-)
 
-diff --git a/modules/libpref/src/prefapi.cpp b/modules/libpref/src/prefapi.cpp
-index 5ecc914..885bdf4 100644
---- a/modules/libpref/src/prefapi.cpp
-+++ b/modules/libpref/src/prefapi.cpp
-@@ -976,7 +976,10 @@ void PREF_ReaderCallback(void       *closure,
+diff --git a/modules/libpref/prefapi.cpp b/modules/libpref/prefapi.cpp
+index b099b2d..19d2d31 100644
+--- a/modules/libpref/prefapi.cpp
++++ b/modules/libpref/prefapi.cpp
+@@ -995,7 +995,10 @@ void PREF_ReaderCallback(void       *closure,
                           const char *pref,
                           PrefValue   value,
                           PrefType    type,
@@ -21,15 +22,15 @@ index 5ecc914..885bdf4 100644
 +                         bool        isDefault,
 +                         bool        isLocked)
  {
-     pref_HashPref(pref, value, type, isDefault);
+     pref_HashPref(pref, value, type, isDefault ? kPrefSetDefault : kPrefForceSet);
 +    if (isLocked)
 +        PREF_LockPref(pref, true);
  }
-diff --git a/modules/libpref/src/prefapi.h b/modules/libpref/src/prefapi.h
-index 22a88d3..2b20c4e 100644
---- a/modules/libpref/src/prefapi.h
-+++ b/modules/libpref/src/prefapi.h
-@@ -208,7 +208,8 @@ void PREF_ReaderCallback( void *closure,
+diff --git a/modules/libpref/prefapi.h b/modules/libpref/prefapi.h
+index 675b384..fe3f2da 100644
+--- a/modules/libpref/prefapi.h
++++ b/modules/libpref/prefapi.h
+@@ -183,7 +183,8 @@ void PREF_ReaderCallback( void *closure,
                            const char *pref,
                            PrefValue   value,
                            PrefType    type,
@@ -37,13 +38,13 @@ index 22a88d3..2b20c4e 100644
 +                          bool        isDefault,
 +                          bool        isLocked);
  
- PR_END_EXTERN_C
- #endif
-diff --git a/modules/libpref/src/prefread.cpp b/modules/libpref/src/prefread.cpp
-index 893d256..d4ef51a 100644
---- a/modules/libpref/src/prefread.cpp
-+++ b/modules/libpref/src/prefread.cpp
-@@ -75,6 +75,7 @@ enum {
+ #ifdef __cplusplus
+ }
+diff --git a/modules/libpref/prefread.cpp b/modules/libpref/prefread.cpp
+index 01612ba..a119669 100644
+--- a/modules/libpref/prefread.cpp
++++ b/modules/libpref/prefread.cpp
+@@ -43,6 +43,7 @@ enum {
  #define BITS_PER_HEX_DIGIT      4
  
  static const char kUserPref[] = "user_pref";
@@ -51,7 +52,7 @@ index 893d256..d4ef51a 100644
  static const char kPref[] = "pref";
  static const char kTrue[] = "true";
  static const char kFalse[] = "false";
-@@ -161,7 +162,7 @@ pref_DoCallback(PrefParseState *ps)
+@@ -129,7 +130,7 @@ pref_DoCallback(PrefParseState *ps)
      default:
          break;
      }
@@ -60,15 +61,15 @@ index 893d256..d4ef51a 100644
      return true;
  }
  
-@@ -220,6 +221,7 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
-                 ps->vb    = NULL;
+@@ -188,6 +189,7 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
+                 ps->vb    = nullptr;
                  ps->vtype = PREF_INVALID;
                  ps->fdefault = false;
 +                ps->flock = false;
              }
              switch (c) {
              case '/':       /* begin comment block or line? */
-@@ -230,7 +232,9 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
+@@ -198,7 +200,9 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
                  break;
              case 'u':       /* indicating user_pref */
              case 'p':       /* indicating pref */
@@ -79,7 +80,7 @@ index 893d256..d4ef51a 100644
                  ps->sindex = 1;
                  ps->nextstate = PREF_PARSE_UNTIL_OPEN_PAREN;
                  state = PREF_PARSE_MATCH_STRING;
-@@ -274,7 +278,8 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
+@@ -242,7 +246,8 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
          /* name parsing */
          case PREF_PARSE_UNTIL_NAME:
              if (c == '\"' || c == '\'') {
@@ -89,11 +90,11 @@ index 893d256..d4ef51a 100644
                  ps->quotechar = c;
                  ps->nextstate = PREF_PARSE_UNTIL_COMMA; /* return here when done */
                  state = PREF_PARSE_QUOTED_STRING;
-diff --git a/modules/libpref/src/prefread.h b/modules/libpref/src/prefread.h
-index 50f4d54..93a1702 100644
---- a/modules/libpref/src/prefread.h
-+++ b/modules/libpref/src/prefread.h
-@@ -62,7 +62,8 @@ typedef void (*PrefReader)(void       *closure,
+diff --git a/modules/libpref/prefread.h b/modules/libpref/prefread.h
+index 4d5ce1e..5b6a44f 100644
+--- a/modules/libpref/prefread.h
++++ b/modules/libpref/prefread.h
+@@ -31,7 +31,8 @@ typedef void (*PrefReader)(void       *closure,
                             const char *pref,
                             PrefValue   val,
                             PrefType    type,
@@ -103,7 +104,7 @@ index 50f4d54..93a1702 100644
  
  /* structure fields are private */
  typedef struct PrefParseState {
-@@ -82,7 +83,8 @@ typedef struct PrefParseState {
+@@ -51,7 +52,8 @@ typedef struct PrefParseState {
      char       *lbend;      /* line buffer end               */
      char       *vb;         /* value buffer (ptr into lb)    */
      PrefType    vtype;      /* PREF_STRING,INT,BOOL          */
@@ -113,3 +114,7 @@ index 50f4d54..93a1702 100644
  } PrefParseState;
  
  /**
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch b/recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch
deleted file mode 100644
index 54ec57d..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 31 Aug 2012 09:01:08 +0200
-Subject: Allow webGL with mesa, assuming users will have updated to 8.0.4-2
- on wheezy
-
-The version in squeeze-backports is not affected by CVE-2012-2864, and the
-version in squeeze is blacklisted.
----
- widget/src/xpwidgets/GfxInfoX11.cpp |    4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
-index a2d5e0b..27a0fd0 100644
---- a/widget/src/xpwidgets/GfxInfoX11.cpp
-+++ b/widget/src/xpwidgets/GfxInfoX11.cpp
-@@ -310,10 +310,6 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
-     }
- 
-     if (mIsMesa) {
--        if (aFeature == nsIGfxInfo::FEATURE_WEBGL_OPENGL) {
--            *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
--            aSuggestedDriverVersion.AssignLiteral("Not Mesa");
--        }
-         if (mIsNouveau && version(mMajorVersion, mMinorVersion) < version(8,0)) {
-             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-             aSuggestedDriverVersion.AssignLiteral("Mesa 8.0");
diff --git a/recipes-mozilla/firefox/firefox/fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch b/recipes-mozilla/firefox/firefox/fixes/Avoid-spurious-Run-items-in-application-handlers.patch
similarity index 80%
rename from recipes-mozilla/firefox/firefox/fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch
rename to recipes-mozilla/firefox/firefox/fixes/Avoid-spurious-Run-items-in-application-handlers.patch
index 6225dad..f6b44e3 100644
--- a/recipes-mozilla/firefox/firefox/fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch
+++ b/recipes-mozilla/firefox/firefox/fixes/Avoid-spurious-Run-items-in-application-handlers.patch
@@ -1,18 +1,18 @@
+From 09606f539c4fc193a9bd810570afbb9ce9bd883e Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Thu, 10 Jul 2008 21:40:08 +0200
-Subject: Avoid spurious "Run" items in application handlers configuration
- pane
+Subject: Avoid spurious "Run" items in application handlers configuration pane
 
 ---
- browser/components/preferences/applications.js |    1 +
- uriloader/exthandler/nsHandlerService.js       |   11 +++++------
+ browser/components/preferences/applications.js |  1 +
+ uriloader/exthandler/nsHandlerService.js       | 11 +++++------
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/browser/components/preferences/applications.js b/browser/components/preferences/applications.js
-index abfec20..40cd81a 100644
+index 3334fba..ed50ecb 100644
 --- a/browser/components/preferences/applications.js
 +++ b/browser/components/preferences/applications.js
-@@ -1345,6 +1345,7 @@ var gApplicationsPane = {
+@@ -1354,6 +1354,7 @@ var gApplicationsPane = {
      return aExecutable &&
             aExecutable.exists() &&
             aExecutable.isExecutable() &&
@@ -21,10 +21,10 @@ index abfec20..40cd81a 100644
  //          just don't know how to do that via script...
  // XXXmano TBD: can probably add this to nsIShellService
 diff --git a/uriloader/exthandler/nsHandlerService.js b/uriloader/exthandler/nsHandlerService.js
-index c4e62f6..589ba31 100644
+index 6aaf8ef..7d9d2e3 100644
 --- a/uriloader/exthandler/nsHandlerService.js
 +++ b/uriloader/exthandler/nsHandlerService.js
-@@ -658,25 +658,24 @@ HandlerService.prototype = {
+@@ -632,25 +632,24 @@ HandlerService.prototype = {
  
      try {
        file.initWithPath(aPath);
@@ -55,3 +55,7 @@ index c4e62f6..589ba31 100644
      return null;
    },
  
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-1094324-Set-browser.newtabpage.enhanced-default.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-1094324-Set-browser.newtabpage.enhanced-default.patch
new file mode 100644
index 0000000..0e3f002
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-1094324-Set-browser.newtabpage.enhanced-default.patch
@@ -0,0 +1,77 @@
+From 71e633697c72c7035cd7b0b49608a2ddcfd91a63 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 25 May 2015 10:50:01 +0900
+Subject: Bug 1094324 - Set browser.newtabpage.enhanced default in prefs
+
+---
+ browser/app/profile/firefox.js             | 3 +++
+ browser/base/content/newtab/intro.js       | 4 ++++
+ browser/base/content/newtab/page.js        | 1 +
+ browser/modules/DirectoryLinksProvider.jsm | 2 +-
+ 4 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
+index 27ceb4d..35fbb8b 100644
+--- a/browser/app/profile/firefox.js
++++ b/browser/app/profile/firefox.js
+@@ -1634,6 +1634,9 @@ pref("browser.newtabpage.introShown", false);
+ // Toggles the content of 'about:newtab'. Shows the grid when enabled.
+ pref("browser.newtabpage.enabled", true);
+ 
++// Toggles the enhanced content of 'about:newtab'. Shows sponsored tiles.
++sticky_pref("browser.newtabpage.enhanced", true);
++
+ // number of rows of newtab grid
+ pref("browser.newtabpage.rows", 3);
+ 
+diff --git a/browser/base/content/newtab/intro.js b/browser/base/content/newtab/intro.js
+index f94c255..f3e4097 100644
+--- a/browser/base/content/newtab/intro.js
++++ b/browser/base/content/newtab/intro.js
+@@ -5,6 +5,7 @@
+ #endif
+ 
+ const PREF_INTRO_SHOWN = "browser.newtabpage.introShown";
++const PREF_NEWTAB_ENHANCED = "browser.newtabpage.enhanced";
+ 
+ let gIntro = {
+   _nodeIDSuffixes: [
+@@ -25,6 +26,9 @@ let gIntro = {
+   },
+ 
+   showIfNecessary: function() {
++    if (!Services.prefs.getBoolPref(PREF_NEWTAB_ENHANCED)) {
++      return;
++    }
+     if (!Services.prefs.getBoolPref(PREF_INTRO_SHOWN)) {
+       Services.prefs.setBoolPref(PREF_INTRO_SHOWN, true);
+       this.showPanel();
+diff --git a/browser/base/content/newtab/page.js b/browser/base/content/newtab/page.js
+index aa4ba92..d916fbe 100644
+--- a/browser/base/content/newtab/page.js
++++ b/browser/base/content/newtab/page.js
+@@ -54,6 +54,7 @@ let gPage = {
+       // Update thumbnails to the new enhanced setting
+       if (aData == "browser.newtabpage.enhanced") {
+         this.update();
++        gIntro.showIfNecessary();
+       }
+ 
+       // Initialize the whole page if we haven't done that, yet.
+diff --git a/browser/modules/DirectoryLinksProvider.jsm b/browser/modules/DirectoryLinksProvider.jsm
+index 9385c09..43a27c7 100644
+--- a/browser/modules/DirectoryLinksProvider.jsm
++++ b/browser/modules/DirectoryLinksProvider.jsm
+@@ -140,7 +140,7 @@ let DirectoryLinksProvider = {
+    */
+   _setDefaultEnhanced: function DirectoryLinksProvider_setDefaultEnhanced() {
+     if (!Services.prefs.prefHasUserValue(PREF_NEWTAB_ENHANCED)) {
+-      let enhanced = true;
++      let enhanced = Services.prefs.getBoolPref(PREF_NEWTAB_ENHANCED);
+       try {
+         // Default to not enhanced if DNT is set to tell websites to not track
+         if (Services.prefs.getBoolPref("privacy.donottrackheader.enabled")) {
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-1098343-part-1-support-sticky-preferences-meaning.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-1098343-part-1-support-sticky-preferences-meaning.patch
new file mode 100644
index 0000000..d7726a4
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-1098343-part-1-support-sticky-preferences-meaning.patch
@@ -0,0 +1,399 @@
+From 756f1a429d4114631c96ce07a14fd8a2c6260a89 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 3 Jul 2015 08:43:16 +0900
+Subject: Bug 1098343 (part 1) - support 'sticky' preferences, meaning a user
+ value is retained even when it matches the default. r=bsmedberg
+
+---
+ modules/libpref/prefapi.cpp                        |  19 ++-
+ modules/libpref/prefapi.h                          |   3 +
+ modules/libpref/prefread.cpp                       |  13 +-
+ modules/libpref/prefread.h                         |   6 +-
+ modules/libpref/test/unit/data/testPrefSticky.js   |   2 +
+ .../libpref/test/unit/data/testPrefStickyUser.js   |   5 +
+ modules/libpref/test/unit/test_stickyprefs.js      | 170 +++++++++++++++++++++
+ modules/libpref/test/unit/xpcshell.ini             |   2 +
+ 8 files changed, 212 insertions(+), 8 deletions(-)
+ create mode 100644 modules/libpref/test/unit/data/testPrefSticky.js
+ create mode 100644 modules/libpref/test/unit/data/testPrefStickyUser.js
+ create mode 100644 modules/libpref/test/unit/test_stickyprefs.js
+
+diff --git a/modules/libpref/prefapi.cpp b/modules/libpref/prefapi.cpp
+index 19d2d31..fa617f9 100644
+--- a/modules/libpref/prefapi.cpp
++++ b/modules/libpref/prefapi.cpp
+@@ -137,7 +137,8 @@ static nsresult pref_DoCallback(const char* changed_pref);
+ 
+ enum {
+     kPrefSetDefault = 1,
+-    kPrefForceSet = 2
++    kPrefForceSet = 2,
++    kPrefStickyDefault = 4,
+ };
+ static nsresult pref_HashPref(const char *key, PrefValue value, PrefType type, uint32_t flags);
+ 
+@@ -337,7 +338,8 @@ pref_savePref(PLDHashTable *table, PLDHashEntryHdr *heh, uint32_t i, void *arg)
+         (pref_ValueChanged(pref->defaultPref,
+                            pref->userPref,
+                            (PrefType) PREF_TYPE(pref)) ||
+-         !(pref->flags & PREF_HAS_DEFAULT))) {
++         !(pref->flags & PREF_HAS_DEFAULT) ||
++         pref->flags & PREF_STICKY_DEFAULT)) {
+         sourcePref = &pref->userPref;
+     } else {
+         if (argData->saveTypes == SAVE_ALL_AND_DEFAULTS) {
+@@ -771,6 +773,8 @@ nsresult pref_HashPref(const char *key, PrefValue value, PrefType type, uint32_t
+             {
+                 pref_SetValue(&pref->defaultPref, &pref->flags, value, type);
+                 pref->flags |= PREF_HAS_DEFAULT;
++                if (flags & kPrefStickyDefault)
++                    pref->flags |= PREF_STICKY_DEFAULT;
+                 if (!PREF_HAS_USER_VALUE(pref))
+                     valueChanged = true;
+             }
+@@ -780,9 +784,11 @@ nsresult pref_HashPref(const char *key, PrefValue value, PrefType type, uint32_t
+     }
+     else
+     {
+-        /* If new value is same as the default value, then un-set the user value.
++        /* If new value is same as the default value and it's not a "sticky"
++           pref, then un-set the user value.
+            Otherwise, set the user value only if it has changed */
+         if ((pref->flags & PREF_HAS_DEFAULT) &&
++            !(pref->flags & PREF_STICKY_DEFAULT) &&
+             !pref_ValueChanged(pref->defaultPref, value, type) &&
+             !(flags & kPrefForceSet))
+         {
+@@ -996,9 +1002,14 @@ void PREF_ReaderCallback(void       *closure,
+                          PrefValue   value,
+                          PrefType    type,
+                          bool        isDefault,
++                         bool        isStickyDefault,
+                          bool        isLocked)
+ {
+-    pref_HashPref(pref, value, type, isDefault ? kPrefSetDefault : kPrefForceSet);
++    uint32_t flags = isDefault ? kPrefSetDefault : kPrefForceSet;
++    if (isDefault && isStickyDefault) {
++        flags |= kPrefStickyDefault;
++    }
++    pref_HashPref(pref, value, type, flags);
+     if (isLocked)
+         PREF_LockPref(pref, true);
+ }
+diff --git a/modules/libpref/prefapi.h b/modules/libpref/prefapi.h
+index fe3f2da..24618a7 100644
+--- a/modules/libpref/prefapi.h
++++ b/modules/libpref/prefapi.h
+@@ -61,6 +61,8 @@ typedef enum { PREF_INVALID = 0,
+                PREF_LOCKED = 1, PREF_USERSET = 2, PREF_CONFIG = 4, PREF_REMOTE = 8,
+                PREF_LILOCAL = 16, PREF_STRING = 32, PREF_INT = 64, PREF_BOOL = 128,
+                PREF_HAS_DEFAULT = 256,
++               // pref is default pref with "sticky" semantics
++               PREF_STICKY_DEFAULT = 512,
+                PREF_VALUETYPE_MASK = (PREF_STRING | PREF_INT | PREF_BOOL)
+              } PrefType;
+ 
+@@ -184,6 +186,7 @@ void PREF_ReaderCallback( void *closure,
+                           PrefValue   value,
+                           PrefType    type,
+                           bool        isDefault,
++                          bool        isStickyDefault,
+                           bool        isLocked);
+ 
+ #ifdef __cplusplus
+diff --git a/modules/libpref/prefread.cpp b/modules/libpref/prefread.cpp
+index a119669..16c5057 100644
+--- a/modules/libpref/prefread.cpp
++++ b/modules/libpref/prefread.cpp
+@@ -45,6 +45,7 @@ enum {
+ static const char kUserPref[] = "user_pref";
+ static const char kLockPref[] = "lockPref";
+ static const char kPref[] = "pref";
++static const char kPrefSticky[] = "sticky_pref";
+ static const char kTrue[] = "true";
+ static const char kFalse[] = "false";
+ 
+@@ -130,7 +131,8 @@ pref_DoCallback(PrefParseState *ps)
+     default:
+         break;
+     }
+-    (*ps->reader)(ps->closure, ps->lb, value, ps->vtype, ps->fdefault, ps->flock);
++    (*ps->reader)(ps->closure, ps->lb, value, ps->vtype, ps->fdefault,
++                  ps->fstickydefault, ps->flock);
+     return true;
+ }
+ 
+@@ -189,6 +191,7 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
+                 ps->vb    = nullptr;
+                 ps->vtype = PREF_INVALID;
+                 ps->fdefault = false;
++                ps->fstickydefault = false;
+                 ps->flock = false;
+             }
+             switch (c) {
+@@ -200,9 +203,11 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
+                 break;
+             case 'u':       /* indicating user_pref */
+             case 'p':       /* indicating pref */
++            case 's':       /* indicating sticky_pref */
+             case 'l':       /* indicating lockPref */
+                 ps->smatch = (c == 'u' ? kUserPref :
+-                                         (c == 'p' ? kPref : kLockPref));
++                             (c == 's' ? kPrefSticky :
++                             (c == 'p' ? kPref : kLockPref)));
+                 ps->sindex = 1;
+                 ps->nextstate = PREF_PARSE_UNTIL_OPEN_PAREN;
+                 state = PREF_PARSE_MATCH_STRING;
+@@ -246,7 +251,9 @@ PREF_ParseBuf(PrefParseState *ps, const char *buf, int bufLen)
+         /* name parsing */
+         case PREF_PARSE_UNTIL_NAME:
+             if (c == '\"' || c == '\'') {
+-                ps->fdefault = (ps->smatch != kUserPref);
++                ps->fdefault = (ps->smatch == kPref || ps->smatch == kPrefSticky
++                                || ps->smatch == kLockPref);
++                ps->fstickydefault = (ps->smatch == kPrefSticky);
+                 ps->flock = (ps->smatch == kLockPref);
+                 ps->quotechar = c;
+                 ps->nextstate = PREF_PARSE_UNTIL_COMMA; /* return here when done */
+diff --git a/modules/libpref/prefread.h b/modules/libpref/prefread.h
+index 5b6a44f..0c13057 100644
+--- a/modules/libpref/prefread.h
++++ b/modules/libpref/prefread.h
+@@ -26,12 +26,15 @@ extern "C" {
+  *        preference type (PREF_STRING, PREF_INT, or PREF_BOOL)
+  * @param defPref
+  *        preference type (true: default, false: user preference)
++ * @param stickyPref
++ *        default preference marked as a "sticky" pref
+  */
+ typedef void (*PrefReader)(void       *closure,
+                            const char *pref,
+                            PrefValue   val,
+                            PrefType    type,
+                            bool        defPref,
++                           bool        stickyPref,
+                            bool        lockPref);
+ 
+ /* structure fields are private */
+@@ -52,7 +55,8 @@ typedef struct PrefParseState {
+     char       *lbend;      /* line buffer end               */
+     char       *vb;         /* value buffer (ptr into lb)    */
+     PrefType    vtype;      /* PREF_STRING,INT,BOOL          */
+-    bool        fdefault;   /* true if (default) pref        */
++    bool        fdefault;   /* true if (default) pref     */
++    bool        fstickydefault; /* true if (sticky) pref     */
+     bool        flock;      /* true if pref to be locked     */
+ } PrefParseState;
+ 
+diff --git a/modules/libpref/test/unit/data/testPrefSticky.js b/modules/libpref/test/unit/data/testPrefSticky.js
+new file mode 100644
+index 0000000..69b3165
+--- /dev/null
++++ b/modules/libpref/test/unit/data/testPrefSticky.js
+@@ -0,0 +1,2 @@
++pref("testPref.unsticky.bool", true);
++sticky_pref("testPref.sticky.bool", false);
+diff --git a/modules/libpref/test/unit/data/testPrefStickyUser.js b/modules/libpref/test/unit/data/testPrefStickyUser.js
+new file mode 100644
+index 0000000..0ea0906
+--- /dev/null
++++ b/modules/libpref/test/unit/data/testPrefStickyUser.js
+@@ -0,0 +1,5 @@
++// testPrefSticky.js defined this pref as a sticky_pref(). Once a sticky
++// pref has been changed, it's written as a user_pref().
++// So this test file reflects that scenario.
++// Note the default in testPrefSticky.js is also false.
++user_pref("testPref.sticky.bool", false);
+diff --git a/modules/libpref/test/unit/test_stickyprefs.js b/modules/libpref/test/unit/test_stickyprefs.js
+new file mode 100644
+index 0000000..c2c5a7c
+--- /dev/null
++++ b/modules/libpref/test/unit/test_stickyprefs.js
+@@ -0,0 +1,170 @@
++/* Any copyright is dedicated to the Public Domain.
++ * http://creativecommons.org/licenses/publicdomain/  */
++
++Components.utils.import("resource://gre/modules/XPCOMUtils.jsm");
++Components.utils.import("resource://gre/modules/Services.jsm");
++
++const ps = Services.prefs;
++
++// Once we fetch the profile directory the xpcshell test harness will send
++// a profile-before-change notification at shutdown. This causes the prefs
++// service to flush the prefs file - and the prefs file it uses ends up being
++// testPrefSticky*.js in the test dir. This upsets things in confusing ways :)
++// We avoid this by ensuring our "temp" prefs.js is the current prefs file.
++do_get_profile();
++do_register_cleanup(saveAndReload);
++
++// A little helper to reset the service and load some pref files
++function resetAndLoad(filenames) {
++  ps.resetPrefs();
++  for (let filename of filenames) {
++    ps.readUserPrefs(do_get_file(filename));
++  }
++}
++
++// A little helper that saves the current state to a file in the profile
++// dir, then resets the service and re-reads the file it just saved.
++// Used to test what gets actually written - things the pref service decided
++// not to write don't exist at all after this call.
++function saveAndReload() {
++  let file = do_get_profile();
++  file.append("prefs.js");
++  ps.savePrefFile(file);
++
++  // Now reset the pref service and re-read what we saved.
++  ps.resetPrefs();
++  ps.readUserPrefs(file);
++}
++
++function run_test() {
++  run_next_test();
++}
++
++// A sticky pref should not be written if the value is unchanged.
++add_test(function notWrittenWhenUnchanged() {
++  resetAndLoad(["data/testPrefSticky.js"]);
++  Assert.strictEqual(ps.getBoolPref("testPref.unsticky.bool"), true);
++  Assert.strictEqual(ps.getBoolPref("testPref.sticky.bool"), false);
++
++  // write prefs - but we haven't changed the sticky one, so it shouldn't be written.
++  saveAndReload();
++  // sticky should not have been written to the new file.
++  try {
++    ps.getBoolPref("testPref.sticky.bool");
++    Assert.ok(false, "expected failure reading this pref");
++  } catch (ex) {
++    Assert.ok(ex, "exception reading regular pref");
++  }
++  run_next_test();
++});
++
++// Loading a sticky_pref then a user_pref for the same pref means it should
++// always be written.
++add_test(function writtenOnceLoadedWithoutChange() {
++  // Load the same pref file *as well as* a pref file that has a user_pref for
++  // our sticky with the default value. It should be re-written without us
++  // touching it.
++  resetAndLoad(["data/testPrefSticky.js", "data/testPrefStickyUser.js"]);
++  // reset and re-read what we just wrote - it should be written.
++  saveAndReload();
++  Assert.strictEqual(ps.getBoolPref("testPref.sticky.bool"), false,
++                     "user_pref was written with default value");
++  run_next_test();
++});
++
++// If a sticky pref is explicicitly changed, even to the default, it is written.
++add_test(function writtenOnceLoadedWithChangeNonDefault() {
++  // Load the same pref file *as well as* a pref file that has a user_pref for
++  // our sticky - then change the pref. It should be written.
++  resetAndLoad(["data/testPrefSticky.js", "data/testPrefStickyUser.js"]);
++  // Set a new val and check we wrote it.
++  ps.setBoolPref("testPref.sticky.bool", false);
++  saveAndReload();
++  Assert.strictEqual(ps.getBoolPref("testPref.sticky.bool"), false,
++                     "user_pref was written with custom value");
++  run_next_test();
++});
++
++// If a sticky pref is changed to the non-default value, it is written.
++add_test(function writtenOnceLoadedWithChangeNonDefault() {
++  // Load the same pref file *as well as* a pref file that has a user_pref for
++  // our sticky - then change the pref. It should be written.
++  resetAndLoad(["data/testPrefSticky.js", "data/testPrefStickyUser.js"]);
++  // Set a new val and check we wrote it.
++  ps.setBoolPref("testPref.sticky.bool", true);
++  saveAndReload();
++  Assert.strictEqual(ps.getBoolPref("testPref.sticky.bool"), true,
++                     "user_pref was written with custom value");
++  run_next_test();
++});
++
++// Test that prefHasUserValue always returns true whenever there is a sticky
++// value, even when that value matches the default. This is mainly for
++// about:config semantics - prefs with a sticky value always remain bold and
++// always offer "reset" (which fully resets and drops the sticky value as if
++// the pref had never changed.)
++add_test(function hasUserValue() {
++  // sticky pref without user value.
++  resetAndLoad(["data/testPrefSticky.js"]);
++  Assert.strictEqual(ps.getBoolPref("testPref.sticky.bool"), false);
++  Assert.ok(!ps.prefHasUserValue("testPref.sticky.bool"),
++            "should not initially reflect a user value");
++
++  ps.setBoolPref("testPref.sticky.bool", false);
++  Assert.ok(ps.prefHasUserValue("testPref.sticky.bool"),
++            "should reflect a user value after set to default");
++
++  ps.setBoolPref("testPref.sticky.bool", true);
++  Assert.ok(ps.prefHasUserValue("testPref.sticky.bool"),
++            "should reflect a user value after change to non-default");
++
++  ps.clearUserPref("testPref.sticky.bool");
++  Assert.ok(!ps.prefHasUserValue("testPref.sticky.bool"),
++            "should reset to no user value");
++  ps.setBoolPref("testPref.sticky.bool", false, "expected default");
++
++  // And make sure the pref immediately reflects a user value after load.
++  resetAndLoad(["data/testPrefSticky.js", "data/testPrefStickyUser.js"]);
++  Assert.strictEqual(ps.getBoolPref("testPref.sticky.bool"), false);
++  Assert.ok(ps.prefHasUserValue("testPref.sticky.bool"),
++            "should have a user value when loaded value is the default");
++  run_next_test();
++});
++
++// Test that clearUserPref removes the "sticky" value.
++add_test(function clearUserPref() {
++  // load things such that we have a sticky value which is the same as the
++  // default.
++  resetAndLoad(["data/testPrefSticky.js", "data/testPrefStickyUser.js"]);
++  ps.clearUserPref("testPref.sticky.bool");
++
++  // Once we save prefs the sticky pref should no longer be written.
++  saveAndReload();
++  try {
++    ps.getBoolPref("testPref.sticky.bool");
++    Assert.ok(false, "expected failure reading this pref");
++  } catch (ex) {
++    Assert.ok(ex, "pref doesn't have a sticky value");
++  }
++  run_next_test();
++});
++
++// Test that a pref observer gets a notification fired when a sticky pref
++// has it's value changed to the same value as the default. The reason for
++// this behaviour is that later we might have other code that cares about a
++// pref being sticky (IOW, we notify due to the "state" of the pref changing
++// even if the value has not)
++add_test(function observerFires() {
++  // load things so there's no sticky value.
++  resetAndLoad(["data/testPrefSticky.js"]);
++
++  function observe(subject, topic, data) {
++    Assert.equal(data, "testPref.sticky.bool");
++    ps.removeObserver("testPref.sticky.bool", observe);
++    run_next_test();
++  }
++  ps.addObserver("testPref.sticky.bool", observe, false);
++
++  ps.setBoolPref("testPref.sticky.bool", ps.getBoolPref("testPref.sticky.bool"));
++  // and the observer will fire triggering the next text.
++});
+diff --git a/modules/libpref/test/unit/xpcshell.ini b/modules/libpref/test/unit/xpcshell.ini
+index 443d96e..2ee36ed 100644
+--- a/modules/libpref/test/unit/xpcshell.ini
++++ b/modules/libpref/test/unit/xpcshell.ini
+@@ -11,6 +11,8 @@ support-files =
+ [test_bug506224.js]
+ [test_bug577950.js]
+ [test_bug790374.js]
++[test_stickyprefs.js]
++support-files = data/testPrefSticky.js data/testPrefStickyUser.js
+ [test_changeType.js]
+ [test_dirtyPrefs.js]
+ [test_extprefs.js]
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-1136958-Remove-duplicate-SkDiscardableMemory_none.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-1136958-Remove-duplicate-SkDiscardableMemory_none.patch
new file mode 100644
index 0000000..ff5ddcb
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-1136958-Remove-duplicate-SkDiscardableMemory_none.patch
@@ -0,0 +1,26 @@
+From 663e55eb0c2835a349494fbe6cc91d7b32708964 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh+mozilla@glandium.org>
+Date: Thu, 26 Feb 2015 14:14:02 +0900
+Subject: Bug 1136958 - Remove duplicate SkDiscardableMemory_none.cpp from
+ gfx/skia/moz.build
+
+---
+ gfx/skia/moz.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gfx/skia/moz.build b/gfx/skia/moz.build
+index c8f47a0..59bb7af 100644
+--- a/gfx/skia/moz.build
++++ b/gfx/skia/moz.build
+@@ -852,7 +852,6 @@ else:
+         'trunk/src/opts/SkTextureCompression_opts_none.cpp',
+         'trunk/src/opts/SkUtils_opts_none.cpp',
+         'trunk/src/opts/SkXfermode_opts_none.cpp',
+-        'trunk/src/ports/SkDiscardableMemory_none.cpp',
+     ]
+ 
+ 
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-1166243-Remove-build-function-from-js-and-xpc.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-1166243-Remove-build-function-from-js-and-xpc.patch
new file mode 100644
index 0000000..4f7931d
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-1166243-Remove-build-function-from-js-and-xpc.patch
@@ -0,0 +1,102 @@
+From ad22baf32e37eb93a1c8fca29772fe5cc4dbc350 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Tue, 19 May 2015 20:50:08 +0900
+Subject: Bug 1166243 - Remove build() function from js and xpc shells.
+
+---
+ ipc/testshell/XPCShellEnvironment.cpp | 10 ----------
+ js/src/shell/js.cpp                   | 13 -------------
+ js/xpconnect/src/XPCShellImpl.cpp     | 10 ----------
+ 3 files changed, 33 deletions(-)
+
+diff --git a/ipc/testshell/XPCShellEnvironment.cpp b/ipc/testshell/XPCShellEnvironment.cpp
+index f1ad26d..8d14c22 100644
+--- a/ipc/testshell/XPCShellEnvironment.cpp
++++ b/ipc/testshell/XPCShellEnvironment.cpp
+@@ -193,15 +193,6 @@ Version(JSContext *cx,
+ }
+ 
+ static bool
+-BuildDate(JSContext *cx, unsigned argc, JS::Value *vp)
+-{
+-    JS::CallArgs args = JS::CallArgsFromVp(argc, vp);
+-    fprintf(stdout, "built on %s at %s\n", __DATE__, __TIME__);
+-    args.rval().setUndefined();
+-    return true;
+-}
+-
+-static bool
+ Quit(JSContext *cx,
+      unsigned argc,
+      JS::Value *vp)
+@@ -270,7 +261,6 @@ const JSFunctionSpec gGlobalFunctions[] =
+     JS_FS("load",            Load,           1,0),
+     JS_FS("quit",            Quit,           0,0),
+     JS_FS("version",         Version,        1,0),
+-    JS_FS("build",           BuildDate,      0,0),
+     JS_FS("dumpXPC",         DumpXPC,        1,0),
+     JS_FS("dump",            Dump,           1,0),
+     JS_FS("gc",              GC,             0,0),
+diff --git a/js/src/shell/js.cpp b/js/src/shell/js.cpp
+index c3ef703..380d55d 100644
+--- a/js/src/shell/js.cpp
++++ b/js/src/shell/js.cpp
+@@ -2500,15 +2500,6 @@ DisassWithSrc(JSContext* cx, unsigned argc, jsval* vp)
+ #endif /* DEBUG */
+ 
+ static bool
+-BuildDate(JSContext* cx, unsigned argc, jsval* vp)
+-{
+-    CallArgs args = CallArgsFromVp(argc, vp);
+-    fprintf(gOutFile, "built on %s at %s\n", __DATE__, __TIME__);
+-    args.rval().setUndefined();
+-    return true;
+-}
+-
+-static bool
+ Intern(JSContext* cx, unsigned argc, jsval* vp)
+ {
+     CallArgs args = CallArgsFromVp(argc, vp);
+@@ -4516,10 +4507,6 @@ static const JSFunctionSpecWithHelp shell_functions[] = {
+ "  will be 'null', because they are roots."),
+ 
+ #endif
+-    JS_FN_HELP("build", BuildDate, 0, 0,
+-"build()",
+-"  Show build date and time."),
+-
+     JS_FN_HELP("intern", Intern, 1, 0,
+ "intern(str)",
+ "  Internalize str in the atom table."),
+diff --git a/js/xpconnect/src/XPCShellImpl.cpp b/js/xpconnect/src/XPCShellImpl.cpp
+index 4b75a80..c035be1 100644
+--- a/js/xpconnect/src/XPCShellImpl.cpp
++++ b/js/xpconnect/src/XPCShellImpl.cpp
+@@ -363,15 +363,6 @@ Version(JSContext* cx, unsigned argc, jsval* vp)
+ }
+ 
+ static bool
+-BuildDate(JSContext* cx, unsigned argc, jsval* vp)
+-{
+-    CallArgs args = CallArgsFromVp(argc, vp);
+-    fprintf(gOutFile, "built on %s at %s\n", __DATE__, __TIME__);
+-    args.rval().setUndefined();
+-    return true;
+-}
+-
+-static bool
+ Quit(JSContext* cx, unsigned argc, jsval* vp)
+ {
+     CallArgs args = CallArgsFromVp(argc, vp);
+@@ -649,7 +640,6 @@ static const JSFunctionSpec glob_functions[] = {
+     JS_FS("quit",            Quit,           0,0),
+     JS_FS("ignoreReportedErrors", IgnoreReportedErrors, 1,0),
+     JS_FS("version",         Version,        1,0),
+-    JS_FS("build",           BuildDate,      0,0),
+     JS_FS("dumpXPC",         DumpXPC,        1,0),
+     JS_FS("dump",            Dump,           1,0),
+     JS_FS("gc",              GC,             0,0),
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-1166538-Use-dozip.py-for-langpacks.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-1166538-Use-dozip.py-for-langpacks.patch
new file mode 100644
index 0000000..096c81d
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-1166538-Use-dozip.py-for-langpacks.patch
@@ -0,0 +1,26 @@
+From b6b668fa53688af84ad8f7cab25347c4d7adb381 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Tue, 19 May 2015 23:07:49 +0900
+Subject: Bug 1166538 - Use dozip.py for langpacks.
+
+---
+ toolkit/locales/l10n.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/toolkit/locales/l10n.mk b/toolkit/locales/l10n.mk
+index 1c907e5..6ec0b58 100644
+--- a/toolkit/locales/l10n.mk
++++ b/toolkit/locales/l10n.mk
+@@ -172,7 +172,7 @@ langpack-%: libs-%
+ 	$(call py_action,preprocessor,$(DEFINES) $(ACDEFINES) \
+ 	  -I$(TK_DEFINES) -I$(APP_DEFINES) $(srcdir)/generic/install.rdf -o $(DIST)/xpi-stage/$(XPI_NAME)/install.rdf)
+ 	cd $(DIST)/xpi-stage/locale-$(AB_CD) && \
+-	  $(ZIP) -r9D $(LANGPACK_FILE) install.rdf $(PKG_ZIP_DIRS) chrome.manifest
++	  $(PYTHON) $(MOZILLA_DIR)/toolkit/mozapps/installer/dozip.py --base-dir . $(LANGPACK_FILE) install.rdf $(PKG_ZIP_DIRS) chrome.manifest
+ 
+ # This variable is to allow the wget-en-US target to know which ftp server to download from
+ ifndef EN_US_BINARY_URL 
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-1168231-Normalize-file-mode-in-jars.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-1168231-Normalize-file-mode-in-jars.patch
new file mode 100644
index 0000000..de10135
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-1168231-Normalize-file-mode-in-jars.patch
@@ -0,0 +1,35 @@
+From 051e925e9b74980aae7e796d38d3212de67c204d Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Tue, 26 May 2015 08:12:43 +0900
+Subject: Bug 1168231 - Normalize file mode in jars
+
+---
+ python/mozbuild/mozpack/files.py | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/files.py
+index 612aea9..3cddcc5 100644
+--- a/python/mozbuild/mozpack/files.py
++++ b/python/mozbuild/mozpack/files.py
+@@ -212,7 +212,16 @@ class File(BaseFile):
+         if platform.system() == 'Windows':
+             return None
+         assert self.path is not None
+-        return os.stat(self.path).st_mode
++        mode = os.stat(self.path).st_mode
++        # Normalize file mode:
++        # - take the user bits only (leaving away sticky bit, setuid, setgid)
++        # - expand them to group and other
++        # - apply a standard umask
++        # - keep file type (e.g. S_IFREG)
++        file_type = stat.S_IFMT(mode)
++        mode = mode & stat.S_IRWXU;
++        mode = mode | (mode >> 3) | (mode >> 6)
++        return file_type | (mode & 0755);
+ 
+ class ExecutableFile(File):
+     '''
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch
deleted file mode 100644
index 87cf894..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sun, 26 Feb 2012 09:20:44 +0100
-Subject: Bug 515232 - Try getting general.useragent.locale as a complex value
- first in DirectoryProvider.cpp
-
----
- browser/components/dirprovider/DirectoryProvider.cpp |   14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/browser/components/dirprovider/DirectoryProvider.cpp b/browser/components/dirprovider/DirectoryProvider.cpp
-index 1373adc..5df1419 100644
---- a/browser/components/dirprovider/DirectoryProvider.cpp
-+++ b/browser/components/dirprovider/DirectoryProvider.cpp
-@@ -56,6 +56,7 @@
- #include "nsServiceManagerUtils.h"
- #include "nsStringAPI.h"
- #include "nsXULAppAPI.h"
-+#include "nsIPrefLocalizedString.h"
- 
- namespace mozilla {
- namespace browser {
-@@ -200,7 +201,18 @@ AppendDistroSearchDirs(nsIProperties* aDirSvc, nsCOMArray<nsIFile> &array)
-     localePlugins->AppendNative(NS_LITERAL_CSTRING("locale"));
- 
-     nsCString locale;
--    rv = prefs->GetCharPref("general.useragent.locale", getter_Copies(locale));
-+    nsCOMPtr<nsIPrefLocalizedString> prefString;
-+    rv = prefs->GetComplexValue("general.useragent.locale",
-+                                NS_GET_IID(nsIPrefLocalizedString),
-+                                getter_AddRefs(prefString));
-+    if (NS_SUCCEEDED(rv)) {
-+      nsAutoString wLocale;
-+      prefString->GetData(getter_Copies(wLocale));
-+      CopyUTF16toUTF8(wLocale, locale);
-+    } else {
-+      rv = prefs->GetCharPref("general.useragent.locale", getter_Copies(locale));
-+    }
-+
-     if (NS_SUCCEEDED(rv)) {
- 
-       nsCOMPtr<nsIFile> curLocalePlugins;
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch
deleted file mode 100644
index dab2016..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch
+++ /dev/null
@@ -1,285 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 24 Dec 2011 09:56:58 +0100
-Subject: Bug 691898 - Use YARR interpreter instead of PCRE on platforms where
- YARR JIT is not supported
-
----
- js/src/Makefile.in           |   21 +++++++++++++--------
- js/src/vm/RegExpObject-inl.h |   28 ++++++----------------------
- js/src/vm/RegExpObject.cpp   |   36 ------------------------------------
- js/src/vm/RegExpObject.h     |   27 ++++++---------------------
- js/src/yarr/wtfbridge.h      |    2 --
- 5 files changed, 25 insertions(+), 89 deletions(-)
-
-diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index fc48cbd..49f0bdc 100644
---- a/js/src/Makefile.in
-+++ b/js/src/Makefile.in
-@@ -416,15 +416,20 @@ CPPSRCS += 	checks.cc \
- 
- ifeq (,$(filter arm% sparc %86 x86_64,$(TARGET_CPU)))
- 
--VPATH +=        $(srcdir)/yarr/pcre \
-+VPATH +=        $(srcdir)/assembler \
-+                $(srcdir)/assembler/wtf \
-+                $(srcdir)/yarr \
- 		$(NULL)
- 
- CPPSRCS += \
--                pcre_compile.cpp \
--                pcre_exec.cpp \
--                pcre_tables.cpp \
--                pcre_xclass.cpp \
--                pcre_ucp_searchfuncs.cpp \
-+                Assertions.cpp \
-+                OSAllocatorOS2.cpp \
-+                OSAllocatorPosix.cpp \
-+                OSAllocatorWin.cpp \
-+                PageBlock.cpp \
-+                YarrInterpreter.cpp \
-+                YarrPattern.cpp \
-+                YarrSyntaxChecker.cpp \
- 		$(NULL)
- else
- 
-@@ -1015,10 +1020,10 @@ endif
- # Needed to "configure" it correctly.  Unfortunately these
- # flags wind up being applied to all code in js/src, not just
- # the code in js/src/assembler.
--CXXFLAGS += -DUSE_SYSTEM_MALLOC=1 -DENABLE_ASSEMBLER=1
-+CXXFLAGS += -DUSE_SYSTEM_MALLOC=1
- 
- ifneq (,$(ENABLE_YARR_JIT)$(ENABLE_TRACEJIT)$(ENABLE_METHODJIT))
--CXXFLAGS +=  -DENABLE_JIT=1
-+CXXFLAGS +=  -DENABLE_JIT=1 -DENABLE_ASSEMBLER=1
- endif
- 
- INCLUDES +=	-I$(srcdir)/assembler -I$(srcdir)/yarr
-diff --git a/js/src/vm/RegExpObject-inl.h b/js/src/vm/RegExpObject-inl.h
-index 5f7817d..91108a7 100644
---- a/js/src/vm/RegExpObject-inl.h
-+++ b/js/src/vm/RegExpObject-inl.h
-@@ -327,6 +327,7 @@ RegExpPrivate::create(JSContext *cx, JSString *source, RegExpFlag flags, TokenSt
-     return RetType(self);
- }
- 
-+#if ENABLE_YARR_JIT
- /* This function should be deleted once bad Android platforms phase out. See bug 604774. */
- inline bool
- RegExpPrivateCode::isJITRuntimeEnabled(JSContext *cx)
-@@ -337,12 +338,12 @@ RegExpPrivateCode::isJITRuntimeEnabled(JSContext *cx)
-     return true;
- #endif
- }
-+#endif
- 
- inline bool
- RegExpPrivateCode::compile(JSContext *cx, JSLinearString &pattern, TokenStream *ts,
-                            uintN *parenCount, RegExpFlag flags)
- {
--#if ENABLE_YARR_JIT
-     /* Parse the pattern. */
-     ErrorCode yarrError;
-     YarrPattern yarrPattern(pattern, bool(flags & IgnoreCaseFlag), bool(flags & MultilineFlag),
-@@ -359,7 +360,7 @@ RegExpPrivateCode::compile(JSContext *cx, JSLinearString &pattern, TokenStream *
-      * case we have to bytecode compile it.
-      */
- 
--#ifdef JS_METHODJIT
-+#if ENABLE_YARR_JIT && defined(JS_METHODJIT)
-     if (isJITRuntimeEnabled(cx) && !yarrPattern.m_containsBackreferences) {
-         if (!cx->compartment->ensureJaegerCompartmentExists(cx))
-             return false;
-@@ -371,21 +372,11 @@ RegExpPrivateCode::compile(JSContext *cx, JSLinearString &pattern, TokenStream *
-     }
- #endif
- 
-+#if ENABLE_YARR_JIT
-     codeBlock.setFallBack(true);
-+#endif
-     byteCode = byteCompile(yarrPattern, cx->compartment->regExpAllocator).get();
-     return true;
--#else /* !defined(ENABLE_YARR_JIT) */
--    int error = 0;
--    compiled = jsRegExpCompile(pattern.chars(), pattern.length(),
--                  ignoreCase() ? JSRegExpIgnoreCase : JSRegExpDoNotIgnoreCase,
--                  multiline() ? JSRegExpMultiline : JSRegExpSingleLine,
--                  parenCount, &error);
--    if (error) {
--        reportPCREError(cx, error);
--        return false;
--    }
--    return true;
--#endif
- }
- 
- inline bool
-@@ -431,19 +422,12 @@ RegExpPrivateCode::execute(JSContext *cx, const jschar *chars, size_t start, siz
-     else
-         result = JSC::Yarr::execute(codeBlock, chars, start, length, output);
- #else
--    result = jsRegExpExecute(cx, compiled, chars, length, start, output, outputCount);
-+    result = JSC::Yarr::interpret(byteCode, chars, start, length, output);
- #endif
- 
-     if (result == -1)
-         return Success_NotFound;
- 
--#if !ENABLE_YARR_JIT
--    if (result < 0) {
--        reportPCREError(cx, result);
--        return Error;
--    }
--#endif
--
-     JS_ASSERT(result >= 0);
-     return Success;
- }
-diff --git a/js/src/vm/RegExpObject.cpp b/js/src/vm/RegExpObject.cpp
-index f75c6a5..7631dd5 100644
---- a/js/src/vm/RegExpObject.cpp
-+++ b/js/src/vm/RegExpObject.cpp
-@@ -251,7 +251,6 @@ Class js::RegExpClass = {
-     NULL                     /* trace */
- };
- 
--#if ENABLE_YARR_JIT
- void
- RegExpPrivateCode::reportYarrError(JSContext *cx, TokenStream *ts, ErrorCode error)
- {
-@@ -283,41 +282,6 @@ RegExpPrivateCode::reportYarrError(JSContext *cx, TokenStream *ts, ErrorCode err
-     }
- }
- 
--#else /* !ENABLE_YARR_JIT */
--
--void
--RegExpPrivateCode::reportPCREError(JSContext *cx, int error)
--{
--#define REPORT(msg_) \
--    JS_ReportErrorFlagsAndNumberUC(cx, JSREPORT_ERROR, js_GetErrorMessage, NULL, msg_); \
--    return
--    switch (error) {
--      case -2: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      case 0: JS_NOT_REACHED("Precondition violation: an error must have occurred."); 
--      case 1: REPORT(JSMSG_TRAILING_SLASH);
--      case 2: REPORT(JSMSG_TRAILING_SLASH); 
--      case 3: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      case 4: REPORT(JSMSG_BAD_QUANTIFIER);
--      case 5: REPORT(JSMSG_BAD_QUANTIFIER);
--      case 6: REPORT(JSMSG_BAD_CLASS_RANGE);
--      case 7: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      case 8: REPORT(JSMSG_BAD_CLASS_RANGE);
--      case 9: REPORT(JSMSG_BAD_QUANTIFIER);
--      case 10: REPORT(JSMSG_UNMATCHED_RIGHT_PAREN);
--      case 11: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      case 12: REPORT(JSMSG_UNMATCHED_RIGHT_PAREN);
--      case 13: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      case 14: REPORT(JSMSG_MISSING_PAREN);
--      case 15: REPORT(JSMSG_BAD_BACKREF);
--      case 16: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      case 17: REPORT(JSMSG_REGEXP_TOO_COMPLEX);
--      default:
--        JS_NOT_REACHED("Precondition violation: unknown PCRE error code.");
--    }
--#undef REPORT
--}
--#endif /* ENABLE_YARR_JIT */
--
- bool
- js::ParseRegExpFlags(JSContext *cx, JSString *flagStr, RegExpFlag *flagsOut)
- {
-diff --git a/js/src/vm/RegExpObject.h b/js/src/vm/RegExpObject.h
-index 1449d56..279f3c0 100644
---- a/js/src/vm/RegExpObject.h
-+++ b/js/src/vm/RegExpObject.h
-@@ -49,8 +49,6 @@
- #include "yarr/Yarr.h"
- #if ENABLE_YARR_JIT
- #include "yarr/YarrJIT.h"
--#else
--#include "yarr/pcre/pcre.h"
- #endif
- 
- namespace js {
-@@ -153,48 +151,39 @@ ResetRegExpObject(JSContext *cx, AlreadyIncRefed<RegExpPrivate> rep);
- /* Abstracts away the gross |RegExpPrivate| backend details. */
- class RegExpPrivateCode
- {
--#if ENABLE_YARR_JIT
-     typedef JSC::Yarr::BytecodePattern BytecodePattern;
-     typedef JSC::Yarr::ErrorCode ErrorCode;
-+    typedef JSC::Yarr::YarrPattern YarrPattern;
-+#if ENABLE_YARR_JIT
-     typedef JSC::Yarr::JSGlobalData JSGlobalData;
-     typedef JSC::Yarr::YarrCodeBlock YarrCodeBlock;
--    typedef JSC::Yarr::YarrPattern YarrPattern;
- 
-     /* Note: Native code is valid only if |codeBlock.isFallBack() == false|. */
-     YarrCodeBlock   codeBlock;
--    BytecodePattern *byteCode;
--#else
--    JSRegExp        *compiled;
- #endif
-+    BytecodePattern *byteCode;
- 
-   public:
-     RegExpPrivateCode()
-       :
- #if ENABLE_YARR_JIT
-         codeBlock(),
--        byteCode(NULL)
--#else
--        compiled(NULL)
- #endif
-+        byteCode(NULL)
-     { }
- 
-     ~RegExpPrivateCode() {
- #if ENABLE_YARR_JIT
-         codeBlock.release();
-+#endif
-         if (byteCode)
-             Foreground::delete_<BytecodePattern>(byteCode);
--#else
--        if (compiled)
--            jsRegExpFree(compiled);
--#endif
-     }
- 
- #if ENABLE_YARR_JIT
-     static inline bool isJITRuntimeEnabled(JSContext *cx);
--    void reportYarrError(JSContext *cx, TokenStream *ts, JSC::Yarr::ErrorCode error);
--#else
--    void reportPCREError(JSContext *cx, int error);
- #endif
-+    void reportYarrError(JSContext *cx, TokenStream *ts, JSC::Yarr::ErrorCode error);
- 
-     inline bool compile(JSContext *cx, JSLinearString &pattern, TokenStream *ts, uintN *parenCount,
-                         RegExpFlag flags);
-@@ -205,11 +194,7 @@ class RegExpPrivateCode
-                                  int *output, size_t outputCount);
- 
-     static size_t getOutputSize(size_t pairCount) {
--#if ENABLE_YARR_JIT
-         return pairCount * 2;
--#else
--        return pairCount * 3; /* Should be x2, but PCRE has... needs. */
--#endif
-     }
- };
- 
-diff --git a/js/src/yarr/wtfbridge.h b/js/src/yarr/wtfbridge.h
-index ac41d08..fb8eb86 100644
---- a/js/src/yarr/wtfbridge.h
-+++ b/js/src/yarr/wtfbridge.h
-@@ -49,9 +49,7 @@
- #include "jsprvtd.h"
- #include "vm/String.h"
- #include "assembler/wtf/Platform.h"
--#if ENABLE_YARR_JIT
- #include "assembler/jit/ExecutableAllocator.h"
--#endif
- 
- namespace JSC { namespace Yarr {
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch
deleted file mode 100644
index 4f0ffc9..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From: Benoit Jacob <bjacob@mozilla.com>
-Date: Thu, 23 Feb 2012 17:21:30 -0500
-Subject: Bug 696636 - Block OpenGL 1 drivers explicitly to steer clear of
- crashes - r=mattwoodrow
-
----
- widget/src/xpwidgets/GfxInfoX11.cpp |   14 +++++++++++++-
- widget/src/xpwidgets/GfxInfoX11.h   |    2 +-
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
-index 018b8fa..4974c5f 100644
---- a/widget/src/xpwidgets/GfxInfoX11.cpp
-+++ b/widget/src/xpwidgets/GfxInfoX11.cpp
-@@ -61,6 +61,7 @@ pid_t glxtest_pid = 0;
- nsresult
- GfxInfo::Init()
- {
-+    mGLMajorVersion = 0;
-     mMajorVersion = 0;
-     mMinorVersion = 0;
-     mRevisionVersion = 0;
-@@ -195,6 +196,9 @@ GfxInfo::GetData()
-     CrashReporter::AppendAppNotesToCrashReport(note);
- #endif
- 
-+    // determine the major OpenGL version. That's the first integer in the version string.
-+    mGLMajorVersion = strtol(mVersion.get(), 0, 10);
-+
-     // determine driver type (vendor) and where in the version string
-     // the actual driver version numbers should be expected to be found (whereToReadVersionNumbers)
-     const char *whereToReadVersionNumbers = nsnull;
-@@ -219,7 +223,7 @@ GfxInfo::GetData()
-         whereToReadVersionNumbers = mVersion.get();
-     }
- 
--    // read major.minor version numbers
-+    // read major.minor version numbers of the driver (not to be confused with the OpenGL version)
-     if (whereToReadVersionNumbers) {
-         // copy into writable buffer, for tokenization
-         strncpy(buf, whereToReadVersionNumbers, buf_size);
-@@ -275,6 +279,14 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
- 
-     OperatingSystem os = DRIVER_OS_LINUX;
- 
-+    if (mGLMajorVersion == 1) {
-+        // We're on OpenGL 1. In most cases that indicates really old hardware.
-+        // We better block them, rather than rely on them to fail gracefully, because they don't!
-+        // see bug 696636
-+        *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DEVICE;
-+        return NS_OK;
-+    }
-+
-     // Disable OpenGL layers when we don't have texture_from_pixmap because it regresses performance. 
-     if (aFeature == nsIGfxInfo::FEATURE_OPENGL_LAYERS && !mHasTextureFromPixmap) {
-         *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-diff --git a/widget/src/xpwidgets/GfxInfoX11.h b/widget/src/xpwidgets/GfxInfoX11.h
-index 2525db0..03878ff 100644
---- a/widget/src/xpwidgets/GfxInfoX11.h
-+++ b/widget/src/xpwidgets/GfxInfoX11.h
-@@ -95,7 +95,7 @@ private:
-   nsCString mAdapterDescription;
-   bool mIsMesa, mIsNVIDIA, mIsFGLRX;
-   bool mHasTextureFromPixmap;
--  int mMajorVersion, mMinorVersion, mRevisionVersion;
-+  int mGLMajorVersion, mMajorVersion, mMinorVersion, mRevisionVersion;
- 
-   void AddCrashReportAnnotations();
- };
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch
deleted file mode 100644
index 0d3bd9f..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From: aceman <acelists@atlas.sk>
-Date: Wed, 11 Jan 2012 10:46:54 +0100
-Subject: =?UTF-8?q?Bug=20706724=20-=20Fix=20for=20error:=20=E2=80=98ftruncat?=
- =?UTF-8?q?e=E2=80=99=20was=20not=20declared=20in=20this=20scope.=20r=3Dbenj?=
- =?UTF-8?q?amin?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
----
- ipc/chromium/src/base/file_util.cc |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ipc/chromium/src/base/file_util.cc b/ipc/chromium/src/base/file_util.cc
-index 1154fed..6067a4a 100644
---- a/ipc/chromium/src/base/file_util.cc
-+++ b/ipc/chromium/src/base/file_util.cc
-@@ -8,7 +8,7 @@
- #include <io.h>
- #endif
- #include <stdio.h>
--#if defined(ANDROID)
-+#if defined(ANDROID) || defined(OS_POSIX)
- #include <unistd.h>
- #endif
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch
deleted file mode 100644
index 23c90a2..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From: Chris Coulson <chrisccoulson@ubuntu.com>
-Date: Wed, 14 Dec 2011 11:34:31 +0100
-Subject: Bug 709259 - Try creating a named cursor before a bitmap cursor.
- r=karlt
-
----
- widget/src/gtk2/nsGtkCursors.h |   31 +++++++++++++++++--------------
- widget/src/gtk2/nsWindow.cpp   |   14 +++++++++++---
- 2 files changed, 28 insertions(+), 17 deletions(-)
-
-diff --git a/widget/src/gtk2/nsGtkCursors.h b/widget/src/gtk2/nsGtkCursors.h
-index b8065eb..eff43ba 100644
---- a/widget/src/gtk2/nsGtkCursors.h
-+++ b/widget/src/gtk2/nsGtkCursors.h
-@@ -46,6 +46,7 @@ typedef struct {
-   const unsigned char *mask_bits;
-   int hot_x;
-   int hot_y;
-+  const char *hash;
- } nsGtkCursor;
- 
- /* MOZ_CURSOR_HAND_GRAB */
-@@ -415,21 +416,23 @@ enum {
-   MOZ_CURSOR_NONE
- };
- 
--// create custom pixmap cursor
-+// create custom pixmap cursor. The hash values must stay in sync with the
-+// bitmap data above. To see the hash function, have a look at XcursorImageHash
-+// in libXcursor
- static const nsGtkCursor GtkCursors[] = {
--  { moz_hand_grab_bits,      moz_hand_grab_mask_bits,      10, 10 },
--  { moz_hand_grabbing_bits,  moz_hand_grabbing_mask_bits,  10, 10 },
--  { moz_copy_bits,           moz_copy_mask_bits,           2,  2  },
--  { moz_alias_bits,          moz_alias_mask_bits,          2,  2  },
--  { moz_menu_bits,           moz_menu_mask_bits,           2,  2  },
--  { moz_spinning_bits,       moz_spinning_mask_bits,       2,  2  },
--  { moz_zoom_in_bits,        moz_zoom_in_mask_bits,        6,  6  },
--  { moz_zoom_out_bits,       moz_zoom_out_mask_bits,       6,  6  },
--  { moz_not_allowed_bits,    moz_not_allowed_mask_bits,    9,  9  },
--  { moz_vertical_text_bits,  moz_vertical_text_mask_bits,  8,  4  },
--  { moz_nesw_resize_bits,    moz_nesw_resize_mask_bits,    8,  8  },
--  { moz_nwse_resize_bits,    moz_nwse_resize_mask_bits,    8,  8  },
--  { moz_none_bits,           moz_none_mask_bits,           0,  0  }
-+  { moz_hand_grab_bits,      moz_hand_grab_mask_bits,      10, 10, "5aca4d189052212118709018842178c0" },
-+  { moz_hand_grabbing_bits,  moz_hand_grabbing_mask_bits,  10, 10, "208530c400c041818281048008011002" },
-+  { moz_copy_bits,           moz_copy_mask_bits,           2,  2,  "08ffe1cb5fe6fc01f906f1c063814ccf" },
-+  { moz_alias_bits,          moz_alias_mask_bits,          2,  2,  "0876e1c15ff2fc01f906f1c363074c0f" },
-+  { moz_menu_bits,           moz_menu_mask_bits,           2,  2,  "08ffe1e65f80fcfdf9fff11263e74c48" },
-+  { moz_spinning_bits,       moz_spinning_mask_bits,       2,  2,  "08e8e1c95fe2fc01f976f1e063a24ccd" },
-+  { moz_zoom_in_bits,        moz_zoom_in_mask_bits,        6,  6,  "f41c0e382c94c0958e07017e42b00462" },
-+  { moz_zoom_out_bits,       moz_zoom_out_mask_bits,       6,  6,  "f41c0e382c97c0938e07017e42800402" },
-+  { moz_not_allowed_bits,    moz_not_allowed_mask_bits,    9,  9,  "03b6e0fcb3499374a867d041f52298f0" },
-+  { moz_vertical_text_bits,  moz_vertical_text_mask_bits,  8,  4,  "048008013003cff3c00c801001200000" },
-+  { moz_nesw_resize_bits,    moz_nesw_resize_mask_bits,    8,  8,  "50585d75b494802d0151028115016902" },
-+  { moz_nwse_resize_bits,    moz_nwse_resize_mask_bits,    8,  8,  "38c5dff7c7b8962045400281044508d2" },
-+  { moz_none_bits,           moz_none_mask_bits,           0,  0,  NULL }
- };
- 
- #endif /* nsGtkCursors_h__ */
-diff --git a/widget/src/gtk2/nsWindow.cpp b/widget/src/gtk2/nsWindow.cpp
-index 2fd6f64..25f1c2a 100644
---- a/widget/src/gtk2/nsWindow.cpp
-+++ b/widget/src/gtk2/nsWindow.cpp
-@@ -5602,9 +5602,17 @@ get_gtk_cursor(nsCursor aCursor)
-         break;
-     }
- 
--    // if by now we don't have a xcursor, this means we have to make a
--    // custom one
--    if (newType != 0xff) {
-+    // If by now we don't have a xcursor, this means we have to make a custom
-+    // one. First, we try creating a named cursor based on the hash of our
-+    // custom bitmap, as libXcursor has some magic to convert bitmapped cursors
-+    // to themed cursors
-+    if (newType != 0xFF && GtkCursors[newType].hash) {
-+        gdkcursor = gdk_cursor_new_from_name(gdk_display_get_default(),
-+                                             GtkCursors[newType].hash);
-+    }
-+
-+    // If we still don't have a xcursor, we now really create a bitmap cursor
-+    if (newType != 0xff && !gdkcursor) {
-         GdkPixbuf * cursor_pixbuf = gdk_pixbuf_new(GDK_COLORSPACE_RGB, TRUE, 8, 32, 32);
-         if (!cursor_pixbuf)
-             return NULL;
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch
deleted file mode 100644
index 7bc22a6..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 25 Feb 2012 10:34:52 +0100
-Subject: Bug 720682 - Don't crash an app using libxul because of the lack of
- je_malloc_usable_size_in_advance
-
----
- storage/src/mozStorageService.cpp |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/storage/src/mozStorageService.cpp b/storage/src/mozStorageService.cpp
-index 7c0a7a0..8a1aa65 100644
---- a/storage/src/mozStorageService.cpp
-+++ b/storage/src/mozStorageService.cpp
-@@ -367,7 +367,8 @@ static int sqliteMemSize(void* p)
- 
- static int sqliteMemRoundup(int n)
- {
--  n = je_malloc_usable_size_in_advance(n);
-+  if (je_malloc_usable_size_in_advance)
-+  	n = je_malloc_usable_size_in_advance(n);
- 
-   // jemalloc can return blocks of size 2 and 4, but SQLite requires that all
-   // allocations be 8-aligned.  So we round up sub-8 requests to 8.  This
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch
deleted file mode 100644
index cef3817..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From: ojab <ojab@ojab.ru>
-Date: Mon, 30 Jan 2012 15:53:21 +0100
-Subject: Bug 722127 - Bump required libvpx version to 1.0.0. r=tterribe
-
----
- configure.in |   12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 6b155e0..d83926e 100644
---- a/configure.in
-+++ b/configure.in
-@@ -5616,20 +5616,20 @@ if test -n "$MOZ_WEBM"; then
-                      [MOZ_NATIVE_LIBVPX_DEC_TEST=1],
-                      ([--with-system-libvpx requested but symbol vpx_codec_dec_init_ver not found]))
-         if test -n "$MOZ_NATIVE_LIBVPX_DEC_TEST" ; then
--            AC_MSG_CHECKING([for libvpx version >= v0.9.7])
-+            AC_MSG_CHECKING([for libvpx version >= v1.0.0])
-             dnl We need at least v0.9.7 to fix several crash bugs (for which we
--            dnl had local patches prior to v0.9.7).
-+            dnl had local patches prior to v1.0.0).
-             dnl
-             dnl This is a terrible test for the library version, but we don't
-             dnl have a good one. There is no version number in a public header,
-             dnl and testing the headers still doesn't guarantee we link against
-             dnl the right version. While we could call vpx_codec_version() at
-             dnl run-time, that would break cross-compiling. There are no
--            dnl additional exported symbols between the v0.9.7 release and the
--            dnl v0.9.6 one to check for.
-+            dnl additional exported decoder symbols between the v1.0.0 release
-+            dnl and the v0.9.7 one to check for.
-             AC_TRY_COMPILE([
-                 #include <vpx/vpx_decoder.h>
--                #if !defined(VPX_CODEC_USE_INPUT_PARTITION)
-+                #if !defined(VPX_CODEC_USE_INPUT_FRAGMENTS)
-                     #error "test failed."
-                 #endif
-                 ],
-@@ -5639,7 +5639,7 @@ if test -n "$MOZ_WEBM"; then
-                  MOZ_LIBVPX_INCLUDES="-I${LIBVPX_DIR}/include"
-                  MOZ_LIBVPX_LIBS="-L${LIBVPX_DIR}/lib -lvpx"],
-                 [AC_MSG_RESULT([no])
--                 AC_MSG_ERROR([--with-system-libvpx requested but it is not v0.9.7 or later])])
-+                 AC_MSG_ERROR([--with-system-libvpx requested but it is not v1.0.0 or later])])
-         fi
-         CFLAGS=$_SAVE_CFLAGS
-         LDFLAGS=$_SAVE_LDFLAGS
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch
deleted file mode 100644
index 1db1a28..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From: =?UTF-8?q?Martin=20Str=C3=A1nsk=C3=BD?= <stransky@redhat.com>
-Date: Fri, 10 Feb 2012 16:07:41 +0100
-Subject: Bug 725655 - gcc 4.7 build failures (missing headers). r=benjamin
-
----
- ipc/chromium/src/base/file_util_linux.cc       |    3 +++
- ipc/chromium/src/base/message_pump_libevent.cc |    3 +++
- ipc/chromium/src/base/time_posix.cc            |    3 +++
- 3 files changed, 9 insertions(+)
-
-diff --git a/ipc/chromium/src/base/file_util_linux.cc b/ipc/chromium/src/base/file_util_linux.cc
-index cca706f..171e44f 100644
---- a/ipc/chromium/src/base/file_util_linux.cc
-+++ b/ipc/chromium/src/base/file_util_linux.cc
-@@ -5,6 +5,9 @@
- #include "base/file_util.h"
- 
- #include <fcntl.h>
-+#if defined(ANDROID) || defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
- 
- #include <string>
- #include <vector>
-diff --git a/ipc/chromium/src/base/message_pump_libevent.cc b/ipc/chromium/src/base/message_pump_libevent.cc
-index 6194f79..9f31dbb 100644
---- a/ipc/chromium/src/base/message_pump_libevent.cc
-+++ b/ipc/chromium/src/base/message_pump_libevent.cc
-@@ -6,6 +6,9 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#if defined(ANDROID) || defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
- 
- #include "eintr_wrapper.h"
- #include "base/logging.h"
-diff --git a/ipc/chromium/src/base/time_posix.cc b/ipc/chromium/src/base/time_posix.cc
-index 8d1a1d5..abf2a56 100644
---- a/ipc/chromium/src/base/time_posix.cc
-+++ b/ipc/chromium/src/base/time_posix.cc
-@@ -13,6 +13,9 @@
- #else
- #include <time.h>
- #endif
-+#if defined(ANDROID) || defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
- 
- #include <limits>
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch
deleted file mode 100644
index b3e4c52..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 17 Feb 2012 16:53:34 +0100
-Subject: Bug 728229 - Allow to build with system python ply library
-
----
- config/autoconf.mk.in           |    2 ++
- configure.in                    |   10 ++++++++++
- xpcom/idl-parser/Makefile.in    |    2 ++
- xpcom/typelib/xpidl/Makefile.in |    2 ++
- 4 files changed, 16 insertions(+)
-
-diff --git a/config/autoconf.mk.in b/config/autoconf.mk.in
-index fccb1a9..e13dce4 100644
---- a/config/autoconf.mk.in
-+++ b/config/autoconf.mk.in
-@@ -685,6 +685,8 @@ JS_SHARED_LIBRARY = @JS_SHARED_LIBRARY@
- 
- MOZ_INSTRUMENT_EVENT_LOOP = @MOZ_INSTRUMENT_EVENT_LOOP@
- 
-+MOZ_SYSTEM_PLY = @MOZ_SYSTEM_PLY@
-+
- # We only want to do the pymake sanity on Windows, other os's can cope
- ifeq ($(HOST_OS_ARCH),WINNT)
- # Ensure invariants between GNU Make and pymake
-diff --git a/configure.in b/configure.in
-index d83926e..3c32ae8 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1021,6 +1021,16 @@ if test -z "$PYTHON"; then
-     AC_MSG_ERROR([python was not found in \$PATH])
- fi
- 
-+MOZ_ARG_WITH_BOOL(system-ply,
-+[  --with-system-ply       Use system installed python ply library],
-+    [if $PYTHON -c 'import ply' 2>&5; then
-+         MOZ_SYSTEM_PLY=1
-+     else
-+         AC_MSG_ERROR([python ply library is not found but --with-system-ply was requested])
-+     fi])
-+
-+AC_SUBST(MOZ_SYSTEM_PLY)
-+
- if test -z "$COMPILE_ENVIRONMENT"; then
-     NSINSTALL_BIN='$(PYTHON) $(topsrcdir)/config/nsinstall.py'
- fi
-diff --git a/xpcom/idl-parser/Makefile.in b/xpcom/idl-parser/Makefile.in
-index 20ca148..f5ff178 100644
---- a/xpcom/idl-parser/Makefile.in
-+++ b/xpcom/idl-parser/Makefile.in
-@@ -47,10 +47,12 @@ PARSER_SRCS = \
-   xpidl.py \
-   $(NULL)
- 
-+ifndef MOZ_SYSTEM_PLY
- PLY_PROGS = \
-   $(topsrcdir)/other-licenses/ply/ply/lex.py \
-   $(topsrcdir)/other-licenses/ply/ply/yacc.py \
-   $(NULL)
-+endif
- 
- include $(topsrcdir)/config/rules.mk
- 
-diff --git a/xpcom/typelib/xpidl/Makefile.in b/xpcom/typelib/xpidl/Makefile.in
-index 30f1a66..bcae13a 100644
---- a/xpcom/typelib/xpidl/Makefile.in
-+++ b/xpcom/typelib/xpidl/Makefile.in
-@@ -52,6 +52,7 @@ SDK_BINARY = \
-   $(DEPTH)/xpcom/idl-parser/xpidlyacc.py \
-   $(NULL)
- 
-+ifndef MOZ_SYSTEM_PLY
- $(SDK_BIN_DIR)/ply::
- 	$(NSINSTALL) -D $@
- 
-@@ -63,6 +64,7 @@ PLY_SRCS = \
- 
- export:: $(PLY_SRCS) $(SDK_BIN_DIR)/ply
- 	$(INSTALL) $(IFLAGS2) $^
-+endif
- 
- include $(topsrcdir)/config/rules.mk
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch
deleted file mode 100644
index 40b010d..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From: Zack Weinberg <zackw@panix.com>
-Date: Fri, 9 Mar 2012 11:07:16 +0100
-Subject: Bug 729817 - Allow the Nouveau driver with Mesa >= 8.0.1 - r=bjacob
-
----
- widget/src/xpwidgets/GfxInfoX11.cpp |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
-index c6b2ad3..a2d5e0b 100644
---- a/widget/src/xpwidgets/GfxInfoX11.cpp
-+++ b/widget/src/xpwidgets/GfxInfoX11.cpp
-@@ -314,9 +314,9 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
-             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-             aSuggestedDriverVersion.AssignLiteral("Not Mesa");
-         }
--        if (mIsNouveau) {
-+        if (mIsNouveau && version(mMajorVersion, mMinorVersion) < version(8,0)) {
-             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
--            aSuggestedDriverVersion.AssignLiteral("<Not the Nouveau driver>");
-+            aSuggestedDriverVersion.AssignLiteral("Mesa 8.0");
-         } else if (version(mMajorVersion, mMinorVersion, mRevisionVersion) < version(7,10,3)) {
-             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-             aSuggestedDriverVersion.AssignLiteral("Mesa 7.10.3");
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch
deleted file mode 100644
index 7e2f3a6..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From: Benoit Jacob <bjacob@mozilla.com>
-Date: Thu, 23 Feb 2012 17:23:29 -0500
-Subject: Bug 729817 - Block the Nouveau 3D driver as it's installed by
- default on OpenSuse 12.1 and crashes - r=mattwoodrow
-
----
- widget/src/xpwidgets/GfxInfoX11.cpp |    8 +++++++-
- widget/src/xpwidgets/GfxInfoX11.h   |    2 +-
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
-index 4974c5f..c6b2ad3 100644
---- a/widget/src/xpwidgets/GfxInfoX11.cpp
-+++ b/widget/src/xpwidgets/GfxInfoX11.cpp
-@@ -68,6 +68,7 @@ GfxInfo::Init()
-     mIsMesa = false;
-     mIsNVIDIA = false;
-     mIsFGLRX = false;
-+    mIsNouveau = false;
-     mHasTextureFromPixmap = false;
-     return GfxInfoBase::Init();
- }
-@@ -208,6 +209,8 @@ GfxInfo::GetData()
-         // with Mesa, the version string contains "Mesa major.minor" and that's all the version information we get:
-         // there is no actual driver version info.
-         whereToReadVersionNumbers = Mesa_in_version_string + strlen("Mesa");
-+        if (strcasestr(mVendor.get(), "nouveau"))
-+            mIsNouveau = true;
-     } else if (strstr(mVendor.get(), "NVIDIA Corporation")) {
-         mIsNVIDIA = true;
-         // with the NVIDIA driver, the version string contains "NVIDIA major.minor"
-@@ -311,7 +314,10 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
-             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-             aSuggestedDriverVersion.AssignLiteral("Not Mesa");
-         }
--        if (version(mMajorVersion, mMinorVersion, mRevisionVersion) < version(7,10,3)) {
-+        if (mIsNouveau) {
-+            *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-+            aSuggestedDriverVersion.AssignLiteral("<Not the Nouveau driver>");
-+        } else if (version(mMajorVersion, mMinorVersion, mRevisionVersion) < version(7,10,3)) {
-             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
-             aSuggestedDriverVersion.AssignLiteral("Mesa 7.10.3");
-         }
-diff --git a/widget/src/xpwidgets/GfxInfoX11.h b/widget/src/xpwidgets/GfxInfoX11.h
-index 03878ff..68bf976 100644
---- a/widget/src/xpwidgets/GfxInfoX11.h
-+++ b/widget/src/xpwidgets/GfxInfoX11.h
-@@ -93,7 +93,7 @@ private:
-   nsCString mRenderer;
-   nsCString mVersion;
-   nsCString mAdapterDescription;
--  bool mIsMesa, mIsNVIDIA, mIsFGLRX;
-+  bool mIsMesa, mIsNVIDIA, mIsFGLRX, mIsNouveau;
-   bool mHasTextureFromPixmap;
-   int mGLMajorVersion, mMajorVersion, mMinorVersion, mRevisionVersion;
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch
deleted file mode 100644
index a2ee22e..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From: Stefan <kdevel@vogtner.de>
-Date: Thu, 15 Mar 2012 11:01:08 -0700
-Subject: Bug 734490: fix build failures with Clang and GCC 4.7 in
- TestPoisonArea.cpp. r=zwol
-
----
- layout/base/tests/TestPoisonArea.cpp |   14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/layout/base/tests/TestPoisonArea.cpp b/layout/base/tests/TestPoisonArea.cpp
-index f81ce1b..6cf4afd 100644
---- a/layout/base/tests/TestPoisonArea.cpp
-+++ b/layout/base/tests/TestPoisonArea.cpp
-@@ -397,7 +397,7 @@ ReservePoisonArea()
-     uintptr_t result = (((uintptr_t(0x7FFFFFFFu) << 31) << 1 |
-                          uintptr_t(0xF0DEAFFFu)) &
-                         ~uintptr_t(PAGESIZE-1));
--    printf("INFO | poison area assumed at 0x%.*"PRIxPTR"\n", SIZxPTR, result);
-+    printf("INFO | poison area assumed at 0x%.*" PRIxPTR "\n", SIZxPTR, result);
-     return result;
-   } else {
-     // First see if we can allocate the preferred poison address from the OS.
-@@ -405,7 +405,7 @@ ReservePoisonArea()
-     void *result = ReserveRegion(candidate, false);
-     if (result == (void *)candidate) {
-       // success - inaccessible page allocated
--      printf("INFO | poison area allocated at 0x%.*"PRIxPTR
-+      printf("INFO | poison area allocated at 0x%.*" PRIxPTR
-              " (preferred addr)\n", SIZxPTR, (uintptr_t)result);
-       return candidate;
-     }
-@@ -416,7 +416,7 @@ ReservePoisonArea()
-       // success - selected page cannot be usable memory
-       if (result != MAP_FAILED)
-         ReleaseRegion(result);
--      printf("INFO | poison area assumed at 0x%.*"PRIxPTR
-+      printf("INFO | poison area assumed at 0x%.*" PRIxPTR
-              " (preferred addr)\n", SIZxPTR, candidate);
-       return candidate;
-     }
-@@ -424,7 +424,7 @@ ReservePoisonArea()
-     // The preferred address is already in use.  Did the OS give us a
-     // consolation prize?
-     if (result != MAP_FAILED) {
--      printf("INFO | poison area allocated at 0x%.*"PRIxPTR
-+      printf("INFO | poison area allocated at 0x%.*" PRIxPTR
-              " (consolation prize)\n", SIZxPTR, (uintptr_t)result);
-       return (uintptr_t)result;
-     }
-@@ -433,7 +433,7 @@ ReservePoisonArea()
-     // the address.
-     result = ReserveRegion(0, false);
-     if (result != MAP_FAILED) {
--      printf("INFO | poison area allocated at 0x%.*"PRIxPTR
-+      printf("INFO | poison area allocated at 0x%.*" PRIxPTR
-              " (fallback)\n", SIZxPTR, (uintptr_t)result);
-       return (uintptr_t)result;
-     }
-@@ -455,7 +455,7 @@ ReservePositiveControl()
-     printf("ERROR | allocating positive control | %s\n", LastErrMsg());
-     return 0;
-   }
--  printf("INFO | positive control allocated at 0x%.*"PRIxPTR"\n",
-+  printf("INFO | positive control allocated at 0x%.*" PRIxPTR "\n",
-          SIZxPTR, (uintptr_t)result);
-   return (uintptr_t)result;
- }
-@@ -486,7 +486,7 @@ ReserveNegativeControl()
-     return 0;
-   }
- 
--  printf("INFO | negative control allocated at 0x%.*"PRIxPTR"\n",
-+  printf("INFO | negative control allocated at 0x%.*" PRIxPTR "\n",
-          SIZxPTR, (uintptr_t)result);
-   return (uintptr_t)result;
- }
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch
deleted file mode 100644
index 17b6678..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 20 Apr 2012 11:26:22 +0200
-Subject: Bug 747322 - Fix jemalloc mmap wrapper for s390x
-
----
- memory/jemalloc/jemalloc.c |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/memory/jemalloc/jemalloc.c b/memory/jemalloc/jemalloc.c
-index d792728..147e18f 100644
---- a/memory/jemalloc/jemalloc.c
-+++ b/memory/jemalloc/jemalloc.c
-@@ -403,9 +403,9 @@ void *_mmap(void *addr, size_t length, int prot, int flags,
- 	struct {
- 		void *addr;
- 		size_t length;
--		int prot;
--		int flags;
--		int fd;
-+		long prot;
-+		long flags;
-+		long fd;
- 		off_t offset;
- 	} args = { addr, length, prot, flags, fd, offset };
- 	return (void *) syscall(SYS_mmap, &args);
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch
deleted file mode 100644
index ac855b2..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From: Mike Hommey <mh+mozilla@glandium.org>
-Date: Thu, 7 Jun 2012 10:41:59 +0200
-Subject: Bug 761082 - Only export TabMessageUtils.h in mozilla/dom. r=cjones
-
----
- dom/ipc/Makefile.in         |    2 +-
- dom/ipc/PBrowser.ipdl       |    2 +-
- dom/ipc/TabMessageUtils.cpp |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dom/ipc/Makefile.in b/dom/ipc/Makefile.in
-index 8d02e8b..ea37fad 100644
---- a/dom/ipc/Makefile.in
-+++ b/dom/ipc/Makefile.in
-@@ -53,7 +53,7 @@ DIRS += tests
- endif
- endif
- 
--EXPORTS = TabMessageUtils.h PCOMContentPermissionRequestChild.h
-+EXPORTS = PCOMContentPermissionRequestChild.h
- 
- EXPORTS_NAMESPACES = mozilla/dom
- 
-diff --git a/dom/ipc/PBrowser.ipdl b/dom/ipc/PBrowser.ipdl
-index f9a25fc..10a8592 100644
---- a/dom/ipc/PBrowser.ipdl
-+++ b/dom/ipc/PBrowser.ipdl
-@@ -44,7 +44,7 @@ include protocol PContentPermissionRequest;
- include protocol PRenderFrame;
- include protocol POfflineCacheUpdate;
- 
--include "TabMessageUtils.h";
-+include "mozilla/dom/TabMessageUtils.h";
- include "gfxMatrix.h";
- include "mozilla/net/NeckoMessageUtils.h";
- include "IPC/nsGUIEventIPC.h";
-diff --git a/dom/ipc/TabMessageUtils.cpp b/dom/ipc/TabMessageUtils.cpp
-index 201d7d4..44b7e44 100644
---- a/dom/ipc/TabMessageUtils.cpp
-+++ b/dom/ipc/TabMessageUtils.cpp
-@@ -36,7 +36,7 @@
-  *
-  * ***** END LICENSE BLOCK ***** */
- 
--#include "TabMessageUtils.h"
-+#include "mozilla/dom/TabMessageUtils.h"
- #include "nsCOMPtr.h"
- #include "nsIDOMEvent.h"
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Fix-build-error-in-MIPS-SIMD-when-compiling-with-mfpxx.patch b/recipes-mozilla/firefox/firefox/fixes/Fix-build-error-in-MIPS-SIMD-when-compiling-with-mfpxx.patch
new file mode 100644
index 0000000..d709caa
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Fix-build-error-in-MIPS-SIMD-when-compiling-with-mfpxx.patch
@@ -0,0 +1,545 @@
+From 329b77f892120fe669c08ea6cc0fcbab2e11af99 Mon Sep 17 00:00:00 2001
+From: James Cowgill <james410@cowgill.org.uk>
+Date: Sat, 15 Aug 2015 13:30:14 +0100
+Subject: Fix build error in MIPS SIMD when compiling with -mfpxx
+
+When compiled with -mfpxx (which is now the default on Debian), there are
+some restrictions on the use of odd-numbered FP registers. More details
+about FPXX can be found here:
+https://dmz-portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking
+
+This commit simply changes all uses of FP registers to an even-numbered
+equivalent like this:
+ f0 -> f0
+ f1 -> f2
+ f2 -> f4
+ ...
+ f8 -> f16
+
+This commit should have no observable effect except that the MIPS assembly
+will now compile with -mfpxx.
+---
+ media/libjpeg/simd/jsimd_mips_dspr2.S | 392 +++++++++++++++++-----------------
+ 1 file changed, 196 insertions(+), 196 deletions(-)
+
+diff --git a/media/libjpeg/simd/jsimd_mips_dspr2.S b/media/libjpeg/simd/jsimd_mips_dspr2.S
+index 4572a51..e4cfcce 100644
+--- a/media/libjpeg/simd/jsimd_mips_dspr2.S
++++ b/media/libjpeg/simd/jsimd_mips_dspr2.S
+@@ -2840,54 +2840,54 @@ LEAF_MIPS_DSPR2(jsimd_quantize_float_mips_dspr2)
+     mtc1       t1, f0
+     li         t0, 63
+ 0:
+-    lwc1       f1, 0(a2)
+-    lwc1       f5, 0(a1)
+-    lwc1       f2, 4(a2)
+-    lwc1       f6, 4(a1)
+-    lwc1       f3, 8(a2)
+-    lwc1       f7, 8(a1)
+-    lwc1       f4, 12(a2)
+-    lwc1       f8, 12(a1)
+-    madd.s     f1, f0, f1, f5
+-    madd.s     f2, f0, f2, f6
+-    madd.s     f3, f0, f3, f7
+-    madd.s     f4, f0, f4, f8
+-    lwc1       f5, 16(a1)
+-    lwc1       f6, 20(a1)
+-    trunc.w.s  f1, f1
++    lwc1       f2, 0(a2)
++    lwc1       f10, 0(a1)
++    lwc1       f4, 4(a2)
++    lwc1       f12, 4(a1)
++    lwc1       f6, 8(a2)
++    lwc1       f14, 8(a1)
++    lwc1       f8, 12(a2)
++    lwc1       f16, 12(a1)
++    madd.s     f2, f0, f2, f10
++    madd.s     f4, f0, f4, f12
++    madd.s     f6, f0, f6, f14
++    madd.s     f8, f0, f8, f16
++    lwc1       f10, 16(a1)
++    lwc1       f12, 20(a1)
+     trunc.w.s  f2, f2
+-    trunc.w.s  f3, f3
+     trunc.w.s  f4, f4
+-    lwc1       f7, 24(a1)
+-    lwc1       f8, 28(a1)
+-    mfc1       t1, f1
+-    mfc1       t2, f2
+-    mfc1       t3, f3
+-    mfc1       t4, f4
+-    lwc1       f1, 16(a2)
+-    lwc1       f2, 20(a2)
+-    lwc1       f3, 24(a2)
+-    lwc1       f4, 28(a2)
+-    madd.s     f1, f0, f1, f5
+-    madd.s     f2, f0, f2, f6
+-    madd.s     f3, f0, f3, f7
+-    madd.s     f4, f0, f4, f8
++    trunc.w.s  f6, f6
++    trunc.w.s  f8, f8
++    lwc1       f14, 24(a1)
++    lwc1       f16, 28(a1)
++    mfc1       t1, f2
++    mfc1       t2, f4
++    mfc1       t3, f6
++    mfc1       t4, f8
++    lwc1       f2, 16(a2)
++    lwc1       f4, 20(a2)
++    lwc1       f6, 24(a2)
++    lwc1       f8, 28(a2)
++    madd.s     f2, f0, f2, f10
++    madd.s     f4, f0, f4, f12
++    madd.s     f6, f0, f6, f14
++    madd.s     f8, f0, f8, f16
+     addiu      t1, t1, -16384
+     addiu      t2, t2, -16384
+     addiu      t3, t3, -16384
+     addiu      t4, t4, -16384
+-    trunc.w.s  f1, f1
+     trunc.w.s  f2, f2
+-    trunc.w.s  f3, f3
+     trunc.w.s  f4, f4
++    trunc.w.s  f6, f6
++    trunc.w.s  f8, f8
+     sh         t1, 0(a0)
+     sh         t2, 2(a0)
+     sh         t3, 4(a0)
+     sh         t4, 6(a0)
+-    mfc1       t1, f1
+-    mfc1       t2, f2
+-    mfc1       t3, f3
+-    mfc1       t4, f4
++    mfc1       t1, f2
++    mfc1       t2, f4
++    mfc1       t3, f6
++    mfc1       t4, f8
+     addiu      t0, t0, -8
+     addiu      a2, a2, 32
+     addiu      a1, a1, 32
+@@ -4150,32 +4150,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 4(a0)
+-    swc1     f1, 0(a2)
+-    swc1     f2, 4(a2)
+-    swc1     f3, 8(a2)
++    swc1     f2, 0(a2)
++    swc1     f4, 4(a2)
++    swc1     f6, 8(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 12(a2)
+-    swc1     f5, 16(a2)
+-    swc1     f6, 20(a2)
+-    swc1     f7, 24(a2)
+-    swc1     f8, 28(a2)
++    swc1     f8, 12(a2)
++    swc1     f10, 16(a2)
++    swc1     f12, 20(a2)
++    swc1     f14, 24(a2)
++    swc1     f16, 28(a2)
+     //elemr 1
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4193,32 +4193,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 8(a0)
+-    swc1     f1, 32(a2)
+-    swc1     f2, 36(a2)
+-    swc1     f3, 40(a2)
++    swc1     f2, 32(a2)
++    swc1     f4, 36(a2)
++    swc1     f6, 40(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 44(a2)
+-    swc1     f5, 48(a2)
+-    swc1     f6, 52(a2)
+-    swc1     f7, 56(a2)
+-    swc1     f8, 60(a2)
++    swc1     f8, 44(a2)
++    swc1     f10, 48(a2)
++    swc1     f12, 52(a2)
++    swc1     f14, 56(a2)
++    swc1     f16, 60(a2)
+     //elemr 2
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4236,32 +4236,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 12(a0)
+-    swc1     f1, 64(a2)
+-    swc1     f2, 68(a2)
+-    swc1     f3, 72(a2)
++    swc1     f2, 64(a2)
++    swc1     f4, 68(a2)
++    swc1     f6, 72(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 76(a2)
+-    swc1     f5, 80(a2)
+-    swc1     f6, 84(a2)
+-    swc1     f7, 88(a2)
+-    swc1     f8, 92(a2)
++    swc1     f8, 76(a2)
++    swc1     f10, 80(a2)
++    swc1     f12, 84(a2)
++    swc1     f14, 88(a2)
++    swc1     f16, 92(a2)
+     //elemr 3
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4279,32 +4279,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 16(a0)
+-    swc1     f1, 96(a2)
+-    swc1     f2, 100(a2)
+-    swc1     f3, 104(a2)
++    swc1     f2, 96(a2)
++    swc1     f4, 100(a2)
++    swc1     f6, 104(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 108(a2)
+-    swc1     f5, 112(a2)
+-    swc1     f6, 116(a2)
+-    swc1     f7, 120(a2)
+-    swc1     f8, 124(a2)
++    swc1     f8, 108(a2)
++    swc1     f10, 112(a2)
++    swc1     f12, 116(a2)
++    swc1     f14, 120(a2)
++    swc1     f16, 124(a2)
+     //elemr 4
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4322,32 +4322,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 20(a0)
+-    swc1     f1, 128(a2)
+-    swc1     f2, 132(a2)
+-    swc1     f3, 136(a2)
++    swc1     f2, 128(a2)
++    swc1     f4, 132(a2)
++    swc1     f6, 136(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 140(a2)
+-    swc1     f5, 144(a2)
+-    swc1     f6, 148(a2)
+-    swc1     f7, 152(a2)
+-    swc1     f8, 156(a2)
++    swc1     f8, 140(a2)
++    swc1     f10, 144(a2)
++    swc1     f12, 148(a2)
++    swc1     f14, 152(a2)
++    swc1     f16, 156(a2)
+     //elemr 5
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4365,32 +4365,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 24(a0)
+-    swc1     f1, 160(a2)
+-    swc1     f2, 164(a2)
+-    swc1     f3, 168(a2)
++    swc1     f2, 160(a2)
++    swc1     f4, 164(a2)
++    swc1     f6, 168(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 172(a2)
+-    swc1     f5, 176(a2)
+-    swc1     f6, 180(a2)
+-    swc1     f7, 184(a2)
+-    swc1     f8, 188(a2)
++    swc1     f8, 172(a2)
++    swc1     f10, 176(a2)
++    swc1     f12, 180(a2)
++    swc1     f14, 184(a2)
++    swc1     f16, 188(a2)
+     //elemr 6
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4408,32 +4408,32 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
+     lw       t0, 28(a0)
+-    swc1     f1, 192(a2)
+-    swc1     f2, 196(a2)
+-    swc1     f3, 200(a2)
++    swc1     f2, 192(a2)
++    swc1     f4, 196(a2)
++    swc1     f6, 200(a2)
+     addu     t0, t0, a1
+-    swc1     f4, 204(a2)
+-    swc1     f5, 208(a2)
+-    swc1     f6, 212(a2)
+-    swc1     f7, 216(a2)
+-    swc1     f8, 220(a2)
++    swc1     f8, 204(a2)
++    swc1     f10, 208(a2)
++    swc1     f12, 212(a2)
++    swc1     f14, 216(a2)
++    swc1     f16, 220(a2)
+     //elemr 7
+     lbu      t1, 0(t0)
+     lbu      t2, 1(t0)
+@@ -4451,30 +4451,30 @@ LEAF_MIPS_DSPR2(jsimd_convsamp_float_mips_dspr2)
+     addiu    t6, t6, -128
+     addiu    t7, t7, -128
+     addiu    t8, t8, -128
+-    mtc1     t1, f1
+-    mtc1     t2, f2
+-    mtc1     t3, f3
+-    mtc1     t4, f4
+-    mtc1     t5, f5
+-    mtc1     t6, f6
+-    mtc1     t7, f7
+-    mtc1     t8, f8
+-    cvt.s.w  f1, f1
++    mtc1     t1, f2
++    mtc1     t2, f4
++    mtc1     t3, f6
++    mtc1     t4, f8
++    mtc1     t5, f10
++    mtc1     t6, f12
++    mtc1     t7, f14
++    mtc1     t8, f16
+     cvt.s.w  f2, f2
+-    cvt.s.w  f3, f3
+     cvt.s.w  f4, f4
+-    cvt.s.w  f5, f5
+     cvt.s.w  f6, f6
+-    cvt.s.w  f7, f7
+     cvt.s.w  f8, f8
+-    swc1     f1, 224(a2)
+-    swc1     f2, 228(a2)
+-    swc1     f3, 232(a2)
+-    swc1     f4, 236(a2)
+-    swc1     f5, 240(a2)
+-    swc1     f6, 244(a2)
+-    swc1     f7, 248(a2)
+-    swc1     f8, 252(a2)
++    cvt.s.w  f10, f10
++    cvt.s.w  f12, f12
++    cvt.s.w  f14, f14
++    cvt.s.w  f16, f16
++    swc1     f2, 224(a2)
++    swc1     f4, 228(a2)
++    swc1     f6, 232(a2)
++    swc1     f8, 236(a2)
++    swc1     f10, 240(a2)
++    swc1     f12, 244(a2)
++    swc1     f14, 248(a2)
++    swc1     f16, 252(a2)
+ 
+     j        ra
+      nop
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch b/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch
deleted file mode 100644
index c1002a9..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Thu, 14 Jul 2011 17:18:56 +0200
-Subject: Fix some tests using CurProcD where GreD should be used
-
----
- dom/plugins/test/unit/head_plugins.js                    |    2 +-
- netwerk/test/unit/test_socks.js                          |    2 +-
- toolkit/mozapps/extensions/test/xpcshell/test_plugins.js |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dom/plugins/test/unit/head_plugins.js b/dom/plugins/test/unit/head_plugins.js
-index ddb78f5..ca32106 100644
---- a/dom/plugins/test/unit/head_plugins.js
-+++ b/dom/plugins/test/unit/head_plugins.js
-@@ -38,7 +38,7 @@
- 
- // Finds the test plugin library
- function get_test_plugin() {
--  var plugins = gDirSvc.get("CurProcD", Ci.nsILocalFile);
-+  var plugins = gDirSvc.get("GreD", Ci.nsILocalFile);
-   plugins.append("plugins");
-   do_check_true(plugins.exists());
-   var plugin = plugins.clone();
-diff --git a/netwerk/test/unit/test_socks.js b/netwerk/test/unit/test_socks.js
-index bbaeffa..f692d97 100644
---- a/netwerk/test/unit/test_socks.js
-+++ b/netwerk/test/unit/test_socks.js
-@@ -36,7 +36,7 @@ function runScriptSubprocess(script, args)
- {
-   // logic copied from ted's crashreporter unit test
-   var ds = new DirectoryService();
--  var bin = ds.get("CurProcD", Ci.nsILocalFile);
-+  var bin = ds.get("GreD", Ci.nsILocalFile);
- 
-   bin.append("xpcshell");
-   if (!bin.exists()) {
-diff --git a/toolkit/mozapps/extensions/test/xpcshell/test_plugins.js b/toolkit/mozapps/extensions/test/xpcshell/test_plugins.js
-index 71e9ac1..0bde3e2 100644
---- a/toolkit/mozapps/extensions/test/xpcshell/test_plugins.js
-+++ b/toolkit/mozapps/extensions/test/xpcshell/test_plugins.js
-@@ -18,7 +18,7 @@ function run_test() {
- 
- // Finds the test plugin library
- function get_test_plugin() {
--  var plugins = Services.dirsvc.get("CurProcD", AM_Ci.nsILocalFile);
-+  var plugins = Services.dirsvc.get("GreD", AM_Ci.nsILocalFile);
-   plugins.append("plugins");
-   do_check_true(plugins.exists());
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch b/recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch
deleted file mode 100644
index 216792f..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 25 Feb 2012 12:03:56 +0100
-Subject: Load dependent libraries with their real path to avoid confusing gdb
- when they are symlinks
-
----
- xpcom/glue/standalone/nsGlueLinkingDlopen.cpp |    3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp b/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp
-index 959bd69..61b18f8 100644
---- a/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp
-+++ b/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp
-@@ -206,6 +206,9 @@ preload(const char *file)
- static void
- ReadDependentCB(const char *aDependentLib, bool do_preload)
- {
-+    char lib[MAXPATHLEN];
-+    if (realpath(aDependentLib, lib))
-+        aDependentLib = lib;
- #if defined(LINUX) && !defined(ANDROID)
-     if (do_preload)
-         preload(aDependentLib);
diff --git a/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch b/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch
deleted file mode 100644
index 8ed4881..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Sat, 22 Nov 2008 09:35:23 +0100
-Subject: Properly launch applications set in $HOME/.mailcap
-
-Replaces the previous patch in a much simpler way.
----
- uriloader/exthandler/unix/nsMIMEInfoUnix.cpp |   15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/uriloader/exthandler/unix/nsMIMEInfoUnix.cpp b/uriloader/exthandler/unix/nsMIMEInfoUnix.cpp
-index 5d7f758..81b8efb 100644
---- a/uriloader/exthandler/unix/nsMIMEInfoUnix.cpp
-+++ b/uriloader/exthandler/unix/nsMIMEInfoUnix.cpp
-@@ -99,6 +99,12 @@ nsMIMEInfoUnix::LoadUriInternal(nsIURI * aURI)
- NS_IMETHODIMP
- nsMIMEInfoUnix::GetHasDefaultHandler(bool *_retval)
- {
-+  // if mDefaultApplication is set, it means the application has been set from
-+  // either /etc/mailcap or ${HOME}/.mailcap, in which case we don't want to
-+  // give the GNOME answer.
-+  if (mDefaultApplication)
-+    return nsMIMEInfoImpl::GetHasDefaultHandler(_retval);
-+
-   *_retval = false;
-   nsRefPtr<nsMIMEInfoBase> mimeInfo = nsGNOMERegistry::GetFromType(mSchemeOrType);
-   if (!mimeInfo) {
-@@ -132,13 +138,18 @@ nsMIMEInfoUnix::GetHasDefaultHandler(bool *_retval)
-   }
- #endif
- 
--  // If we didn't find a VFS handler, fallback.
--  return nsMIMEInfoImpl::GetHasDefaultHandler(_retval);
-+  return NS_OK;
- }
- 
- nsresult
- nsMIMEInfoUnix::LaunchDefaultWithFile(nsIFile *aFile)
- {
-+  // if mDefaultApplication is set, it means the application has been set from
-+  // either /etc/mailcap or ${HOME}/.mailcap, in which case we don't want to
-+  // give the GNOME answer.
-+  if (mDefaultApplication)
-+    return nsMIMEInfoImpl::LaunchDefaultWithFile(aFile);
-+
-   nsCAutoString nativePath;
-   aFile->GetNativePath(nativePath);
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch b/recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch
deleted file mode 100644
index 2fdc6ae..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch
+++ /dev/null
@@ -1,351 +0,0 @@
-From: Trevor Saunders <trev.saunders@gmail.com>
-Date: Wed, 4 Jan 2012 20:54:17 -0500
-Subject: bug 693343 - a11y disabled in Gnome 3 when GNOME_ACCESSIBILITY is
- unset patch=mgorse, tbsaunde r=tbsaunde, karlt
-
----
- accessible/src/atk/Makefile.in                     |    4 +
- accessible/src/atk/nsApplicationAccessibleWrap.cpp |  156 ++++++++++++++++----
- accessible/src/base/nsAccessibilityService.h       |   15 ++
- widget/src/gtk2/nsWindow.cpp                       |   48 +-----
- widget/src/gtk2/nsWindow.h                         |    3 -
- 5 files changed, 157 insertions(+), 69 deletions(-)
-
-diff --git a/accessible/src/atk/Makefile.in b/accessible/src/atk/Makefile.in
-index 4934fd1..9fe1f48 100644
---- a/accessible/src/atk/Makefile.in
-+++ b/accessible/src/atk/Makefile.in
-@@ -92,6 +92,10 @@ include $(topsrcdir)/config/rules.mk
- CFLAGS		+= $(MOZ_GTK2_CFLAGS)
- CXXFLAGS	+= $(MOZ_GTK2_CFLAGS)
- 
-+ifdef MOZ_ENABLE_DBUS
-+CXXFLAGS += $(MOZ_DBUS_CFLAGS)
-+endif
-+
- LOCAL_INCLUDES += \
-   -I$(srcdir) \
-   -I$(srcdir)/../base \
-diff --git a/accessible/src/atk/nsApplicationAccessibleWrap.cpp b/accessible/src/atk/nsApplicationAccessibleWrap.cpp
-index c8ee40c..5937883 100644
---- a/accessible/src/atk/nsApplicationAccessibleWrap.cpp
-+++ b/accessible/src/atk/nsApplicationAccessibleWrap.cpp
-@@ -44,7 +44,7 @@
- #include "nsMai.h"
- #include "prlink.h"
- #include "prenv.h"
--#include "nsIPrefBranch.h"
-+#include "nsIGConfService.h"
- #include "nsIServiceManager.h"
- #include "nsAutoPtr.h"
- #include "nsAccessibilityService.h"
-@@ -52,6 +52,11 @@
- 
- #include <gtk/gtk.h>
- #include <atk/atk.h>
-+#ifdef MOZ_ENABLE_DBUS
-+#include <dbus/dbus.h>
-+#endif
-+
-+using namespace mozilla::a11y;
- 
- typedef GType (* AtkGetTypeType) (void);
- GType g_atk_hyperlink_impl_type = G_TYPE_INVALID;
-@@ -60,11 +65,6 @@ static PRLibrary *sATKLib = nsnull;
- static const char sATKLibName[] = "libatk-1.0.so.0";
- static const char sATKHyperlinkImplGetTypeSymbol[] =
-     "atk_hyperlink_impl_get_type";
--static const char sAccEnv [] = "GNOME_ACCESSIBILITY";
--static const char sSysPrefService [] =
--    "@mozilla.org/system-preference-service;1";
--static const char sAccessibilityKey [] =
--    "config.use_system_prefs.accessibility";
- 
- /* gail function pointer */
- static guint (* gail_add_global_event_listener) (GSignalEmissionHook listener,
-@@ -614,26 +614,7 @@ toplevel_event_watcher(GSignalInvocationHint* ihint,
- bool
- nsApplicationAccessibleWrap::Init()
- {
--    // XXX following code is copied from widget/src/gtk2/nsWindow.cpp
--    // we should put it to somewhere that can be used from both modules
--    // see bug 390761
--
--    // check if accessibility enabled/disabled by environment variable
--    bool isGnomeATEnabled = false;
--    const char *envValue = PR_GetEnv(sAccEnv);
--    if (envValue) {
--        isGnomeATEnabled = !!atoi(envValue);
--    } else {
--        //check gconf-2 setting
--        nsresult rv;
--        nsCOMPtr<nsIPrefBranch> sysPrefService =
--            do_GetService(sSysPrefService, &rv);
--        if (NS_SUCCEEDED(rv) && sysPrefService) {
--            sysPrefService->GetBoolPref(sAccessibilityKey, &isGnomeATEnabled);
--        }
--    }
--
--    if (isGnomeATEnabled) {
-+    if (ShouldA11yBeEnabled()) {
-         // load and initialize gail library
-         nsresult rv = LoadGtkModule(sGail);
-         if (NS_SUCCEEDED(rv)) {
-@@ -882,3 +863,126 @@ LoadGtkModule(GnomeAccessibilityModule& aModule)
-     }
-     return NS_OK;
- }
-+
-+namespace mozilla {
-+namespace a11y {
-+
-+  static const char sAccEnv [] = "GNOME_ACCESSIBILITY";
-+#ifdef MOZ_ENABLE_DBUS
-+static DBusPendingCall *sPendingCall = nsnull;
-+#endif
-+
-+void
-+PreInit()
-+{
-+#ifdef MOZ_ENABLE_DBUS
-+  static bool sChecked = FALSE;
-+  if (sChecked)
-+    return;
-+
-+  sChecked = TRUE;
-+
-+  // dbus is only checked if GNOME_ACCESSIBILITY is unset
-+  if (PR_GetEnv(sAccEnv) || !PR_GetEnv("DBUS_SESSION_BUS_ADDRESS"))
-+    return;
-+
-+  DBusConnection* bus = dbus_bus_get(DBUS_BUS_SESSION, nsnull);
-+  if (!bus)
-+    return;
-+
-+  dbus_connection_set_exit_on_disconnect(bus, FALSE);
-+
-+  DBusMessage *message;
-+  message = dbus_message_new_method_call("org.a11y.Bus", "/org/a11y/bus",
-+                                         "org.freedesktop.DBus.Properties",
-+                                         "Get");
-+  if (!message)
-+    goto dbus_done;
-+
-+  static const char* iface = "org.a11y.Status";
-+  static const char* member = "IsEnabled";
-+  dbus_message_append_args(message, DBUS_TYPE_STRING, &iface,
-+                           DBUS_TYPE_STRING, &member, DBUS_TYPE_INVALID);
-+  dbus_connection_send_with_reply(bus, message, &sPendingCall, 1000);
-+  dbus_message_unref(message);
-+
-+dbus_done:
-+  dbus_connection_unref(bus);
-+#endif
-+}
-+
-+bool
-+ShouldA11yBeEnabled()
-+{
-+  static bool sChecked = false, sShouldEnable = false;
-+  if (sChecked)
-+    return sShouldEnable;
-+
-+  sChecked = true;
-+
-+  // check if accessibility enabled/disabled by environment variable
-+  const char* envValue = PR_GetEnv(sAccEnv);
-+  if (envValue)
-+    return sShouldEnable = !!atoi(envValue);
-+
-+#ifdef MOZ_ENABLE_DBUS
-+  PreInit();
-+  bool dbusSuccess = false;
-+  DBusMessage *reply = nsnull;
-+  if (!sPendingCall)
-+    goto dbus_done;
-+
-+  dbus_pending_call_block(sPendingCall);
-+  reply = dbus_pending_call_steal_reply(sPendingCall);
-+  dbus_pending_call_unref(sPendingCall);
-+  sPendingCall = nsnull;
-+  if (!reply ||
-+      dbus_message_get_type(reply) != DBUS_MESSAGE_TYPE_METHOD_RETURN ||
-+      strcmp(dbus_message_get_signature (reply), DBUS_TYPE_VARIANT_AS_STRING))
-+    goto dbus_done;
-+
-+  DBusMessageIter iter, iter_variant, iter_struct;
-+  dbus_bool_t dResult;
-+  dbus_message_iter_init(reply, &iter);
-+  dbus_message_iter_recurse (&iter, &iter_variant);
-+  switch (dbus_message_iter_get_arg_type(&iter_variant)) {
-+    case DBUS_TYPE_STRUCT:
-+      // at-spi2-core 2.2.0-2.2.1 had a bug where it returned a struct
-+      dbus_message_iter_recurse(&iter_variant, &iter_struct);
-+      if (dbus_message_iter_get_arg_type(&iter_struct) == DBUS_TYPE_BOOLEAN) {
-+        dbus_message_iter_get_basic(&iter_struct, &dResult);
-+        sShouldEnable = dResult;
-+        dbusSuccess = true;
-+      }
-+
-+      break;
-+    case DBUS_TYPE_BOOLEAN:
-+      dbus_message_iter_get_basic(&iter_variant, &dResult);
-+      sShouldEnable = dResult;
-+      dbusSuccess = true;
-+      break;
-+    default:
-+      break;
-+  }
-+
-+dbus_done:
-+  if (reply)
-+    dbus_message_unref(reply);
-+
-+  if (dbusSuccess)
-+    return sShouldEnable;
-+#endif
-+
-+  //check gconf-2 setting
-+static const char sGconfAccessibilityKey[] =
-+    "/desktop/gnome/interface/accessibility";
-+  nsresult rv = NS_OK;
-+  nsCOMPtr<nsIGConfService> gconf =
-+    do_GetService(NS_GCONFSERVICE_CONTRACTID, &rv);
-+  if (NS_SUCCEEDED(rv) && gconf)
-+    gconf->GetBool(NS_LITERAL_CSTRING(sGconfAccessibilityKey), &sShouldEnable);
-+
-+  return sShouldEnable;
-+}
-+} // namespace a11y
-+} // namespace mozilla
-diff --git a/accessible/src/base/nsAccessibilityService.h b/accessible/src/base/nsAccessibilityService.h
-index 841814a..4284c80 100644
---- a/accessible/src/base/nsAccessibilityService.h
-+++ b/accessible/src/base/nsAccessibilityService.h
-@@ -56,6 +56,21 @@ namespace a11y {
-  */
- FocusManager* FocusMgr();
- 
-+#ifdef MOZ_ACCESSIBILITY_ATK
-+/**
-+ * Perform initialization that should be done as soon as possible, in order
-+ * to minimize startup time.
-+ * XXX: this function and the next defined in nsApplicationAccessibleWrap.cpp
-+ */
-+void PreInit();
-+
-+/**
-+ * Is platform accessibility enabled.
-+ * Only used on linux with atk for now.
-+ */
-+bool ShouldA11yBeEnabled();
-+#endif
-+
- } // namespace a11y
- } // namespace mozilla
- 
-diff --git a/widget/src/gtk2/nsWindow.cpp b/widget/src/gtk2/nsWindow.cpp
-index 25f1c2a..8f8cd40 100644
---- a/widget/src/gtk2/nsWindow.cpp
-+++ b/widget/src/gtk2/nsWindow.cpp
-@@ -110,19 +110,10 @@
- #include "nsIPropertyBag2.h"
- 
- #ifdef ACCESSIBILITY
--#include "nsIAccessibilityService.h"
-+#include "nsAccessibilityService.h"
- #include "nsIAccessibleDocument.h"
--#include "prenv.h"
--#include "stdlib.h"
- 
- using namespace mozilla;
--
--static bool sAccessibilityChecked = false;
--/* static */
--bool nsWindow::sAccessibilityEnabled = false;
--static const char sSysPrefService [] = "@mozilla.org/system-preference-service;1";
--static const char sAccEnv [] = "GNOME_ACCESSIBILITY";
--static const char sAccessibilityKey [] = "config.use_system_prefs.accessibility";
- #endif
- 
- /* For SetIcon */
-@@ -1116,9 +1107,8 @@ nsWindow::Show(bool aState)
-     }
- 
- #ifdef ACCESSIBILITY
--    if (aState && sAccessibilityEnabled) {
-+    if (aState && a11y::ShouldA11yBeEnabled())
-         CreateRootAccessible();
--    }
- #endif
- 
-     NativeShow(aState);
-@@ -3890,6 +3880,11 @@ nsWindow::Create(nsIWidget        *aParent,
- 
-     NS_ASSERTION(!mWindowGroup, "already have window group (leaking it)");
- 
-+#ifdef ACCESSIBILITY
-+    // Send a DBus message to check whether a11y is enabled
-+    a11y::PreInit();
-+#endif
-+
-     // Ensure that the toolkit is created.
-     nsGTKToolkit::GetToolkit();
- 
-@@ -4283,33 +4278,6 @@ nsWindow::Create(nsIWidget        *aParent,
-     if (!mIsTopLevel)
-         Resize(mBounds.x, mBounds.y, mBounds.width, mBounds.height, false);
- 
--#ifdef ACCESSIBILITY
--    nsresult rv;
--    if (!sAccessibilityChecked) {
--        sAccessibilityChecked = true;
--
--        //check if accessibility enabled/disabled by environment variable
--        const char *envValue = PR_GetEnv(sAccEnv);
--        if (envValue) {
--            sAccessibilityEnabled = atoi(envValue) != 0;
--            LOG(("Accessibility Env %s=%s\n", sAccEnv, envValue));
--        }
--        //check gconf-2 setting
--        else {
--            nsCOMPtr<nsIPrefBranch> sysPrefService =
--                do_GetService(sSysPrefService, &rv);
--            if (NS_SUCCEEDED(rv) && sysPrefService) {
--
--                // do the work to get gconf setting.
--                // will be done soon later.
--                sysPrefService->GetBoolPref(sAccessibilityKey,
--                                            &sAccessibilityEnabled);
--            }
--
--        }
--    }
--#endif
--
- #ifdef MOZ_DFB
-     if (!mDFB) {
-          DirectFBCreate( &mDFB );
-@@ -6517,7 +6485,7 @@ nsWindow::DispatchAccessibleEvent()
- void
- nsWindow::DispatchEventToRootAccessible(PRUint32 aEventType)
- {
--    if (!sAccessibilityEnabled) {
-+    if (!a11y::ShouldA11yBeEnabled()) {
-         return;
-     }
- 
-diff --git a/widget/src/gtk2/nsWindow.h b/widget/src/gtk2/nsWindow.h
-index a72eca7..577acbf 100644
---- a/widget/src/gtk2/nsWindow.h
-+++ b/widget/src/gtk2/nsWindow.h
-@@ -345,9 +345,6 @@ public:
- #endif
-     NS_IMETHOD         ReparentNativeWidget(nsIWidget* aNewParent);
- 
--#ifdef ACCESSIBILITY
--    static bool        sAccessibilityEnabled;
--#endif
- protected:
-     // Helper for SetParent and ReparentNativeWidget.
-     void ReparentNativeWidgetInternal(nsIWidget* aNewParent,
diff --git a/recipes-mozilla/firefox/firefox/freetype-2.5.patch b/recipes-mozilla/firefox/firefox/freetype-2.5.patch
deleted file mode 100644
index 78f4ff8..0000000
--- a/recipes-mozilla/firefox/firefox/freetype-2.5.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Adapted from:
-https://bugzilla.mozilla.org/show_bug.cgi?id=944454
-
-Upstream-Status: Backport
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr mozilla-esr10.orig/config/system-headers mozilla-esr10/config/system-headers
---- mozilla-esr10.orig/config/system-headers	2012-11-15 19:24:02.000000000 +0100
-+++ mozilla-esr10/config/system-headers	2014-08-09 20:59:18.103672068 +0200
-@@ -273,6 +273,19 @@
- freetype/ttnameid.h
- freetype/tttables.h
- freetype/t1tables.h
-+freetype.h
-+ftcache.h
-+ftglyph.h
-+ftsynth.h
-+ftoutln.h
-+ttnameid.h
-+tttables.h
-+t1tables.h
-+ftlcdfil.h
-+ftsizes.h
-+ftadvanc.h
-+ftbitmap.h
-+ftxf86.h
- fribidi/fribidi.h
- FSp_fopen.h
- fstream
-diff -uNr mozilla-esr10.orig/js/src/config/system-headers mozilla-esr10/js/src/config/system-headers
---- mozilla-esr10.orig/js/src/config/system-headers	2012-11-15 19:24:19.000000000 +0100
-+++ mozilla-esr10/js/src/config/system-headers	2014-08-09 20:59:25.877672347 +0200
-@@ -273,6 +273,19 @@
- freetype/ttnameid.h
- freetype/tttables.h
- freetype/t1tables.h
-+freetype.h
-+ftcache.h
-+ftglyph.h
-+ftsynth.h
-+ftoutln.h
-+ttnameid.h
-+tttables.h
-+t1tables.h
-+ftlcdfil.h
-+ftsizes.h
-+ftadvanc.h
-+ftbitmap.h
-+ftxf86.h
- fribidi/fribidi.h
- FSp_fopen.h
- fstream
---- mozilla-esr10.orig/configure	2014-08-09 23:05:46.397944139 +0200
-+++ mozilla-esr10/configure	2014-08-09 23:07:23.691947627 +0200
-@@ -16011,8 +16011,7 @@
- #define MOZ_PANGO 1
- EOF
- 
--    else
--        succeeded=no
-+    fi
- 
-   if test -z "$PKG_CONFIG"; then
-     # Extract the first word of "pkg-config", so it can be a program name with args.
-@@ -16105,7 +16104,6 @@
- 
-         
-         
--    fi
- fi
- 
- if test "$MOZ_ENABLE_QT"
diff --git a/recipes-mozilla/firefox/firefox/freetype-2.6.patch b/recipes-mozilla/firefox/firefox/freetype-2.6.patch
new file mode 100644
index 0000000..caffbf8
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/freetype-2.6.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Backport
+
+Subject: [PATCH] freetype-2.6
+
+Fix error: undefined reference to `FT_Get_X11_Font_Format'
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ config/system-headers | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config/system-headers b/config/system-headers
+index 2c94a7d..4ab45e1 100644
+--- a/config/system-headers
++++ b/config/system-headers
+@@ -471,6 +471,7 @@ freetype/ftbitmap.h
+ freetype/ftxf86.h
+ freetype.h
+ ftcache.h
++ftfntfmt.h
+ ftglyph.h
+ ftsynth.h
+ ftoutln.h
+-- 
+2.1.4
+
diff --git a/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch b/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch
deleted file mode 100644
index 69d01f6..0000000
--- a/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Thu, 1 Apr 2010 15:34:59 +0200
-Subject: Determine which phishing shavar to use depending on
- MOZ_OFFICIAL_BRANDING
-
----
- browser/app/Makefile.in                                |    4 ++++
- browser/app/profile/firefox.js                         |    4 ++++
- browser/components/safebrowsing/Makefile.in            |    4 ++++
- browser/components/safebrowsing/content/application.js |    4 ++++
- 4 files changed, 16 insertions(+)
-
-diff --git a/browser/app/Makefile.in b/browser/app/Makefile.in
-index 95055cb..a6066f7 100644
---- a/browser/app/Makefile.in
-+++ b/browser/app/Makefile.in
-@@ -191,6 +191,10 @@ ifdef MOZILLA_OFFICIAL
- DEFINES += -DMOZILLA_OFFICIAL
- endif
- 
-+ifdef MOZ_OFFICIAL_BRANDING
-+DEFINES += -DMOZ_OFFICIAL_BRANDING
-+endif
-+
- ifeq ($(MOZ_WIDGET_TOOLKIT),gtk2)
- libs::
- 	$(INSTALL) $(IFLAGS1) $(DIST)/branding/mozicon128.png $(DIST)/bin/icons
-diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
-index 4f3aac3..7ba75fa 100644
---- a/browser/app/profile/firefox.js
-+++ b/browser/app/profile/firefox.js
-@@ -742,7 +742,11 @@ pref("urlclassifier.alternate_error_page", "blocked");
- pref("urlclassifier.gethashnoise", 4);
- 
- // The list of tables that use the gethash request to confirm partial results.
-+#ifdef MOZ_OFFICIAL_BRANDING
- pref("urlclassifier.gethashtables", "goog-phish-shavar,goog-malware-shavar");
-+#else
-+pref("urlclassifier.gethashtables", "googpub-phish-shavar,goog-malware-shavar");
-+#endif
- 
- // If an urlclassifier table has not been updated in this number of seconds,
- // a gethash request will be forced to check that the result is still in
-diff --git a/browser/components/safebrowsing/Makefile.in b/browser/components/safebrowsing/Makefile.in
-index 2d526c2..3b6ca17 100644
---- a/browser/components/safebrowsing/Makefile.in
-+++ b/browser/components/safebrowsing/Makefile.in
-@@ -51,6 +51,10 @@ ifdef MOZILLA_OFFICIAL
- DEFINES += -DOFFICIAL_BUILD=1
- endif
- 
-+ifdef MOZ_OFFICIAL_BRANDING
-+DEFINES += -DMOZ_OFFICIAL_BRANDING
-+endif
-+
- EXTRA_COMPONENTS = \
-   src/nsSafebrowsingApplication.manifest \
-   $(NULL)
-diff --git a/browser/components/safebrowsing/content/application.js b/browser/components/safebrowsing/content/application.js
-index d353cbc..ec32c92 100644
---- a/browser/components/safebrowsing/content/application.js
-+++ b/browser/components/safebrowsing/content/application.js
-@@ -109,7 +109,11 @@ PROT_Application.prototype.initialize = function() {
-   this.malwareWarden.maybeToggleUpdateChecking();
- 
-   this.phishWarden = new PROT_PhishingWarden();
-+#ifdef MOZ_OFFICIAL_BRANDING
-   this.phishWarden.registerBlackTable("goog-phish-shavar");
-+#else
-+  this.phishWarden.registerBlackTable("googpub-phish-shavar");
-+#endif
-   this.phishWarden.maybeToggleUpdateChecking();
- }
- 
diff --git a/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on.patch b/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on.patch
new file mode 100644
index 0000000..a12ccde
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on.patch
@@ -0,0 +1,42 @@
+From 2ebab860a2edc2ae9f985ebfe0c8c4035b3374ad Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Thu, 1 Apr 2010 15:34:59 +0200
+Subject: Determine which phishing shavar to use depending on
+ MOZ_OFFICIAL_BRANDING
+
+---
+ modules/libpref/init/all.js | 4 ++++
+ modules/libpref/moz.build   | 3 +++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/modules/libpref/init/all.js b/modules/libpref/init/all.js
+index ba6de28..c412c79 100644
+--- a/modules/libpref/init/all.js
++++ b/modules/libpref/init/all.js
+@@ -4368,7 +4368,11 @@ pref("dom.mapped_arraybuffer.enabled", false);
+ 
+ // The tables used for Safebrowsing phishing and malware checks.
+ pref("urlclassifier.malwareTable", "goog-malware-shavar,test-malware-simple");
++#ifdef MOZ_OFFICIAL_BRANDING
+ pref("urlclassifier.phishTable", "goog-phish-shavar,test-phish-simple");
++#else
++pref("urlclassifier.phishTable", "googpub-phish-shavar,test-phish-simple");
++#endif
+ pref("urlclassifier.downloadBlockTable", "");
+ pref("urlclassifier.downloadAllowTable", "");
+ pref("urlclassifier.disallow_completions", "test-malware-simple,test-phish-simple,goog-downloadwhite-digest256,mozpub-track-digest256");
+diff --git a/modules/libpref/moz.build b/modules/libpref/moz.build
+index 54a921d..6f3270f 100644
+--- a/modules/libpref/moz.build
++++ b/modules/libpref/moz.build
+@@ -46,3 +46,6 @@ DEFINES['OS_ARCH'] = CONFIG['OS_ARCH']
+ DEFINES['MOZ_WIDGET_TOOLKIT'] = CONFIG['MOZ_WIDGET_TOOLKIT']
+ 
+ FAIL_ON_WARNINGS = True
++
++if CONFIG['MOZ_OFFICIAL_BRANDING']:
++    DEFINES['MOZ_OFFICIAL_BRANDING'] = True
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/iceweasel-branding/Modify-search-plugins-depending-on-MOZ_APP_NAME.patch b/recipes-mozilla/firefox/firefox/iceweasel-branding/Modify-search-plugins-depending-on-MOZ_APP_NAME.patch
new file mode 100644
index 0000000..2d478f2
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/iceweasel-branding/Modify-search-plugins-depending-on-MOZ_APP_NAME.patch
@@ -0,0 +1,39 @@
+From 64c0839b2ed6a0695b539640ce6ac9c779312986 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Sat, 19 Feb 2011 11:04:53 +0100
+Subject: Modify search plugins depending on MOZ_APP_NAME
+
+---
+ browser/locales/Makefile.in                     | 2 ++
+ browser/locales/en-US/searchplugins/answers.xml | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/browser/locales/Makefile.in b/browser/locales/Makefile.in
+index d1f3b6e..fbbdd86 100644
+--- a/browser/locales/Makefile.in
++++ b/browser/locales/Makefile.in
+@@ -88,6 +88,8 @@ SEARCHPLUGINS := $(foreach plugin,$(addsuffix .xml,$(SEARCHPLUGINS_NAMES)),$(or
+ SEARCHPLUGINS_FLAGS := --silence-missing-directive-warnings
+ PP_TARGETS += SEARCHPLUGINS
+ 
++DEFINES += -DMOZ_APP_NAME=$(MOZ_APP_NAME)
++
+ # Required for l10n.mk - defines a list of app sub dirs that should
+ # be included in langpack xpis.
+ ifdef MOZ_METRO
+diff --git a/browser/locales/en-US/searchplugins/answers.xml b/browser/locales/en-US/searchplugins/answers.xml
+index 4bd2fbf..e0fcec6 100644
+--- a/browser/locales/en-US/searchplugins/answers.xml
++++ b/browser/locales/en-US/searchplugins/answers.xml
+@@ -12,6 +12,6 @@
+   <Param name="gwp" value="13"/>
+ </Url>
+ <Url type="application/x-suggestions+json" method="GET"
+-     template="http://www.answers.com/main/startswith?output=json&amp;client=firefox&amp;s={searchTerms}"/>
++#expand     template="http://www.answers.com/main/startswith?output=json&amp;client=__MOZ_APP_NAME__&amp;s={searchTerms}"/>
+ <SearchForm>http://www.answers.com/</SearchForm>
+ </SearchPlugin>
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch b/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.properties.patch
similarity index 82%
rename from recipes-mozilla/firefox/firefox/iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch
rename to recipes-mozilla/firefox/firefox/iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.properties.patch
index 277a35c..ae13346 100644
--- a/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch
+++ b/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.properties.patch
@@ -1,17 +1,18 @@
+From be57c51cf79cc412507afe93286dd9f334b1acbc Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Sat, 19 Feb 2011 11:02:30 +0100
 Subject: Use MOZ_APP_DISPLAYNAME to fill appstrings.properties
 
 ---
- browser/locales/Makefile.in                        |    2 ++
- .../en-US/chrome/overrides/appstrings.properties   |   20 ++++++++++----------
+ browser/locales/Makefile.in                          |  2 ++
+ .../en-US/chrome/overrides/appstrings.properties     | 20 ++++++++++----------
  2 files changed, 12 insertions(+), 10 deletions(-)
 
 diff --git a/browser/locales/Makefile.in b/browser/locales/Makefile.in
-index b30a715..9f7befb 100644
+index f6b43cc..d1f3b6e 100644
 --- a/browser/locales/Makefile.in
 +++ b/browser/locales/Makefile.in
-@@ -69,6 +69,8 @@ SUBMAKEFILES += \
+@@ -29,6 +29,8 @@ SUBMAKEFILES += \
  	$(DEPTH)/$(MOZ_BRANDING_DIRECTORY)/locales/Makefile \
  	$(NULL)
  
@@ -21,20 +22,20 @@ index b30a715..9f7befb 100644
  # build non-default locales to non-default dist/ locations. Be aware!
  
 diff --git a/browser/locales/en-US/chrome/overrides/appstrings.properties b/browser/locales/en-US/chrome/overrides/appstrings.properties
-index 87e9538..ac979f9 100644
+index 14fad72..f1b396f 100644
 --- a/browser/locales/en-US/chrome/overrides/appstrings.properties
 +++ b/browser/locales/en-US/chrome/overrides/appstrings.properties
-@@ -35,24 +35,24 @@
- # ***** END LICENSE BLOCK *****
+@@ -3,24 +3,24 @@
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
  
  malformedURI=The URL is not valid and cannot be loaded.
 -fileNotFound=Firefox can't find the file at %S.
 -dnsNotFound=Firefox can't find the server at %S.
--protocolNotFound=Firefox doesn't know how to open this address, because the protocol (%S) isn't associated with any program.
+-unknownProtocolFound=Firefox doesn't know how to open this address, because one of the following protocols (%S) isn't associated with any program or is not allowed in this context.
 -connectionFailure=Firefox can't establish a connection to the server at %S.
 +#expand fileNotFound=__MOZ_APP_DISPLAYNAME__ can't find the file at %S.
 +#expand dnsNotFound=__MOZ_APP_DISPLAYNAME__ can't find the server at %S.
-+#expand protocolNotFound=__MOZ_APP_DISPLAYNAME__ doesn't know how to open this address, because the protocol (%S) isn't associated with any program.
++#expand unknownProtocolFound=__MOZ_APP_DISPLAYNAME__ doesn't know how to open this address, because one of the following protocols (%S) isn't associated with any program or is not allowed in this context.
 +#expand connectionFailure=__MOZ_APP_DISPLAYNAME__ can't establish a connection to the server at %S.
  netInterrupt=The connection to %S was interrupted while the page was loading.
  netTimeout=The server at %S is taking too long to respond.
@@ -59,3 +60,7 @@ index 87e9538..ac979f9 100644
  contentEncodingError=The page you are trying to view cannot be shown because it uses an invalid or unsupported form of compression.
  unsafeContentType=The page you are trying to view cannot be shown because it is contained in a file type that may not be safe to open. Please contact the website owners to inform them of this problem.
  externalProtocolTitle=External Protocol Request
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-firefox-instead-of-MOZ_APP_NAME-for-profile-reset.patch b/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-firefox-instead-of-MOZ_APP_NAME-for-profile-reset.patch
new file mode 100644
index 0000000..2c12e7a
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/iceweasel-branding/Use-firefox-instead-of-MOZ_APP_NAME-for-profile-reset.patch
@@ -0,0 +1,40 @@
+From 6fdeb777e8288bcc855b808aa73a793723d0b629 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Sun, 11 May 2014 15:08:37 +0900
+Subject: Use "firefox" instead of MOZ_APP_NAME for profile reset
+
+---
+ toolkit/modules/ResetProfile.jsm | 2 +-
+ toolkit/xre/nsAppRunner.cpp      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/toolkit/modules/ResetProfile.jsm b/toolkit/modules/ResetProfile.jsm
+index c4c2567..3ba756f 100644
+--- a/toolkit/modules/ResetProfile.jsm
++++ b/toolkit/modules/ResetProfile.jsm
+@@ -7,7 +7,7 @@
+ this.EXPORTED_SYMBOLS = ["ResetProfile"];
+ 
+ const {classes: Cc, interfaces: Ci, utils: Cu, results: Cr} = Components;
+-#expand const MOZ_APP_NAME = "__MOZ_APP_NAME__";
++const MOZ_APP_NAME = "firefox";
+ #expand const MOZ_BUILD_APP = "__MOZ_BUILD_APP__";
+ 
+ Cu.import("resource://gre/modules/Services.jsm");
+diff --git a/toolkit/xre/nsAppRunner.cpp b/toolkit/xre/nsAppRunner.cpp
+index 5334a05..ace6143 100644
+--- a/toolkit/xre/nsAppRunner.cpp
++++ b/toolkit/xre/nsAppRunner.cpp
+@@ -4095,7 +4095,7 @@ XREMain::XRE_mainRun()
+         if (gDoProfileReset) {
+           // Automatically migrate from the current application if we just
+           // reset the profile.
+-          aKey = MOZ_APP_NAME;
++          aKey = "firefox";
+         }
+         pm->Migrate(&mDirProvider, aKey);
+       }
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/mozconfig b/recipes-mozilla/firefox/firefox/mozconfig
index cc71f48..a343cff 100644
--- a/recipes-mozilla/firefox/firefox/mozconfig
+++ b/recipes-mozilla/firefox/firefox/mozconfig
@@ -1,60 +1,39 @@
 . $topsrcdir/browser/config/mozconfig
 
-# From xulrunner.mozconfig
-ac_add_options --prefix=@prefix@
-ac_add_options --enable-default-toolkit=cairo-gtk2
-ac_add_options --enable-pango
-ac_add_options --enable-system-cairo # MOZ_TREE_CAIRO=
-ac_add_options --with-system-jpeg # MOZ_NATIVE_JPEG=1
-ac_add_options --with-system-zlib # MOZ_NATIVE_ZLIB=1
-ac_add_options --with-system-bz2 # MOZ_NATIVE_BZ2=1
-#ac_add_options --with-system-nspr # MOZ_NATIVE_NSPR=1
-#ac_add_options --with-system-nss # MOZ_NATIVE_NSS=1
-ac_add_options --enable-svg
-ac_add_options --enable-mathml
-ac_add_options --disable-pedantic
-ac_add_options --disable-long-long-warning
-ac_add_options --disable-gnomevfs
-ac_add_options --disable-gconf
-#ac_add_options --enable-gio
-ac_add_options --disable-gio
-#ac_add_options --enable-gnomeui
-ac_add_options --disable-gnomeui
-ac_add_options --disable-mochitest
-ac_add_options --disable-debug
-ac_add_options --enable-canvas
-ac_add_options --enable-readline
-ac_add_options --disable-installer
-ac_add_options --disable-javaxpcom
-ac_add_options --disable-elf-dynstr-gc
-#ac_add_options --enable-system-hunspell # MOZ_NATIVE_HUNSPELL=1
-ac_add_options --disable-system-hunspell # MOZ_NATIVE_HUNSPELL=1
-ac_add_options --disable-crashreporter
-#ac_add_options --enable-system-sqlite # MOZ_NATIVE_SQLITE=1
-ac_add_options --disable-strip
-ac_add_options --disable-install-strip
-ac_add_options --enable-url-classifier
-ac_add_options --enable-startup-notification
-ac_add_options --enable-system-ffi # MOZ_NATIVE_FFI=1
-ac_add_options --with-system-libevent=@STAGING_DIR_TARGET@@prefix@ # MOZ_NATIVE_LIBEVENT=1
-ac_add_options --with-system-libvpx # MOZ_NATIVE_LIBVPX=1
-#ac_add_options --enable-shared-js
+ac_add_options --target=${TARGET_SYS}
+ac_add_options --prefix=${prefix}
 
-# From iceweasel.mozconfig
-ac_add_options --with-user-appdir=.mozilla
-ac_add_options --disable-installer
+ac_add_options --enable-application=browser
+ac_add_options --enable-official-branding
+
+ac_add_options --disable-elf-hack
+ac_add_options --disable-gold
 ac_add_options --disable-strip
 ac_add_options --disable-install-strip
+
+# System libraries
+#ac_add_options --with-system-nss # your version is too old
+#ac_add_options --with-system-jpeg # Insufficient JPEG library version
+ac_add_options --with-system-zlib
+ac_add_options --with-system-bz2
+#ac_add_options --with-system-png # system's libpng doesn't have APNG support
+ac_add_options --with-system-libevent
+ac_add_options --with-system-libvpx
+ac_add_options --with-system-icu
+ac_add_options --enable-system-ffi
+ac_add_options --enable-system-pixman
+
+# Features
+ac_add_options --enable-startup-notification
+ac_add_options --enable-pulseaudio
+ac_add_options --disable-gstreamer
+ac_add_options --disable-pango
 ac_add_options --disable-tests
-ac_add_options --enable-extensions=default
-ac_add_options --enable-single-profile
-ac_add_options --disable-profilesharing
-ac_add_options --disable-updater
-ac_add_options --disable-elf-dynstr-gc
-#ac_add_options --with-branding=debian/branding
-ac_add_options --enable-official-branding
 ac_add_options --disable-necko-wifi
+ac_add_options --disable-pedantic
+ac_add_options --disable-gnomevfs
+ac_add_options --disable-gconf
 ac_add_options --disable-crashreporter
-ac_add_options --disable-webm
-ac_add_options --enable-chrome-format=jar
-ac_add_options --disable-libjpeg-turbo
+ac_add_options --disable-updater
+ac_add_options --disable-installer
+ac_add_options --disable-debug-symbols
diff --git a/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch b/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch
index 9e2f26c..36260de 100644
--- a/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch
@@ -1,3 +1,4 @@
+From e3972be3d7d144f0fe24a3ccc480d8efcaa26cd8 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Fri, 30 Apr 2010 11:03:50 +0200
 Subject: Add xptcall support for SH4 processors
@@ -5,35 +6,29 @@ Subject: Add xptcall support for SH4 processors
 Closes: #553593
 https://bugzilla.mozilla.org/show_bug.cgi?id=382214
 ---
- xpcom/reflect/xptcall/src/md/unix/Makefile.in      |   11 +
- .../xptcall/src/md/unix/xptcinvoke_linux_sh.cpp    |  203 +++++++++++++++
- .../xptcall/src/md/unix/xptcstubs_linux_sh.cpp     |  271 ++++++++++++++++++++
- 3 files changed, 485 insertions(+)
+ xpcom/reflect/xptcall/md/unix/moz.build            |   5 +
+ .../xptcall/src/md/unix/xptcinvoke_linux_sh.cpp    | 203 +++++++++++++++
+ .../xptcall/src/md/unix/xptcstubs_linux_sh.cpp     | 271 +++++++++++++++++++++
+ 3 files changed, 479 insertions(+)
  create mode 100644 xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_sh.cpp
  create mode 100644 xpcom/reflect/xptcall/src/md/unix/xptcstubs_linux_sh.cpp
 
-diff --git a/xpcom/reflect/xptcall/src/md/unix/Makefile.in b/xpcom/reflect/xptcall/src/md/unix/Makefile.in
-index 6c50821..44d6ab1 100644
---- a/xpcom/reflect/xptcall/src/md/unix/Makefile.in
-+++ b/xpcom/reflect/xptcall/src/md/unix/Makefile.in
-@@ -430,6 +430,17 @@ CPPSRCS		:= xptcinvoke_linux_s390x.cpp xptcstubs_linux_s390x.cpp
- CXXFLAGS	+= -fno-strict-aliasing -fno-inline -fomit-frame-pointer -mbackchain
- endif
+diff --git a/xpcom/reflect/xptcall/md/unix/moz.build b/xpcom/reflect/xptcall/md/unix/moz.build
+index 8403032..f5296c1 100644
+--- a/xpcom/reflect/xptcall/md/unix/moz.build
++++ b/xpcom/reflect/xptcall/md/unix/moz.build
+@@ -320,6 +320,11 @@ if CONFIG['OS_ARCH'] == 'Linux':
+             '-fomit-frame-pointer',
+             '-mbackchain',
+         ]
++    elif CONFIG['OS_TEST'] in ('sh4', 'sh4a'):
++        SOURCES += [
++            'xptcinvoke_linux_sh.cpp',
++            'xptcstubs_linux_sh.cpp',
++        ]
  
-+############
-+# SuperH
-+############
-+#
-+#
-+# Currently, tested on sh4 and sh4a (non sh4al and sh4al-dsp..)
-+ifeq ($(OS_ARCH),Linux)
-+ifneq (,$(filter sh4 sh4a,$(OS_TEST)))
-+CPPSRCS		:= xptcinvoke_linux_sh.cpp xptcstubs_linux_sh.cpp
-+endif
-+endif
+ FINAL_LIBRARY = 'xul'
  
- # we don't want the shared lib, but we want to force the creation of a static lib.
- FORCE_STATIC_LIB = 1
 diff --git a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_sh.cpp b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_sh.cpp
 new file mode 100644
 index 0000000..ca4807d
@@ -520,3 +515,6 @@ index 0000000..cf9fcea
 +}
 +
 +#include "xptcstubsdef.inc"
+-- 
+cgit v0.11.2
+
diff --git a/recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch b/recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch
deleted file mode 100644
index bf73dc0..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 5 Aug 2011 11:24:58 +0200
-Subject: Allow ipc code to build on GNU/Hurd
-
----
- ipc/chromium/src/base/debug_util_posix.cc         |    1 -
- ipc/chromium/src/base/third_party/nspr/prcpucfg.h |    2 +-
- ipc/chromium/src/build/build_config.h             |    2 +-
- 3 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/ipc/chromium/src/base/debug_util_posix.cc b/ipc/chromium/src/base/debug_util_posix.cc
-index 72a4ebf..5a45ac9 100644
---- a/ipc/chromium/src/base/debug_util_posix.cc
-+++ b/ipc/chromium/src/base/debug_util_posix.cc
-@@ -17,7 +17,6 @@
- #include <unistd.h>
- #if MOZ_HAVE_EXECINFO_H
- #include <execinfo.h>
--#include <sys/sysctl.h>
- #endif
- 
- #include "base/basictypes.h"
-diff --git a/ipc/chromium/src/base/third_party/nspr/prcpucfg.h b/ipc/chromium/src/base/third_party/nspr/prcpucfg.h
-index 30fef1b..c7e47ba 100644
---- a/ipc/chromium/src/base/third_party/nspr/prcpucfg.h
-+++ b/ipc/chromium/src/base/third_party/nspr/prcpucfg.h
-@@ -34,7 +34,7 @@
- #include "base/third_party/nspr/prcpucfg_win.h"
- #elif defined(__APPLE__)
- #include "base/third_party/nspr/prcpucfg_mac.h"
--#elif defined(__linux__) || defined(ANDROID) || defined(__GLIBC__)
-+#elif defined(__linux__) || defined(ANDROID) || defined(__GLIBC__) || defined(__GNU__)
- #include "base/third_party/nspr/prcpucfg_linux.h"
- #elif defined(__OpenBSD__)
- #include "base/third_party/nspr/prcpucfg_openbsd.h"
-diff --git a/ipc/chromium/src/build/build_config.h b/ipc/chromium/src/build/build_config.h
-index 4ef0c76..463b3d9 100644
---- a/ipc/chromium/src/build/build_config.h
-+++ b/ipc/chromium/src/build/build_config.h
-@@ -17,7 +17,7 @@
- // A set of macros to use for platform detection.
- #if defined(__APPLE__)
- #define OS_MACOSX 1
--#elif defined(__linux__) || defined(ANDROID) || defined(__GLIBC__)
-+#elif defined(__linux__) || defined(ANDROID) || defined(__GLIBC__) || defined(__GNU__)
- #define OS_LINUX 1
- #elif defined(__OpenBSD__)
- #define OS_OPENBSD 1
diff --git a/recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch b/recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch
deleted file mode 100644
index 5c680f6..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Thu, 30 Jun 2011 18:29:22 +0200
-Subject: Allow ipc code to build on GNU/kfreebsd
-
----
- ipc/chromium/src/base/platform_thread_posix.cc    |    4 ++++
- ipc/chromium/src/base/third_party/nspr/prcpucfg.h |    2 +-
- ipc/chromium/src/build/build_config.h             |    2 +-
- 3 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/ipc/chromium/src/base/platform_thread_posix.cc b/ipc/chromium/src/base/platform_thread_posix.cc
-index e3f49c7..f1d3b2f 100644
---- a/ipc/chromium/src/base/platform_thread_posix.cc
-+++ b/ipc/chromium/src/base/platform_thread_posix.cc
-@@ -37,7 +37,11 @@ PlatformThreadId PlatformThread::CurrentId() {
-   // TODO(BSD): find a better thread ID
-   return (intptr_t)(pthread_self());
- #elif defined(OS_LINUX)
-+#ifdef __NR_gettid
-   return syscall(__NR_gettid);
-+#else
-+  return getpid();
-+#endif
- #endif
- }
- 
-diff --git a/ipc/chromium/src/base/third_party/nspr/prcpucfg.h b/ipc/chromium/src/base/third_party/nspr/prcpucfg.h
-index ef40994..30fef1b 100644
---- a/ipc/chromium/src/base/third_party/nspr/prcpucfg.h
-+++ b/ipc/chromium/src/base/third_party/nspr/prcpucfg.h
-@@ -34,7 +34,7 @@
- #include "base/third_party/nspr/prcpucfg_win.h"
- #elif defined(__APPLE__)
- #include "base/third_party/nspr/prcpucfg_mac.h"
--#elif defined(__linux__) || defined(ANDROID)
-+#elif defined(__linux__) || defined(ANDROID) || defined(__GLIBC__)
- #include "base/third_party/nspr/prcpucfg_linux.h"
- #elif defined(__OpenBSD__)
- #include "base/third_party/nspr/prcpucfg_openbsd.h"
-diff --git a/ipc/chromium/src/build/build_config.h b/ipc/chromium/src/build/build_config.h
-index 0952ab1..4ef0c76 100644
---- a/ipc/chromium/src/build/build_config.h
-+++ b/ipc/chromium/src/build/build_config.h
-@@ -17,7 +17,7 @@
- // A set of macros to use for platform detection.
- #if defined(__APPLE__)
- #define OS_MACOSX 1
--#elif defined(__linux__) || defined(ANDROID)
-+#elif defined(__linux__) || defined(ANDROID) || defined(__GLIBC__)
- #define OS_LINUX 1
- #elif defined(__OpenBSD__)
- #define OS_OPENBSD 1
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch b/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch
deleted file mode 100644
index 83907bf..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 18 Nov 2011 11:27:29 +0100
-Subject: Bug 698923 - Don't require 16 bytes alignment for VMFrame on sparc
-
----
- js/src/methodjit/MethodJIT.cpp |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/src/methodjit/MethodJIT.cpp b/js/src/methodjit/MethodJIT.cpp
-index 4f7f5db..c3d01cb 100644
---- a/js/src/methodjit/MethodJIT.cpp
-+++ b/js/src/methodjit/MethodJIT.cpp
-@@ -257,7 +257,7 @@ JS_STATIC_ASSERT(offsetof(FrameRegs, sp) == 0);
- #if defined(__GNUC__) && !defined(_WIN64)
- 
- /* If this assert fails, you need to realign VMFrame to 16 bytes. */
--#ifdef JS_CPU_ARM
-+#if defined(JS_CPU_ARM) || defined(JS_CPU_SPARC)
- JS_STATIC_ASSERT(sizeof(VMFrame) % 8 == 0);
- #else
- JS_STATIC_ASSERT(sizeof(VMFrame) % 16 == 0);
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch
deleted file mode 100644
index 509b46a..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 18 Nov 2011 11:32:09 +0100
-Subject: Bug 703531 - Fix ARMAssembler::getOp2RegScale on < ARMv5
-
----
- js/src/assembler/assembler/ARMAssembler.cpp |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/js/src/assembler/assembler/ARMAssembler.cpp b/js/src/assembler/assembler/ARMAssembler.cpp
-index 78b8a7d..0458446 100644
---- a/js/src/assembler/assembler/ARMAssembler.cpp
-+++ b/js/src/assembler/assembler/ARMAssembler.cpp
-@@ -112,10 +112,10 @@ ARMWord ARMAssembler::getOp2RegScale(RegisterID reg, ARMWord scale)
-     : // No clobbers.
-     );
- #else
--    ARMWord lz = 0; // Accumulate leading zeroes.
-+    lz = 0; // Accumulate leading zeroes.
-     for (ARMWord s = 16; s > 0; s /= 2) {
-         ARMWord mask = 0xffffffff << (32-lz-s);
--        if ((x & mask) == 0) {
-+        if ((scale & mask) == 0) {
-             lz += s;
-         }
-     }
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch
deleted file mode 100644
index 981e7a7..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 18 Nov 2011 11:55:49 +0100
-Subject: Bug 703534 - Fix build failure on platforms without YARR JIT
-
----
- js/src/jscompartment.cpp |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/js/src/jscompartment.cpp b/js/src/jscompartment.cpp
-index 721c38e..af5a96e 100644
---- a/js/src/jscompartment.cpp
-+++ b/js/src/jscompartment.cpp
-@@ -50,7 +50,6 @@
- #include "jswatchpoint.h"
- #include "jswrapper.h"
- #include "assembler/wtf/Platform.h"
--#include "assembler/jit/ExecutableAllocator.h"
- #include "yarr/BumpPointerAllocator.h"
- #include "methodjit/MethodJIT.h"
- #include "methodjit/PolyIC.h"
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch
deleted file mode 100644
index e4e339e..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From: Mike Hommey <mh+mozilla@glandium.org>
-Date: Sat, 19 Nov 2011 09:44:10 +0100
-Subject: Bug 703833 - Avoid invalid conversion from 'const size_t*' to 'const
- jsuword*' on s390
-
----
- js/src/jsgc.cpp |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/js/src/jsgc.cpp b/js/src/jsgc.cpp
-index e8818d1..f25f0a5 100644
---- a/js/src/jsgc.cpp
-+++ b/js/src/jsgc.cpp
-@@ -1052,8 +1052,8 @@ MarkStackRangeConservatively(JSTracer *trc, Value *beginv, Value *endv)
-         ~AutoSkipChecking() { runtime->gcCheckCompartment = savedCompartment; }
-     } as(trc->context->runtime);
- 
--    const jsuword *begin = beginv->payloadWord();
--    const jsuword *end = endv->payloadWord();
-+    const jsuword *begin = (const jsuword *) beginv->payloadWord();
-+    const jsuword *end = (const jsuword *) endv->payloadWord();;
- #ifdef JS_NUNBOX32
-     /*
-      * With 64-bit jsvals on 32-bit systems, we can optimize a bit by
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch
deleted file mode 100644
index c687ff4..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Mike Hommey <mh+mozilla@glandium.org>
-Date: Sat, 19 Nov 2011 09:37:34 +0100
-Subject: Bug 703842 - Avoid R_SPARC_WDISP22 relocation in TrampolineSparc.s
-
----
- js/src/methodjit/TrampolineSparc.s |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/js/src/methodjit/TrampolineSparc.s b/js/src/methodjit/TrampolineSparc.s
-index 0fa9cfd..1b15369 100644
---- a/js/src/methodjit/TrampolineSparc.s
-+++ b/js/src/methodjit/TrampolineSparc.s
-@@ -112,7 +112,7 @@ throwpoline_exit:
- JaegerInterpolineScripted:
-     ld      [%l0 + 0x10], %l0                        /* Load f->prev_ */
-     st      %l0, [%fp - 36]                          /* Update f->regs->fp_ */
--    ba     JaegerInterpoline
-+    ba     interpoline_enter
-     nop
- .size    JaegerInterpolineScripted, . - JaegerInterpolineScripted
- 
-@@ -120,6 +120,7 @@ JaegerInterpolineScripted:
- .global JaegerInterpoline
- .type   JaegerInterpoline, #function
- JaegerInterpoline:
-+interpoline_enter:
-     mov     %o0,%o2
-     mov     %l3,%o0
-     mov     %l2,%o1
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch b/recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch
deleted file mode 100644
index c20e218..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From: Martin Stransky <stransky@redhat.com>
-Date: Mon, 5 Dec 2011 10:49:56 +0100
-Subject: Bug 706787 - Crash on s390x
- (nsXPCComponents::AttachNewComponentsObject() fails). r=glandium
-
----
- .../xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp |   50 ++++----------------
- 1 file changed, 9 insertions(+), 41 deletions(-)
-
-diff --git a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp
-index c12482a..ec9dd98 100644
---- a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp
-+++ b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp
-@@ -194,55 +194,23 @@ invoke_copy_to_stack(PRUint32 paramCount, nsXPTCVariant* s, PRUint64* d_ov, PRUi
-     }
- }
- 
-+typedef nsresult (*vtable_func)(nsISupports *, PRUint64, PRUint64, PRUint64, PRUint64, double, double, double, double);
-+
- EXPORT_XPCOM_API(nsresult)
- NS_InvokeByIndex(nsISupports* that, PRUint32 methodIndex,
-                  PRUint32 paramCount, nsXPTCVariant* params)
- {
--    PRUint64 *vtable = *(PRUint64 **)that;
--    PRUint64 method = vtable[methodIndex];
-+    vtable_func *vtable = *reinterpret_cast<vtable_func **>(that);
-+    vtable_func method = vtable[methodIndex];
-     PRUint64 overflow = invoke_count_words (paramCount, params);
-+    PRUint64 *stack_space = reinterpret_cast<PRUint64 *>(__builtin_alloca((overflow + 8 /* 4 64-bits gpr + 4 64-bits fpr */) * 8));
-     PRUint64 result;
- 
--    __asm__ __volatile__
--    (
--        "lgr    7,15\n\t"
--        "aghi   7,-64\n\t"
--
--        "lgr    3,%3\n\t"
--        "sllg   3,3,3\n\t"
--        "lcgr   3,3\n\t"
--        "lg     2,0(15)\n\t"
--        "la     15,0(3,7)\n\t"
--        "stg    2,0(15)\n\t"
--
--        "lgr    2,%1\n\t"
--        "lgr    3,%2\n\t"
--        "la     4,160(15)\n\t"
--        "lgr    5,%3\n\t"
--        "basr   14,%4\n\t"
--
--        "lgr    2,%5\n\t"
--        "ld     0,192(7)\n\t"
--        "ld     2,200(7)\n\t"
--        "ld     4,208(7)\n\t"
--        "ld     6,216(7)\n\t"
--        "lmg    3,6,160(7)\n\t"
--        "basr   14,%6\n\t"
-+    invoke_copy_to_stack(paramCount, params, stack_space, overflow);
- 
--        "la     15,64(7)\n\t"
-+    PRUint64 *d_gpr = stack_space + overflow;
-+    double *d_fpr = reinterpret_cast<double *>(d_gpr + 4);
- 
--        "lgr    %0,2\n\t"
--        : "=r" (result)
--        : "r" ((PRUint64)paramCount),
--          "r" (params),
--          "r" (overflow),
--          "a" (invoke_copy_to_stack),
--          "a" (that),
--          "a" (method)
--        : "2", "3", "4", "5", "6", "7", "14", "cc", "memory",
--	  "%f0", "%f1", "%f2", "%f3", "%f4", "%f5", "%f6", "%f7"
--    );
--  
--    return result;
-+    return method(that, d_gpr[0], d_gpr[1], d_gpr[2], d_gpr[3], d_fpr[0], d_fpr[1], d_fpr[2], d_fpr[3]);
- }
- 
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch b/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch
deleted file mode 100644
index 721caf4..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Mike Hommey <mh+mozilla@glandium.org>
-Date: Fri, 16 Dec 2011 11:29:43 +0100
-Subject: Bug 711353 - Add support for GNU/kFreeBSD and GNU/Hurd to
- gfx/angle/src/compiler/osinclude.h
-
----
- gfx/angle/src/compiler/osinclude.h |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gfx/angle/src/compiler/osinclude.h b/gfx/angle/src/compiler/osinclude.h
-index dacdc22..6e84774 100644
---- a/gfx/angle/src/compiler/osinclude.h
-+++ b/gfx/angle/src/compiler/osinclude.h
-@@ -16,7 +16,8 @@
- #define ANGLE_OS_WIN
- #elif defined(__APPLE__) || defined(__linux__) || \
-       defined(__FreeBSD__) || defined(__OpenBSD__) || \
--      defined(__sun) || defined(ANDROID)
-+      defined(__sun) || defined(ANDROID) || \
-+      defined(__GLIBC__) || defined(__GNU__)
- #define ANGLE_OS_POSIX
- #else
- #error Unsupported platform.
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch b/recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch
deleted file mode 100644
index ea01a1c..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Mon, 23 Apr 2012 12:32:10 +0200
-Subject: Bug 747870 - Properly align XPCLazyCallContext::mData. r=bholley
-
----
- js/xpconnect/src/xpcprivate.h |   13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/js/xpconnect/src/xpcprivate.h b/js/xpconnect/src/xpcprivate.h
-index d57f66e..ca23216 100644
---- a/js/xpconnect/src/xpcprivate.h
-+++ b/js/xpconnect/src/xpcprivate.h
-@@ -1328,12 +1328,13 @@ public:
-     XPCCallContext &GetXPCCallContext()
-     {
-         if (!mCcx) {
-+            XPCCallContext *data = mData.addr();
-             mCcxToDestroy = mCcx =
--                new (mData) XPCCallContext(mCallerLanguage, mCx,
--                                           mCallBeginRequest == CALL_BEGINREQUEST,
--                                           mObj,
--                                           mFlattenedJSObject, mWrapper,
--                                           mTearOff);
-+                new (data) XPCCallContext(mCallerLanguage, mCx,
-+                                          mCallBeginRequest == CALL_BEGINREQUEST,
-+                                          mObj,
-+                                          mFlattenedJSObject, mWrapper,
-+                                          mTearOff);
-             if (!mCcx->IsValid()) {
-                 NS_ERROR("This is not supposed to fail!");
-             }
-@@ -1361,7 +1362,7 @@ private:
-     JSObject *mFlattenedJSObject;
-     XPCWrappedNative *mWrapper;
-     XPCWrappedNativeTearOff *mTearOff;
--    char mData[sizeof(XPCCallContext)];
-+    mozilla::AlignedStorage2<XPCCallContext> mData;
- };
- 
- /***************************************************************************
diff --git a/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch b/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch
deleted file mode 100644
index 6ef2226..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 18 Nov 2011 11:28:30 +0100
-Subject: Fix GNU/non-Linux failure to build because of
- ipc/chromium/src/base/dir_reader_posix.h
-
----
- ipc/chromium/src/base/dir_reader_posix.h |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ipc/chromium/src/base/dir_reader_posix.h b/ipc/chromium/src/base/dir_reader_posix.h
-index f591ae0..4b74a08 100644
---- a/ipc/chromium/src/base/dir_reader_posix.h
-+++ b/ipc/chromium/src/base/dir_reader_posix.h
-@@ -18,7 +18,7 @@
- // seems worse than falling back to enumerating all file descriptors so we will
- // probably never implement this on the Mac.
- 
--#if defined(OS_LINUX)
-+#if defined(OS_LINUX) && defined(__linux__)
- #include "base/dir_reader_linux.h"
- #else
- #include "base/dir_reader_fallback.h"
-@@ -26,7 +26,7 @@
- 
- namespace base {
- 
--#if defined(OS_LINUX)
-+#if defined(OS_LINUX) && defined(__linux__)
- typedef DirReaderLinux DirReaderPosix;
- #else
- typedef DirReaderFallback DirReaderPosix;
diff --git a/recipes-mozilla/firefox/firefox/porting/Make-powerpc-not-use-static-page-sizes-in-mozjemalloc.patch b/recipes-mozilla/firefox/firefox/porting/Make-powerpc-not-use-static-page-sizes-in-mozjemalloc.patch
new file mode 100644
index 0000000..a23a6ce
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/porting/Make-powerpc-not-use-static-page-sizes-in-mozjemalloc.patch
@@ -0,0 +1,26 @@
+From 15f3179ad82af4ef4705b86285d32d306b854a53 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Wed, 25 Feb 2015 10:41:37 +0900
+Subject: Make powerpc not use static page sizes in mozjemalloc
+
+Closes: #763900
+---
+ memory/mozjemalloc/jemalloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/memory/mozjemalloc/jemalloc.c b/memory/mozjemalloc/jemalloc.c
+index 3681792..621f5ba 100644
+--- a/memory/mozjemalloc/jemalloc.c
++++ b/memory/mozjemalloc/jemalloc.c
+@@ -1087,7 +1087,7 @@ static const bool config_recycle = false;
+  * controlling the malloc behavior are defined as compile-time constants
+  * for best performance and cannot be altered at runtime.
+  */
+-#if !defined(__ia64__) && !defined(__sparc__) && !defined(__mips__)
++#if !defined(__ia64__) && !defined(__sparc__) && !defined(__mips__) && !defined(__powerpc__)
+ #define MALLOC_STATIC_SIZES 1
+ #endif
+ 
+-- 
+cgit v0.11.2
+
diff --git a/recipes-mozilla/firefox/firefox/porting/NSS-Fix-FTBFS-on-Hurd-because-of-MAXPATHLEN.patch b/recipes-mozilla/firefox/firefox/porting/NSS-Fix-FTBFS-on-Hurd-because-of-MAXPATHLEN.patch
new file mode 100644
index 0000000..ad8297b
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/porting/NSS-Fix-FTBFS-on-Hurd-because-of-MAXPATHLEN.patch
@@ -0,0 +1,68 @@
+From 66c937f0ccb31c69a63ad8e4f2ac7d82958c1e9f Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 13 Jan 2014 12:00:25 +0900
+Subject: [NSS] Fix FTBFS on Hurd because of MAXPATHLEN
+
+---
+ security/nss/cmd/shlibsign/shlibsign.c | 21 ++++++++++++++++-----
+ security/nss/lib/freebl/unix_rand.c    |  4 ++++
+ 2 files changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/security/nss/cmd/shlibsign/shlibsign.c b/security/nss/cmd/shlibsign/shlibsign.c
+index 5160441..5dfd7ce 100644
+--- a/security/nss/cmd/shlibsign/shlibsign.c
++++ b/security/nss/cmd/shlibsign/shlibsign.c
+@@ -706,7 +706,6 @@ int main(int argc, char **argv)
+ #ifdef USES_LINKS
+     int ret;
+     struct stat stat_buf;
+-    char link_buf[MAXPATHLEN+1];
+     char *link_file = NULL;
+ #endif
+ 
+@@ -1034,10 +1033,22 @@ int main(int argc, char **argv)
+     }
+     if (S_ISLNK(stat_buf.st_mode)) {
+         char *dirpath,*dirend;
+-        ret = readlink(input_file, link_buf, sizeof(link_buf) - 1);
+-        if (ret < 0) {
+-            perror(input_file);
+-            goto cleanup;
++        char *link_buf = NULL;
++        size_t size = 64;
++        while (1) {
++            link_buf = realloc(link_buf, size);
++            if (!link_buf) {
++                perror(input_file);
++                goto cleanup;
++            }
++            ret = readlink(input_file, link_buf, size - 1);
++            if (ret < 0) {
++                perror(input_file);
++                goto cleanup;
++            }
++            if (ret < size - 1)
++                break;
++            size *= 2;
+         }
+         link_buf[ret] = 0;
+         link_file = mkoutput(input_file);
+diff --git a/security/nss/lib/freebl/unix_rand.c b/security/nss/lib/freebl/unix_rand.c
+index 579040e..b4fef7a 100644
+--- a/security/nss/lib/freebl/unix_rand.c
++++ b/security/nss/lib/freebl/unix_rand.c
+@@ -1031,6 +1031,10 @@ void ReadSingleFile(const char *fileName)
+ #define _POSIX_PTHREAD_SEMANTICS
+ #include <dirent.h>
+ 
++#ifndef PATH_MAX
++#define PATH_MAX 1024
++#endif
++
+ PRBool
+ ReadFileOK(char *dir, char *file)
+ {
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/porting/NSS-GNU-kFreeBSD-support.patch b/recipes-mozilla/firefox/firefox/porting/NSS-GNU-kFreeBSD-support.patch
new file mode 100644
index 0000000..3128fe6
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/porting/NSS-GNU-kFreeBSD-support.patch
@@ -0,0 +1,165 @@
+From d8e24518e18a12815cdc3a60af5c8593ea4fa941 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 13 Jan 2014 12:01:08 +0900
+Subject: [NSS] GNU/kFreeBSD support
+
+---
+ security/nss/coreconf/Linux.mk       | 22 ++++++++++++++++++----
+ security/nss/coreconf/arch.mk        |  8 ++++++++
+ security/nss/coreconf/config.mk      |  2 +-
+ security/nss/lib/freebl/unix_rand.c  |  3 ++-
+ security/nss/lib/softoken/softoken.h |  2 +-
+ security/nss/lib/ssl/sslmutex.c      |  2 +-
+ security/nss/lib/ssl/sslmutex.h      |  2 +-
+ 7 files changed, 32 insertions(+), 9 deletions(-)
+
+diff --git a/security/nss/coreconf/Linux.mk b/security/nss/coreconf/Linux.mk
+index 177a3c8..4f17549 100644
+--- a/security/nss/coreconf/Linux.mk
++++ b/security/nss/coreconf/Linux.mk
+@@ -100,7 +100,7 @@ ifneq ($(OS_TARGET),Android)
+ LIBC_TAG		= _glibc
+ endif
+ 
+-ifeq ($(OS_RELEASE),2.0)
++ifeq ($(KERNEL)-$(OS_RELEASE),linux-2.0)
+ 	OS_REL_CFLAGS	+= -DLINUX2_0
+ 	MKSHLIB		= $(CC) -shared -Wl,-soname -Wl,$(@:$(OBJDIR)/%.so=%.so) $(RPATH)
+ 	ifdef MAPFILE
+@@ -130,14 +130,26 @@ ifeq ($(USE_PTHREADS),1)
+ OS_PTHREAD = -lpthread 
+ endif
+ 
+-OS_CFLAGS		= $(DSO_CFLAGS) $(OS_REL_CFLAGS) $(ARCHFLAG) -Wall -Werror-implicit-function-declaration -Wno-switch -pipe -ffunction-sections -fdata-sections -DLINUX -Dlinux -DHAVE_STRERROR
++# See bug 537829, in particular comment 23.
++# Place -ansi and *_SOURCE before $(DSO_CFLAGS) so DSO_CFLAGS can override
++# -ansi on platforms like Android where the system headers are C99 and do
++# not build with -ansi.
++STANDARDS_CFLAGS	= -D_POSIX_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE
++OS_CFLAGS		= $(STANDARDS_CFLAGS) $(DSO_CFLAGS) $(OS_REL_CFLAGS) $(ARCHFLAG) -Wall -Werror-implicit-function-declaration -Wno-switch -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR
++ifeq ($(KERNEL),linux)
++OS_CFLAGS		+= -DLINUX -Dlinux
++endif
+ OS_LIBS			= $(OS_PTHREAD) -ldl -lc
+ 
+ ifdef USE_PTHREADS
+ 	DEFINES		+= -D_REENTRANT
+ endif
+ 
+-ARCH			= linux
++ifeq ($(KERNEL),linux)
++	ARCH		= linux
++else
++	ARCH		= gnu
++endif
+ 
+ DSO_CFLAGS		= -fPIC
+ DSO_LDOPTS		= -shared $(ARCHFLAG) -Wl,--gc-sections
+@@ -154,7 +166,7 @@ ifdef _SBOX_DIR
+ LDFLAGS			+= -Wl,-rpath-link,/usr/lib:/lib
+ endif
+ 
+-# INCLUDES += -I/usr/include -Y/usr/include/linux
++# INCLUDES += -I/usr/include
+ G++INCLUDES		= -I/usr/include/g++
+ 
+ #
+@@ -189,7 +201,9 @@ RPATH = -Wl,-rpath,'$$ORIGIN:/opt/sun/private/lib'
+ endif
+ endif
+ 
++ifeq ($(KERNEL), linux)
+ OS_REL_CFLAGS   += -DLINUX2_1
++endif
+ MKSHLIB         = $(CC) $(DSO_LDOPTS) -Wl,-soname -Wl,$(@:$(OBJDIR)/%.so=%.so) $(RPATH)
+ 
+ ifdef MAPFILE
+diff --git a/security/nss/coreconf/arch.mk b/security/nss/coreconf/arch.mk
+index 782e6c0..521d265 100644
+--- a/security/nss/coreconf/arch.mk
++++ b/security/nss/coreconf/arch.mk
+@@ -122,6 +122,14 @@ ifeq ($(OS_ARCH),Linux)
+     ifneq ($(words $(OS_RELEASE)),1)
+ 	OS_RELEASE := $(word 1,$(OS_RELEASE)).$(word 2,$(OS_RELEASE))
+     endif
++    KERNEL = linux
++endif
++
++# This check must be last.  Since all uses of OS_ARCH that follow affect only
++# userland, we can merge other Glibc systems with Linux here.
++ifneq (, $(filter GNU GNU_%, $(OS_ARCH)))
++OS_ARCH = Linux
++OS_RELEASE = 2.6
+ endif
+ 
+ #
+diff --git a/security/nss/coreconf/config.mk b/security/nss/coreconf/config.mk
+index 99c6ce6..9d619f1 100644
+--- a/security/nss/coreconf/config.mk
++++ b/security/nss/coreconf/config.mk
+@@ -31,7 +31,7 @@ endif
+ #######################################################################
+ 
+ TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin BeOS OpenBSD \
+-              AIX RISCOS WINNT WIN95 Linux Android
++              AIX RISCOS WINNT WIN95 Linux Android GNU GNU_%
+ 
+ ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
+ include $(CORE_DEPTH)/coreconf/$(OS_TARGET).mk
+diff --git a/security/nss/lib/freebl/unix_rand.c b/security/nss/lib/freebl/unix_rand.c
+index b4fef7a..20bfaa9 100644
+--- a/security/nss/lib/freebl/unix_rand.c
++++ b/security/nss/lib/freebl/unix_rand.c
+@@ -156,7 +156,8 @@ static SECStatus RNG_kstat(PRUint32* fed)
+ 
+ #if defined(SCO) || defined(UNIXWARE) || defined(BSDI) || defined(FREEBSD) \
+     || defined(NETBSD) || defined(DARWIN) || defined(OPENBSD) \
+-    || defined(NTO) || defined(__riscos__)
++    || defined(NTO) || defined(__riscos__) || defined(__GNU__) \
++    || defined(__FreeBSD_kernel__) || defined(__NetBSD_kernel__)
+ #include <sys/times.h>
+ 
+ #define getdtablesize() sysconf(_SC_OPEN_MAX)
+diff --git a/security/nss/lib/softoken/softoken.h b/security/nss/lib/softoken/softoken.h
+index fbd00b6..bb35af8 100644
+--- a/security/nss/lib/softoken/softoken.h
++++ b/security/nss/lib/softoken/softoken.h
+@@ -184,7 +184,7 @@ extern PRBool sftk_fatalError;
+ 
+ #define CHECK_FORK_MIXED
+ 
+-#elif defined(LINUX)
++#elif defined(LINUX) || defined (__GLIBC__)
+ 
+ #define CHECK_FORK_PTHREAD
+ 
+diff --git a/security/nss/lib/ssl/sslmutex.c b/security/nss/lib/ssl/sslmutex.c
+index ff63680..fb4c4ab7 100644
+--- a/security/nss/lib/ssl/sslmutex.c
++++ b/security/nss/lib/ssl/sslmutex.c
+@@ -56,7 +56,7 @@ static SECStatus single_process_sslMutex_Lock(sslMutex* pMutex)
+     return SECSuccess;
+ }
+ 
+-#if defined(LINUX) || defined(AIX) || defined(BEOS) || defined(BSDI) || (defined(NETBSD) && __NetBSD_Version__ < 500000000) || defined(OPENBSD)
++#if defined(LINUX) || defined(AIX) || defined(BEOS) || defined(BSDI) || (defined(NETBSD) && __NetBSD_Version__ < 500000000) || defined(OPENBSD) || defined(__GLIBC__)
+ 
+ #include <unistd.h>
+ #include <fcntl.h>
+diff --git a/security/nss/lib/ssl/sslmutex.h b/security/nss/lib/ssl/sslmutex.h
+index b784baf..4a21d84 100644
+--- a/security/nss/lib/ssl/sslmutex.h
++++ b/security/nss/lib/ssl/sslmutex.h
+@@ -50,7 +50,7 @@ typedef struct
+ 
+ typedef int    sslPID;
+ 
+-#elif defined(LINUX) || defined(AIX) || defined(BEOS) || defined(BSDI) || (defined(NETBSD) && __NetBSD_Version__ < 500000000) || defined(OPENBSD)
++#elif defined(LINUX) || defined(AIX) || defined(BEOS) || defined(BSDI) || (defined(NETBSD) && __NetBSD_Version__ < 500000000) || defined(OPENBSD) || defined(__GLIBC__)
+ 
+ #include <sys/types.h>
+ #include "prtypes.h"
+-- 
+cgit v0.11.2
+
+
diff --git a/recipes-mozilla/firefox/firefox/powerpc_va_list.patch b/recipes-mozilla/firefox/firefox/powerpc_va_list.patch
deleted file mode 100644
index e91e09a..0000000
--- a/recipes-mozilla/firefox/firefox/powerpc_va_list.patch
+++ /dev/null
@@ -1,44 +0,0 @@
---- mozilla-release.ORIG/xpcom/glue/nsTextFormatter.cpp	2009-07-30 09:30:35.000000000 -0600
-+++ mozilla-release/xpcom/glue/nsTextFormatter.cpp	2010-03-24 15:48:24.000000000 -0600
-@@ -70,7 +70,10 @@
- ** Note: on some platforms va_list is defined as an array,
- ** and requires array notation.
- */
--
-+#if defined(__powerpc__)
-+#define HAVE_VA_LIST_AS_ARRAY
-+#endif
-+
- #ifdef HAVE_VA_COPY
- #define VARARGS_ASSIGN(foo, bar)        VA_COPY(foo,bar)
- #elif defined(HAVE_VA_LIST_AS_ARRAY)
-
-diff -ur mozilla-release.ORIG/js/src/jsapi.cpp mozilla-release/js/src/jsapi.cpp
---- mozilla-release.ORIG/js/src/jsapi.cpp	2012-02-15 23:40:35.000000000 -0700
-+++ mozilla-release/js/src/jsapi.cpp	2012-03-01 17:01:41.716770994 -0700
-@@ -108,6 +108,10 @@
- #include "jsxml.h"
- #endif
- 
-+#if defined(__powerpc__)
-+#define HAVE_VA_LIST_AS_ARRAY
-+#endif
-+
- using namespace js;
- using namespace js::gc;
- using namespace js::types;
-
-diff -ur mozilla-release.ORIG/js/src/jsprf.cpp mozilla-release/js/src/jsprf.cpp
---- mozilla-release.ORIG/js/src/jsprf.cpp	2012-02-15 23:40:35.000000000 -0700
-+++ mozilla-release/js/src/jsprf.cpp	2012-03-01 17:01:41.348769842 -0700
-@@ -57,6 +57,10 @@
- ** Note: on some platforms va_list is defined as an array,
- ** and requires array notation.
- */
-+#if defined(__powerpc__)
-+#define HAVE_VA_LIST_AS_ARRAY
-+#endif
-+
- #ifdef HAVE_VA_COPY
- #define VARARGS_ASSIGN(foo, bar)        VA_COPY(foo,bar)
- #elif defined(HAVE_VA_LIST_AS_ARRAY)
diff --git a/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch b/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch
index f01ac83..eb40b53 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch
@@ -1,21 +1,25 @@
+From 636a4989f50bd4a59869a75c63b6e01035700c9e Mon Sep 17 00:00:00 2001
 From: Mike Hommey <mh@glandium.org>
 Date: Fri, 17 Feb 2012 17:47:15 +0100
 Subject: Don't auto-disable extensions in system directories
 
 ---
- browser/app/profile/firefox.js |    2 +-
+ browser/app/profile/firefox.js | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
-index 3d979c2..6d72e8d 100644
+index 27ceb4d..899d7c8 100644
 --- a/browser/app/profile/firefox.js
 +++ b/browser/app/profile/firefox.js
-@@ -88,7 +88,7 @@ pref("extensions.hotfix.certs.1.sha1Fingerprint", "CA:C4:7D:BF:63:4D:24:E9:DC:93
- // Disable add-ons installed into the shared user and shared system areas by
- // default. This does not include the application directory. See the SCOPE
- // constants in AddonManager.jsm for values to use here
+@@ -65,7 +65,7 @@ pref("extensions.hotfix.certs.1.sha1Fingerprint", "91:53:98:0C:C1:86:DF:47:8F:35
+ 
+ // Disable add-ons that are not installed by the user in all scopes by default.
+ // See the SCOPE constants in AddonManager.jsm for values to use here.
 -pref("extensions.autoDisableScopes", 15);
 +pref("extensions.autoDisableScopes", 3);
  
  // Dictionary download preference
  pref("browser.dictionaries.download.url", "https://addons.mozilla.org/%LOCALE%/firefox/dictionaries/");
+-- 
+cgit v0.11.2
+
diff --git a/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch b/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch
deleted file mode 100644
index 773b61a..0000000
--- a/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Mike Hommey <glandium@debian.org>
-Date: Thu, 13 Mar 2008 20:28:02 +0100
-Subject: Enable intl.locale.matchOS, and report the locale correctly
-
-https://bugzilla.mozilla.org/show_bug.cgi?id=331779
----
- xulrunner/app/xulrunner.js |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/xulrunner/app/xulrunner.js b/xulrunner/app/xulrunner.js
-index 880593c..0a0f5a9 100644
---- a/xulrunner/app/xulrunner.js
-+++ b/xulrunner/app/xulrunner.js
-@@ -39,7 +39,8 @@
- // We need to override the default values of these preferences since all.js
- // assumes these are in the navigator package, which for us is nonexistent.
- // XXX(darin): perhaps all.js should not be seamonkey specific
--pref("general.useragent.locale", "@AB_CD@");
-+pref("intl.locale.matchOS", true);
-+pref("general.useragent.locale", "chrome://global/locale/intl.properties");
- pref("xpinstall.dialog.confirm", "chrome://mozapps/content/xpinstall/xpinstallConfirm.xul");
- pref("xpinstall.dialog.progress.chrome", "chrome://mozapps/content/extensions/extensions.xul");
- pref("xpinstall.dialog.progress.skin", "chrome://mozapps/content/extensions/extensions.xul");
diff --git a/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch b/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch
deleted file mode 100644
index 68034fc..0000000
--- a/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 18 Oct 2008 14:30:06 +0200
-Subject: Remove general.useragent.locale prefs from firefox*.js
-
-It is better defined in the GRE provided by xulrunner-1.9
----
- browser/app/profile/firefox.js        |    1 -
- browser/locales/en-US/firefox-l10n.js |    1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
-index 4f3aac3..3d979c2 100644
---- a/browser/app/profile/firefox.js
-+++ b/browser/app/profile/firefox.js
-@@ -229,7 +229,6 @@ pref("keyword.enabled", true);
- // "use the search service's default engine"
- pref("keyword.URL", "");
- 
--pref("general.useragent.locale", "@AB_CD@");
- pref("general.skins.selectedSkin", "classic/1.0");
- 
- pref("general.smoothScroll", false);
-diff --git a/browser/locales/en-US/firefox-l10n.js b/browser/locales/en-US/firefox-l10n.js
-index e9027aa..a683b7f 100644
---- a/browser/locales/en-US/firefox-l10n.js
-+++ b/browser/locales/en-US/firefox-l10n.js
-@@ -36,4 +36,3 @@
- 
- #filter substitution
- 
--pref("general.useragent.locale", "@AB_CD@");
diff --git a/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch b/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch
index 9058cd4..b252065 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch
@@ -1,16 +1,17 @@
+From 90c98927045ce21216d948012330253690c6b7fe Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Thu, 13 Mar 2008 20:30:19 +0100
 Subject: Set DPI to system settings
 
 ---
- modules/libpref/src/init/all.js |    2 +-
+ modules/libpref/init/all.js | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/modules/libpref/src/init/all.js b/modules/libpref/src/init/all.js
-index 3c0a70c..10b82bb 100644
---- a/modules/libpref/src/init/all.js
-+++ b/modules/libpref/src/init/all.js
-@@ -1397,7 +1397,7 @@ pref("layout.css.visited_links_enabled", true);
+diff --git a/modules/libpref/init/all.js b/modules/libpref/init/all.js
+index b0c3c6f..74a71b1 100644
+--- a/modules/libpref/init/all.js
++++ b/modules/libpref/init/all.js
+@@ -2064,7 +2064,7 @@ pref("layout.css.visited_links_enabled", true);
  // A value of 0 means use the system DPI. A positive value is used as the DPI.
  // This sets the physical size of a device pixel and thus controls the
  // interpretation of physical units such as "pt".
@@ -19,3 +20,6 @@ index 3c0a70c..10b82bb 100644
  
  // Set the number of device pixels per CSS pixel. A value <= 0 means choose
  // automatically based on user settings for the platform (e.g., "UI scale factor"
+-- 
+cgit v0.11.2
+
diff --git a/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch b/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch
index cee79cf..a5b3707 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch
@@ -1,20 +1,24 @@
+From 7679fd1ee207287bfc8164a800c77bdd98df2d18 Mon Sep 17 00:00:00 2001
 From: Mike Hommey <glandium@debian.org>
 Date: Sat, 8 Dec 2007 19:24:40 +0100
 Subject: Set javascript.options.showInConsole
 
 ---
- modules/libpref/src/init/all.js |    1 +
+ modules/libpref/init/all.js | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/modules/libpref/src/init/all.js b/modules/libpref/src/init/all.js
-index e8160c2..3c0a70c 100644
---- a/modules/libpref/src/init/all.js
-+++ b/modules/libpref/src/init/all.js
-@@ -627,6 +627,7 @@ pref("javascript.options.strict",           false);
- pref("javascript.options.strict.debug",     true);
+diff --git a/modules/libpref/init/all.js b/modules/libpref/init/all.js
+index ba6de28..b0c3c6f 100644
+--- a/modules/libpref/init/all.js
++++ b/modules/libpref/init/all.js
+@@ -1044,6 +1044,7 @@ pref("javascript.options.strict.debug",     true);
  #endif
- pref("javascript.options.relimit",          true);
+ pref("javascript.options.baselinejit",      true);
+ pref("javascript.options.ion",              true);
 +pref("javascript.options.showInConsole",    true);
- pref("javascript.options.tracejit.content",  false);
- pref("javascript.options.tracejit.chrome",   false);
- pref("javascript.options.methodjit.content", true);
+ pref("javascript.options.asmjs",            true);
+ pref("javascript.options.native_regexp",    true);
+ pref("javascript.options.parallel_parsing", true);
+-- 
+cgit v0.11.2
+
diff --git a/recipes-mozilla/firefox/firefox/x86_64-fix.patch b/recipes-mozilla/firefox/firefox/x86_64-fix.patch
deleted file mode 100644
index 69bd957..0000000
--- a/recipes-mozilla/firefox/firefox/x86_64-fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Loosely based on
-https://bug436263.bugzilla.mozilla.org/attachment.cgi?id=323103
-
---- mozilla-esr10/js/src/jscpucfg.h.orig        2014-08-15 16:02:55.462991201 +0000
-+++ mozilla-esr10/js/src/jscpucfg.h     2014-08-15 15:56:10.858551202 +0000
-@@ -42,6 +42,10 @@
-
- #define JS_HAVE_LONG_LONG
-
-+#if defined __GNUC__ && defined __x86_64__
-+#define HAVE_VA_LIST_AS_ARRAY
-+#endif
-+
- #if defined(_WIN64)
-
- #if defined(_M_X64) || defined(_M_AMD64) || defined(_AMD64_)
diff --git a/recipes-mozilla/firefox/firefox_10.0.12esr.bb b/recipes-mozilla/firefox/firefox_10.0.12esr.bb
deleted file mode 100644
index 8bd9ca4..0000000
--- a/recipes-mozilla/firefox/firefox_10.0.12esr.bb
+++ /dev/null
@@ -1,156 +0,0 @@
-# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION ?= "Browser made by mozilla"
-DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl nss nspr"
-
-LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
-
-SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
-           file://mozilla-firefox.png \
-           file://mozilla-firefox.desktop \
-           file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
-           file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch \
-           file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
-           file://fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch \
-           file://fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch \
-           file://fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch \
-           file://fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch \
-           file://fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch \
-           file://fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch \
-           file://fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch \
-           file://fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch \
-           file://fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch \
-           file://fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch \
-           file://fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch \
-           file://fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch \
-           file://fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch \
-           file://fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch \
-           file://fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch \
-           file://fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch \
-           file://fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch \
-           file://fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch \
-           file://iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch \
-           file://iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch \
-           file://porting/Add-xptcall-support-for-SH4-processors.patch \
-           file://porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch \
-           file://porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch \
-           file://porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch \
-           file://porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch \
-           file://porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch \
-           file://porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch \
-           file://porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch \
-           file://porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch \
-           file://porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch \
-           file://porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch \
-           file://porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch \
-           file://prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch \
-           file://prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch \
-           file://prefs/Set-javascript.options.showInConsole.patch \
-           file://prefs/Set-DPI-to-system-settings.patch \
-           file://prefs/Don-t-auto-disable-extensions-in-system-directories.patch \
-           file://debian-hacks/Check-less-things-during-configure-when-using-libxul.patch \
-           file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
-           file://debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch \
-           file://debian-hacks/Don-t-build-example-component.patch \
-           file://debian-hacks/Don-t-install-system-profile.patch \
-           file://debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch \
-           file://debian-hacks/Add-soname-to-appropriate-libraries.patch \
-           file://debian-hacks/Add-another-preferences-directory-for-applications-p.patch \
-           file://debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch \
-           file://debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch \
-           file://debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch \
-           file://debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch \
-           file://debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch \
-           file://debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch \
-           file://debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch \
-           file://debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch \
-           file://debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch \
-           file://debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch \
-           file://debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch \
-           file://debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch \
-           file://debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch \
-           file://configure.patch \
-           file://powerpc_va_list.patch \
-           file://freetype-2.5.patch \
-           file://x86_64-fix.patch \
-           file://vendor.js \
-           file://alignment.patch \
-           file://Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch"
-
-SRC_URI[archive.md5sum] = "ea6a9d240c271341eba014467b97e8ad"
-SRC_URI[archive.sha256sum] = "9f12cb7fd18fc51e995cd67b70a090f32fcd8dcf636be1b840281f2612d9db40"
-
-S = "${WORKDIR}/mozilla-esr10"
-
-inherit mozilla
-
-EXTRA_OEMAKE = "installdir=${libdir}/${PN}"
-
-ARM_INSTRUCTION_SET = "arm"
-
-do_install() {
-	oe_runmake -C "${MOZ_OBJDIR}" DESTDIR="${D}" destdir="${D}" install
-	install -d ${D}${datadir}/applications
-	install -d ${D}${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
-	install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
-	install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pref/
-	rm -f ${D}${libdir}/${PN}/TestGtkEmbed
-	rm -f ${D}${libdir}/${PN}/defaults/pref/firefox-l10n.js
-
-	# use locale settings
-	grep -Rl intl.locale.matchOS ${D}${libdir}/${PN}/ \
-	   | grep '.js$' \
-	   | xargs sed -i 's/\(pref("intl.locale.matchOS",\s*\)false)/\1true)/g'
-
-	# disable application updating
-	grep -Rl app.update.enabled ${D}${libdir}/${PN}/ \
-	   | grep '.js$' \
-	   | xargs sed -i 's/\(pref("app.update.enabled",\s*\)true)/\1false)/g'
-}
-
-PACKAGES += "${PN}-inspector"
-
-FILES_${PN}-inspector = "${libdir}/${PN}/chrome/inspector* \
-                         ${libdir}/${PN}/components/*nspector* \
-                         ${libdir}/${PN}/extensions/inspector* \
-                         ${libdir}/${PN}/defaults/preferences/inspector*"
-FILES_${PN} = "${bindir}/${PN} \
-               ${datadir}/applications/ \
-               ${datadir}/pixmaps/ \
-               ${libdir}/${PN}/* \
-               ${libdir}/${PN}/.autoreg \
-               ${bindir}/defaults"
-FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
-FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
-FILES_${PN}-dbg += "${libdir}/${PN}/.debug \
-                    ${libdir}/${PN}/*/.debug \
-                    ${libdir}/${PN}/*/*/.debug \
-                    ${libdir}/${PN}/*/*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
-                    ${bindir}/.debug"
-
-# We don't build XUL as system shared lib, so we can mark all libs as private
-PRIVATE_LIBS = "libmozjs.so \
-                libxpcom.so \
-                libnspr4.so \
-                libxul.so \
-                libmozalloc.so \
-                libplc4.so \
-                libplds4.so"
-
-# mark libraries also provided by nss as private too
-PRIVATE_LIBS += " \
-    libfreebl3.so \
-    libnss3.so \
-    libnssckbi.so \
-    libsmime3.so \
-    libnssutil3.so \
-    libnssdbm3.so \
-    libssl3.so \
-    libsoftokn3.so \
-"
diff --git a/recipes-mozilla/firefox/firefox_38.2.1esr.bb b/recipes-mozilla/firefox/firefox_38.2.1esr.bb
new file mode 100644
index 0000000..4065031
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox_38.2.1esr.bb
@@ -0,0 +1,115 @@
+# Copyright (C) 2009-2015, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION ?= "Browser made by mozilla"
+DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx \
+            virtual/libgl nss nspr pulseaudio yasm-native icu"
+
+LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=f7e14664a6dca6a06efe93d70f711c0e"
+
+SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
+           file://mozilla-firefox.png \
+           file://mozilla-firefox.desktop \
+           file://vendor.js \
+           file://fix-python-path.patch \
+           file://freetype-2.6.patch \
+           file://prefs/Don-t-auto-disable-extensions-in-system-directories.patch \
+           file://prefs/Set-DPI-to-system-settings.patch \
+           file://prefs/Set-javascript.options.showInConsole.patch \
+           file://porting/Add-xptcall-support-for-SH4-processors.patch \
+           file://porting/NSS-Fix-FTBFS-on-Hurd-because-of-MAXPATHLEN.patch \
+           file://porting/NSS-GNU-kFreeBSD-support.patch \
+           file://porting/Make-powerpc-not-use-static-page-sizes-in-mozjemalloc.patch \
+           file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
+           file://fixes/Avoid-spurious-Run-items-in-application-handlers.patch \
+           file://fixes/Bug-1136958-Remove-duplicate-SkDiscardableMemory_none.patch \
+           file://fixes/Bug-1166243-Remove-build-function-from-js-and-xpc.patch \
+           file://fixes/Bug-1166538-Use-dozip.py-for-langpacks.patch \
+           file://fixes/Bug-1094324-Set-browser.newtabpage.enhanced-default.patch \
+           file://fixes/Bug-1168231-Normalize-file-mode-in-jars.patch \
+           file://fixes/Bug-1098343-part-1-support-sticky-preferences-meaning.patch \
+           file://fixes/Fix-build-error-in-MIPS-SIMD-when-compiling-with-mfpxx.patch \
+           file://iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.properties.patch \
+           file://iceweasel-branding/Modify-search-plugins-depending-on-MOZ_APP_NAME.patch \
+           file://iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on.patch \
+           file://iceweasel-branding/Use-firefox-instead-of-MOZ_APP_NAME-for-profile-reset.patch \
+           file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
+           file://debian-hacks/Add-another-preferences-directory-for-applications.patch \
+           file://debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGINS.patch \
+           file://debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch \
+           file://debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-than.patch \
+           file://debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch \
+           file://debian-hacks/Load-distribution-search-plugins-from.patch \
+           file://debian-hacks/Handle-transition-to-etc-appname-searchplugins.patch \
+           file://debian-hacks/Preprocess-appstrings.properties.patch \
+           file://debian-hacks/Disable-Firefox-Health-Report.patch \
+           file://debian-hacks/Bump-search-engine-max-icon-size-to-35kB.patch \
+           file://debian-hacks/NSS-Adds-the-SPI-Inc.-and-CAcert.org-CA-certificates.patch \
+           file://debian-hacks/Work-around-binutils-assertion-on-mips.patch \
+           file://debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch \
+           "
+
+SRC_URI[archive.md5sum] = "3b9e4d1bf0dc9b502042e973c91d1a08"
+SRC_URI[archive.sha256sum] = "0143b3f99ccb390949d7f3847215f6f9b4bb7cd692f4f802921d2f9961bf270a"
+
+S = "${WORKDIR}/mozilla-esr38"
+# MOZ_APP_BASE_VERSION should be incremented after a release
+MOZ_APP_BASE_VERSION = "38.2"
+
+inherit mozilla
+
+EXTRA_OEMAKE += "installdir=${libdir}/${PN}"
+
+ARM_INSTRUCTION_SET = "arm"
+
+do_install_append() {
+    install -d ${D}${datadir}/applications
+    install -d ${D}${datadir}/pixmaps
+
+    install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
+    install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
+    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/defaults/pref/
+
+    # Fix ownership of files
+    chown root:root -R ${D}${datadir}
+    chown root:root -R ${D}${libdir}
+}
+
+FILES_${PN} = "${bindir}/${PN} \
+               ${datadir}/applications/ \
+               ${datadir}/pixmaps/ \
+               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/* \
+               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.autoreg \
+               ${bindir}/defaults"
+FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
+FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
+FILES_${PN}-dbg += "${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.debug \
+                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/.debug \
+                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/.debug \
+                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/*/.debug \
+                    ${libdir}/${PN}-devel-*/*/.debug \
+                    ${libdir}/${PN}-devel-*/*/*/.debug \
+                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
+                    ${bindir}/.debug"
+
+# We don't build XUL as system shared lib, so we can mark all libs as private
+PRIVATE_LIBS = "libmozjs.so \
+                libxpcom.so \
+                libnspr4.so \
+                libxul.so \
+                libmozalloc.so \
+                libplc4.so \
+                libplds4.so"
+
+# mark libraries also provided by nss as private too
+PRIVATE_LIBS += " \
+    libfreebl3.so \
+    libnss3.so \
+    libnssckbi.so \
+    libsmime3.so \
+    libnssutil3.so \
+    libnssdbm3.so \
+    libssl3.so \
+    libsoftokn3.so \
+"
-- 
2.6.2


