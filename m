Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Runxr-0000eP-5N
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:32:19 +0100
Received: by lbol12 with SMTP id l12so1657681lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 08:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sk911ZD60tfCvc3+eln/FyZ0AwKF7sGrjAVNNcJl2fg=;
	b=u+YvZrL+14dVVo6fK2EwS30uLUBc7HggfeK5Zc08Z/+lwvI2I1H+6T0Ouj3Zv9XcIm
	e3/yYVX7GygPeDdLAw15nT7Z0rJJSjcXvC/bfEtxLIfDf4sKRZTYSuz/kLFzOemxbr3p
	HSHUtMPnGEMWnQROr0UjHxbZP2VuDevxn4o/4=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr6604362lbz.22.1328631856691; Tue,
	07 Feb 2012 08:24:16 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Tue, 7 Feb 2012 08:24:16 -0800 (PST)
In-Reply-To: <jgrhc8$r0l$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<jgrhc8$r0l$1@dough.gmane.org>
Date: Tue, 7 Feb 2012 17:24:16 +0100
Message-ID: <CALbNGRTGghjj-Nw5jwokoU22FMqbZpezmPNesSaDSv+yT7K=YQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Feb 2012 16:32:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 4:52 PM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 07-02-12 16:12, Andreas M=FCller schreef:
>> The RFC series is intended to
>>
>> * reduce efforts/pitfalls when implementing native systemd support *
>> enable a global configuration for selecting of systemd/syvinit (sysvinit
>> needs further efforts)
>>
>> The whole series' can be found at (branches 'systemd' meta-oe:
>> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git
>> meta-angstrom:
>> git://gitorious.org/schnitzeltony-oe-meta/meta-angstrom-systemd.git
>>
>> Notes: * These are my first python experiences - suggestions welcome. *
>> In local.conf (or in distro) the configuration variable INIT_MANAGER
>> selects the initmanager to be build into an image. When changing the
>> selection, a build from scratch is required. INIT_MANAGER currently
>> defaults to systemd (see image.bbclass and initmanager.bbclass)
>
> NAK! The initmanager decision is up the image, not the distro. The distro
> can use blacklist.bbclass to blacklist the initmanagers it doesn't suppor=
t
> if needed.
It's not possible to let the image decide - e.g for polkit/udisks we
would need 2 versions: one configured/linked against systemd and one
without.
>
> regards,
>
> Koen

regards

Andreas


