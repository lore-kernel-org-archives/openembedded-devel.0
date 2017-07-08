Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4EC60767
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jul 2017 06:36:47 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id t186so26779773pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jul 2017 23:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=vcVE82sFw41ek2LbGhvnkKcSHTlktQZ8gP5fSEN4JYo=;
	b=AspCa8GjXpVEqt1bfiYhACuww9Vd28BahPxoRTeb8vjhY5/RO3VLSuPuyCDUbmLmtn
	Ks8SmxKXBNR/+Cq/kZArnvgN+r7eIYQFUbEHbp9SxQgxM+if/1pXquIzBNzf2NNmYNLk
	P+ww8J4I+3J1L4ymW3ncYM3AxY2PPGrA/05Gox5gV1aWL4ToYTF01YhGojMHt9v8sZVF
	Z+S65o2kYyxiWQzvRZ/XScx08b8xSRKVXXIe9hPvblGTcmHdeIfRTF88jY6udPL1lFpd
	CsYGWCcUfEOXoYU/DJbdF1MMkcqvdJnYJombHCZ3OLnVI/GJTDhK2YHIO7ZQirWIMQp8
	QMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vcVE82sFw41ek2LbGhvnkKcSHTlktQZ8gP5fSEN4JYo=;
	b=pHCEoW9e5/fiUB7wHO+TmhN/3yUM3EUw06RwDDIXKEsF0EMnqsad8RWSXAInD3fT8J
	MSQeuLRP73pFhMAflU1UQ03+AE3aB+WLz5TcjeL5ksRi8nHz2zy4/5tyqw2Wnn0MaZkL
	gn7yghlS+YY+mwx1yN90EMCX+wc0Fr4X7S92/D+W05XU+FFQHJOrY6V5bIU1XgaoNNN+
	cgmli8cJvWaw8Pz2cyT1iL2MhC1mWk/XzIB7aDZ+0uZuXKyPCDtajAUepER1MskTRuhh
	FDTfwxqROO+modB4ACSaf14O6FTCsTNcqsJkqp/ZiRPUfMRAye5TSamcIMWt9WjFaoTf
	mUfw==
X-Gm-Message-State: AIVw112bmfQhgAdeR2UkyOhqLAVflFq0xjV8vIHSWjkfPRvLNDnKkOQV
	T2XowGvx9GVxwcsf
X-Received: by 10.98.252.17 with SMTP id e17mr34501588pfh.63.1499495808623;
	Fri, 07 Jul 2017 23:36:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	s62sm11744175pfi.36.2017.07.07.23.36.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jul 2017 23:36:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jul 2017 23:36:32 -0700
Message-Id: <20170708063632.1941-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-browser] Fix firefox and chromium for musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Jul 2017 06:36:50 -0000

The following changes since commit c79cf6c7811afd2cd167e8967e3c29b1e797371e:

  Merge pull request #48 from kraj/kraj/master (2017-07-03 17:04:53 -0300)

are available in the git repository at:

  https://github.com/kraj/meta-browser kraj/master

for you to fetch changes up to 68ad85b614dcab5b6a4c931ee2c37a2e166bbc15:

  firefox: Fix build with musl (2017-07-07 23:27:58 -0700)

----------------------------------------------------------------
Khem Raj (4):
      Dont disable gold explicitly when ld-is-gold is not in distro features
      chromium: Fix build for musl platforms
      chromium: Always use gold linker
      firefox: Fix build with musl

 recipes-browser/chromium/chromium-browser.inc      | 23 +++++-
 recipes-browser/chromium/chromium.inc              |  7 ++
 ...-Define-TEMP_FAILURE_RETRY-if-not-defined.patch | 35 ++++++++++
 ...place-__WORDSIZE-with-defines-from-limits.patch | 40 +++++++++++
 ...03-Avoid-mallinfo-APIs-on-non-glibc-linux.patch | 48 +++++++++++++
 .../chromium/0004-include-fcntl.h-for-loff_t.patch | 25 +++++++
 ...off64_t-instead-of-the-internal-__off64_t.patch | 65 +++++++++++++++++
 .../0006-linux-glibc-make-the-distinction.patch    | 26 +++++++
 ...o-not-include-glibc_weak_symbols-for-musl.patch | 26 +++++++
 ...-member-name-__si_fields-from-LinuxSigInf.patch | 26 +++++++
 .../0009-Match-syscalls-to-match-musl.patch        | 47 +++++++++++++
 ...ninit-and-res_nclose-for-non-glibc-platfo.patch | 81 ++++++++++++++++++++++
 .../0011-Do-not-define-__sbrk-on-musl.patch        | 29 ++++++++
 .../0012-Adjust-default-pthread-stack-size.patch   | 77 ++++++++++++++++++++
 ...3-include-asm-generic-ioctl.h-for-TCGETS2.patch | 25 +++++++
 .../0014-link-with-libexecinfo-on-musl.patch       | 25 +++++++
 ...p-GNU-extentions-effective-only-when-usin.patch | 37 ++++++++++
 ...6-getcontext-API-is-unimplemented-in-musl.patch | 41 +++++++++++
 .../0001-mallinfo-is-glibc-specific-API.patch      | 34 +++++++++
 .../firefox/0002-disable-hunspell-hooks.patch      | 26 +++++++
 .../firefox/0003-define-TEMP_FAILURE_RETRY.patch   | 20 ++++++
 .../firefox/0004-Fix-mozilla-arm-builds.patch      | 26 +++++++
 recipes-mozilla/firefox/firefox_45.9.0esr.bb       |  7 ++
 23 files changed, 795 insertions(+), 1 deletion(-)
 create mode 100644 recipes-browser/chromium/chromium/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch
 create mode 100644 recipes-browser/chromium/chromium/0002-breakpad-Replace-__WORDSIZE-with-defines-from-limits.patch
 create mode 100644 recipes-browser/chromium/chromium/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
 create mode 100644 recipes-browser/chromium/chromium/0004-include-fcntl.h-for-loff_t.patch
 create mode 100644 recipes-browser/chromium/chromium/0005-use-off64_t-instead-of-the-internal-__off64_t.patch
 create mode 100644 recipes-browser/chromium/chromium/0006-linux-glibc-make-the-distinction.patch
 create mode 100644 recipes-browser/chromium/chromium/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch
 create mode 100644 recipes-browser/chromium/chromium/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch
 create mode 100644 recipes-browser/chromium/chromium/0009-Match-syscalls-to-match-musl.patch
 create mode 100644 recipes-browser/chromium/chromium/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch
 create mode 100644 recipes-browser/chromium/chromium/0011-Do-not-define-__sbrk-on-musl.patch
 create mode 100644 recipes-browser/chromium/chromium/0012-Adjust-default-pthread-stack-size.patch
 create mode 100644 recipes-browser/chromium/chromium/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
 create mode 100644 recipes-browser/chromium/chromium/0014-link-with-libexecinfo-on-musl.patch
 create mode 100644 recipes-browser/chromium/chromium/0015-metrics-Keep-GNU-extentions-effective-only-when-usin.patch
 create mode 100644 recipes-browser/chromium/chromium/0016-getcontext-API-is-unimplemented-in-musl.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0001-mallinfo-is-glibc-specific-API.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0002-disable-hunspell-hooks.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0003-define-TEMP_FAILURE_RETRY.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0004-Fix-mozilla-arm-builds.patch

