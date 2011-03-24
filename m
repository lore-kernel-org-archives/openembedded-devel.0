Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q2i3o-0003je-3P
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:46:36 +0100
Received: by qwh5 with SMTP id 5so6490973qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=CYzftvNVGsSNA1Ytvu8QLDUzoX6kfBTYJ10KUkKaez8=;
	b=Mv5Gcej7EkFf60WVfIgxECIVMOKmj4xjqyG8cF8oMIF6hr1vDRr3zAc0XxIpe4SaFs
	nRbIMAgk1+yJ39GNWYHvQvLSsJEzkxFzZqW6EnB25HRjv8gxcwjYdObT2dyzZ2h9iHxP
	sMClHPcSK5hmZfuWkaBAVf/nDtIyh0gsndVjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=XVip/dyFJ3gAjAlDYzUlM4aVsV74YZzPow0eKVkDfV7GqTUkv4Uhri0E2OCHe33rRv
	EST9c2SbyUUe1iCUdkYlHu/QJewLqZ7aJVW23oH53zAZZ5T6pySvxJJ/wVkIUDAorlGH
	JeLMr6u1903Y1ghB/SpmybyM2vMMGs49FpTJ4=
MIME-Version: 1.0
Received: by 10.224.41.11 with SMTP id m11mr6899313qae.155.1300963016424; Thu,
	24 Mar 2011 03:36:56 -0700 (PDT)
Received: by 10.224.134.5 with HTTP; Thu, 24 Mar 2011 03:36:56 -0700 (PDT)
In-Reply-To: <1300958100.3795.13.camel@mattotaupa>
References: <AANLkTikXA3RfJ2jfnf+ct=eCVmOS4CC1xPg1Q94JDeGT@mail.gmail.com>
	<1300958100.3795.13.camel@mattotaupa>
Date: Thu, 24 Mar 2011 16:06:56 +0530
Message-ID: <AANLkTinKGR2iQmx7WvndGc3q6AHOZE=dm=fkwLdWmwb0@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 1/2] TI IPC: Fixes for license, dependencies and installer unpack
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
X-List-Received-Date: Thu, 24 Mar 2011 10:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2011 at 2:45 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Siddharth,
>
>
> Am Donnerstag, den 24.03.2011, 14:22 +0530 schrieb Siddharth Heroor:
<snip>

>>
>> +DEPENDS =3D "ti-sysbios ti-cgt6x ti-xdctools"
>> +
>
> Did it work before?
>
>> =A0BINFILE=3D"ipc_setuplinux_${PV}.bin"
>> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
>> +TI_BIN_UNPK_CMDS=3D"Y: q:workdir:Y"
>
> Will this work with the older versions, since it is an include file.

I found only the include file present and so, the second patch added
the version of a package that's available.

>
> Please resend as =BBPATCH v2=AB. Your other patch was also corrupted.
>
> Two additional comments.
>
> 1. I would prefer one commit for each change.

Sure. I can send separate patches.

> 2. Is it true that `ti-ipc` as committed in 32336b9a [1] was only usable
> for the TI folks and just now it is released to and usable for the
> public? This should be explained in the commit message and that the
> first public version will be committed in the next commit.

Yes, I will add more information in the commit and resend patches.

>
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php/Styleguide
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D32336=
b9a0e785f2f13d8cc36aefcaa2be27141da
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

--=20
Sid


