Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SKrOZ-0006q2-OS
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 15:27:35 +0200
Received: by iaag37 with SMTP id g37so12194295iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GaM1j6RxVrkhLAIHYGmHAGF3JrOKcgLRK+agBPdCjio=;
	b=t+BqWKFrnzWYZiy5qnTp1PyqwXeQFgituOqQbK+XVB1LAPas3cnUegJoVBZe8xNfnE
	7gV4PFBE1BUNMiIrp5TI+HnRZQ1zmd0EZCPqjYDbAYyvnnrGZMafRcI+Y6Iz8YNfvTmm
	MzPoMTXeNiiFgTt/wKUnrbXsQ33yHOn4GeHhIQpsIg+HTpk8Crl2hlNAJccR/9/2jQku
	sN/PaSW8ToV7ocSlJ2Duh8J9P3sTIy9GP9msqq6bsvTFQXn66YSYqQoSQf7vhSbIfNkM
	yQ0gmgEbGM0x+iajXHgL6MFJ/rK68AUVdL5fKDn8jx1QPVGHRTHV7BJ9TJ7Ul/0TFHDL
	YnNw==
MIME-Version: 1.0
Received: by 10.50.15.162 with SMTP id y2mr1570123igc.32.1334841486446; Thu,
	19 Apr 2012 06:18:06 -0700 (PDT)
Received: by 10.231.67.134 with HTTP; Thu, 19 Apr 2012 06:18:06 -0700 (PDT)
In-Reply-To: <CAOHjBZtTxc7L8OpwMsSFr_xqc6WVXRRWK7eV95BDxnOLrjMqyQ@mail.gmail.com>
References: <CAOHjBZtTxc7L8OpwMsSFr_xqc6WVXRRWK7eV95BDxnOLrjMqyQ@mail.gmail.com>
Date: Thu, 19 Apr 2012 15:18:06 +0200
Message-ID: <CAOHjBZvEAiHvNh-nxKTAo8b6ytTYdz2TS4q_aaDfsc=-cE8HYA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] gcc-runtime failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2012 13:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Well indeed I discovered why gmp and Co. are not included, because
INHIBIT_DEFAULT_DEPS = "1" is set in the gcc-configre-runtime.inc.
But if I hack this, or put gmp etc... in the below DEPENDS setting I fall in
a circular dependency that I'm not able to solve.
Please can you help me?

Thanks,
Giuseppe

2012/4/19 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi All,
>
> a question about gcc-runtime package.
> It fails building due to the lack of gmp/mpfr/mpc libraries/headers.
> Indeed the native ones were correctly built and looking at the config.log
> file I can see
> the problem is due to libraries wrong format (in fact I'm building for sh
> arch and the gmp/mpfr/mpc libs it
> includes are the native ones).
> The question is: should the package build the target libraries given that
> there is the DEPENDS =+ "gmp mpfr libmpc" string in the
> gcc_4.6.inc file?
> I think yes, but actually this doesn't happen.
> Moreover I can think gcc-runtime is not intended for target but for
> something else. Isn't it?
>
> Please clarify this to me... :)
> Cheers,
> Giuseppe
>

