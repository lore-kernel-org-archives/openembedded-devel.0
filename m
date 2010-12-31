Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYjZn-0007eP-50
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 19:19:43 +0100
Received: by ywi6 with SMTP id 6so5066084ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 10:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=hHvCca+OPL9+zF+DQIu1fs6dj0OypHTx9XTHsxgvMtg=;
	b=XZy/QFmqq2/IvJFyU+LXBd395PuIz5Wwgri01MLsgt8QwJA1hhU48XyJ0Q3/yH7cTt
	SHjJWz4krj263SBnNoX06BkkPxC0DzbWpOyx99euyScl6LJQljg9JWIwz5RXD89YS8Q4
	rtj+PbWjNcpu0htINYSghmOdtkyBwKUgkEIAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Q2ImE7OaCpZaET35QvWow3C9ee5HlUg1pVqODiXJdEQuIUgcn/s8UG8lTmZL/7jz5n
	VF9f9U5vuwxKZbJ/QNTu8RUO2s4Kpqyuy6rSNylzkhWddS5BUvpOZ8cGXgXBFvH54X9Y
	YEwe+Wo/2ArDppnbASzUTCGq4ejW8XkNy+0yQ=
Received: by 10.91.163.27 with SMTP id q27mr9090382ago.139.1293819561015; Fri,
	31 Dec 2010 10:19:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 31 Dec 2010 10:19:00 -0800 (PST)
In-Reply-To: <AANLkTikGxbBHJJLeM52LUe6LUJkMCekmb3r7MkXOvAmp@mail.gmail.com>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=kATNZpvbMESpVEDK9=eCo5Bq-paSKWYNJneH9@mail.gmail.com>
	<AANLkTikGxbBHJJLeM52LUe6LUJkMCekmb3r7MkXOvAmp@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Dec 2010 10:19:00 -0800
Message-ID: <AANLkTik-pdubrbmvXYozG3ij3gEpyc5ZUtKCYtsr07SN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot: added 2010.12 recipe (DEFAULT_PREFERENCE = -1)
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
X-List-Received-Date: Fri, 31 Dec 2010 18:19:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2010 at 10:01 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/31 Khem Raj <raj.khem@gmail.com>:
>> I thought it was preferred for some machine. Whats the use of a DP=3D-1
>> recipe? So you intend to use it.
>
> Yes. a DP=3D1 for pandaboard is added in the next patch.

ok

> I wanted to separate adding the recipe and enabling it for pandaboard
> (as I figured the latter might raise some controversy).
> I can also imagine other machines can use this (I need to check if it
> is good enough for kirkwood based hardware and I need some more
> testing for that before I move to this version).
> However, I wanted to make this available now, so others can also use it.
>
> BTW we have plenty of recipes with a DP=3D-1:
> grep DEFAULT_PREFERENCE */* | grep -- -1 | wc
> =C2=A0 =C2=A0421 =C2=A0 =C2=A01263 =C2=A0 23484
> guess some of them are enabled for specific hw, but several of them
> seem to be quite pointless.
> E.g. for cups we have 6 recipes: cups_1.1.23.bb =C2=A0cups_1.2.12.bb
> cups_1.2.7.bb =C2=A0cups_1.3.8.bb =C2=A0cups_1.4.3.bb =C2=A0cups_1.4.4.bb
> The last three have DP -1, none is pinned or has a hw specific DP.

yes we should try to reduce them if possible.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


