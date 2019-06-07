Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 629747E4BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 20:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45LDPC2Kzdz40
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 22:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559938703;
	bh=HRyTKK/bXTUawbd7r6ZzwX0jW8jqjXZMvIU4OJx98Bs=;
	h=From:To:Subject:Date:From;
	b=DhE5vZwxkAV5VFJAzFVYNBBpBnsSxcQcFMuU7HOu64GfLEWK5NHuEhx9dzLXaimKH
	JyLS1tDWdsDUjzry1G7560TEda/J3jfzZjMEun4Vao0ikohjqhCGSJusXTDLT+G/g1
	htC3kwSAN0yJT8XF0fQEdjG598hv+v/vEI45lKZ+kWe27zrxv+DUPyxDwJpWRBUrBU
	MWVgrCj/1qy4E4HKltgl3pnm02uY+rtq9ejnzX7saFjpeI+tBf8HaZZkbWaCazB2RG
	VMnn5s4McHvCDM3l3XP739HLmVprcz2+EKs9k6XFSsLjVT1gMryApeFYs3PmPaIu32
	BwA6f2cY6myFP/pgnPyRUCgLGBHUFYAOdAjAhwft5mV+qgjXb6CrwHq4LK9gIsVyLL
	8GvjqBmawEPIx2mHM9wW63YJOk7LjsiQdl8+KoT0NMVbaZCBtpdHfxWPK+KWGtGuaD
	hYA7WUi/z7EPcK4yFumI3+mjdUu/mvwXyENn9dD9m3prutNqWNf29Z74hxDpW4kDRL
	BgMtkMv3BfB92uNkehgzSdXplWrgollkeJlP5EXDhOJGLIxh75A5ui69DMZo/I1YLk
	72e5KERt7M3RPI2eMxvLydTRexAbTknOTwmK0qHmvL7QxIap/htUHgFgoIo81PhU6d
	JJICc5EfiExae8vINKi8Sr0k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jun 2019 23:18:22 +0300
Message-Id: <20190607201822.28898-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-perl][PATCH] recipes-devtools: Move back from meta-networking to meta-perl
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
X-List-Received-Date: Fri, 07 Jun 2019 20:18:23 -0000

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


