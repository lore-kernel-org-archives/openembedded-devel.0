Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id F08C37F9AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:13:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c23so17450596plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2020 22:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gCvxUrqsmr1Wax80Ybf/rE3lO2OIQJr6lpvJoXoZvuI=;
	b=roNtcSyJtpEnhuv4QqIwpKgFZGGd6kL0xRm3VYDVolkSnSpJUjSiYbbpLm7Mkbvnep
	IDasMz1bcDkkGWfak/WMkPhms3vEk0CajacWVX7c6gDVOiVwTkBzOhMPW5aU969b6rws
	R++2esEfaSKe3ReOhj9Es5TSSEQ89drt25MSuZtzRsfb8SAxRynSwUHBeuuUFhJlnniP
	mzKL13PVmNCWVNCtotcBpVO/ITi1RVmawfcNXGvxj6Zy3eV0a/oOKMtAZhLHddqdIIkl
	lM87KCWCM/Cvc1JEEMJ7KN6NgedChK85TrLiuOj+phmZNLUHSSnGe9gHZOwItYzihV2m
	KtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gCvxUrqsmr1Wax80Ybf/rE3lO2OIQJr6lpvJoXoZvuI=;
	b=Z/5ebA5gCzyWn1jHIfBQ8QaLpFQdXm95fZZOqcHBPOf5PFbJJTK56CTXvj+s2rRbOm
	l7L+r7i3rfD/fXDBu/jQgQDnoTiUP1n33OLoaAqF9LQzzo+7n697Gbd5BUVmWOoOezy8
	OXjI4mirO2I+e/hp0Pseho0K9DLWmwOAi/I/Xowow8TpdclWrYY0tZxexKEllEmcZu7h
	yB9iSndbJyGZNhciUALe9KprHFdVebz/APlm77ZnOrLSgbEE0kWfZhhEcL4rVT0hDxrb
	YZ5WoVzOiLQnCY8qHnZnRX52qqMDMGYOI8qRu9aGzu+1MeY/MC6ew/SqIPfIAMaEt1r5
	Kz1g==
X-Gm-Message-State: APjAAAUFThXRqvr6DRAe61ayEDZ1jIInXEtvv/hd5wi3QCBETxGxTpvq
	H/aKkVa6txf+bdOZxH8cKolTnzOSlG0=
X-Google-Smtp-Source: APXvYqx1XWEK5C58gPPJ+iAjVgwQ/ktjghULA8F4Wn92WkloVpjTj7sSmL/N3qMEw17PAyFADLq+UA==
X-Received: by 2002:a17:902:9a8d:: with SMTP id
	w13mr62842861plp.40.1577945620918; 
	Wed, 01 Jan 2020 22:13:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	e19sm9369149pjr.10.2020.01.01.22.13.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 22:13:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2020 22:13:26 -0800
Message-Id: <20200102061330.480482-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102061330.480482-1-raj.khem@gmail.com>
References: <20200102061330.480482-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/6] netcat: Fix build with gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 06:13:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/netcat/netcat/gettext.patch  | 16 ++++++++++++++++
 .../recipes-support/netcat/netcat_0.7.1.bb       |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcat/netcat/gettext.patch

diff --git a/meta-networking/recipes-support/netcat/netcat/gettext.patch b/meta-networking/recipes-support/netcat/netcat/gettext.patch
new file mode 100644
index 0000000000..f2e5f99270
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat/gettext.patch
@@ -0,0 +1,16 @@
+Fix build with gettext 0.20.x
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,7 +49,7 @@ AC_SUBST(all_libraries)
+ dnl I18n support
+ ALL_LINGUAS="it sk"
+ AM_GNU_GETTEXT([external], need-ngettext)
+-AM_INTL_SUBDIR
++#AM_INTL_SUBDIR
+ 
+ dnl find resolver functions and the socket library on some broken OS
+ AC_LBL_LIBRARY_NET
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index d961af542c..14d743f820 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
            file://obsolete_autoconf_macros.patch \
            file://netcat-locale_h.patch \
            file://make-netcat_flag_count_work.patch \
+           file://gettext.patch \
 "
 
 SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
-- 
2.24.1


