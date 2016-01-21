Return-Path: <k4230r6@gmail.com>
Received: from mail-lb0-f194.google.com (mail-lb0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id DED0673169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 10:39:01 +0000 (UTC)
Received: by mail-lb0-f194.google.com with SMTP id ad5so1253183lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=rwKI7fNGPJ3ZWhh08jB+hAiqCd1Ihd1nUCM3wSQpM6c=;
	b=vavCs1O+UnRuZ1jtskpi7lKLMFjUe4jJijfGYRVmoyhEKXldzVuiAmTiRdgfaa7S1C
	5yOAcS8BYCJ7AlAMh4Hz/2iP0tSSaNouVgtgdZxdUVep9rHPJ8y0Rxa4ey/5KrfPKepz
	HHJtk3OcB/w63mFSI0gwjXP0sCu534I/o86Kdpnxb0bHpTftvhnB7oS4gCJtbY+ubsyA
	0x2ZG6WCwXstWaybiCY5mbptxYXesmhFc23C2Wco5PKjrl7m2WBvyEd0gxAGHwnfE4Ky
	tL9pZ2vzKKt+DhvHQlovPdyhlmk96n/ZmwmBxXgCdiENzug7+DUO+Ylpo0i+k0S3yn0d
	r8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=rwKI7fNGPJ3ZWhh08jB+hAiqCd1Ihd1nUCM3wSQpM6c=;
	b=THv7yievQreX2r2c+XYXahz2PsFDjUrQu8hkUvUVDvqFUpk6BNwfOZzete3SuvrGDQ
	2iu+nP+HQgQFm6ZFghvWVl3OMbQpc8sDROT0ReRTJ3FHyKbFAsDsIm2ojI+ggQelrmUf
	40+D0t+AU2xaaNYZRMoATUVr739S1u4nWHjUvgE7/4SiIWhBWhWw8eQbXtPSHigTfw+u
	qKnS/n1zwbEQJI62jm0m5fPkEboepIrN3Nl0Aj/AX63W+ICfbYJ0UClgRbFzkD2G/ZWQ
	1U2fOhIGH1glDoOt0uIU/V+V2VZDUHSPTQSQEdBQcIMeh0hWJxHNqGiIPVpgAnoNnfiX
	g9wQ==
X-Gm-Message-State: ALoCoQm3xK0viRlX0bHIZOb1VRYiALnjFzBf/MuRFP/JOHEmuPNNNtXFM3cKj6FerQwfO4O/DfzUpVBjSl5KtTr+gN98G0uGRg==
MIME-Version: 1.0
X-Received: by 10.112.78.33 with SMTP id y1mr14475809lbw.62.1453372741513;
	Thu, 21 Jan 2016 02:39:01 -0800 (PST)
Received: by 10.25.141.139 with HTTP; Thu, 21 Jan 2016 02:39:01 -0800 (PST)
Date: Thu, 21 Jan 2016 11:39:01 +0100
Message-ID: <CAALGJZY5LQw6a+fk+4TMy+JHFo=_p7kWixh9BJT+XyQqXh6wvA@mail.gmail.com>
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][FIDO PATCH 1/1] ruby: Fixed runtime error
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
X-List-Received-Date: Thu, 21 Jan 2016 10:39:02 -0000
Content-Type: text/plain; charset=UTF-8

From 6d2c2b602185a03232635a9c5c97253930c2bc0b Mon Sep 17 00:00:00 2001
From: Daniel Schnell <daniel.schnell.extern@ifm.com>
Date: Wed, 14 Oct 2015 14:49:52 +0200
Subject: [meta-openembedded][FIDO PATCH 1/1] ruby: Fixed runtime error

 Only include "enable-wide-getaddrinfo" if IVP6 is enabled in disto
 feature otherwise 'gem install rails' throws an error
 for the missing symbol 'getipnodebyname'

This is a backport of master branch commit
86835b4ac5ee593e8bd5b142504194370df71728
to make any gem installation possible.

Signed-off-by: Daniel Schnell <daniel.schnell.extern@ifm.com>
Signed-off-by: Christian Ege <k4230r6@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
index 080d455..ccb7cbc 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
@@ -9,11 +9,12 @@ SRC_URI[sha256sum] =
"5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c78
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"

 PACKAGECONFIG ??= ""
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
'ipv6', '', d)}"
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
+PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"

 EXTRA_OECONF = "\
-    --enable-wide-getaddrinfo \
     --disable-versioned-paths \
     --disable-rpath \
     --disable-dtrace \
-- 
1.7.9.5


-- 
http://ch.ege.io/

