Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id D69C6606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 20:13:01 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id p74so55940912qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TyHvE1s4LPelrrkfsneVX5XpOiY6umKozV2UvODepGs=;
	b=tvB5h24aCJHHYYnjZNUKCmXXnsP6tQECn4RWzrTYKUpmtj/VewPBRFADLRgFYX3xd7
	879s0MxYK0168oqToST500+uRwBw88274cKd7lXrvSlBvkIO+rC8+CK8UWRPJk6Aox9I
	WK13GW80cL99VoUpxzDxsmeKKgD/FRhMhXfzgcQWJ+usZUDlfPGfM13heJYLMKnLmHf/
	4HWsOcs2rL36+gEkAcE36IL6tSmxQRcCtQFJX+8i/2bBB1PBBfJtaIOpXMZU6MN6U3ZS
	g7q2Cz8ZANishcm0PqKwT+p1xQ9uuwv5mHb8Orh3hSN9rTqKvaRgsDp7UMvCOByc6PC4
	ePPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TyHvE1s4LPelrrkfsneVX5XpOiY6umKozV2UvODepGs=;
	b=Z7HJBjvYcD+pIBwF5nsmItosByBdGY1enDf3gEo7QKGVdGXMd56nLHhrbYiEm4ZZ78
	bKMJTokrk6lVIOuoTUoyiPi8S3Sby5E5BTgavhabUEIJaJSqEIEAEp5pTa9uAP8PgOLz
	sN80JnNuYk3MY3u6EpoyclxZarsM7CN9JiNCpc53+KgDs58W01curvyIi0SOyi/sqsLB
	kQDFmKwxpbdQsYu0zMfutiz/45K8sVTy47O8xQ01GOj3sXVHaPyVgXpdA98Chjj6tDG1
	sVoPS8YoqgCWgTszB2JwykypbnqJ1a4z/1qiuXMsPy6IqMIbuhRrj8IRy9SOJJNGawM+
	xYXQ==
X-Gm-Message-State: ALyK8tKfipABgWsoDtnR2ls0V1f0/CX79golcC0sPWm6MgDxFA+pfjHZZGP18Cq5a0YWvQ==
X-Received: by 10.55.189.65 with SMTP id n62mr54691865qkf.3.1469045581972;
	Wed, 20 Jul 2016 13:13:01 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	u44sm2332366qtc.27.2016.07.20.13.13.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 13:13:01 -0700 (PDT)
Date: Wed, 20 Jul 2016 16:13:35 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160720201335.GA23547@openSUSE-i7.site>
References: <20160720195201.22250-1-twoerner@gmail.com>
	<20160720195201.22250-3-twoerner@gmail.com>
	<CAMKF1spXxjfGzhg58hHNDcxQaRWWJ4pB36y7WTbpLjBSM_01LA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spXxjfGzhg58hHNDcxQaRWWJ4pB36y7WTbpLjBSM_01LA@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-browser][PATCH 2/4] chromium: gcc-6 support
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
X-List-Received-Date: Wed, 20 Jul 2016 20:13:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2016-07-20 @ 12:59:21 PM, Khem Raj wrote:
> On Wed, Jul 20, 2016 at 12:51 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> > Allow chromium to build with gcc-6.
> 
> bunch of patches are deleted. Are they upstreamed ? or how do they
> help compiling chromium with gcc6?

At some point in the past (I could figure out who, but I don't want to give
the impression that I'm pointing fingers) someone added the following line to
the recipe:

	-Ddisable_fatal_linker_warnings=1

The *intention* was to keep the build from failing due to compiler -Werror
issues. For whatever reason this line has no effect on the build; the -Werror
is still used, and builds still fail for annoying, non-critical reasons.
Therefore we've amassed a large set of patches that try to fix these
warnings by either fixing the code itself:


	> > ---- a/third_party/ots/src/name.cc
	> > -+++ b/third_party/ots/src/name.cc
	> > -@@ -79,7 +79,7 @@ bool ots_name_parse(Font *font, const uint8_t* data, size_t length) {
	> > -   const char* string_base = reinterpret_cast<const char*>(data) +
	> > -       string_offset;
	> > -
	> > --  NameRecord prev_record;
	> > -+  NameRecord prev_record(0, 0, 0, 0);
	> > -   bool sort_required = false;
	> > -

or by (more likely) some l337 #pragma tricks:


	> > ---- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
	> > -+++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
	> > -@@ -102,7 +102,10 @@
	> > -     }
	> > -
	> > -
	> > -+#pragma GCC diagnostic push
	> > -+#pragma GCC diagnostic warning "-Wstrict-overflow"
	> > -     void Bignum::AssignDecimalString(Vector<const char> value) {
	> > -+#pragma GCC diagnostic pop
	> > -         // 2^64 = 18446744073709551616 > 10^19
	> > -         const int kMaxUint64DecimalDigits = 19;
	> > -         Zero();
	> > -@@ -696,7 +696,10 @@
	> > -     }

What I've done here is to patch the various BUILD.gn files and *gyp files so
that -Werror is actually removed from our build (which was the original
intent), thereby making a number of subsequent patches superfluous.

Given the chromium developers use a completely different compiler and,
therefore, are unlikely to be tripping over the same warning/error problems we
keep seeing, I believe this is a sensible thing to do. Especially since, going
forward, is reduces the maintanance burden, and (in my opinion) the upstream
developers are probably unlikely to ever accept these sorts of patches anyway.

