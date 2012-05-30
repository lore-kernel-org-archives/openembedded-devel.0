Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SZotK-0005mO-FC
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 21:49:10 +0200
Received: by yenl13 with SMTP id l13so187364yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 12:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YjSqcbPtuKSvpmwPCa8VMrBD2rwq/KwqosPKeWZ951c=;
	b=TiKCh9UhSq/EAmzZe8uZMONtt3DPK3k/vPAXgbNpUzDBEH2Je8jtijLbELnunX2tFd
	C57RcjGo4dN6SleqMOxFBvDGsJp9zvYzYr+CCLUXyGm8p85BSGFTJzQNBZJA0sHTcnUx
	36s1JqBdvi3TgLc+/eBqNOe719UtTRbLkycgs7toYO1anzlkmruOSALGnMgUtMHfRv0B
	c8dok1rXKYnyLPKCP2enepUjLNHqS3kzLCPMOiAR6iNYeMzbH7sKN4OykZe/svgIOJhj
	xsLFM26NHs+x2TQvhxeRzjKov6hlmVvLcHZNKmwa9qyKPsk6XFxz1p50XgtwdOeaxa5/
	4tjw==
MIME-Version: 1.0
Received: by 10.42.62.195 with SMTP id z3mr10656176ich.9.1338406730820; Wed,
	30 May 2012 12:38:50 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Wed, 30 May 2012 12:38:50 -0700 (PDT)
In-Reply-To: <20120530192452.GA8099@sakrah.homelinux.org>
References: <1338404160-6968-1-git-send-email-elvis.dowson@gmail.com>
	<20120530192452.GA8099@sakrah.homelinux.org>
Date: Wed, 30 May 2012 14:38:50 -0500
Message-ID: <CAAB-1yyujmBXX6ULdGVA3oX0ROUFHa77+3nfmmXyg=kED42mNA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Elvis Dowson <elvis.dowson@gmail.com>
Subject: Re: [meta-xilinx] tune-ppc440.inc: Add support for PowerPC 440 processor for Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Wed, 30 May 2012 19:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Elvis,

the tune file its ok, but it should be better if you rather provide a
fix for the tune-ppc440.inc
that is part of meta-xilinx layer;

Regards
Adrian Alonso

On Wed, May 30, 2012 at 2:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (30/05/12 20:55), Elvis Dowson wrote:
>> This commit adds support for the PowerPC 440 processor for the Xilinx
>> Virtex-5 FXT FPGA.
>>
>
>
> this looks ok to me
>
>
>> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
>> ---
>> =A0meta/conf/machine/include/tune-ppc440.inc | =A0 14 ++++++++++++++
>> =A01 file changed, 14 insertions(+)
>> =A0create mode 100644 meta/conf/machine/include/tune-ppc440.inc
>>
>> diff --git a/meta/conf/machine/include/tune-ppc440.inc b/meta/conf/machi=
ne/include/tune-ppc440.inc
>> new file mode 100644
>> index 0000000..394364d
>> --- /dev/null
>> +++ b/meta/conf/machine/include/tune-ppc440.inc
>> @@ -0,0 +1,14 @@
>> +DEFAULTTUNE ?=3D "ppc440"
>> +
>> +require conf/machine/include/powerpc/arch-powerpc.inc
>> +
>> +TUNEVALID[ppc440] =3D "Enable ppc440 specific processor optimizations"
>> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcp=
u=3D440", "", d)}"
>> +
>> +AVAILTUNES +=3D "ppc440"
>> +TUNE_FEATURES_tune-ppc440 =3D "m32 fpu-soft ppc440"
>> +TUNE_PKGARCH_tune-ppc440 =3D "ppc440"
>> +PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D "${PACKAGE_EXTRA_ARCHS_tune-powerpc=
-nf} ppc440"
>> +
>> +# glibc configure options to get 440 specific library (for sqrt)
>> +GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440"=
, "-with-cpu=3D440", "", d)}"
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


