Received: from mail-qy0-f193.google.com ([209.85.221.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OGEEX-000873-0Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 18:41:01 +0200
Received: by qyk31 with SMTP id 31so4602144qyk.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=B7Rhk47Ys7CpZgww+DdLLimdftw2kd3NV3ZrqoAElbM=;
	b=J7ogmvJ5+2EXqJVyhxsso7TQxkXo4uOJNldFDc8IVEDmygde++A8FsSoQ0rR+g+dmz
	k7trGfhhroMMoJytF5/STfIOhSzaKSNm31co9s0+6s5W3Z6rGoDjFWZlZzKwvHpz+Hgo
	HCisMEM0VAumtgYujZUc4tWpG0CmR/1gZDhQ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=RD11DZZbG5aKcDIx5I0+ZDRHNEti+C/lMUxMRPQyBMnpTWTLJz+QydsIeMtgmyl3vb
	mHLiR8znhbtJ2Zn1Navi9Qi+AKz6tiDTtaqDZJnJc7TNaesT49MKro0zDq5D7s/8HtYK
	rm7uklBFZKW65eaE+C2klXuIyhUFhgNpZgph8=
Received: by 10.224.51.17 with SMTP id b17mr2557341qag.175.1274632615162; Sun, 
	23 May 2010 09:36:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.215.15 with HTTP; Sun, 23 May 2010 09:36:35 -0700 (PDT)
In-Reply-To: <lyhblyk2ox.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de> 
	<AANLkTimyqUYuSfWUQZdwn1Q2KrojnjvsUqLSCX9H_FMa@mail.gmail.com> 
	<lyhblyk2ox.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 23 May 2010 09:36:35 -0700
X-Google-Sender-Auth: gvLJ417t-PqoPiSHWsD_sx1iPH8
Message-ID: <AANLkTim5GfCsCgW9Bnn4auW9fuN-5L7wDC9PI8ISeX59@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-SA-Exim-Connect-IP: 209.85.221.193
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH (updated)] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Sun, 23 May 2010 16:41:01 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 23, 2010 at 9:22 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Chris Larson <clarson@kergoth.com> writes:
>
> >> This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
> >> this patch, it is possible to do
> >>
> >> | EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"
> >>
> >> where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.
> >>
> >
> > I don't think that doing EXTRA_OECONF =
> > "'--with-build-cflags=${BUILD_CFLAGS}'"
> >
> > is that much more difficult, and works today, unless I'm missing
> > something?
>
> It does not work today... E.g. try the recipe
>
> ---- xxx.bb -----
> EXTRA_OECONF = "--with-build-cflags='-O2 -g3 --help'"
>
> inherit autotools
>
> do_unpack() {
>    mkdir -p ${S}
>    echo 'AC_INIT()' > ${S}/configure.ac
> }
> ----
>
>
> Without the patch, there will be called
>
> | $ ./bitbake -b /tmp/xxx.bb -c configure -f -D
> | ...
> | + ..../configure ...  '--with-build-cflags='\''-O2' -g3 '--help'\'''
>
> and with the patch
>
> | + ..../configure ...  '--with-build-cflags=-O2 -g3 --help'
>
>
I fail to see how this is a problem.  Seems to work fine for every other
app, including make.  Is configure's argument passing that stupid, that it
can't split by = and use the right side for the value?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

