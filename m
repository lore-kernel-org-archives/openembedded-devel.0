Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8836F6E82C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 06:26:05 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so2492825wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 22:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=jDq+m8TiYVagcKLj7aV4p/CmyPD9bOazV6D+WrEFtL0=;
	b=Z8ttl2MGBOgFUykRxvF+DmKvDzcSl6yl30u0LTDNoaEc+pBr58XvjjDtI4iK8pr6zh
	wr7BoZBfFU2t1VpNHdFx+e8k7otK47SVBzhk4kjhclUce675rt1E8DyYMIn3PnoQWIMR
	+p30HdPoMAu5gYKMmzt9XeinP7MdESj9ndHBn7cCwpz86vSApsc0Y4a5HtaRJa37g1G8
	bJWr9/S92A7S/5NQqkPF9ENgDnzmEpt/wiCmdFimBXV1xrPaquYv1myz+VV6KLzv0/FX
	+yY3FTWQaWKzDFGFn1Y5WRJwl1OPJjpgDUz6V6He+Du2kPWdDNkg7Ah9/fnTtJhrjRCj
	kVFg==
X-Gm-Message-State: ALoCoQlE0ZCrG/HFhwEnBoeDkDKsNXp+IiaP2W5/cEpC4zwWwlSvD2EbS4VQAqawjA1GJ6r4DT27
X-Received: by 10.180.189.6 with SMTP id ge6mr1887649wic.1.1390544765757;
	Thu, 23 Jan 2014 22:26:05 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id cx3sm12230571wib.0.2014.01.23.22.26.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 22:26:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrYit8BbXPD4Ubp=dD3QCoNM1XEfEyXiyrtpJD+tXMhmQ@mail.gmail.com>
Date: Fri, 24 Jan 2014 07:26:18 +0100
Message-Id: <7BF692DD-0FD9-40C3-8FF5-D94C7B5169D3@dominion.thruhere.net>
References: <1390491148-20966-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKrYit8BbXPD4Ubp=dD3QCoNM1XEfEyXiyrtpJD+tXMhmQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1827)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	mporter@linaro.org
Subject: Re: [meta-oe][PATCH] libusbg: add 0.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 06:26:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 24 jan. 2014, om 03:05 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> On Thu, Jan 23, 2014 at 1:32 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> This needs a 3.11.x kernel or newer for the configfs stuff.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-support/libusbg/libusbg_git.bb |   14 ++++++++++++++
>> 1 file changed, 14 insertions(+)
>> create mode 100644 meta-oe/recipes-support/libusbg/libusbg_git.bb
>>=20
>> diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb =
b/meta-oe/recipes-support/libusbg/libusbg_git.bb
>> new file mode 100644
>> index 0000000..ed5ac65
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY =3D "USB Gadget Configfs Library"
>> +
>> +LICENSE =3D "GPLv2 & LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    =
file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516c"
>> +
>> +inherit autotools
>> +
>> +PV =3D "0.1.0"
>> +SRCREV =3D "7e2b04363f319e8936a606bdb122dbde249a2f58"
>> +SRC_URI =3D "git://github.com/libusbg/libusbg.git"
>=20
> Branch value missed. Please add ${SRCPV}.

It's the master branch and the 0.1.0 tag, so no need for SRCPV or =
specifying the branch.

regards,

Koen

>=20
>> +S =3D "${WORKDIR}/git"
>> +
>=20
> Spurious new line.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


