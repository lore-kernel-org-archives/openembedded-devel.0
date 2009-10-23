Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N1GOp-0003rg-M0
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:25:35 +0200
Received: by bwz9 with SMTP id 9so972389bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mrvzSeIl6J3+nYqVdV5cPkNUAsjsSNjUXx/+LZY58hY=;
	b=EntZLhmhJ95ek8gxmp1PzkJfzO+0gsLacgOus5hVaN0/yuS3Eltr3DqpY51jENhCP6
	79trL67ID/XGgTCrBbXsagjndurm1XTKOw6o+3OaqbjDXHs8gZ4MLMrk4K0PGddDNhXb
	HVrxVRFvErVw7X8EZK5Ne8yH8wjI5fUdYHFFU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jZdZex1LvLmskySUmQCuRpW2sJLyF+DC6cGbMBNoV77ojEaxDVp8H6JItwTSeR7x9F
	jmvdwrLRPlY8z4jPvPaCqzQtfRPr2orBoSpbqGFyRYGL45qmF/YamGBKo80ogjMTAyYL
	pRCllN/vzrphhgORhxxVbuOJ9LY1y+hJ4b4+o=
MIME-Version: 1.0
Received: by 10.239.237.193 with SMTP id k1mr883161hbp.173.1256289867541; Fri, 
	23 Oct 2009 02:24:27 -0700 (PDT)
In-Reply-To: <be7a9f3d0910221517g2bc6d91k55e18e9d3c5e6604@mail.gmail.com>
References: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
	<200910222119.40861.marcin@juszkiewicz.com.pl>
	<be7a9f3d0910221517g2bc6d91k55e18e9d3c5e6604@mail.gmail.com>
Date: Fri, 23 Oct 2009 11:24:27 +0200
Message-ID: <c384c5ea0910230224h1fbd309j383adb6341884a1b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] package complete ${datadir} ${libdir} by default
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
X-List-Received-Date: Fri, 23 Oct 2009 09:25:35 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Otavio,

2009/10/23 Otavio Salvador <otavio@ossystems.com.br>:
> On Thu, Oct 22, 2009 at 5:19 PM, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl> wrote:
>> Dnia czwartek, 22 pa=BCdziernika 2009 o 21:08:27 Leon Woestenberg napisa=
=B3(a):
>>> Why does FILES_${PN} have ${PN} after ${datadir} and ${libdir}?
>>>
>>> I would propose to just package ${datadir} and ${libdir} as-is.
>>> Or am I overlooking something?
>>
>> PACKAGES =3D "PN-dbg PN PN-doc PN-dev PN-locale"
>>
>> With your suggestion PN-doc and PN-locale starts to be useless as PN wil=
l get
>> /usr/share/{doc,man,info}/ which are part of PN-doc and /usr/share/local=
e/
>> which is packaged to PN-locale.
>
> Even more; it can "hide" contents inside of the package without
> further noticing.
>
We have always suffered from this and still do in some recipes.

Changing {libdir}/${PN} to {libdir} will not change that.

I think the default assumption, that after -doc -locale, -dbg and
-dev, all files that are installed should end up in the main package.

My proposal is to ignore the recipe name (PN) during the packaging of
{libdir} and {datadir} by default, so that alternative recipes
(i.e. our approach to the USE flags) do not require special handling.

> IMO everything that is not _standard_ ought to be explicited add.
>
Correct. I just proposed to default to the {libdir} and {datadir} that
the package wants to install.

Regards,

--=20
Leon


