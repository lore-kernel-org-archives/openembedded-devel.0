Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OmtEV-0000YY-5W
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 20:56:28 +0200
Received: by iwn2 with SMTP id 2so1571726iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BXL3IdUrPmJwt/6tqNI76rQZ0iFjb5kHYFXA3XE6Ft0=;
	b=d8j26eCYLkuPnyF9UNdfiqwNgKpkifXMfGOnoMBymolE+3xDfIfRL8WC176n2U1bQw
	gXKkUtJlUPCULpxvfu7IreBMUze9kXIoVTZf6ujJx3NMhB9PmBCnI7MhZF5u2qLB+40M
	UiN1qToH+hQiQ1/yAtM4piTf9oznjgwH6ZoYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vPX7o3Nskk62SoYUm5zgz9eDWwnCsE8Bb6zfhUOO6kq7tfw9mDAA+1wna1tTNywMTT
	Qm1ntylOJy+VAUB24XyrIaiS17bTRydivGG/La2YMXnksj/lhVbkAoawLac5G5QPsjxy
	PbF3GPQGnky74pZViCoBr+souOb8+IQNGGWKo=
Received: by 10.231.157.205 with SMTP id c13mr3729257ibx.71.1282416938139;
	Sat, 21 Aug 2010 11:55:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Sat, 21 Aug 2010 11:55:18 -0700 (PDT)
In-Reply-To: <201008212219.27410.roman@khimov.ru>
References: <1282406626-13837-1-git-send-email-khimov@altell.ru>
	<AANLkTimSd5v_KD7cz92JHTxp-sELd4ri9OLdpkNU4zO_@mail.gmail.com>
	<201008212219.27410.roman@khimov.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Aug 2010 11:55:18 -0700
Message-ID: <AANLkTi==V_i_jLyeMQnF+D9Nwm0D5y0-ohUBx6E3AYdN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clamav: allow clamav-data installation
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
X-List-Received-Date: Sat, 21 Aug 2010 18:56:37 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2010 at 11:19 AM, Roman I Khimov <roman@khimov.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D5=C2=C2=CF=D4=C1 21 =C1=D7=C7=
=D5=D3=D4=C1 2010 21:38:48 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
>> On Sat, Aug 21, 2010 at 9:03 AM, Roman I Khimov <khimov@altell.ru> wrote=
:
>> > It wasn't possible to install prepackaged clamav-data with the way it'=
s
>> > been packaged. And there are situations where you want to have at leas=
t
>> > prepackaged AV databases before you could do any sort of update. Also,
>> > logically freshclam doesn't substitute clamav-data, but rather
>> > complements it.
>> >
>> > Signed-off-by: Roman I Khimov <khimov@altell.ru>
>>
>> Will there be any conflicts with prepackaged clamav-data
>> otherwise you have the ack.
>
> Well, -data is data. -freshclam is freshclam. Freshclam updates the data,=
 but
> the data files are defined as CONFFILES already, so there is no conflict =
at
> this level.
>
> But thinking another 5 minutes about it there is an issue with this patch=
 in
> that it actually makes clamav-data installation (and that is huge, 25M)
> _mandatory_, whether you want that or not depends on situation. We want t=
hat
> (hence the patch), someone might not.
>
> Technically, there are three possible installation combinations, each has=
 its
> valid use:
> =9A* clamav-data
> =9A* clamav-freshclam
> =9A* clamav-data & clamav-freshclam
>
> Before the patch only second one was possible (probably with the recent
> BAD_RECOMMENDATIONS fixes to opkg and OE also the first one). After the p=
atch
> only first and third will be possible. Do we really care about second cas=
e?

Can clamav-freshclam function without clamav-data? If yes then
I guess if someone does not need it and does not need data
and is forced to install would be unwelcome particularly when
the size is big enough.

> And if yes, how to allow all of three to coexist?
>

may be have separate recipe for data.

> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


