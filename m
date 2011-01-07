Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbG9R-0006EX-7D
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 18:30:57 +0100
Received: by yie16 with SMTP id 16so4822263yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 09:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=JYZbI3phj3vfCJYk5Cg4mzwiSUWU7Ep5DsSqLaOXqAU=;
	b=AbUYm83rh9Qv7/bOUTO9lJA8MILQwhvBFJsIce9EQ8dZ9CvRudo5ECxipTbqEj9pan
	rlOVHNAM5ojjSle9FJj9i/6dKDxMsdjpF/pv+zsG72BiDY60geV4Ju3ona6vF3YLDMCy
	h+wK0EN0F1MDJGfm6p3UFotKwyqVJPV6R+nEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=pOgHjDOUNl2dKVgU/B0rxENYWPv2uwWpiz3BvoAVE3RjwC9FfDtkSfuW63YV9bexeS
	6iX0ETk1GczK1t+NRdwyINW+s0LA36p2d/BgIEo0F8VsghmXRebLv75wuhIdvyFDjCW8
	WurTCcMIrNI+i78oTeXIpBxfOIDQLls8bCA5I=
Received: by 10.90.120.14 with SMTP id s14mr1681688agc.58.1294421429476; Fri,
	07 Jan 2011 09:30:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 09:30:08 -0800 (PST)
In-Reply-To: <4D272079.5000402@opendreambox.org>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
	<4D272079.5000402@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 09:30:08 -0800
Message-ID: <AANLkTikTFe9ytvKcD1T=_L8GFiPo5bqBQ2o29McmzYU4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Fri, 07 Jan 2011 17:30:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 7, 2011 at 6:17 AM, Andreas Oberritter <obi@opendreambox.org> wrote:
> On 01/07/2011 02:47 PM, Otavio Salvador wrote:
>> On Fri, Jan 7, 2011 at 07:28, Khem Raj <raj.khem@gmail.com> wrote:
>>> * Look for disabled features in DISTRO_FEATURES and disable them while building eglibc
>>> * By default all features are built
>>> * One can disable a feature by specifying DISTRO_FEATURES += "noinet6 nobsd ...." e.g.
>>
>> Awesome.
>>
>> Do you think we could do something similar to busybox to avoid having
>> many defconfigs?
>>
>
> Maybe it would be better to introduce EGLIBC_FEATURES and
> BUSYBOX_FEATURES, possibly presetting some values with options already
> present in DISTRO_FEATURES.
>

I think it can get to many knobs and confusion in settings. With
system library any feature en|disable
is system  wide so having it as a distro policy is right way to go imo.

> Now it seems to be possible to specify both ipv6 and noipv6, which seems
> inintuitive to me. It's not defined, which one would take precedence
> over the other, or whether such conflicts could be catched to display an
> error message.

good one
hmm yes ipv6 exists already so probably I could reuse that one in eglibc

>
> Also, as an example, nobsd's name doesn't contain an implicit
> relationship to eglibc, so one might think that it would affect other
> packages as well.

Its a system wide feature not limited to eglibc if we disable BSD
functions in libc then we better not use them in applications
so this feature knob is the way to handle that for more than eglibc
possibly so are others.
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


