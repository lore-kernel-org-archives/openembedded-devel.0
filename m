Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaNi0-0003Vy-Lu
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 10:59:48 +0200
Received: by ghbf1 with SMTP id f1so1989588ghb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 01:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dclTREnW9v8+OoPYYWNwHkCZNVafLAyVnW9tlS6etrY=;
	b=Fu8xpF2a2JG+GO9Gy4gbut96h7Ay1CI0E7vcf/spkPOIcUZOIl8T2+i/Id/YA58ZUe
	Xc2yq1VOBsaSjkvZmGvhOMTRQRE/2GaW294+SdAxbXVGZ3Ay6W3w+XMft8UTdHaGW8Hf
	CmKjTKRI1hwpM590JA9DSntX7u1RaKL/ifmcvVX+iqrl0pOWUHqwo45Pk/lYUA5JDe2h
	jzVevRdQ/jh+dLGFVsxWHgloMw4nm5uuOFW43eBvFsXSw1o2EYC2xVDQ4/TFajh0GJp9
	GcsbEtP6vDxSES3lDpLMsIv6zECigjM/ziHjhyA9AeYtLw0aXpC9i1jto0NsbvYUI6UK
	5yew==
MIME-Version: 1.0
Received: by 10.50.104.167 with SMTP id gf7mr480472igb.38.1338540567295; Fri,
	01 Jun 2012 01:49:27 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Fri, 1 Jun 2012 01:49:27 -0700 (PDT)
In-Reply-To: <CALbNGRSdkCb320X=zDGV3Ei6-i-w+C-GX2RPyXx2XrLYSbA7hg@mail.gmail.com>
References: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
	<1338510443-29579-3-git-send-email-schnitzeltony@googlemail.com>
	<20120601053614.GV3138@jama.jama.net>
	<CALbNGRSdkCb320X=zDGV3Ei6-i-w+C-GX2RPyXx2XrLYSbA7hg@mail.gmail.com>
Date: Fri, 1 Jun 2012 10:49:27 +0200
Message-ID: <CALbNGRRsS2ENfALZcQOfp4gj4d4hinS_Z8qHY3VAC=Z1zQHM_w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, v2 3/4] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Fri, 01 Jun 2012 08:59:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 9:16 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Jun 1, 2012 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_exactly_one_service =3D l=
en(systemd_services.split()) =3D=3D 1
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_exactly_one_service =3D l=
en(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages)) =3D=3D 1
>>
>> ^ isn't split() still needed here?
> Uhh - this would have broken the /dev/null links - thanks. Hope to do
> better next time. What concerns me is that I did not see that in
> buildhistory. Will check that first before sending out V3.
>
Just if anybody is interested (and to prove that my buildhistory tests
were OK :) AFAICS the only recipes affected would have been dropbear
and openssh. These have the 'Conflicts' tag in the *.socket files. The
*.service file are still dragged in since *.socket files add *.service
automatically - there was something mentioned in systemd docs. So time
to have short test on V3...

Andreas


