Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AE52B786D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:09:44 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id i11so14771833wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 03:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=uoN29vWMlSBXomW/ajkV/Pf+XiD/1n6wZwOOg7Xw8tE=;
	b=gXppHpikH1SiPL+z1K3tGV8zDoCXarPzQAJNtce2nzFuHeDEY9sojkUH3AnRoAqgja
	W6paQ2+N9uNTjvJvFYUbfTDlzGPHIZbLJzOpry1v55x1pFp5TEvA0Cq+eZObGa4WKTvZ
	fN8Ew4a2vro1zL0TKQHPrpsNQtsWSOigHWblPcmvf5X1luzSrKxQo+BZcoe3gyGCbj+R
	m+mLC0WvcJPTBM9J4Z+Cm9fbGYdEVXUogES2sxP1XhLHCvYvNrTxT0reUw+dh00lBlbU
	otCgJ/ziNCnfZEPOVGTFWPQYpMmztIIFEJC/30NRN2rikLxSMKj4ATbEO/cB6pgpLh2P
	KI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=uoN29vWMlSBXomW/ajkV/Pf+XiD/1n6wZwOOg7Xw8tE=;
	b=qDSLh3us6HDQGrURhUh8z78+ne8ToUPZ62J6jzAfHHrXzS7uLt+fY3SkqmGEKWwwfy
	0SKLBACfCSoCOvNkHYByUVJcN9O29DZY3BiDUdY42ultQeE+BOH/CqhwJWlM8yn7HX2D
	087fZKoYSL/Z2PP67MDReYdhhHmH7/HibkkI2U7JWQ19QuUAreB0ZBqBTM3D40AlyJsq
	rvFV/dsJD7wXbjQbLKzbjWqS5/9wD+eXwvG2maOOjWGUqzVpnWrpR9KLcBSzRxoQ0YvR
	vQUS0KrTTUUuP9o49vx2wX4+BSTZvO92cWuL0808rKPmIiEET2FfkZ/h8AdbHNMFWpIq
	sxJA==
X-Gm-Message-State: AKwxytf7yiK7/GgHq+2LP1iKRx0l6F598c6OG6qSIPmwbFUfp7gpBMOd
	2dG0JETLn8yiRGOoF7GLUE7rCqM=
X-Google-Smtp-Source: ACJfBotsHIVUKWQM/aZQLEOjAbj2y9MN/d/Py0YFS6oqBus4xBaARf2PT2iKgwYQiNERbYOJQiq+og==
X-Received: by 10.28.222.5 with SMTP id v5mr1791532wmg.161.1516187385290;
	Wed, 17 Jan 2018 03:09:45 -0800 (PST)
Received: from pohly-mobl1 (p54BD5DCA.dip0.t-ipconnect.de. [84.189.93.202])
	by smtp.gmail.com with ESMTPSA id
	s17sm5987596wmd.34.2018.01.17.03.09.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 03:09:44 -0800 (PST)
Message-ID: <1516187383.6718.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 12:09:43 +0100
In-Reply-To: <20171003234535.GG16828@denix.org>
References: <20171003234535.GG16828@denix.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: nativesdk-qtbase 5.9.2 C++11 errors with gcc 6.3?
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
X-List-Received-Date: Wed, 17 Jan 2018 11:09:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-10-03 at 19:45 -0400, Denys Dmytriyenko wrote:
> Martin, Khem,
> 
> Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm seeing
> bunch of 
> what seems to be C++11 related errors during do_configure of
> nativesdk-qtbase. 
> Target qtbase builds fine and switching to gcc 7.2 seems to resolve
> it as well.
> 
> Any ideas or pointers? Thanks!
> 
> 
> Errors are like these:
> 
> In file included from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
>                  from /OE/master/build/tmp-glibc/work/x86_64-
> nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-
> r0/git/src/corelib/tools/qarraydata.cpp:42:
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/core
> lib/global/qnumeric_p.h: In function 'bool
> qnumeric_std_wrapper::__builtin_isnan(double)':
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/core
> lib/global/qnumeric_p.h:104:45: error: '__builtin_isnan' is not a
> member of 'std'
>  static inline bool isnan(double d) { return std::isnan(d); }

I'm getting the same error when building qemu 2.8.0 for intel-corei7-64 
with gcc 6.3.0.

The reason seems to be that somewhere there's a
  #define isnan __builtin_isnan
which doesn't work in C++ because std::__builtin_isnan    does not
exist.

I'm still looking for the define... if someone has suggestions, I'm all
ears.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



