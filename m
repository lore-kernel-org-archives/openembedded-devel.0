Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pgjv9-0006T0-41
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 21:18:51 +0100
Received: by yxd5 with SMTP id 5so987278yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 12:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=uDeMBogSBOt6CoG1fZkvPla5i8sp3JVL4QKud8PUQw8=;
	b=xUquq4TYFW+E/1Ik6ovLiViW8/R0vm/4kjpW5NB8QjPN0CrM7HGmpKrRWO98ABrjkh
	WnScj/jj9usOzhhEqEGNIH9ewLn6DIvU1UFT4KG6EYIZfKgcDf6hrAQLGRvVM/Px4N2K
	7UfC/Dt3ZCWupOx/F/jl8aqcdBBg6/JsblzX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=U9KBLfcY5oj8j1WDbhrLRWj337iqdhc6G3P0k0YRghnm/el+jaXHAi2GrAhRHMXD2T
	F++Ck8U6nUvq6SBsUDrfj/MiwhWfhO7QYlsm2oCY51PI4O5umo4imsRNxAssJ8wRhKTr
	WOgs240IEf5UiyZbsQuOWYXNgm4h2mluAxXws=
Received: by 10.90.10.21 with SMTP id 21mr2688240agj.112.1295727485481; Sat,
	22 Jan 2011 12:18:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sat, 22 Jan 2011 12:17:45 -0800 (PST)
In-Reply-To: <AANLkTin27ikNKV4v3D+e+cu_=SHv7Vv+0ef-z61irn60@mail.gmail.com>
References: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>
	<AANLkTimSeB5GqQSyMtskAm_3O9h-MWfCJJz+FAFnnkB8@mail.gmail.com>
	<AANLkTin27ikNKV4v3D+e+cu_=SHv7Vv+0ef-z61irn60@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jan 2011 12:17:45 -0800
Message-ID: <AANLkTimOGhiwA+szLoWVzAUP2AUX1YVBcOnMLg3YSWdM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Recipes with fetch failures:
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
X-List-Received-Date: Sat, 22 Jan 2011 20:18:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2011 at 12:07 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Jan 22, 2011 at 17:46, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Jan 22, 2011 at 10:06 AM, Otavio Salvador
>>> =C2=A0 cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=3Dipkg-ut=
ils
>>>
>>
>> yeah hh.org is gone. So you need to rely on mirrors to get the tarballs
>> add
>>
>> SOURCE_MIRROR_URL ?=3D "http://sources.openembedded.org/"
>>
>> to your local.conf and probably you also need to inherit own_mirrors
>
> I think the recipe should be change to use this in this case. I know I
> can use mirrors but the recipe ought to use a fetchable reference IMO.
>

we are still hopeful of getting the cvs repos. But yes it wont hurt if
the SRC_URIs pointed
to source mirrors for now

> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


