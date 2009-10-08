Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mvzge-0002sp-Tn
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 22:34:12 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2231697qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2009 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7v1q1TB6YRNHlzZvLsDdKbOPoDvLv9ibyv5EpSqZb3M=;
	b=MLS2dam9aDGhkAUwG3a0eRZrGJr8H0LOxmfNFdFxu2I1QFwyEEcYhRVyBplCSG8t6Q
	2AxorqjB+j2UXjQQdu4vt31xKmWX2XPMgAPsF1nuYsrZ0XcimvhAb5r9knia38eMxcNM
	qua8MLeZeBPLSUUOtQm0P82YzbgPfWFRo/+yY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fvrOPVWd3wr8/2itbPwDQ8Oc7s4UvsBB+1mbRce5mTC5I5YU0in2ZO5dfToFjwr9wc
	K5KQJi3JPNDzVVDy2OmtLdu5EZpWaxcTxoAk/MZpNxvINEsskzJAWclue6mFimuBoIKL
	P1uenU2SIKRn7Q3xDDDgsk5em719ELrqgFQww=
MIME-Version: 1.0
Received: by 10.229.36.195 with SMTP id u3mr1199906qcd.61.1255033999939; Thu, 
	08 Oct 2009 13:33:19 -0700 (PDT)
In-Reply-To: <1255009355.6355.4.camel@mill.internal.reciva.com>
References: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
	<200910081523.06229.holger+oe@freyther.de>
	<1255009355.6355.4.camel@mill.internal.reciva.com>
Date: Thu, 8 Oct 2009 13:33:19 -0700
Message-ID: <19c1b8a90910081333u1fc22290v571796c20b2fff12@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert Request for linux -> linux-gnu changes
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
X-List-Received-Date: Thu, 08 Oct 2009 20:34:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2009 at 6:42 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2009-10-08 at 15:23 +0200, Holger Hans Peter Freyther wrote:
>> As hard as it is. I agree that it should be backed out and put in a bran=
ch and
>> tested on non EABI systems. We find new regressions every day.
>
> Yes, I agree. =C2=A0It isn't even completely obvious to me that this chan=
ge
> has a great deal of merit. =C2=A0As I wrote in:
>
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-September/01=
3577.html
>
> it doesn't seem as if switching TARGET_OS from "linux" to "linux-gnu"
> brings any benefits other than trivial cosmetic ones, and it is a shame
> to break everybody's builds just for that.
>
> So, personally, I would be tempted to just revert it and leave it
> reverted rather than burning a lot of manpower on trying to make
> "linux-gnu" work for everybody at once. =C2=A0If individual DISTROs want =
to
> switch to linux-gnu then they are obviously welcome to do so and pick up
> the pieces for themselves.

It seems to be more entwined that it initially appeared to me. This
changes obviously
needs time to settle in as it gets tested in different ways. I thought
we would fix the fallouts as we find them
but I am fine to revert it as it seems to what other devs are leaning towar=
ds.
I will revert the cosmetic parts.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


