Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaMGK-0001Lz-47
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 09:27:08 +0200
Received: by yhjj56 with SMTP id j56so1430001yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5RR/5huCQOWyPHsV9LqidWYPKa+N+DiNioh55Rurj00=;
	b=SQEfGag6nSlav2wENjDnBLD8n83ymdKs9r8nOPjyO09r3l7dKglO5KoBRTZTqLjLJl
	Ii2e2VEiX0DLSqilUV5TJcLLiePPFNsMNy6+fJlWpiDxpqqO+ixuHWKqkbaVJrFAnJ5z
	qnbty024f5bPWE8maJEwVsqxc1Udp9vW9sUvP0M9cvC0kKE28cJZy0KCL9AxJjGlSPwx
	6iP10VlDQKK6EBZm1C9ml6KThzaW/83NhS+/byeipxSQkn8R9VFMoXeSuqehkoDZs8ib
	I+0iQbCVg/hlDe6z9AsbW4Fwe+TxbMqvUrKDVYCKNOSS+mv/llWzcAcqX8iWrnKmra/i
	/daA==
MIME-Version: 1.0
Received: by 10.50.178.33 with SMTP id cv1mr522259igc.1.1338535006495; Fri, 01
	Jun 2012 00:16:46 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Fri, 1 Jun 2012 00:16:46 -0700 (PDT)
In-Reply-To: <20120601053614.GV3138@jama.jama.net>
References: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
	<1338510443-29579-3-git-send-email-schnitzeltony@googlemail.com>
	<20120601053614.GV3138@jama.jama.net>
Date: Fri, 1 Jun 2012 09:16:46 +0200
Message-ID: <CALbNGRSdkCb320X=zDGV3Ei6-i-w+C-GX2RPyXx2XrLYSbA7hg@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jun 2012 07:27:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_exactly_one_service =3D le=
n(systemd_services.split()) =3D=3D 1
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_exactly_one_service =3D le=
n(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages)) =3D=3D 1
>
> ^ isn't split() still needed here?
Uhh - this would have broken the /dev/null links - thanks. Hope to do
better next time. What concerns me is that I did not see that in
buildhistory. Will check that first before sending out V3.

Andreas


