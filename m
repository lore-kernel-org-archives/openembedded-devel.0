Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpdG0-0000A0-6R
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 10:28:53 +0200
Received: by iwn2 with SMTP id 2so3854297iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=154QwLBztPRgDlUWknPNCvwFW3JP+Fq0jPiOGTt250Y=;
	b=kVSzTC/Y0bfk98vSJTY+3z6FjBG0ZZKTmuR8AZIksJOjDdtfyDZaM4Xcby0HVWHT8T
	R99PeCbH+hE0fK0JEMMjwB0JlYigSeXGoPKHl8IsqcQbfaS5jkuYm1qfx7j9EE7jW5jh
	I5zQ/62Ke/lLzFgYTUm4ApzhQ5vU6aAhE6Tu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NlbaxDeJ/qQiJciJYM4hc0omcMxwYhG52pPI787s/lYbU3H0sufOYX06qR1HnTIS6Q
	p2D0qAauEsWU1+hSh7V4/ncmaFr6Hph8eusF/NN+lfDZfLEC4W4aXoNsKF3/ajG6H757
	oNuAibt/7fk14PYMou+aVrVb+DxfZCx0q6Ris=
Received: by 10.231.31.199 with SMTP id z7mr3547294ibc.50.1283070503159; Sun,
	29 Aug 2010 01:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 01:28:03 -0700 (PDT)
In-Reply-To: <AANLkTik-7oaZUABzC2ui0Oa8sAiPahHsR0x1K_g66Y9p@mail.gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-7-git-send-email-raj.khem@gmail.com>
	<AANLkTik-7oaZUABzC2ui0Oa8sAiPahHsR0x1K_g66Y9p@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 01:28:03 -0700
Message-ID: <AANLkTi=xUsGz0DCUouYVrJnxVr7AoNAdTXit4a8GdKzi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 06/23] sugar-fructose.bb: sugar-web-activity is not provided by any recipe dont DEPEND on it.
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
X-List-Received-Date: Sun, 29 Aug 2010 08:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 12:25 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I seem to recall from previous discussion that it will still build.
> Haven't tested that part.

Well as I said if this recipe is broken the patch does not break it
any more than it already is.

> Still:
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>
> 2010/8/28 Khem Raj <raj.khem@gmail.com>:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/sugar/sugar-fructose.bb | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/sugar/sugar-fructose.bb b/recipes/sugar/sugar-fruct=
ose.bb
>> index ad0db39..697ac21 100644
>> --- a/recipes/sugar/sugar-fructose.bb
>> +++ b/recipes/sugar/sugar-fructose.bb
>> @@ -1,3 +1,3 @@
>> =A0DESCRIPTION =3D "Sugar fructose activities"
>>
>> -DEPENDS =3D "etoys sugar-web-activity"
>> +DEPENDS =3D "etoys"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


