Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OiFW0-0003UW-RL
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 01:42:53 +0200
Received: by iwn38 with SMTP id 38so3146792iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 16:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Tv2phVUfgvPkJkWRMzuuMhzhTejRTuUJF2gA0z1RlIM=;
	b=mC5/oEHDkq/C40TxLmbWs3nFAXUWVBPllNGs+3nn0BfwGYTv1pZMTIR7edA0Wsg1T4
	fab9kB+GbRwQ6jplZSLe5XU7ADZxmm+1C50upYZ8vEQYhxvtO8nlFf1Q85VwWuOWOlJD
	3rcC52zvwLACj+qrFrCI2Y6Y2lsbmh+Yv4gUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MFd+qnK2bejLVlAAiuiNX7Sg03u7Ps/0ec7A90WmFZAkXGN22kCdjXGTQtzcOmQYE4
	hBW7t4gmnpyYSTJaKygJMzm/pAJkjnlBFB1nz+KZCxEXu5uOminr04jlYmfvEoFBvtfV
	w4G6PeRHs54WRbjQLDxpuN/GDig8XMlgdLkJc=
MIME-Version: 1.0
Received: by 10.231.166.72 with SMTP id l8mr17836904iby.95.1281310964885; Sun, 
	08 Aug 2010 16:42:44 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Sun, 8 Aug 2010 16:42:44 -0700 (PDT)
In-Reply-To: <AANLkTikW-PHOKKuz1fOiocuU8gGiwFRk3CmTfYtU_gZf@mail.gmail.com>
References: <AANLkTikW-PHOKKuz1fOiocuU8gGiwFRk3CmTfYtU_gZf@mail.gmail.com>
Date: Mon, 9 Aug 2010 09:12:44 +0930
Message-ID: <AANLkTi=vY5==A3XoJfhpp4Qjgbur+fy46L_gPacNhT6d@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: application not getting loaded
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
X-List-Received-Date: Sun, 08 Aug 2010 23:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8 August 2010 20:25, Anand Sivaram <aspnair@gmail.com> wrote:
> Dear All,
>
> I wrote a custom gstreamer application on ARM (dm6446) angstrom.
> Whenever I try to run the application, I am getting the following error,
> that looks
> as if the shell is treating the application as a shell script.
>
> /usr/bin/app: line 1: syntax error: word unexpected (expecting ")")
>
> I made sure that the application is having 755 permission and readelf/fil=
e
> etc. from
> a linux pc shows this as an ELF 32 bit ARM executable.

This error message is typical when the system is trying to execute a
binary built for a different architecture.


> These are the dynamic library dependencies during compilation.
> pkg-config --libs gtk+-2.0 gstreamer-0.10 gstreamer-interfaces-0.10
>
> Is it due to some shared library loading problem? =A0In that case is ther=
e
> any arm "ldd" available on openembedded target or on build host to
> verify what is missing?

You can invoke the dynamic linker and have it print out the dependent
dynamic libs. e.g.
$ /lib/ld.so.1 --list /path/to/bin

But this will execute the binary to make the list, so if your system
doesn't recognise the binary, this won't work.

-Graham


