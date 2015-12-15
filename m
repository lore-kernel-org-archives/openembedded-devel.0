Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 885F473189
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:19:17 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 63so6451364pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Fi58nTwjKitu6A0z5BL7S3blyy4r8Ko8QzYt+Kw1XV8=;
	b=pGsUCGR2iw4O66LS+eoVJIQERY7qvTOFykG8XPPJrdL169sX7f6ZZdTtLh5S4aFC1g
	FCn0BqOxD2ABq1lGDXfZvQYp0qVWhjqIz51BUOe7yWbwZcwg1SVES1UjDuEjsufD2af4
	I8Ws9ESp2C53qiAGVZKdpOvlmW1FxPM24QZZEAU6fMNYyJjzlu1OvcLnWLD/jRKpG8M3
	i5tKXndPdrUoupBoK5U3/chf/coR2463nNeBi7k/9Q/tmGpjTcTJLo/6Kg/VmUD1tDuZ
	YyZb1f7hdpKJMPGXd0lIBqKK708hIQmQ+2nLEKGApRs8ckW78Eq57Daz9BIW7/kevLTW
	zURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Fi58nTwjKitu6A0z5BL7S3blyy4r8Ko8QzYt+Kw1XV8=;
	b=Vel7QOuJkSqZCyYxmekT2lcRkzokNu62f6Mhvk0C23oh+KjK0gnsSz48pbSvCKG8Si
	PnXrehOwisWVzO8p1ywR60E79JDfZIcxKptn/ZSQfolBDNmXvdoJY4m3RHLOipmWKzBx
	AqIWQIlZi2eC1wvOWKn8NG+ZNXX1pyD/i1P3tqn3DyMwKL2j3xwD55ktbhpl3iEm1cLg
	lIUvIjylJ5j5GN4xZ9KFYrTStDEj77Rg6Q9pS4MA6guo783fzfiunR95yXjaYj4KkaC6
	1+08gtzCnlsa/g/xZYkrAeJl6tVXfcYz06J5KE++PuWJWInZuA+264TjAvjQQ6J7YC0o
	xlpw==
X-Gm-Message-State: ALoCoQkOk8RRXSFu0gqisycUc9EDGR0GaqYeguGjgaD88R4BmqXvOoU7wJ2ND/1HdZ4uGp1RwM0RX86d6oDOJpXJfg6V2ohRsw==
X-Received: by 10.98.64.7 with SMTP id n7mr35434750pfa.139.1450192757960;
	Tue, 15 Dec 2015 07:19:17 -0800 (PST)
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com.
	[209.85.192.169]) by smtp.gmail.com with ESMTPSA id
	kh9sm3046495pad.11.2015.12.15.07.19.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 07:19:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f169.google.com with SMTP id u66so6254516pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 07:19:16 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.68.201 with SMTP id m70mr45524737pfi.101.1450192756072;
	Tue, 15 Dec 2015 07:19:16 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 15 Dec 2015 07:19:15 -0800 (PST)
In-Reply-To: <C8645930-1FEB-4ED9-ABAB-45EA9B500B4A@gmail.com>
References: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
	<CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
	<0A579224-B53A-40F8-9C7E-270C6D9D9B4A@gmail.com>
	<CAP9ODKqLsDuyxVWOOC2UJMqGpjep+LGFajQO+N7jyiRa=5ea=Q@mail.gmail.com>
	<C8645930-1FEB-4ED9-ABAB-45EA9B500B4A@gmail.com>
Date: Tue, 15 Dec 2015 13:19:15 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrFN3yi=Q7VbZJUzzMDveKj9AaeLDNH0o2P8zgt1DeU5A@mail.gmail.com>
Message-ID: <CAP9ODKrFN3yi=Q7VbZJUzzMDveKj9AaeLDNH0o2P8zgt1DeU5A@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Dec 2015 15:19:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 11:51 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 15.12.2015 um 13:50 schrieb Otavio Salvador <otavio.salvador@ossystem=
s.com.br>:
>>
>> On Tue, Dec 15, 2015 at 10:40 AM, Jens Rehsack <rehsack@gmail.com> wrote=
:
>>>
>>>> Am 15.12.2015 um 13:31 schrieb Otavio Salvador <otavio.salvador@ossyst=
ems.com.br>:
>>>>
>>>> On Sat, Dec 12, 2015 at 7:36 AM, Jens Rehsack <rehsack@gmail.com> wrot=
e:
>>>>>
>>>>> Fix bitbake warnings from variable renaming like
>>>>>
>>>>>   Variable key FILES_${PN} (${bindir}/* ${sbindir}/* ${libexecdir}/* =
${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} ${=
base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} ${base_prefix}/l=
ib/udev/rules.d ${prefix}/lib/udev/rules.d ${datadir}/${BPN} ${libdir}/${BP=
N}/* ${datadir}/pixmaps ${datadir}/applications ${datadir}/idl ${datadir}/o=
mf ${datadir}/sounds ${libdir}/bonobo/servers) replaces original key FILES_=
openjre-8 (    ${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*     ${JRE_=
HOME}/LICENSE     ${JRE_HOME}/release ).
>>>>>
>>>>> It is caused by using FILES_${PN} and FILES_{JDKPN} or FILES_${JREPN}=
,
>>>>> respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and FILES_${JREP=
N} to
>>>>> openjre-8_%.bb to allow consequently use FILES_${PN}.
>>>>>
>>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>>
>>>> Looking at the proposed change, it seems it would be better to squash
>>>> the JDK and JRE installation to a single recipe and do the proper
>>>> split using the packaging.
>>>>
>>>> Do you think this is reasonable?
>>>
>>> I split openjdk-8/openjre-8 because of weird behavior wrt.
>>>
>>> PREFERRED_PROVIDER_java2-runtime =3D "openjdk-8-jre"
>>>
>>> but I think with all the things I learned during packaging openjdk-8
>>> and nqp/perl6 I can retry.
>>>
>>> This will require lots of tests, so unfortunately it's unlikely
>>> to manage it this year - maybe even not before our planned HP1 update
>>> release.
>>
>> Right; it is not a problem and I think this could be merged as an
>> intermediate solution, in meanwhile.
>
> Would be great.
>
>> However I think consolidating it
>> into a single recipe would give us some benefits as: faster builds,
>> single recipe to manage, removal of .inc file at all.
>
> Dunno how reasonable it is to install openjre and openjdk on on target,
> so I don't see the faster builds. However - for dev or test targets:
> *shrug* - I do my best to add no conflicts for most liberal use :)
>
> Reducing .inc's is your favorite goal, isn't it? :D

When we can consolidate things in a single recipe, most of time, it
makes it easier to improve and hack. So it is something we  should go
after for sure.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

