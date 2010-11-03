Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDVKO-0000L5-Ot
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 05:52:05 +0100
Received: by gxk26 with SMTP id 26so207940gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 21:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=I6DazDeARWYYC3+NQr8K6ISRT+bSKtJFj2S/cAYSbt8=;
	b=m39YZoGYetw5Ts0AZbLqpEGNGmmprdgk5zI/uS5whNgHX2ut0fM5s5MMklI5CMCKDQ
	0LIzFOG76Ocu6ixtimhFyAqaz003K03abmJmMu/Jk1RXcYt6YOGJjnCeAVSSVcjoPTNj
	5e+oXMqzYkSWSTAZnZxv5DdCGLr3zMzNe59X8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cIHKeivkYmCxKY3Nmj6/kYTRq2rqjqLo2wIDkzaLPQF1tfDFTMxcnBOMHL2/h7GCFL
	GS+1NscjeAsqrXYxXO/FAMzYg5h3psWx/HXrHYV9Dep99FrBQ5JsAm3PolfxhjMsMIR4
	P6Z93bxl7whKMwPx6zNLzjZIWb6T4bBp2+vHs=
Received: by 10.90.57.2 with SMTP id f2mr371659aga.118.1288759874088; Tue, 02
	Nov 2010 21:51:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 21:50:53 -0700 (PDT)
In-Reply-To: <AANLkTi=a3=QB-NGyLi5samZ2epFYGgw3_HKctN32L=vd@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
	<20101101195748.GB12018@gmail.com>
	<AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
	<AANLkTimOLodSjV8+saSi1td==O7TgX1iqzJeQ=NT5mgB@mail.gmail.com>
	<AANLkTi=LRGff3rc0++-+2PAKMWLitWZWOC3TGTUO4kYQ@mail.gmail.com>
	<AANLkTi=a3=QB-NGyLi5samZ2epFYGgw3_HKctN32L=vd@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 21:50:53 -0700
Message-ID: <AANLkTi=iKpceASBeqeGcnu6p7uAOiaymA51o7t7VyAUS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Wed, 03 Nov 2010 04:52:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2010 at 8:10 PM, Zach Frey <zach@znfrey.com> wrote:
> On Tue, Nov 2, 2010 at 10:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> > A question -- is the build supposed to be using the build host's
>> automake,
>> > or is it supposed to be using one from its downloaded toolchain?
>>
>> well automake is used from the contained versions. We use the version
>> from native staging which
>> is the version we build. The automake installed on your host is not
>> used unless you do some stuff
>> with assume provided.
>>
>>
> From
> $OEBASE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backend=
s-2.10.1-r0/temp/run.do_compile.12625
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AUTOV=3D`automake --version |head -n 1 |sed "s/.*
> //;s/\.[0-9]\+$//"`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0automake --version
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo "AUTOV is $AUTOV"
>
> As far as I can tell, this will pick up the host, not the contained versi=
on.
>
> Tried to understand where this is spelled out in the recipe, but not seei=
ng
> it (afraid I'm new to this).
>

Well see where the PATHS are set in the script.


