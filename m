Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PrDXi-0001yt-BR
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 18:57:58 +0100
Received: by iwn10 with SMTP id 10so1294052iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 09:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=aZmAn/4T+KxjFCfhjhTL83Sj50xM5lONDI/ba2VfRqA=;
	b=EjDuchvGMdfXXVoGrr84jy0bnaYi9o7nvdQR9HYPlxLOYAPnHLVLkk9VWXLrZwlBat
	9B768YvTW7RJZSK+qco3QQye6COatlpD99UgtHNtfu5962DBOhn3KkJg2Yuk9dFucqnE
	cljspqYAe7TvVSI9REH5HkWGE1NO0HX8afJ3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nOKFBxlDeQnIXX6gUFON74BGMW9VVfDsz6k2D0T6tU+vtJXE6ETKHgBZQRTaDEB4lZ
	XErSJdcG4n49J4KmrILpA6tB96kkwIvNhJ+jtrFWFijLSzClq1OImbp2t+vaBSpxvEwc
	/FZGwtVYVueDQ9JD7ill3qMrTYRH0aDM4yf/w=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr449241ibd.147.1298224600413; Sun,
	20 Feb 2011 09:56:40 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 20 Feb 2011 09:56:40 -0800 (PST)
In-Reply-To: <201102201754.15655.schnitzeltony@gmx.de>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D612958.70402@mentor.com>
	<AANLkTikJOdOdOmDwNwrsT1Jaraoaxj8ofBiDUA-HMAjH@mail.gmail.com>
	<201102201754.15655.schnitzeltony@gmx.de>
Date: Sun, 20 Feb 2011 18:56:40 +0100
Message-ID: <AANLkTikCeuf93NuDYEPu1o+DoSpRi1+ZWPja6Ymajqzp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sun, 20 Feb 2011 17:57:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/20 Andreas Mueller <schnitzeltony@gmx.de>:
> On Sunday 20 February 2011 17:31:26 Frans Meulenbroeks wrote:
>> 2011/2/20 Tom Rini <tom_rini@mentor.com>:
>> > On 02/20/2011 05:42 AM, Frans Meulenbroeks wrote:
>> >> 2011/2/19 Tom Rini<tom_rini@mentor.com>:
>> >>> On 02/19/2011 06:26 AM, Otavio Salvador wrote:
>> >>>> On Sat, Feb 19, 2011 at 11:52, Andreas Mueller<schnitzeltony@gmx.de=
>
>> >>>>
>> >>>> =A0wrote:
>> >>>>> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
>> >>>>>> I am fine with the patch, but perhaps a better solution would be =
to
>> >>>>>> introduce a var to decide whether it is a fatal or not.
>> >>>>>> That way people distro's that use libtool 2.4 can decide to make =
it
>> >>>>>> a fatal. (or individual users in their local.conf)
>> >>>>>>
>> >>>>>> Frans
>> >>>>>
>> >>>>> How comes that I sometimes feel handled as spammer ;-) ?
>> >>>>>
>> >>>>> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
>> >>>>> February/029534.html
>> >>>>>
>> >>>>> anyway - treating RPATH errors as fatal has lead to many QA fixes =
and
>> >>>>> further
>> >>>>> will follow...
>> >>>>>
>> >>>>> my opinion now: keep RPATH errors fatal as developer's =A0whip :-)
>> >>>>
>> >>>> I agree about keeping it configurable.
>> >>>>
>> >>>> Besides I think that we ought to keep it fatal until quite near of
>> >>>> release since we'll be "forced" to fix most of many of them.
>> >>>
>> >>> I just want to state, again, that most of these just go away with
>> >>> libtool 2.4. =A0Now, if people are looking for something to work on =
that
>> >>> won't just go
>> >>> away with an update to libtool 2.4:
>> >>> - iscsi-target needs some love again for various kernel versions as
>> >>> that looks to be killing calamari and neek for nas-server-image
>> >>
>> >> Peeked at iscsi-target for calamari. Some inet fields have changed
>> >> name in 2.6.32 or so, and apparently this is not handled fully.
>> >> Instead of trying to fix it, I moved the calamari recipe to 2.6.34
>> >> (which I'm already using for half a year or so, but apparently never
>> >> pushed).
>> >
>> > Thanks.
>> >
>> >> I'll also see if I can update the neek version (probably also by
>> >> moving the kernel version forward.
>> >> Tomorrow I'll discuss this with Walter who afaik is the only other ne=
ek
>> >> user.
>> >
>> > Note that I also see:
>> > - uclibc total failure, but I assume unsupported and I'll drop
>> > - minimal fails everywhere else with:
>> > ERROR: QA Issue with staging: libsupc++.la failed sanity test (workdir=
)
>> > in path
>> > /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-im=
age
>> > /DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/u=
sr/
>> > lib ERROR: QA Issue with staging: libstdc++.la failed sanity test
>> > (workdir) in path
>> > /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-im=
age
>> > /DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/u=
sr/
>> > lib ERROR: QA staging was broken by the package built above
>>
>> Also mentioned this on irc, I will try patch 719 that is suggested
>> below, but this could be a toolchain issue (it would not be the
>> first).
>> Toolchain for nios is quite old (gcc 4.1.something, binutils
>> 2.18.50.something). It should be able to build minimal-image for distro
>> minimal and micro. And as far as I know neither uclibc nor eglibc are
>> supported.
> Maybe a misunderstanding on my side but: patch 719 only affects libtool-2=
.2
> distros. I think minimal and micro distro do not pin libtool version so u=
se
> libtool-2.4.

Ah ok, I think you are right, thanks for bringing that up.
Guess it'll need some more attention, but as it stands I am quite
constrained on time upcoming few days.

Frans.


