Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aguirre.nicolas@gmail.com>) id 1SKSIM-0004v6-Qq
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 12:39:31 +0200
Received: by pbcum15 with SMTP id um15so7457304pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=rvR2wDLjG32mFG/swQQ8+I4t2Ti9P8TRlWkZlIjYmFw=;
	b=EP3+55S2Xk4lWni2qnWsI2QeJLzE6sorHGaqJNPUYjqwP8IjhvBn69X0ck4sWLMHRR
	TKw0L+B3xv6GUa3CtwjrTpGWi3sr+xmtAgYgFExdUeg4p+EckvyLz+lt7KDCnPlXxHeT
	gwzK790t9wTYQLGvmhT87f7nzmA5C/c346leQ7wFCbJBm5/ZHgO2g8TnvHAuZy7AVFAD
	bKrN5wpHmGc71Wi1pcvW+Fo1XmAiXWwRIvxuCGOlB4yLJW71unyGwIwaiXTm+V+97V8S
	3edwL30IJ4en3qgP5AcrORAb98R9cM8wz+p4EHNGtS6UbHEtHP+OXcxoXcxE/ciNOkDJ
	ITfQ==
Received: by 10.68.231.233 with SMTP id tj9mr5650057pbc.49.1334745001746; Wed,
	18 Apr 2012 03:30:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.225.232 with HTTP; Wed, 18 Apr 2012 03:29:40 -0700 (PDT)
In-Reply-To: <4F871E0E.7080500@windriver.com>
References: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
	<4F871E0E.7080500@windriver.com>
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Wed, 18 Apr 2012 10:29:40 +0000
Message-ID: <CAHTvVMcj_ADZxYCBvvcJcsTxXxW3uupq8xvWf-p=7xnrc=_n0Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Hard floating point support for armv7a wmmx2 processor in oe-core
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
X-List-Received-Date: Wed, 18 Apr 2012 10:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 12 avril 2012 18:25, Mark Hatle <mark.hatle@windriver.com> a =E9crit :
> On 4/12/12 12:38 PM, Nicolas Aguirre wrote:
>>
>> Hi,
>>
>> I'm building an oe-core minimal image and toolchain for the cubox[1]
>> which has a Marvell Armada 510 SoC, also known as Dove.
>> It's a armv7 Arm processor with wmmx2 instruction set [2].
>>
>> I setup a new machine for the cubox and added :
>> require conf/machine/include/arm/arch-armv7a.inc
>> in my cubox.conf file
>>
>> I also added
>> ARM_FP_MODE =3D "hardfp"
>> TARGET_FPU =3D "hardfp"
>> in my local.conf file.
>
>
> That is not how to enable the mode with the newer tune infrastructure. =
=A0You
> need to simply enable a tune, in your machine configuration, that matches
> the desired output.
>
> The following are the defined VFP (hard float requires VFP) tunes for har=
d
> float:
>
> armv7ahf armv7athf armv7ahf-neon armv7athf-neon
>
> the "t" varients support thumb, but don't have it enabled by default..
>
> the -neon variants also enabled the neon instructions.
>
> I do not know what the "wmmx2" instructions are, if they are different fr=
om
> VFP and Neon, then it sounds like you need a custom tune.
>
> Your machine configure should set DEFAULTTUNE =3D "..." where "..." is th=
e
> tune you want for that given machine. =A0(armv7ahf should be a safe place=
 to
> start.)
>

Hi Mark,

Thanks for your detailed explanation


I'm now able to build a minimal core image with hardfp enabled. The
detail of the OE Build :
TUNE_FEATURES     =3D "armv7a vfp callconvention-hard"
TARGET_FPU        =3D "vfp"

I pushed my layer on github : https://github.com/naguirre/meta-cubox
Nothing interesting for now and binaries have not been tested.

I encountered some problems during the build, due to a bad fetch
operation of mime-support package. I need to fetch it by hand, the
.tar.gz was corrupted and contains an html page.

Another problem i encountered, was during the build of cpufrequtils.
And it seems that this point is related to harfp. cpufreq is linked
against libcpufreq which are not compatible each other. I don't know
if it's a problem in cpufreq recipe, i need to investigate more.

Another problem was during the build of libvpx which seems to be not
compatible with armv7ahf, only with armv7a.

ERROR: Logfile of failure stored in:
/home/nico/e17_src/cubox/setup-scripts/build/tmp-angstrom_2010_x-eglibc/wor=
k/armv7ahf-vfp-angstrom-linux-gnueabi/libvpx-0.9.5-r3.0/temp/log.do_configu=
re.9887
Log data follows:
| ERROR: Function failed: do_configure (see
/home/nico/e17_src/cubox/setup-scripts/build/tmp-angstrom_2010_x-eglibc/wor=
k/armv7ahf-vfp-angstrom-linux-gnueabi/libvpx-0.9.5-r3.0/temp/log.do_configu=
re.9887
for further information)
| Configuring selected codecs
|   enabling vp8_encoder
|   enabling vp8_decoder
| Configuring for target 'armv7-linux-gcc'
|   enabling armv7
|   enabling armv6
|   enabling armv5te
|   enabling fast_unaligned
| Toolchain is unable to link executables
|
| Configuration failed. This could reflect a misconfiguration of your
| toolchains, improper options selected, or another problem. If you
| don't see any useful error messages above, the next step is to look
| at the configure error log file (config.err) to determine what
| configure was trying to do when it died.
NOTE: package libvpx-0.9.5-r3.0: task do_configure: Failed

I now understand why Koen said that hardfp is not compatible with anything =
:)


> Figure out the correct set of commands for gcc to support this processor,
> and I can help you define a custom tune file.
>

I need to dig more about wmmx2 instructions set, to see how to enable it in=
 gcc
I will maybe come back with more questions :)

Thanks for your time,
Nicolas

> The few references I found in a quick google search seem to indicate that
> the core does support thumb, it should use the armv7-a compilation, and
> there is little to no support for the wmmx2 instructions.
>
> --Mark
>
>
>> Any help would be appreciate :)
>>
>> [1] http://www.solid-run.com/products/cubox
>> [2] http://www.marvell.com/application-processors/armada-500/
>>
>> regards,
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Nicolas Aguirre
Mail: aguirre.nicolas@gmail.com
Web: http://enna.geexbox.org
Blog: http://dev.enlightenment.fr/~captainigloo/


