Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 221BD757CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:02:50 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so37961995pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Ylp3dZMuPggF6Uk+YZfUiqw6fZjP0BOssFYSX6oTvEU=;
	b=NtWxTzisBmm7cAlkMTYcEnbYQ7AptzvJ8c9lTTmEOA5gKNi56nbOqAHKsj0fgGgY9c
	Pqo8UNDToYUJWf7Ku8llNJ73g23BaU77oYPIAcS2Wa2D4EbiGB+pH1sl0Rl28OyI/TL1
	6JyIz+31FYKXlNh1/bTlxQ4cmL1ymJE9aU5tv/oGkNEM/QNuIJHjrZGCheEvDmjYFElV
	zA7wW1eV72ahvCTuwrBNbEvXAc5ghnIRhSWJqIia+9i9/L0KXdZ4TxU+uq996TvxsErz
	qDPuDoCQPqtWlyYHfik5ewIXIQ0q34/zIDq9Prkg8+oQ8m9PnR3SLS9ZXWv1WF002AoR
	KIEQ==
MIME-Version: 1.0
X-Received: by 10.68.225.97 with SMTP id rj1mr11993662pbc.108.1434553372087;
	Wed, 17 Jun 2015 08:02:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 17 Jun 2015 08:02:52 -0700 (PDT)
In-Reply-To: <1434486209-463-1-git-send-email-gary@mlbassoc.com>
References: <1434486209-463-1-git-send-email-gary@mlbassoc.com>
Date: Wed, 17 Jun 2015 12:02:52 -0300
X-Google-Sender-Auth: TwJ8lJzHxnaZKBYFYsx71vbqM8I
Message-ID: <CAP9ODKqL8mN7vhZRqp7dm1XTP5vsKEqLKhUe82Ms6T8ygym2kQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser][PATCH] chromium: Fix potential configuration issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 15:02:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 16, 2015 at 5:23 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> This recipe should be using the python interpreter as built by bitbake,
> rather than relying on the host python.  In some cases, the host python
> may be incomplete or just plain old, yielding errors during the configure
> step such as:
>   |     from sgmllib import SGMLParser, SGMLParseError
>   | ImportError: No module named sgmllib
>   | ninja: build stopped: subcommand failed.
>
> Adding 'inherit pythonnative' solves this problem on all build hosts.
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>

Applied to master; thanks.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

