Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1P8iVb-0003Bz-1m
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:55:51 +0200
Received: by eye27 with SMTP id 27so1049950eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=VwJc9+NHlCeHM9MktX/ufxp7fVQ7r722/rKxfWy6ZeI=;
	b=uF8GUp7nQCx0yJbJK/+I+49GlWvmXDBEO0hu1J1RZeTXjEaBzdrRX4EqGDy6sDSJar
	EFlZPUX31jXmDhWvvvn+HIpBOW9e5xWyOnciNw8pO/lSnjU01nze+g607HqJb9qU4sIi
	Q8bWzMMLXQVrzLCRrSWkQvD0Togj6NJGDlFGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ws6blEbPbtrwv2fNiJkD2iKdXLi15Pw6FlbDglUMS9eptolWj0tkD72NHKIGkcxvZK
	ioVBRt0u++/lb3cJhzKNcoCukDIjvfJtG66Kmr0D2W9oTCZhs8wJOoYO/bhOJCC/r+lo
	jcIFTHiwPz84XEy/QimP3sObivGuKRMAoul14=
Received: by 10.213.35.145 with SMTP id p17mr7229356ebd.84.1287618913624; Wed,
	20 Oct 2010 16:55:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.127.137 with HTTP; Wed, 20 Oct 2010 16:54:53 -0700 (PDT)
In-Reply-To: <20101020231922.GX11514@denix.org>
References: <AANLkTi=B3qc0KgH_oz0_iLHN0ztbP6g7XD5fP-Jxg--j@mail.gmail.com>
	<20101020231922.GX11514@denix.org>
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 20 Oct 2010 16:54:53 -0700
Message-ID: <AANLkTi=m21_7GtTTb930H9XppjJrMuJ4cnTku9Bdt3p4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'require' across different collections
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
X-List-Received-Date: Wed, 20 Oct 2010 23:55:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ah...brilliant! This works like a charm.
Thanks for the super-speed responses.
-Ash

On Wed, Oct 20, 2010 at 4:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Oct 20, 2010 at 04:12:13PM -0700, Ash Charles wrote:
>> Hello,
>>
>> Is it possible to use the 'require' or 'include' keywords across
>> different collections without specifying an absolute path?
>> Specifically, I have an image recipe which adds a few additional
>> packages to console-image.bb; it lives in a separate collection i.e.
>> it is not recipes/images/. =C2=A0I currently get parse errors if I try t=
o
>> 'require console-image.bb' yet I had thought there was a way of doing
>> this and I can't track it down in the mailing list archives.
>
> require recipes/images/console-image.bb
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


