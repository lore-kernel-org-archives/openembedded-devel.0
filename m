Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4A987E444
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 12:02:42 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id g84so4636828ioa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 05:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ItYkEzjIRVVXMu0Gs5YR2veILSyOZCDasXlKfEOSFcc=;
	b=TmPNlvzUrB9zIvlAlv4o8VBIA7ImSDAaLXwK1ryX15L/h+eY933K9pCLBlimdwGz97
	zyZRLh9ngIkJz5A2VjMdOwO2kxPESmlxzVfjXSw7wQg9WGDEx44WXbR90YPyAkvwGD7M
	1It+J21t7/Qoo1gPHLtV1mQNOTupMGOGwLErPbSXsEdAAal/4tCzmT+VDIRK89r/uPYM
	nxclmLSBOYrkpuy0QH8ycAz1h+svlxZrPBMCuLx7ga6bI6svn+Ax0uBlplLRvsDo8jIm
	yefcOoTkklh8rAIuG7+xS2LFHNaYIDkLkwvZXtmSYmnlG6PPeZ8mn1g7pUaXum965TI0
	Wj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ItYkEzjIRVVXMu0Gs5YR2veILSyOZCDasXlKfEOSFcc=;
	b=tZTFcJ95nHpcuj2XSSehYrFCxw4C+zkP2d05oi6JJXr9rAsdccB1Yfpe7Y41AcvLG9
	8FismklxnBK1ZA+CZdfm+q5o3PRfNxw3cCtD3sa9gKa9VwKsk1ku1gMwf0Hy/ui7/mCX
	vQwplSF221uteDrteFJwiuY6ZYsaEl6GmJ33W6AW8XtBJW8hiu87mXg8a3HrHWfz+xii
	gFHtITh12jHgwBORJIXLeqvUPTiFOKc6FqHg8+yWU4JywMyc4RWIqnkIIF8vTVG/tjm/
	EcS0jzytGlgPSYnC0wsIULwjZEXXrlm6njX2o7ij1Dm1QweX4ZFzLGI0pn/4jin07Kq5
	pF2w==
X-Gm-Message-State: APjAAAUM/q/MDkUUQzHzpA46cT0dU1vkEF1C2ZAKNXvmUiQ/man2z5mf
	BNu3fM+GANi++1CuAu1+a0KlyQZuoyciSSq/KQk=
X-Google-Smtp-Source: APXvYqyjRMUrcCm88b3doJVr+3w7+Mrho+10rdmWnqeCv02p6qDIuVcJD7DyAWJyzmMPnsMzKp4gWb20X1ZHMhdQ9fs=
X-Received: by 2002:a05:6602:4f:: with SMTP id
	z15mr14127704ioz.108.1558612963866; 
	Thu, 23 May 2019 05:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523115505.18245-4-Martin.Jansa@gmail.com>
In-Reply-To: <20190523115505.18245-4-Martin.Jansa@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 May 2019 14:02:29 +0200
Message-ID: <CALbNGRRVnprGpuahqikbNSyuPV=YXA=MPOyQBSZJRekP9SzHhg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/8] hunspell: use git fetcher instead of github archive
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
X-List-Received-Date: Thu, 23 May 2019 12:02:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 1:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * fixes:
>   ERROR: QA Issue: https://github.com/hunspell/hunspell/archive/v1.7.0.tar.gz: SRC_URI uses unstable GitHub archives [src-uri-bad]
> * there is developer uploaded tarball in:
>   https://github.com/hunspell/hunspell/files/2573619/hunspell-1.7.0.tar.gz
>   but it's already reconfigured which we don't need, so I've used git fetcher
>   to stay closer to what we already use.
> * the diff between:
>   https://github.com/hunspell/hunspell/files/2573619/hunspell-1.7.0.tar.gz
>   and
>   https://github.com/hunspell/hunspell/archive/v1.7.0.tar.gz
>
> docker-shr @ ~/hunspell $ diff -rq hunspell-1.7.0*/
> Only in hunspell-1.7.0-archive/: .gitignore
> Only in hunspell-1.7.0-archive/: .travis.yml
> Only in hunspell-1.7.0-archive/: COPYING.MPL
> Only in hunspell-1.7.0/: INSTALL
> Only in hunspell-1.7.0/: Makefile.in
> Only in hunspell-1.7.0-archive/: README.md
> Only in hunspell-1.7.0/: aclocal.m4
> Only in hunspell-1.7.0-archive/: appveyor.yml
> Only in hunspell-1.7.0/: compile
> Only in hunspell-1.7.0/: config.guess
> Only in hunspell-1.7.0/: config.h.in
> Only in hunspell-1.7.0/: config.sub
> Only in hunspell-1.7.0/: configure
> Only in hunspell-1.7.0/: depcomp
> Only in hunspell-1.7.0/: install-sh
> Only in hunspell-1.7.0/: ltmain.sh
> Only in hunspell-1.7.0-archive/m4: ChangeLog
> Only in hunspell-1.7.0-archive/m4: README
> Only in hunspell-1.7.0/m4: libtool.m4
> Only in hunspell-1.7.0/m4: ltoptions.m4
> Only in hunspell-1.7.0/m4: ltsugar.m4
> Only in hunspell-1.7.0/m4: ltversion.m4
> Only in hunspell-1.7.0/m4: lt~obsolete.m4
> Only in hunspell-1.7.0/man: Makefile.in
> Only in hunspell-1.7.0/man/hu: Makefile.in
> Only in hunspell-1.7.0/: missing
> Only in hunspell-1.7.0-archive/: msvc
> Only in hunspell-1.7.0-archive/po: .gitignore
> Only in hunspell-1.7.0/po: ca.gmo
> Files hunspell-1.7.0-archive/po/ca.po and hunspell-1.7.0/po/ca.po differ
> Only in hunspell-1.7.0/po: de.gmo
> Files hunspell-1.7.0-archive/po/de.po and hunspell-1.7.0/po/de.po differ
> Only in hunspell-1.7.0/po: es.gmo
> Files hunspell-1.7.0-archive/po/es.po and hunspell-1.7.0/po/es.po differ
> Only in hunspell-1.7.0/po: hu.gmo
> Files hunspell-1.7.0-archive/po/hu.po and hunspell-1.7.0/po/hu.po differ
> Files hunspell-1.7.0-archive/po/hunspell.pot and hunspell-1.7.0/po/hunspell.pot differ
> Only in hunspell-1.7.0/po: it.gmo
> Files hunspell-1.7.0-archive/po/it.po and hunspell-1.7.0/po/it.po differ
> Only in hunspell-1.7.0/po: pl.gmo
> Files hunspell-1.7.0-archive/po/pl.po and hunspell-1.7.0/po/pl.po differ
> Only in hunspell-1.7.0/po: pt_BR.gmo
> Files hunspell-1.7.0-archive/po/pt_BR.po and hunspell-1.7.0/po/pt_BR.po differ
> Only in hunspell-1.7.0/po: tg.gmo
> Files hunspell-1.7.0-archive/po/tg.po and hunspell-1.7.0/po/tg.po differ
> Only in hunspell-1.7.0/src: Makefile.in
> Only in hunspell-1.7.0/src/hunspell: Makefile.in
> Only in hunspell-1.7.0-archive/src/parsers: .gitignore
> Only in hunspell-1.7.0/src/parsers: Makefile.in
> Only in hunspell-1.7.0-archive/src/tools: .gitignore
> Only in hunspell-1.7.0/src/tools: Makefile.in
> Only in hunspell-1.7.0-archive/src/tools: fuzzer.cxx
> Only in hunspell-1.7.0/: tap-driver.sh
> Only in hunspell-1.7.0/: test-driver
> Only in hunspell-1.7.0-archive/tests: .gitattributes
> Only in hunspell-1.7.0-archive/tests: .gitignore
> Only in hunspell-1.7.0/tests: Makefile.in
> Only in hunspell-1.7.0-archive/tests: hu.wrong
> Only in hunspell-1.7.0-archive/tests: nepali.wrong
> Only in hunspell-1.7.0-archive/tests: ph2.good
> Only in hunspell-1.7.0-archive/tests/suggestiontest: .gitignore
> Only in hunspell-1.7.0/tests/suggestiontest: Makefile.in
> Only in hunspell-1.7.0-archive/tests/suggestiontest: prepare2
> Only in hunspell-1.7.0-archive/tests: wordpair.good
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
If I remember correct it was me who introduced this - sorry & thanks
for taking care

Andreas

