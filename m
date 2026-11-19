Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7906.1795060352618401465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 19:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XKvPMENH;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso2305341c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 19:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060352; x=1795665152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioX2QTmVitZYRWxgnqn3yF0mrcEyaUpJunIoJtaTTR0=;
        b=XKvPMENHgtNElaf/TP38YY7gq4T4KHix/gDdd1cQSChASOWLpZWtak6V+sOuRlfl5S
         vPZ5QKdPZJtuc4jLoqmFx7+pBSWFzxwgrg7evHV84fn8tBMuiOY7XXzTwZNmeEy0F+BW
         2FMr9wOvS9KEzmaxDPcbCx2AALKJyBDh4HGiqJSfcOM/UZPrGwj3jcOMaC4PSKVFODFy
         2aW34a2Oi0ypFMn+/e55o0kaC8rhlZlJgPI2Ip6ie/Hh6joi4tiPPjQfJ8JEJnVFl+ui
         1EgNRp/Z7BTSRtLXANzclQjz/Xz1x53vDRcUXVUP+lP41JLrpNFbXOm3L7Tb+McwidVA
         oc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060352; x=1795665152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioX2QTmVitZYRWxgnqn3yF0mrcEyaUpJunIoJtaTTR0=;
        b=rIweHpr0lH1Ho66O0W+/dQDXGo/FCfc/6oTt8g7Wx9lsjkQ0a73+HszBasgABBDMGC
         Z1AQ+CtlZvqgzqfi6F78ZHulqMfKSrJAL+57ktZzOh3xsIydqAMacWMNzkx41uyAhKiu
         0lzpIvT5OrlAG5qREh99X41uihmoaW3eN62B2MDjbtDBpOvCqhtaZz68El2cvY+xyr/y
         WSoqNW62/Wy6RbyF0w43Jh6OXBStr7hcIB6j1lxphEt1ERNVNSAUtCoqVDJE+KAfA0nQ
         46rP4e8NDK8Iiq0VpvpCcroYllCxh6u+fbcFmO+T6eEu1r6PfvhWcv1QUejZY27zQ6BV
         Qh8w==
X-Gm-Message-State: APuU4Z/R79s7IRXoc71yBKfv39ceehHqRtlepHoEldaVKZOaGrddzvGZ
	kF3KIC6kJBapfJ85pt/9ty4mtcl0cRU5vAhP6r+/3EmjP7vQxbmWspnXCFSl9KKO
X-Gm-Gg: AYBFou3nnrk7XxCKjl4S7GXLg/lqbi4+uDx5jRHyJZf3Fm5Ai/qvncVukXU+fRnnodp
	0QEQXvX9w1X04UeQMKEN7mZ1QCarkBCImEgZXR9xj2CRzVpoi+KupOk1u/MINaHQijzylWLG8pr
	WzzloC2sd1gStJCYreSXYn1CHRPpc6kiBC/CXLG1us9YPAIW0qX0CYwLsjjHJ0Qd2XT6OCuGYUC
	E7U/LfbiDXCcOvN+F6PkpfAu31oPCO/sFe0JlFYE1d2VUk0/nOkW4jzN5NtS6IkeQXqy+xRf9Wx
	6AlLzeBCRlGF4Z33+RHipSl71VTD+FubksBGJ4uI0NEAwFKlcSRdCyuqt0ZpyOaTRP7sR8WZuKf
	Zim7sfLtqSVwtqPGqU/AV5XcD9UpWPSyPR5izc0lsDjWJo88R5j5zU9RFG8wlhVnQORUfwS5FjE
	EG8fRYWmevZvBYyntkG79wFTsgl2fnGOMlIZJITMk11xgL/po939vcHsTMvrjQLbH+j+BH1VPbT
	30G3N5dLSe8+FcOujwQfJ358id0cFOylouBXm14p0Gu+lVT5i6fX550E4yCG0lCDVckgung6Brg
	4NwqbAke5uNOECs3OLlzvqWfBn/0I0Br3DDW4B0gSGwbLlHHomFx/s4GindnNdHK0ZxPC3qzZzW
	XY0PJAAiOdFJOvrDgLCGg2hsbsOsPfaDeIiVY9kO55FB21cSYK5RSQl8E3iyjnfP4Zm+kn6opEO
	95MrJKP/pPog848eWrZaZpz4jjZZ/4+JzwFAM4Kdg1B+otIsFR8s3cuxrA4o0NsYHHHEEnXFtJ/
	y93rNPjCIETqwVEKwLU/Vi65LR/VzhEcR//cNGv7+slkmO16R857X0mF3MhjUNHzGjXYzxUygH6
	/d2W
X-Received: by 2002:a05:7022:7e0b:b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b543c4204dmr4678277c88.41.1795060351712;
        Wed, 18 Nov 2026 19:52:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15342139c88.13.2026.11.18.19.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:52:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/4] libidn: Enable linker version script explicitly
Date: Wed, 18 Nov 2026 19:52:25 -0800
Message-ID: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 03:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132666
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults to
--no-undefined-version and rejects it, so with ld-is-lld configure
decides version scripts are unsupported and the library is built without
any symbol versions, silently changing its ABI. Consumers linked earlier
against the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

Every supported linker handles version scripts, so enable them
explicitly instead of relying on the broken probe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/libidn/libidn_1.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libidn/libidn_1.44.bb b/meta-oe/recipes-extended/libidn/libidn_1.44.bb
index 652d67fb69..f8e152aa31 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.44.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.44.bb
@@ -29,7 +29,7 @@ FILES:idn = "${bindir}/*"
 LICENSE:${PN} = "LGPL-2.1-or-later OR LGPL-3.0-only"
 LICENSE:idn = "GPL-3.0-or-later"

-EXTRA_OECONF = "--disable-csharp"
+EXTRA_OECONF = "--disable-csharp --enable-ld-version-script"

 do_install:append() {
 	rm -rf ${D}${datadir}/emacs
