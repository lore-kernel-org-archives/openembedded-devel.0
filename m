Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKyO4-0004GA-H3
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 20:18:46 +0100
Received: by yxd5 with SMTP id 5so5368776yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 11:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=WQ99eoBpjmGKuHosPz2Y1CW1CaVFQIISMDdk+qStXXA=;
	b=SYc8IQMYeaEbZargEdEtXHYkiA8YVF16ad+UYqc7sr5kacPeu/jQVVyHcb3vFbpTGC
	f9RhcuYEopY8IXUyU3vSTxmHIk4FU6o64TqUXfeSBlbVHyB8Pa6JJXAY6Z1ScCJaaDca
	mmbdtLHXN60r+o2AlHYKmS79uKFetldl484rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=VKoN3H+vM7xbo6JxlXd0IUHb8y+9QvimZoWR20kWdSEbOtrF6nCBDzO4baozXVoBZ4
	ekfWKvvgWPUsP0hN5NZEiCTQb3IGbU0G+j3ZXHoZpSAZQcWfnBqHOgb7bB0Wy+Xp4TEE
	XvnRTirpnDw4XmajySsWdAujfixdB1jJFWWe8=
Received: by 10.91.212.4 with SMTP id o4mr900401agq.21.1290539845651; Tue, 23
	Nov 2010 11:17:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 11:17:00 -0800 (PST)
In-Reply-To: <AANLkTikHr_T-D+Zbcfb9K-yJqB85TBh71mJoFnOF3kyc@mail.gmail.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<ich10v$f5b$1@dough.gmane.org>
	<AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
	<AANLkTikHr_T-D+Zbcfb9K-yJqB85TBh71mJoFnOF3kyc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 11:17:00 -0800
Message-ID: <AANLkTimuH0_qytr0HF-zgi0wQejBVtRx=ATNTuMVdZKr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 19:18:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 11:05 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Nov 23, 2010 at 11:42 AM, Chris Larson <clarson@kergoth.com> wrot=
e:
>> On Tue, Nov 23, 2010 at 11:26 AM, Koen Kooi <k.kooi@student.utwente.nl> =
wrote:
>>> On 23-11-10 15:29, Chris Larson wrote:
>>>
>>>> Thanks for your time, and do let me know what you think, either of the
>>>> code, performance in general, or the new progress bar (shows an ETA),
>>>
>>> The heuristic for the progress needs some work, it currently seems to
>>> take in account all the parsed recipes instead of the last N recipes.
>>
>> That's what our progress display always did, it's just more obvious now.
>>
>>> Try ctrl-c'ing it at 75% and restarting, you'll see the ETA taking weir=
d
>>> values. In my case it stayed on "10 seconds" for more than a minute.
>
> Okay, I disabled the ETA display for the time being. =C2=A0It's useful, b=
ut
> less than reliable, so we'll revisit it after revamping the progress
> handling and incorporating cache file loading into the progress.

btw my timing mesasrurements were against the wall clock and not ETA
displayed by bitbake

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


