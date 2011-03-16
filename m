Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pzv2N-0007k7-5r
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 19:01:36 +0100
Received: by pvc30 with SMTP id 30so293438pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Q+Sm+CS2JmMtQ+Ff/YAOUunc6q0nRJ7EHqj2dQ3pOlU=;
	b=hVCIVJew1zWLF5n++0ujSSO4149bAPYR5y6Uiu7U3tJy5Ltea9TiLkKezJEvvpcvPc
	8x/NRIIlRgCGmeexFqcjjpb/3NuvTVlYcFUG08TaH0diaAbgEQEuJPVV4TUzpRHhCWNG
	1B/Gd3v0+ewpWwgOihkbNH7+CPi0GRlGRjQZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=EbMdy1ToqSG5+QxYakxm8gUGpxEWiQPRrxu7OATpTTGBeJUxxwau9MV2lNexzqaTF6
	a8d3UmIXM8wZCnP5sykCSwJ5h0R9bHZtVjL2U1WsBwFHFT39efgawkDCU7LzfeKIDoP6
	Oia/S33nUcOenfdoYascLCPVn748QFreF/f1g=
Received: by 10.143.24.39 with SMTP id b39mr155862wfj.341.1300298390636;
	Wed, 16 Mar 2011 10:59:50 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm1434544wfl.2.2011.03.16.10.59.47
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 10:59:48 -0700 (PDT)
Message-ID: <4D80FA85.7030903@gmail.com>
Date: Wed, 16 Mar 2011 10:59:33 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300264546.3840.9.camel@mattotaupa>	<4D80791E.2040803@gmail.com>
	<1300265560.3840.10.camel@mattotaupa>	<1300269370.2132.13010.camel@phil-desktop>	<1300282755.3840.69.camel@mattotaupa>	<1300284412.2132.13266.camel@phil-desktop>
	<1300287990.3840.85.camel@mattotaupa>
In-Reply-To: <1300287990.3840.85.camel@mattotaupa>
Subject: Re: minimal-uclibc: gnutls-2.10.4-r11.0: task compile fails with `make[4]: *** [coding.lo] Error 1`
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
X-List-Received-Date: Wed, 16 Mar 2011 18:01:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 8:06 AM, Paul Menzel wrote:
> Am Mittwoch, den 16.03.2011, 14:06 +0000 schrieb Phil Blundell:
>> On Wed, 2011-03-16 at 14:39 +0100, Paul Menzel wrote:
>>>          arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o
>>>          coding.c: In function 'asn1_length_der':
>>>          coding.c:101:1: internal compiler error: in dwarf2out_frame_debug_expr, at dwarf2out.c:2221
>>>          Please submit a full bug report,
>>>          with preprocessed source if appropriate.
>>>          See<http://gcc.gnu.org/bugs.html>  for instructions.
>>>          {standard input}: Assembler messages:
>>
>> > From the looks of the error, you could probably work around the crash by
>> compiling without -g.
>
> Thanks, that worked.
>
>> Obviously you'd lose debuggability but that might or might not be a
>> problem for your particular use case.
>
> Well, I am just build testing.
>
>>> I am wondering if the latest GCC 4.5 changes are causing this, but as
>>> always this is just an uneducated guess.
>>
>> Could be.  Or it's possible that the bug has been latent for a long time
>> and has just been tickled by a recent change to CFLAGS.  I think the
>> inclusion of -g in the default opts is a relatively recent innovation.
>
> I think it worked before last Friday, i. e., before the GCC 4.5 updates.

Yes and the fix was to address exact same problem but reported in 
another recipe. So it fixed things but partially. Let me try to poke 
around a bit

>
>> You could bisect the recent changes if you want but, unless you want to
>> debug this for yourself, the best way to proceed is probably to follow
>> the directions in the error message and submit a bug report to upstream
>> GCC.
>
> I will see, if or when I will get to that and report back.
>
>
> Thanks,
>
> Paul
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



