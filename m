Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C8269786EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:20:53 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id x4so21317841wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 03:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=P6jPVvAb0FP+RmgR/9GSC1N7dYeTVqnAtMjRf/jrV3M=;
	b=HiHb2zwWNbd4FEyjsPPP4ZNvAdn5Q90feDzyIVu8iexrLUrZfG9qCZJeiLdmKLqv3q
	a3vpNXLNYqUaEsjTwqdhh9R6LCtBNoIh35Bkj+89C9e5iibLNfT4YfYJ5jwxCu6G6nXT
	Cq2Ppr146wqmXhJeMUzt70IMzdyD+8PZoeSRGUNS3lSFXOfUXdw4wIqXKCzXWlX1uT7l
	Ojj1SoHM4Pu/FtJ7fNuE7ZAHkYznPp9f3vHPPsAo+jCW3yTdJBIo1uO19g0avpmREvQF
	H3WoTtsZZAQfeyVkChpgHUT9mtpy3oFaAiTF7WcxFai01dSa5obU6L8zR8VfWtXoCjVz
	BT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=P6jPVvAb0FP+RmgR/9GSC1N7dYeTVqnAtMjRf/jrV3M=;
	b=obuWIrBm0sI+Ybg8yCJYV4XHwrdbOsvCrctqe2i7XZHZUIMwOW2heKikdXMBJ1L32w
	/iqYH9AwLLdzsKPAWXGsOwV85gMlizAyeaK5oDvqyE8bw2GSl4etgKkBrlfiAUzKKPd0
	jFk8zpJ2ri+9lYChOwA599EA6msIrYA8iEMtfIAo/7BrunTnu+UTTv+j+TUodQ4cR+OC
	Dz3U6LBvEen8BA60EuJSX/BjXmZ5rlnC3p9WKUYK4zAxoSSRj2DThwXRbdNpNiCojjGp
	GOUrk7/CD0oTkJujBgewMp3lTbQlq92CLXFu7ne+uXUR/K+RYpy+3b0K7TenEQikIyVa
	T1Vg==
X-Gm-Message-State: AKwxytc2UibRutmeae4tSf96E0XgtQdiQOLz719pWf2pARY/RTt04EvW
	15Bf09R8pkF/jpgTWS46205F
X-Google-Smtp-Source: ACJfBos7CHv4sOB2DuB5L1/FZwdrd+k5AcAJ3atIgbca//cyspIY1PI3ozw0K5F1q/ZWO5xI/FPFbw==
X-Received: by 10.28.62.202 with SMTP id l193mr1675083wma.73.1516188054474;
	Wed, 17 Jan 2018 03:20:54 -0800 (PST)
Received: from pohly-mobl1 (p54BD5DCA.dip0.t-ipconnect.de. [84.189.93.202])
	by smtp.gmail.com with ESMTPSA id
	w73sm12303698wrb.34.2018.01.17.03.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 03:20:53 -0800 (PST)
Message-ID: <1516188053.6718.37.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 12:20:53 +0100
In-Reply-To: <1516187383.6718.35.camel@intel.com>
References: <20171003234535.GG16828@denix.org>
	<1516187383.6718.35.camel@intel.com>
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
X-List-Received-Date: Wed, 17 Jan 2018 11:20:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-17 at 12:09 +0100, Patrick Ohly wrote:
> On Tue, 2017-10-03 at 19:45 -0400, Denys Dmytriyenko wrote:
> > Martin, Khem,
> > 
> > Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm
> > seeing
> > bunch of 
> > what seems to be C++11 related errors during do_configure of
> > nativesdk-qtbase. 
> > Target qtbase builds fine and switching to gcc 7.2 seems to resolve
> > it as well.
> > 
> > Any ideas or pointers? Thanks!
> > 
> > 
> > Errors are like these:
> > 
> > In file included from
> > ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> >                  from /OE/master/build/tmp-glibc/work/x86_64-
> > nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-
> > r0/git/src/corelib/tools/qarraydata.cpp:42:
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/co
> > re
> > lib/global/qnumeric_p.h: In function 'bool
> > qnumeric_std_wrapper::__builtin_isnan(double)':
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/co
> > re
> > lib/global/qnumeric_p.h:104:45: error: '__builtin_isnan' is not a
> > member of 'std'
> >  static inline bool isnan(double d) { return std::isnan(d); }
> 
> I'm getting the same error when building qemu 2.8.0 for intel-corei7-
> 64 
> with gcc 6.3.0.
> 
> The reason seems to be that somewhere there's a
>   #define isnan __builtin_isnan
> which doesn't work in C++ because std::__builtin_isnan    does not
> exist.
> 
> I'm still looking for the define... if someone has suggestions, I'm
> all ears.

Seems to be from /usr/include/math.h, which gets included by the
corresponding C++ header /usr/include/c++/6.3.0/cmath.

C++ explicitly states that cmath exposes functionality of math.h inside
the std namespace (https://stackoverflow.com/questions/32606023/when-us
ing-c-headers-in-c-should-we-use-functions-from-std-or-the-global-na),
so the QEMU code is correct.

To me this is starting to look like a bug in the toolchain.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



