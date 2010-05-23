Received: from mail-qy0-f193.google.com ([209.85.221.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OGEmQ-0005ek-TR
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 19:16:04 +0200
Received: by qyk31 with SMTP id 31so4630315qyk.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=1DRaNRZxPByVWTNr4iwamTrXblcf7DO1BWrfDJKSzMU=;
	b=sDjBo/9rbcM8CxzUK1+Xv5Rx56fI3p4tTDzc2HleUe4NK+0dSdpMPPJ11nRtMme8AZ
	dHsgplTWL/011HCo0Fk8PqFMO6hVnWpHbZwfoO+eocXMRgX56t/tLhUQLwXPGXd3ZLlH
	/k5hAZ4GfVwlK2MNoTf2ophxBYGU+0/oonFWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=B1HLE5GBQej7mzIT6nUXJgU5Gf+esoDSzHJpltM/KR3CgbwEsJKTFQVeOMrLxtJSYL
	ubN1JSMivfMG8M9bMKpZz4ZqWYyWiiPDW7Nx31mWQoaH52pcAHl2lT1JL+pquhmgmQJ5
	NGXIJdujqpzcn9Fk3sN4n9jB7h3uG54k7c+jY=
Received: by 10.229.219.134 with SMTP id hu6mr883056qcb.137.1274634717238; 
	Sun, 23 May 2010 10:11:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.215.15 with HTTP; Sun, 23 May 2010 10:11:37 -0700 (PDT)
In-Reply-To: <lyd3wmk1n3.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de> 
	<AANLkTimyqUYuSfWUQZdwn1Q2KrojnjvsUqLSCX9H_FMa@mail.gmail.com> 
	<lyhblyk2ox.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTim5GfCsCgW9Bnn4auW9fuN-5L7wDC9PI8ISeX59@mail.gmail.com> 
	<lyd3wmk1n3.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 23 May 2010 10:11:37 -0700
X-Google-Sender-Auth: DYm1UaAFpjSrZe6_MS9hOk_flxs
Message-ID: <AANLkTim43UH4FIYbkIsn30FPqt1tQsp9RBF7tn83UU4x@mail.gmail.com>
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
X-List-Received-Date: Sun, 23 May 2010 17:16:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 23, 2010 at 9:45 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Chris Larson <clarson@kergoth.com> writes:
>
> >> >> This patch allows to pass quoted strings in EXTRA_OECONF.
> >>
> > I fail to see how this is a problem.  Seems to work fine for every
> > other app, including make.
>
> EXTRA_OEMAKE handling is implemented as
>
> | ${MAKE} ${EXTRA_OEMAKE} "$@"
>
> but EXTRA_OECONF as
>
> | cfgcmd="... ${EXTRA_OECONF} $@"
> | $cfgcmd
>
>
> 'make' arguments are expanded by bitbake which preserve the quoting.
>
> The EXTRA_OECONF content was put into a shell variable and this variable
> be executed.  This does not preserve quoting (and I am not aware of any
> way how this can be with variable assignments).
>
>
> > Is configure's argument passing that stupid, that it can't split by =
> > and use the right side for the value?
>
> It is not a configure issue, but a shell one.
>

Ahh, I see, that makes it clear, thanks for clarifying.  I have a local
patch that turns cfgcmd into a bitbake variable, and runs ${cfgcmd} "$@".
What do you think about that approach as an alternative?  It makes it easier
for future metadata tracking if we don't use shell variables unless we
really have to, and would make its behavior consistent with
oe_runmake/EXTRA_OEMAKE.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

