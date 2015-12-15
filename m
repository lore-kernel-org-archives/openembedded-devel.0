Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8D36FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:50:03 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id hk6so4417397pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 04:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VIAaojCeR8xTPlG3so81+QdZgDDR2GlRW8xSPuObuh0=;
	b=FbAk5P9u5ds+podYFq7lRyD+OR6sl1TK2OaQuXpD41wWQNK8vUnYRp41E0sQ+DmCxK
	GL5aOGZsq6n8FSBYYY6+FycYMzFJlC/G2AdJB8CEteUrkw1XpKPm6n5yFhohhc84Rvq1
	9xPCOaAY+vFdoOq+s14WpjPQn1EqvYCbjT2LIkxLkpk7Y/EFZH8GGFq6uGZgAy9ZS9cx
	Izrlh25DLgAS7P/pXWavUlmRjjaPbmG6+KEAR9G1lMNggk3AF/l+0sw570fKtpajG6da
	xNSMgLGdNBf61MmVfdUaISn4XAs8MgiND2uuisRHJlVKJAOqGsWTYwy7QX2IIFXKd0xE
	SO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=VIAaojCeR8xTPlG3so81+QdZgDDR2GlRW8xSPuObuh0=;
	b=ZWes3OSFmMqzvvpRD5w1UpBpq0HRmu6L9YGf0qdMmTav+3cMdmsJnPNsj2fxUB/7x+
	6K+nBo73PKGYxxmMx+mP5gkO+wSL5bi5kHo9JoziZMKUokxylXSIsoQaGfWwDgXVrjRT
	/tvGvUfqorqElvJSw2I1H6cQ8n2/vYWzprmc3iq8MCgpH/5vN5xyE1rHT/zjilZFbvdD
	NR85O9dqjmsA+mpttdkja+DWHlZnWcMiUYkPF0hoyHinJaim0kbOaoVW7ATz4f74ytDD
	PQZPu9kFj6y7QrkMDrIT8xkhZKc3jja8rf6zJxPPFcfxr5XcipD704KOzsw3J27M0bil
	lpjg==
X-Gm-Message-State: ALoCoQkcqq3g8niw+I81u/xoFEKD64BAUkfYHaLuwprVEserE7WhfHeQR4IBbKhIw+PmQy5AFtPdTZ+o9HYNAiuKPZmx/rC/WA==
X-Received: by 10.66.216.73 with SMTP id oo9mr54017597pac.148.1450183804434;
	Tue, 15 Dec 2015 04:50:04 -0800 (PST)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com.
	[209.85.192.173]) by smtp.gmail.com with ESMTPSA id
	b17sm2251697pfj.43.2015.12.15.04.50.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 04:50:02 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f173.google.com with SMTP id u66so4387434pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 04:50:02 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.16.84 with SMTP id y81mr31799982pfi.98.1450183802434;
	Tue, 15 Dec 2015 04:50:02 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 15 Dec 2015 04:50:02 -0800 (PST)
In-Reply-To: <0A579224-B53A-40F8-9C7E-270C6D9D9B4A@gmail.com>
References: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
	<CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
	<0A579224-B53A-40F8-9C7E-270C6D9D9B4A@gmail.com>
Date: Tue, 15 Dec 2015 10:50:02 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqLsDuyxVWOOC2UJMqGpjep+LGFajQO+N7jyiRa=5ea=Q@mail.gmail.com>
Message-ID: <CAP9ODKqLsDuyxVWOOC2UJMqGpjep+LGFajQO+N7jyiRa=5ea=Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: fix rewrite QA warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 12:50:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 10:40 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 15.12.2015 um 13:31 schrieb Otavio Salvador <otavio.salvador@ossystem=
s.com.br>:
>>
>> On Sat, Dec 12, 2015 at 7:36 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>> Fix bitbake warnings from variable renaming like
>>>
>>>    Variable key FILES_${PN} (${bindir}/* ${sbindir}/* ${libexecdir}/* $=
{libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} ${b=
ase_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} ${base_prefix}/li=
b/udev/rules.d ${prefix}/lib/udev/rules.d ${datadir}/${BPN} ${libdir}/${BPN=
}/* ${datadir}/pixmaps ${datadir}/applications ${datadir}/idl ${datadir}/om=
f ${datadir}/sounds ${libdir}/bonobo/servers) replaces original key FILES_o=
penjre-8 (    ${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*     ${JRE_H=
OME}/LICENSE     ${JRE_HOME}/release ).
>>>
>>> It is caused by using FILES_${PN} and FILES_{JDKPN} or FILES_${JREPN},
>>> respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and FILES_${JREPN}=
 to
>>> openjre-8_%.bb to allow consequently use FILES_${PN}.
>>>
>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>
>> Looking at the proposed change, it seems it would be better to squash
>> the JDK and JRE installation to a single recipe and do the proper
>> split using the packaging.
>>
>> Do you think this is reasonable?
>
> I split openjdk-8/openjre-8 because of weird behavior wrt.
>
> PREFERRED_PROVIDER_java2-runtime =3D "openjdk-8-jre"
>
> but I think with all the things I learned during packaging openjdk-8
> and nqp/perl6 I can retry.
>
> This will require lots of tests, so unfortunately it's unlikely
> to manage it this year - maybe even not before our planned HP1 update
> release.

Right; it is not a problem and I think this could be merged as an
intermediate solution, in meanwhile. However I think consolidating it
into a single recipe would give us some benefits as: faster builds,
single recipe to manage, removal of .inc file at all.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

