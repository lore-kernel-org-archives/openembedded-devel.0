Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ry2E9-0000Ai-F3
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 15:22:29 +0100
Received: by lahc1 with SMTP id c1so2546105lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=R6Pz8oqswmt7K07/mJasau1hfZdGqPFDTCLsKLegWtc=;
	b=xq+9REk73rl7OYztaegkYamjzDhN2yLO2zX9tL+wHQUlrl/ZhEDqrCN8FcDdkKz0kO
	tkLIzQ2yPFTBjvKzIBymmKR5xWFbHTmxs59uNFZxQAVs790WSVvwcFbJ2d9l1nJNY32+
	Q4f8OrC0Ilkd0J2xb0ZA5ABbEdfoMhP1Q/HZE=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr1874397lab.23.1329401656433;
	Thu, 16 Feb 2012 06:14:16 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 16 Feb 2012 06:14:16 -0800 (PST)
In-Reply-To: <CAP9ODKofxACXcKtk__mC4AB1a+GbJiiR7b=rutess-eJ53Z3AQ@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
	<CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
	<CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
	<CALbNGRT+riFB=5BiR+r4g=t22U60ZAhChcs1iSFk_3j4eEQyTA@mail.gmail.com>
	<CAP9ODKq9xT+ZqCajjqDkM_-=Tkh8OJk0hKAugGfhXd6E=61Cpg@mail.gmail.com>
	<CALbNGRSUxOf7U7H7AJjCaXYhuYe8bd64_YW6Vc9Mnf9PKdn+sg@mail.gmail.com>
	<CAP9ODKofxACXcKtk__mC4AB1a+GbJiiR7b=rutess-eJ53Z3AQ@mail.gmail.com>
Date: Thu, 16 Feb 2012 15:14:16 +0100
Message-ID: <CALbNGRQrKXGdL22dEqGAHSwx5Mw2Dw3Uzzb33B=scfayMsfTNg@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Feb 2012 14:22:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 3:09 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 16, 2012 at 12:04, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> This is not the case for many packets having *.socket files
>> referencing *.service by 'Also'. But in gpsd.socket is nothing like
>> that.
>>
>> One question the other way round: What fallout do you expect by this pat=
ch?
>
>
> No fallout but I think we ought to support the specification to avoid
> needing to touch this code soon. As systemd explicitly say's that if a
> .socket is provided, a .service or a @.serivce needs to be available, we
> might support this case too.
>
Agreed (previous mail went out too early): V3 will get it

Andreas


