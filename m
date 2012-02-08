Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rv5sE-0000lG-CJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 12:39:42 +0100
Received: by lahc1 with SMTP id c1so374009lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 03:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lzVKCo/mOEP/hOEI1EeuKVy9mqS8ISE87O9/R9Zt5+4=;
	b=ijAS42g9X7RjVPyWJ3S+8f6nUZjpl/PHqPE/nwndxK8Cy9XLBFIYD3H+RIxu2npKWs
	g+MLABv1jp4HGPHWL7PDL2JCs/mtxnJAVq58SBT0f7mEqZB76IUbf6Z9TmY/DIkboGWv
	dyG7YdAzEKvWcImrrodQEwRejhKBR0TxGK8Bk=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr7799497lbz.22.1328700698927; Wed,
	08 Feb 2012 03:31:38 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 8 Feb 2012 03:31:38 -0800 (PST)
In-Reply-To: <jgtl0v$gd6$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
Date: Wed, 8 Feb 2012 12:31:38 +0100
Message-ID: <CALbNGRQNjG+6brS1_MAP+dNCGXwrgbY5r4W5cwPydBiyP38DzQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 11:39:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2012 at 12:07 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 08-02-12 12:00, Otavio Salvador schreef:
>> On Wed, Feb 8, 2012 at 06:18, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>
>>> Op 08-02-12 01:39, Joshua Lock schreef:
>>>> It looks like systemd provides various interfaces and API's that
>>>> packages may or may not use and as more packages adopt these we're
>>>> going to need to be able to enable/disable more than just some unit
>>>> files/scripts for init support.
>>>
>>> Most (if not all) of those APIs are designed to be used with or
>>> without systemd as initmanager, that is why there are seperate shared
>>> libraries. I need to double check, but polkit might be the only
>>> exception to that in that it needs to have systemd actuall running. But
>>> multi-seat is broken anyway currently, so not much difference for the
>>> end user either way :)
>>>
>>
>> Well, it being broken or not doesn't change that it explicitly depends
>> on systemd. We also ought to have a design that will work when this work=
s
>> and it seems, up to now, that distro =A0feature is the only solution =A0=
for
>> now.
>
> If it's just polkit and udisks and image feature works well enough. Perfe=
ct
> is the enemy of good and all that.
It started with udisks followed by polkit. Which is next to take care?

Andreas


