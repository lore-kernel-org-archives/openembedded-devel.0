Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 129A070252
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:18:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1IlTm017984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:18:47 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Jul 2014 18:18:46 -0700
Message-ID: <53BF3B75.6020607@windriver.com>
Date: Fri, 11 Jul 2014 09:18:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1404886727-44130-1-git-send-email-liezhi.yang@windriver.com>	<20140709095544.GC2446@jama>	<53BD17A1.6000205@windriver.com>
	<lplnjv$9pf$1@ger.gmane.org>
In-Reply-To: <lplnjv$9pf$1@ger.gmane.org>
Subject: Re: [meta-oe] [PATCH] fftwf and fftwl: exclude them from world
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 01:18:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/10/2014 05:49 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Robert Yang schreef op 09-07-14 12:21:
>>
>>
>> On 07/09/2014 05:55 PM, Martin Jansa wrote:
>>> On Tue, Jul 08, 2014 at 11:18:47PM -0700, Robert Yang wrote:
>>>> The fftw, fftwf and fftwl provide the same files (different
>>>> contents), we should only build one of them, otherwise there would be
>>>> warning
>>>>
>>>> WARNING: The recipe fftw is trying to install files into a shared
>>>> area when those files already exist. Those files and their manifest
>>>> location are: sysroots/qemux86-64/usr/include/fftw3.f03 Matched in
>>>> manifest-qemux86-64-fftwl.populate_sysroot
>>>> manifest-qemux86-64-fftwf.populate_sysroot
>>>> sysroots/qemux86-64/usr/include/fftw3.h Matched in
>>>> manifest-qemux86-64-fftwl.populate_sysroot
>>>> manifest-qemux86-64-fftwf.populate_sysroot
>>>> sysroots/qemux86-64/usr/include/fftw3q.f03 Matched in
>>>> manifest-qemux86-64-fftwl.populate_sysroot
>>>> manifest-qemux86-64-fftwf.populate_sysroot
>>>> sysroots/qemux86-64/usr/include/fftw3.f Matched in
>>>> manifest-qemux86-64-fftwl.populate_sysroot
>>>> manifest-qemux86-64-fftwf.populate_sysroot
>>>> sysroots/qemux86-64/usr/include/fftw3l.f03 Matched in
>>>> manifest-qemux86-64-fftwl.populate_sysroot
>>>> manifest-qemux86-64-fftwf.populate_sysroot Please verify which
>>>> package should provide the above files.
>>>>
>>>> and maybe errors (race issue):
>>>>
>>>> The recipe imagemagick.do_compiler error: fourier.c:69:19: fatal
>>>> error: fftw3.h: No such file or directory #include <fftw3.h>
>>>>
>>>> This is because imagemagick.do_configure depends on
>>>> fftw.populate_sysroot, but the files installed by
>>>> fftw.populate_sysroot, maybe removed by fftwl or fftwf when they
>>>> rebuild.
>>>>
>>>> Only build fftw in the world will fix the problem.
>>>
>>> But it doesn't fix the problem for people who are really building
>>> fftwl and fftw. If there is someone with this use-case can he send
>>> patch moving common parts to separate recipe used by all 3 or just
>>> rename/move files to have unique name?
>>>
>>> Or if they aren't needed at the same time, lets convert fftwl and
>>> fftwf to PACKAGECONFIG options in fftw.
>>
>> Yes, I think that PACKAGECONFIG is a good idea, will send patches
>> tomorrow if no objections.
>
> The original idea of the different packages was that you could have all the
> libraries in the binary feeds since they are needed. With packageconfig that
> becomes virtually impossible.
> I don't have a suggestion to improve the current situation, though :(

The race issue is painful since we don't know when it would happen,
I think that exclude two of them from world can reduce the race issue
for most of the users, for the user who build or install 3 of them
for the same image, we don't know how to fix it, but we already have
the warning for that.

// Robert

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTvmG+MkyGM64RGpERAu1zAJsGXdlezcHjV4JFjhTj9zeSaJ271ACdERQE
> Xye89UlN8wZ3HEmV0fNGYMQ=
> =iZI9
> -----END PGP SIGNATURE-----
>

