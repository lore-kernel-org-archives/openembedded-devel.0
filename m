Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PC6aI-00069Q-Mx
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 10:15:01 +0200
Received: by iwn42 with SMTP id 42so4097392iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nY21iEzvnm4vkThoZzGh/EqSlPqC5lPtEPWjIfGMJPw=;
	b=tEcJro/1J5xrrkbu3pYxsZeMk+9quAx7UrP0cje2b7H5Hq9Hb1ErbY0meH+PIV+0zt
	ZYdsa7PjmlaVbt7vQQ0qncCV5CELcPfV+jyEBUpxFSakD0QCmvw+lAyvZo27UDiIdhM6
	bQ9BxtKfKuykdjbYgtoOamYnowIVsggKTkzeY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CDr1maUWrB1QnW7QYIZCMQIbfbLLCPCTJhzek5DCTGFz2nnuAJ20md90AcCh0IMgEf
	CAAqhSAtIxNL1os46OQakSb3e+8rC3+gEP6kd4vY1hVYe/Isw0vyRJBWA4W15yPPAPgh
	kNXf0uGMuIR3HOaimOmelD4mfVjlee+T8k24Y=
MIME-Version: 1.0
Received: by 10.42.155.67 with SMTP id t3mr2950649icw.438.1288426436434; Sat,
	30 Oct 2010 01:13:56 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Sat, 30 Oct 2010 01:13:56 -0700 (PDT)
In-Reply-To: <20101030080138.GB3206@jama>
References: <20101029191718.GA27520@gmail.com>
	<20101030080138.GB3206@jama>
Date: Sat, 30 Oct 2010 10:13:56 +0200
Message-ID: <AANLkTinzwh5XOaNn+t057Z1248M6+tZwr_XsBR5EvyQb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Sat, 30 Oct 2010 08:15:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/30 Martin Jansa <martin.jansa@gmail.com>:
> On Fri, Oct 29, 2010 at 12:17:18PM -0700, Khem Raj wrote:
>> Hi
>>
>> There are so many versions of toolchain components gcc/binutils/glibc th=
at
>> we have in metadata. I would like to reduce the number and keep supporti=
ng
>> the ones we really use. Right now we have recipes for
>>
>> binutils =3D 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91=
.0.6,
>> 2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.=
18,
>> 2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
>> 2.20.1, cvs
>>
>> gcc =3D 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4=
.1.2,
>> 4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
>> 4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3
>>
>> glibc =3D 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.=
1,
>> cvs
>>
>> uclibc =3D 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31,=
 git
>>
>>
>> eglibc =3D 2.9, 2.10, 2.11, 2.12, svn
>>
>> They all use common files. So whenever there is a bugfix needed its a ve=
ry
>> hard job to first create a common fix that works across all versions
>> secondly verify if it works and I am sure 80% of recipe versions mention=
ed
>> here dont even build
>>
>> So I am going to propose to remove most of them which dont build and
>> request the distro and machine maintainers to please update the list of
>> toolchain components to keep.
>>
>> Please voice which versions should we really really keep. This should be=
 a
>> set which is buildable and functional.
>
> For me sane-toolchain versions + newer are enough. More users of same
> versions will provide better testing and in the end better toolchain for
> all.
>
> Regards,
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
>

Seems a good plan to me to prune some. Wrt the list:

A nios2 backend *only* exists for gcc 4.1.2. It also needs
binutils_2.17.50.0.12.bb (there is also binutils 2.20.1, but that one
is not fully working yet (and has DP =3D -1)

For glibc and nios2 I see
glibc/glibc_2.10.1.bb
glibc/glibc_2.5.bb
Not 100% which one is being used. Will peek at it next week.

Frans


