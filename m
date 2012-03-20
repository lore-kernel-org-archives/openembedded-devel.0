Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9uhx-0007bM-2b
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 09:46:22 +0100
Received: by iaag37 with SMTP id g37so10545064iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 01:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=W+AzgBlHCNJuOqxf3YpeMz89c7hUikWVATek8e+uVIc=;
	b=rpp98I/R3LE/u0TGTUmYcYLzBHQEteLUOBMcpj6LqXkI9PN0S8PuSyH2Wz7X2+XN0m
	uHASjpOlE0Uot9QIGC3Yn9YpDqa0pm5mmZq8zdnBXoYH2SIcEgGnR3MUtykcVzH8FbPK
	CO2x7QQfKorDTexKR49L1HDvs/lm7w6k3Z12JgaOElRP7H7W7mAwoH79ZI7J667DDGzj
	hrhMU3tcokDR8DmVSNTsH/WDqlGQkTuquBoWSgjqBlK6FiSo8QNXy+ojopDWSNmsrAkT
	NvlrjfuQ/RvPfdi5F5J/lDUWgqpBCKdZ0Uwpb1PHTPRtY0eG1TdiFLaOC4XO2D//uAKU
	QEUg==
MIME-Version: 1.0
Received: by 10.42.159.201 with SMTP id m9mr8672704icx.32.1332232647909; Tue,
	20 Mar 2012 01:37:27 -0700 (PDT)
Received: by 10.42.75.137 with HTTP; Tue, 20 Mar 2012 01:37:27 -0700 (PDT)
In-Reply-To: <jk7vr4$482$1@dough.gmane.org>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
	<jk7aa6$bjh$1@dough.gmane.org>
	<CALbNGRRx041cARMx4bWrZbOzoCJg5qL5v+i4s+mudXPMKAOgYw@mail.gmail.com>
	<jk7vr4$482$1@dough.gmane.org>
Date: Tue, 20 Mar 2012 09:37:27 +0100
Message-ID: <CALbNGRR0Z2pFGOxBGNuyPUDd7h1dUCqOLeqHpBM8qOC_3eY-_Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 1/6] mpd: initial add 0.16.7
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
X-List-Received-Date: Tue, 20 Mar 2012 08:46:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2012 at 8:01 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 19-03-12 16:24, Andreas M=FCller schreef:
>> On Mon, Mar 19, 2012 at 1:54 PM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>>> +DESC=3D"The Music Player Daemon" +DAEMON=3D/usr/bin/mpd
>>>> +MPDCONF=3D/etc/mpd.conf
>>>
>>> The above hardcodes $bindir and $sysconfdir, which it shouldn't do.
>> mpd.in + sed in V2. OK?
>
> sound good to me.
>
>>> Furthermore I'd like to stop maintaining our own initsystem in meta-oe
>>> and switch to upstream initscripts as much as possible
>> The package itself does not contain an initscript so I implemented it
>> close to that found in debian-lenny package. What upstream source do you
>> suggest (matching also above requirement not hardcoding paths)?
>>
>>> and include systemd units by default as well.
>> This requirement I did not know and did not find any source for that -
>> some suggestion?
>
> Fedora or arch should have one.
>
>>
>>> The above script is missing LSB headers as well.
>> This initscript as is does not need.
>
> AIUI OE-core requires lsb headers for all sysvinitscripts and systemd wor=
ks
> a lot better when those headers are present as well.
>
Another question: How about adding the mpd stuff into meta-multimedia
( as a starter - e.g. in subdir recipes-audio )?

Andreas


