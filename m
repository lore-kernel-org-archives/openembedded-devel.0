Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5197560E68
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:05:09 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hm4so5466603wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kVGuIcE4mfcjAg6yuiKiIKcMnUmuvNwDv8MEsZCAYOI=;
	b=sa/PXsh/deMSucI7k/p6pBx68PoEoLYKu0DqvhA+4QWr1BHkt9iPFAgLrgl2BDgnZa
	X7vCFMqVX0g9+QEzYvB/XfgGDd60dyOYjpdCqZGpUGcb6CMv8Fbp34xVLOi4bGbmoLxH
	tjJs2cZB7UPQdV0vE2Mx0GXHd8E2kFsPNzaWEnF8wDksQcZUC6OUAMRCHy9gA6MReukU
	pgMLEhN+6XXqTooRL0080Z1n16rLeE8iPsjMzABS4pklnjV97RBEFr5ideB2frAOyOSK
	iipP49wZ4XUh8mq2kV/EIjPT8y3y7ETgpREjLgJc/Oa1b0HuqWBKGas3ldLZbSqO3Oij
	eYng==
MIME-Version: 1.0
X-Received: by 10.194.48.100 with SMTP id k4mr14985953wjn.49.1396368309803;
	Tue, 01 Apr 2014 09:05:09 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Tue, 1 Apr 2014 09:05:09 -0700 (PDT)
In-Reply-To: <CAMKF1sqgL7ZH+c8JLdw6MjQCj0CiRVV3hNqOxx4of5Jota4Lgg@mail.gmail.com>
References: <45034856.Fj98ikVczS@localhost.localdomain>
	<5335B790.1010107@balister.org>
	<1487041.bBRm1EH4qA@localhost.localdomain>
	<CAMKF1sqgL7ZH+c8JLdw6MjQCj0CiRVV3hNqOxx4of5Jota4Lgg@mail.gmail.com>
Date: Tue, 1 Apr 2014 09:05:09 -0700
Message-ID: <CAOLEWZWudPUcmL2jRWR7KW055G0obRYuCPa7OP7wjWKGM2tWHg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: ntpd fails to start if libcap not installed
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
X-List-Received-Date: Tue, 01 Apr 2014 16:05:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I would agree, as well as making sure the ntp user owns the drift file and
its run and log directories (although I don't believe the latter is
configured in the current recipe).  Moving the drift file (and keys) to
/var/lib/ntp is a pretty standard config.

Just my $.02 ...

Steve


On Sat, Mar 29, 2014 at 5:07 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Mar 28, 2014 at 11:04 AM, Diego <diego.ml@zoho.com> wrote:
> > In data venerd=EC 28 marzo 2014 10:55:28, Philip Balister ha scritto:
> >> On 03/28/2014 06:40 AM, Diego wrote:
> >> > Hi openembedders!
> >> >
> >> > I've noticed that if ntp is built without libcap, ntpd fails to star=
t
> from
> >> > the initscript:
> >> > /etc/init.d/ntpd
> >> >
> >> > giving the error:
> >> > Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled
> --
> >> > built without --enable-clockctl or --enable-linuxcaps
> >> > ntpd - NTP daemon program - Ver. 4.2.6p5
> >> > USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=3D| }<val>] ]...
> >> >
> >> > That is caused by the line:
> >> > start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p
> >> > /var/run/ntp.pid "$@"
> >> >
> >> > and in particular by the option "-u ntp:ntp" which is not supported
> which
> >> > is not supported if ntp is build without --enable-clockctl.
> >> >
> >> > Is anybody else experiencing this problem?
> >>
> >> Oddly enough, I was about to report the symptom today also :)
> >>
> >> Any ntp experts know what the proper solution is? I'd be glad to propo=
se
> >> a patch.
> >>
> >
> > Hi Philip,
> >
> > I'd like to rephrase better my statement, as I put two errors in it:
> > The problem is caused by the option "-u ntp:ntp" which is not supported
> if ntp
> > is build without "--enable-linuxcaps".
> >
> > As far as the manual goes, the "--enable-clockctl" is a build option fo=
r
> > NetBSD:
> > http://www.eecis.udel.edu/~mills/ntp/html/ntpd.html
> >
> > Removing the "-u ntp:ntp" makes the initscript work, but I don't know i=
f
> > shipping different ntpd initscripts based on pkgconfig is the correct
> thing to
> > do. Any expert opinion?
> >
>
> remove the cap PKGCONFIG its redundant and everything in recipe wants
> it enabled, it was  added just for having consistent builds otherwise
> it was autodetected by autotools and if you had libpcap staged then it
> was enabled automatically otherwisie not.
>
> so you can either change PACKAGECONFIG ??=3D "" to PACKAGECONFIG_append =
=3D "
> cap"
>
> or remove this completely and add the dependencies on libcap
> unconditionally.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

