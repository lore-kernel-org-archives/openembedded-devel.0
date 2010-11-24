Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PLKJs-0004Bl-AI
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 19:43:52 +0100
Received: by yxd5 with SMTP id 5so35700yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 10:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ZA2pIqF3I9Y/4+U1pLnkENdt0waBv3air71e1VdU+Tw=;
	b=vwQiwHKOvWUlQEaeUZIBqmAoriKBPJNW+MONe4N0wBHLsaMLK43JOD7z5+Os6Cga0c
	eWyvLZ3+svb553BObJh1fycUv/1ooBchSEtZEoaA/DBrJa+O3oLaxXc2uyOra3Ixh8Gn
	j6Ss5qUuPXXEl/a6ROtfibjbdWInmLCUbjLmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=raXMbKRT11leddPv1cjwpn3YjLpnbai7tBKXAduQaSPdYeEtVArBwLMYUQdU0SGMCZ
	p/EhhjCBEdJySD9BhBPhyK6Sisg22PaDLM19p9L5JsGfrQMHjh+9AE1xoePyTIF5SyaV
	wQCeWPqv91u/xyykPvhvWcIfu8NtYe+ZdBCfY=
Received: by 10.90.9.22 with SMTP id 22mr1269023agi.102.1290624156516; Wed, 24
	Nov 2010 10:42:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 24 Nov 2010 10:42:16 -0800 (PST)
In-Reply-To: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
References: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Nov 2010 10:42:16 -0800
Message-ID: <AANLkTims2A-RP8CRn5PPsQ+wyT6L7vzEqmutoF0ug=yj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
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
X-List-Received-Date: Wed, 24 Nov 2010 18:43:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2010 at 9:32 AM, Zach Frey <zach@znfrey.com> wrote:
> Hi,
>
> I'm seeing a new error using git HEAD and trying to build for the omapzoo=
m2:
>
>
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.10.0"
> METADATA_BRANCH =C2=A0 =3D "master"
> METADATA_REVISION =3D "20117ec"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "omapzoom2"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "next"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "hard"
>
> | checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gc=
c
> -E
> | configure: error: in
> `/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglib=
c-2.12-r16.7+svnr11982/build-arm-angstrom-linux-gnueabi':
> | configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fa=
ils
> sanity check
> | See `config.log' for more details.
> | ERROR: Function do_configure failed
>
> Suggestions? =C2=A0More info I can provide?
>

sometimes rebuilding gcc can be a bit tricky and I think thats what
might have happened in your case. So please rebuild the toolchain

bitbake -c clean eglibc eglibc-initial gcc-cross-initial
gcc-cross-intermediate gcc-cross gcc
bitbake <your image>

that should help if the cross compiler was broken by  unstaging.

>
> Thanks,
> Zach Frey
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


