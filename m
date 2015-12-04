Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id A6F556FF78
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 03:22:18 +0000 (UTC)
Received: by oba1 with SMTP id 1so23451194oba.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Dec 2015 19:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8pgRNtZ9gk5JhhEJWabEOQ5sc2LvZCheK2QYifXu8j4=;
	b=E3RBYwxsXSTC8Piw9o1J/SxNsarVcjDlKjUJzYqGhDgBEAkmvT+dJxMIN4oo3pYCX0
	AkfWuUbd5GSc+ZXmCIg9NsBiTTN2DTf7l8k20sdb/2UVvN+LgLGTLEbedI8a8S8yTncK
	Tj6T5Z+g4ekK5J+luPwwkorp8tCgrSg50ELpZG+ptc9hQdSiVvhhnVm5QQ9+J2bRXE1a
	/6R2BnIufIjpi6H0M+w/8IIvhhxQB2wP3/byeaUUKjXCLLJMs5TUbIwJSpBcbQmAn4+J
	lW64qFLroBXEqSyzRo+n+YPZlBE3pw1bQgsI4z22i6eNqqDlHorudxMJtBf4sl4kkoP4
	eldw==
X-Received: by 10.60.233.10 with SMTP id ts10mr10627495oec.8.1449199339097;
	Thu, 03 Dec 2015 19:22:19 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ct9sm3533633oec.15.2015.12.03.19.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 19:22:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:21:56 -0800
Message-Id: <1449199316-14048-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-multimedia][PATCH 4/4] mpg123: update 1.21.0 -> 1.22.4
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
X-List-Received-Date: Fri, 04 Dec 2015 03:22:18 -0000

  http://mpg123.de/cgi-bin/scm/mpg123/tags/1.22.4/NEWS

1.22.4
---
- Fix stupid regression introduced with a bugfix in 1.14.1 to make
  free format streams work again. It took 3 years for someone to notice.
  I added a regression test for that now!

1.22.3
- Fix UTF-16 surrogate detection because that used to falsely detect
  characters above 0xDFFF as surrogates (bug 216).

1.22.2
---
- Fix buffering for funny sample formats (namely, 24 bit), that do not
  fit nicely into 32768 bytes. Effect was a nasty endless loop where
  mpg123 needs to be externally killed.

1.22.1
---
- Fix mpg123-id3dump when writing images with funny (manipulated) MIME type.
  Stupid mistake in length computation of the fallback file extension caused
  junk from memory being appended to the filename if the pointer size
  is less than 64 bit. For 64 bit pointers (or longer) it was correct by
  accident.
- Fix pedantic build by cleaning up out123 source, also now really showing
  the encoding list in --longhelp instead of possibly, again, writing junk
  from memory in there.
- Not linking libmpg123 against libltdl anymore (bug 215).
- Update MSVC++ ports a bit to make them work again.

1.22.0
---
- libmpg123 version 41
- Build fix: Avoid name clash on OSX SDK with "normal" being defined in an enum already.
- More resilience against folks who do not check errors and rather pass NULL pointers around (see NEWS.libmpg123).
  This changes some return values to MPG123_BAD_HANDLE instead of MPG123_ERR (always check for != MPG123_OK).
- Fix WAV writing to stdout on Windows (bug 214).
- Rework Xing/Info/Lame tag parsing, also detecting short ones without the TOC now.
  In addition, the warning about file size being off is a _lot_ more accurate now.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-multimedia/mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
rename to meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
index 4048404..22ea572 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
@@ -14,8 +14,8 @@ DEPENDS = "audiofile"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "13a9df5d4e7aa110e4ae27cf30128ce9"
-SRC_URI[sha256sum] = "3ad197f77c9ffdf3601e1c3183ae0709ccb3c3de68309527ce9375fcfb15dcba"
+SRC_URI[md5sum] = "2dfafae3bbc532b4c8b04a77c6a6de89"
+SRC_URI[sha256sum] = "5069e02e50138600f10cc5f7674e44e9bf6f1930af81d0e1d2f869b3c0ee40d2"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


