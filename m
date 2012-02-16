Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxyvo-0007l9-GS
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:51:20 +0100
Received: by lahc1 with SMTP id c1so2306483lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=SPuoDhloUOprO39tgS5aj6SQK8CN7mIleCK8M97xLn8=;
	b=k/w1SVUqAhnWsH/IUiZASnD2ZPjlcxE/aZ4g3XG0aQid04r7EfdvCnPN2TLSL7p6cx
	lEpgM9sswOhHBXkscP8xhV4+NeXGhAJ/dU6Ns1H0GBPzEH1lA9OIg7ACBtcIW9J6iJ0/
	SFiaHfjv2Leqmm4XdVK7wXMnSbtzntRY7lFlI=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr1354061lab.23.1329388986918;
	Thu, 16 Feb 2012 02:43:06 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 16 Feb 2012 02:43:06 -0800 (PST)
In-Reply-To: <CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
Date: Thu, 16 Feb 2012 11:43:06 +0100
Message-ID: <CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2] 22/22] gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to enable service
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
X-List-Received-Date: Thu, 16 Feb 2012 10:51:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 11:10 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> =A0SYSTEMD_PACKAGES =3D "${PN}-systemd"
>> -SYSTEMD_SERVICE =3D "${PN}.socket"
>> +SYSTEMD_SERVICE =3D "${PN}.service"
>>
>
> Why?
>
As far as I can see there is no link from *.socket to *.service (
*.service requires *.socket) - correct?. Interesting: This was
highlighted by the systemd.bbclass modification: without this patch
*.service is not installed. Is there something I have overseen?

Andreas


