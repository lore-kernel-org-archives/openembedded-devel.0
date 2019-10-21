Return-Path: <marek.bykowski@gmail.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id 57DC87F232
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 09:30:24 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id z12so9489597lfj.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KITnyJzPEjHpwE+N3mKyZZF6kAg6T6SXN8Zg3pqYng8=;
	b=ETk14Z9WDpDDKOPj0r+jSIzdE738QTgzAC6wukuT8gl7pW0jZFWFHfzsi/uVXkf0u/
	tLnWNKUez3OM7zGTpe4+8AkDoz0HmJH/9bpKAUOkGVwzp83mDKiyv+j0Sn+3Z53tk3F4
	R2gzFmeD6ec4YZF9X+411ke1gobGgSJp1rVAHyQ3SAxLPA/eMQCVg5euSqKAMkdXGCMQ
	RzN3Oie+hvFij3cuKYYS0MLv4kovgdXoH9Ty4piXD+I4gODgDpOvuci0SUngR7pziHzj
	nFjcmg3nO60UiLKFWnvwchR2gC3bMSnnOOVuZWR3oM0VNGrceAgD0nVT1fr1gqAiR2LH
	nAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KITnyJzPEjHpwE+N3mKyZZF6kAg6T6SXN8Zg3pqYng8=;
	b=S7CPiV1Lum2i/NJePI+ei6fVk8oL9DlKHMZFtWLRrJ0TQnwu9V502AehTpgXnNnruJ
	/e2QEqDJg2LKnHXgBQtuERKxuFnNpJPzdCeyMlzhGgXtWymjqHWv7xeevBr9AMOVvzaP
	2O8dh6kCpsJZakQDKLSNmRh1cGyxEH6NapJrEIn08lYdtH7wcBFkQzWx9OzNRi9O0foB
	eaQ+UcjYOsL4DN8Ptp6e4JxnLkeK9KqtwQ0RiiSl93M9nuuI48p763KpiNigOsMgXMnT
	WsTIlqf3X7AXlCdkNrPOjLPR1H1wFptcVBSf7qZqXk9KvsQVF8OMq5ol/t7uZ5fMygF3
	tTOA==
X-Gm-Message-State: APjAAAUjXhGxQLMSQPBv5GxDtZ9uXf7TqHRQU0AC7QK+vMDFHFAMMCYR
	ywNosM4GyaRw0WXedPOQMjA=
X-Google-Smtp-Source: APXvYqzg3D7O96pfK41Zpo9QGfBIzIIXH8hhCnUJ6WYa4ZqKybZWjRoEMIohwy2UdFpVQlDDT0LfNA==
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr4352308lfi.136.1571650223580; 
	Mon, 21 Oct 2019 02:30:23 -0700 (PDT)
Received: from localhost ([78.133.233.210]) by smtp.gmail.com with ESMTPSA id
	o13sm5744348ljh.35.2019.10.21.02.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2019 02:30:23 -0700 (PDT)
Date: Mon, 21 Oct 2019 11:30:18 +0200
From: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20191021113018.3c684d51@gmail.com>
In-Reply-To: <83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost>
	<20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Mon, 21 Oct 2019 09:30:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> What's the "!" for ? It doesn't seem to be essential.

It is a logical negation making warn_unused_result happy (one uses the result in the end) followed by a cast to void discarding the result. With only casting to void the compiler remains to warn.

> so did you consider just making a compiler specific fix/hack
> for gcc/clang such as:
>     #define __wur /* Ignore */
> You could do that in each file that needs it.
> While that's still ugly, it is at least more localized.

In your hack/fix #define __wur /* Ignore */ should be preceded with #undef __wur, isn't it? Yes, this should indeed be neater than "(void) !foo()" but my concern would be it may impact all the routines using __wur discarding they attributes and not only the ones of our interest (somehow a short list of the routines using __wur from glibc below). Not sure if this is a worry though, haven't inspected lmbench if uses any functions with __wur except the write/read being "fixed" by this "(void)!".

$ grep -Irn extern.*__wur ./stdlib/stdlib.h
97:extern size_t __ctype_get_mb_cur_max (void) __THROW __wur;
385:extern char *l64a (long int __n) __THROW __wur;
634:extern char *getenv (const char *__name) __THROW __nonnull ((1)) __wur;
688:extern int mkstemp (char *__template) __nonnull ((1)) __wur;
698:extern int mkstemp64 (char *__template) __nonnull ((1)) __wur;
710:extern int mkstemps (char *__template, int __suffixlen) __nonnull ((1)) __wur;
731:extern char *mkdtemp (char *__template) __THROW __nonnull ((1)) __wur;
742:extern int mkostemp (char *__template, int __flags) __nonnull ((1)) __wur;
752:extern int mkostemp64 (char *__template, int __flags) __nonnull ((1)) __wur;
784:extern int system (const char *__command) __wur;
840:extern int abs (int __x) __THROW __attribute__ ((__const__)) __wur;
841:extern long int labs (long int __x) __THROW __attribute__ ((__const__)) __wur;
946:extern int rpmatch (const char *__response) __THROW __nonnull ((1)) __wur;
968:extern int posix_openpt (int __oflag) __wur;
985:extern char *ptsname (int __fd) __THROW __wur;
 
> Also, did you confirm that this change doesn't affect the
> resulting binary code? I expect that it won't but it's a
> benchmark so it's worth confirming.

I think it will, as the write/read are parts of latency path but I feel this should be negligent eating up a tens/hundreds?! of CPU cycles (say with CPU 1G, 100 cycles is 10ns)

> Finally, lmbench hasn't released a new tarball on sf.net in 5 years:
>     https://sourceforge.net/projects/lmbench/
> There's a new somewhat active version of lmbench:
>     https://github.com/intel/lmbench
> Should we use that version?

I'm not sure what is better, the original (sf.net) but not maintained in a quite few years or one taken over by one of the companies (intel), looked after by them, that is just making a use of it. Such company's project may go to an end of the life cycle leaving openembedded without the sources. Besides you never know who is committing and if you can rely on their changes. I think all together the biggest problem is that lmbench is being officially discontinued in a few years to date and to have reliable in openembedded I would be inclined somebody from openembedded takes the original over and maintains it (as intel did).
 
> Sorry to leave this until v3 but the:
>     (void) !foo()
> syntax triggered me! ;-)

Suppressing the warning I may refer to as to "better than nothing" but the golden solution would be to fix it properly and probably use the return as suggested by the authors of this routine/s.

