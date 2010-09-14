Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OvJqy-0002kr-5e
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 02:58:33 +0200
Received: by wye20 with SMTP id 20so6961457wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 17:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=hfrdGHY1d6Z5Vr6S167bAlNYFwcqDhtYdRjFUBc3uA0=;
	b=kYtIggP828UeMeYARae4XOKUJSyq2enaLIVYYiUyfh4QgbWMZP8VamTrcixRxBJmVS
	hCG3nOkveCcMcL+Wa+BmJV3cFB5Nzj/dX4q4RHWWMIJ0kEnahGIYH3ZUAknXBpgRyC1Q
	HT87CD2tJCM2FRn3hTiamT0UFrdFOXu2pXA4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=aRYQ89icfVbczB7Y2eQZSCnuMxoqvvbXrxTuDhxVQD/fiJrDzFHlTJK68aFWt7R6nA
	9hsgzyYB3bfbrh2FEtne3jweCOb4ljRHZOm13y3O47W4dnS2BgXZ8+gQ1opkLJxE9t66
	uqvRb9G2IYLgDc039cUN2LHHb/Y4WkKu9QR2M=
Received: by 10.216.188.20 with SMTP id z20mr3262883wem.51.1284425863122; Mon,
	13 Sep 2010 17:57:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Mon, 13 Sep 2010 17:57:23 -0700 (PDT)
In-Reply-To: <4C8EBBC8.1060605@gmail.com>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8E8FC5.4020507@balister.org>
	<AANLkTi=fJWrPssjGvPENzuHsXaPmCZTJRRGmzoJxyx9u@mail.gmail.com>
	<4C8EBBC8.1060605@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 13 Sep 2010 17:57:23 -0700
X-Google-Sender-Auth: cU6W-WP_8Pcc3orOtZ2TyVpUc74
Message-ID: <AANLkTimgeqXcCwNkTsEV8rqYwiZGpKCANODxDtkN8q=p@mail.gmail.com>
To: Graham Gower <graham.gower@gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 00:58:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 13, 2010 at 5:03 PM, Graham Gower <graham.gower@gmail.com>wrote:

> On 09/14/2010 09:03 AM, Graham Gower wrote:
> > On 14 September 2010 06:25, Philip Balister <philip@balister.org> wrote:
> >> On 09/13/2010 02:21 PM, Cliff Brake wrote:
> >>>
> >>> last weeks testing cycle was a success.
> >>>
> >>> http://wiki.openembedded.net/index.php/Testing#Testing_Log
> >>>
> >>> Firefox is failing in some configurations if the same version of
> >>> firefox is installed on the host system -- it would be nice to get
> >>> this resolved this week.
> >>>
> >>> testing-next branch has been updated and is ready for clean builds.
> >>
> >> ERROR: Task 1046
> >> (virtual:native:/srv/oe-builds/testing/openembedded/recipes/qemu/
> qemu_0.12.5.bb,
> >> do_compile) failed with exit code '1'
> >> ERROR: __init__() takes at most 3 arguments (4 given)
> >>
> >> I see this building the testing branch on my F13 machine. Normally I
> disable
> >> binary locales, but left them enabled for the testing build. Anyone have
> any
> >> clue what is going on?
> >>
> >> Philip
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> > Its not quite the same, and I'm not quite at testing-next
> > (b9bcb18a4435491bad5cd76ecf26a857b2f40800), but my bitbake -k world
> > halted like this (bitbake is
> > c07cc08f7fd503ac3013ccc43c79198c4c3b7b29):
> >
> > ERROR: p4-05.2:
> > http://filehost.perforce.com/perforce/r05.2/bin.linuxmips/p4 cannot
> > check archive integrity
> > ERROR: Error executing python function in 'do_fetch'
> > Traceback (most recent call last):
> >   File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 334, in better_exec
> >     exec(code, _context, context)
> >   File "do_fetch", line 4, in <module>
> >   File "do_fetch", line 2, in do_fetch
> >   File "/home/grg/oe2/bitbake/lib/bb/build.py", line 183, in exec_func
> >     exec_func_python(func, d, runfile, logfile)
> >   File "/home/grg/oe2/bitbake/lib/bb/build.py", line 234, in
> exec_func_python
> >     raise FuncFailed(func, d, logfile)
> > TypeError: __init__() takes at most 3 arguments (4 given)
> >
> > ERROR: Printing the environment of the function
> > ERROR: __init__() takes at most 3 arguments (4 given)
>

As Graham points out, this was an error in bitbake master, not in OE.  Just
pushed the fix, sorry for the delay -- had some network issues that
prevented getting to the git server yesterday.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

