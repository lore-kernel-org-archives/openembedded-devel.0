Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpnR3-0002it-H4
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 23:30:01 +0200
Received: by ggnp4 with SMTP id p4so3781363ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YlErOpXJQ0OA31FwYeX+doGk1zs32kSuxKlh6i9LyqQ=;
	b=UBGFD5ZOSRrG4K5PHD8o1hdoY+wKztUI+1XU6L4PDdNROwYG8jMS+PPSrPauC9dvdO
	cdzv9E5uX1Ta+nripGa62ua+coUDI3ldGEYn42XIeMIdf1PEa+sjj2UGSuTiNFTZUvTk
	dfqvol/qHOPmUanpXkdK9G/H9FTOFuinUxVRAjC6pLE62SMjX44CUIa5bYc2LGU6rwcI
	J6t/sDWwfyYULfj5ZmkuoKzbueenSFZYdmaJuwfO3nQkgbRHw0F34v9d4+xDHK56mKgc
	jNigx6DuqH/GtRgGQNet4meD2DWnAh+C7EUHDFfwu8uMsOmoOfSmEav5R/9VyhWtcNh1
	Mo5A==
MIME-Version: 1.0
Received: by 10.50.192.170 with SMTP id hh10mr181220igc.36.1342214326259; Fri,
	13 Jul 2012 14:18:46 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Fri, 13 Jul 2012 14:18:46 -0700 (PDT)
In-Reply-To: <CAP9ODKrbdC-G-+tfV6akZUh_Six-O4qAy1nmVazo5Zr0OnbN1w@mail.gmail.com>
References: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
	<1342177846-26594-2-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKrbdC-G-+tfV6akZUh_Six-O4qAy1nmVazo5Zr0OnbN1w@mail.gmail.com>
Date: Fri, 13 Jul 2012 23:18:46 +0200
Message-ID: <CALbNGRRD_65eyWLt+sLW9P_HYczjYkBSUdN8muscZXn_=P4-zA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-system 1/2] systemd.bbclass: introduce SYSTEMD_AUTO_ENABLE variable
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
X-List-Received-Date: Fri, 13 Jul 2012 21:30:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 5:28 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Jul 13, 2012 at 8:10 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> Currently all services introduced are enabled and started at installatio=
n. By
>> setting SYSTEMD_AUTO_ENABLE =3D "disable" the default behaviour can be
>> overridden.
>
> I like the idea but this might be nicer to have it by image; we could
> check, in postinst, for:
>
> $SYSTEMD_ENABLE at runtime, so we can set it in image file.
>
If I understand you correct, you suggest an image global for this?
From my point of view we then put things together which we shouldn't.
For instance: my preferred next candidate would be gateone. Nice to
have on the machine but not mandatory to start at every boot. It takes
long time and is more a on demand thing. What do gateone and udisks
share in common?

Andreas


