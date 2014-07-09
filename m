Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A556170410
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 10:21:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s69ALMoi001929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Jul 2014 03:21:22 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 9 Jul 2014 03:21:22 -0700
Message-ID: <53BD17A1.6000205@windriver.com>
Date: Wed, 9 Jul 2014 18:21:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1404886727-44130-1-git-send-email-liezhi.yang@windriver.com>
	<20140709095544.GC2446@jama>
In-Reply-To: <20140709095544.GC2446@jama>
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
X-List-Received-Date: Wed, 09 Jul 2014 10:21:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2014 05:55 PM, Martin Jansa wrote:
> On Tue, Jul 08, 2014 at 11:18:47PM -0700, Robert Yang wrote:
>> The fftw, fftwf and fftwl provide the same files (different contents), we
>> should only build one of them, otherwise there would be warning
>>
>> WARNING: The recipe fftw is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>>     sysroots/qemux86-64/usr/include/fftw3.f03
>>     Matched in manifest-qemux86-64-fftwl.populate_sysroot
>> manifest-qemux86-64-fftwf.populate_sysroot
>>     sysroots/qemux86-64/usr/include/fftw3.h
>>     Matched in manifest-qemux86-64-fftwl.populate_sysroot
>> manifest-qemux86-64-fftwf.populate_sysroot
>>     sysroots/qemux86-64/usr/include/fftw3q.f03
>>     Matched in manifest-qemux86-64-fftwl.populate_sysroot
>> manifest-qemux86-64-fftwf.populate_sysroot
>>     sysroots/qemux86-64/usr/include/fftw3.f
>>     Matched in manifest-qemux86-64-fftwl.populate_sysroot
>> manifest-qemux86-64-fftwf.populate_sysroot
>>     sysroots/qemux86-64/usr/include/fftw3l.f03
>>     Matched in manifest-qemux86-64-fftwl.populate_sysroot
>> manifest-qemux86-64-fftwf.populate_sysroot
>> Please verify which package should provide the above files.
>>
>> and maybe errors (race issue):
>>
>> The recipe imagemagick.do_compiler error:
>>    fourier.c:69:19: fatal error: fftw3.h: No such file or directory
>>     #include <fftw3.h>
>>
>> This is because imagemagick.do_configure depends on fftw.populate_sysroot, but
>> the files installed by fftw.populate_sysroot, maybe removed by fftwl or fftwf
>> when they rebuild.
>>
>> Only build fftw in the world will fix the problem.
>
> But it doesn't fix the problem for people who are really building fftwl
> and fftw. If there is someone with this use-case can he send patch
> moving common parts to separate recipe used by all 3 or just rename/move
> files to have unique name?
>
> Or if they aren't needed at the same time, lets convert fftwl and fftwf
> to PACKAGECONFIG options in fftw.

Yes, I think that PACKAGECONFIG is a good idea, will send patches tomorrow
if no objections.

// Robert

>
> Regards,
>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta-oe/recipes-support/fftw/fftwf_3.3.4.bb |    2 ++
>>   meta-oe/recipes-support/fftw/fftwl_3.3.4.bb |    2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
>> index 59f4a11..8731df7 100644
>> --- a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
>> +++ b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
>> @@ -6,3 +6,5 @@ EXTRA_OECONF += "--enable-single \
>>
>>   SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
>>   SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
>> +
>> +EXCLUDE_FROM_WORLD = "1"
>> diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
>> index 8f37346..a56bbc8 100644
>> --- a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
>> +++ b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
>> @@ -4,3 +4,5 @@ EXTRA_OECONF += "--enable-long-double"
>>
>>   SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
>>   SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
>> +
>> +EXCLUDE_FROM_WORLD = "1"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

