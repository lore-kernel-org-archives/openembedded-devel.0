Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 51F047E426
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jun 2019 10:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45MBdj6S8jz2C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jun 2019 12:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560074554;
	bh=HRyTKK/bXTUawbd7r6ZzwX0jW8jqjXZMvIU4OJx98Bs=;
	h=From:To:Subject:Date:From;
	b=tU7vYvUIgAUij11w8BBO0XcDKBOVbZD9oUO8miuFJ1aEPP3QEwmZmL0rSl/naz9eM
	IOaGl6e9gXZhFV2xwvH8waXKTRAixONF8vAiV3uTYtzKTah4tmQhdcNZqctbfx2Goq
	l62TP47Qk4ymer0hAyMTZcKiJ6LAnXDnrUkFc2jZvH7QgbacidHuToQxbrNvSytCKc
	dmOhZzYncnPd/fed5chsaSo2QLcPsGmnuWcxn3qhig1LvHLg+kCi99V1Ni/a1B4JE5
	PZQk06iehpZB12A7s4B8k79UCKM88xQr1j6SuFx2Q5RSOlcIMjTMhq4LzXjX8qPtvr
	BptVczkzo/jOaEHcbBqHeEwShpfaRGck6v+dksfBZl0DjDnumuZ3u2Fbzepdlzk6mt
	zCFdeOiZiJdjK0qMHPJtFdP1tDw/MOxbeH6xEDOX4tNJrAYebHbTECuDfP3Pf0YNPo
	sBGnkLUjAcke2DO6teZbbSVP8+0X1Dyab3YkxZH4Swxo99UeffKXpE1pi6wdwc8ozh
	fCTbRUzaODaLfUpVhWjJE2L/NsTnAXJXrFxnFxry0+d8Q/Suu2hN2+ytYZjqCpU7w3
	gjRgSTEmcSU69bHcao2vKKnZ4WqI/A3wXivyEMDNvMAl6XlDTSnVzSKAcqhXW6DJW9
	YDQDGIKIQW4SHFu8tVz/cbIE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jun 2019 13:02:33 +0300
Message-Id: <20190609100233.10571-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-perl][PATCH] libauthen-radius-perl: Move back from meta-networking to meta-perl
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
X-List-Received-Date: Sun, 09 Jun 2019 10:02:33 -0000

It needs both freeradius and perl-module-data-dumper,
so neither place would fulfill all dependencies.

In general meta-perl looks like the more appropriate place.

The location in meta-networking also had the problem that
it was one directory too deep and therefore not included
in BBFILES.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-perl}/libauthen/libauthen-radius-perl/run-ptest       | 0
 .../libauthen-radius-perl/test.pl-adjust-for-ptest.patch          | 0
 .../recipes-perl}/libauthen/libauthen-radius-perl_0.22.bb         | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-devtools/perl => meta-perl/recipes-perl}/libauthen/libauthen-radius-perl/run-ptest (100%)
 rename {meta-networking/recipes-devtools/perl => meta-perl/recipes-perl}/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch (100%)
 rename {meta-networking/recipes-devtools/perl => meta-perl/recipes-perl}/libauthen/libauthen-radius-perl_0.22.bb (100%)

diff --git a/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/run-ptest b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
similarity index 100%
rename from meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/run-ptest
rename to meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
diff --git a/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
similarity index 100%
rename from meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
rename to meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
diff --git a/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
similarity index 100%
rename from meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl_0.22.bb
rename to meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
-- 
2.17.1


