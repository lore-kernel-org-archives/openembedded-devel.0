Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38189744DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 01:34:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G1YCnd001021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Jul 2018 18:34:12 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 15 Jul 2018 18:33:54 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1531497317-26576-1-git-send-email-hongxu.jia@windriver.com>
	<f831e0e9-60e6-7a54-d051-c21604c0bb6a@gmail.com>
	<04bb8026-4d28-2a40-7dd0-4b8ff34e9222@windriver.com>
	<CAMKF1somytP21aUEymwYZJjXLruaS8RzZ-_tjmQ_Lp7Tn3G_OA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d86a021e-60e6-a679-e456-fcebcd5c73ba@windriver.com>
Date: Mon, 16 Jul 2018 09:33:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1somytP21aUEymwYZJjXLruaS8RzZ-_tjmQ_Lp7Tn3G_OA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mozjs: 17.0.0 -> 52.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 01:34:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年07月16日 02:50, Khem Raj wrote:
> On Sun, Jul 15, 2018 at 6:41 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 2018年07月14日 01:31, Khem Raj wrote:
>>
>> fails for configure
>> | checking for the Android toolchain directory... not found
>> | Traceback (most recent call last):
>> |   File
>> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/../../configure.py",
>> line 115, in <module>
>> |     sys.exit(main(sys.argv))
>> |   File
>> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/../../configure.py",
>> line 34, in main
>> |     sandbox.run(os.path.join(os.path.dirname(__file__), 'moz.configure'))
>> |   File
>> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/python/mozbuild/mozbuild/configure/__init__.py",
>> line 359, in run
>> |     raise InvalidOptionError('Unknown option: %s' % without_value)
>> | mozbuild.configure.options.InvalidOptionError: Unknown option:
>> --disable-static
>>
>> Hi Khem,
>>
>> The `--disable-static' option has already been explicitly removed by me
>>
>> in mozjs 52.8.1, I could not reproduce the failure in my build, would you
>>
>> please paste the reproduce steps, or result of `bitbake -e mozjs' to trace
>>
>> where the option come from
>>
> If you add
>
> require conf/distro/include/no-static-libs.inc
>
> in your local.conf you will see it. Basically you need to set
>
> DISABLE_STATIC = "" in the recipe and that should take care of it.

Thanks for pointing it out, I will set it in V2

> Second look at recipe, I see that it has
>
> ARM_INSTRUCTION_SET = "arm"

Build on qemuarm, without it (using thumb1 specific) still successfully,
I will remove it in V2.

//Hongxu

> the failure you see is thumb1 specific, so lets make this thumb1
> specific as well
> e.g.
>
> ARM_INSTRUCTION_SET_armv5 = "arm"
> ARM_INSTRUCTION_SET_armv4 = "arm"
>
>
>> //Hongxu



