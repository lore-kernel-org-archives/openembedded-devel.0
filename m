Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1834B79C85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 08:07:38 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9V87cw8002580
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 31 Oct 2018 09:07:38 +0100
Received: from [139.22.47.124] ([139.22.47.124])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9V87c31018043;
	Wed, 31 Oct 2018 09:07:38 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20181030133511.2954-1-pascal.bach@siemens.com>
	<20181030133511.2954-2-pascal.bach@siemens.com>
	<CAMKF1sq1BgDRg+8oB2d=sUWtCo2x-4FMGyMTS-r4ZPAiD1TG0Q@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <d534704b-616c-a328-5d21-a66ee138ebc0@siemens.com>
Date: Wed, 31 Oct 2018 09:07:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq1BgDRg+8oB2d=sUWtCo2x-4FMGyMTS-r4ZPAiD1TG0Q@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] civetweb: disable tests
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
X-List-Received-Date: Wed, 31 Oct 2018 08:07:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 30.10.2018 22:04, Khem Raj wrote:
> On Tue, Oct 30, 2018 at 7:35 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>> Tests try to download third party code and bypass the bitbake fetcher to
>> do that. This will not work in environments with no internet access.
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  meta-networking/recipes-connectivity/civetweb/civetweb_git.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
>> index 004cf960a..d681f7f30 100644
>> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
>> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
>> @@ -23,6 +23,7 @@ EXTRA_OECMAKE = " \
>>      -DCIVETWEB_ENABLE_DUKTAPE=OFF \
>>      -DCIVETWEB_ENABLE_LUA=OFF \
>>      -DCIVETWEB_ENABLE_ASAN=OFF \
>> +    -DCIVETWEB_BUILD_TESTING=OFF \
>>  "
> Probably, it will be good to turn this into a packageconfig, I am fine
> to disable it by default
> but it might be useful to have it enabled with say images with ptest feature on.
I agree it might be useful, but it needs some change as I don't think we want to have a recipe that fetches code from somewhere without bitbake knowing about it.

Once the main CMake patches land I will try to look into how the whole ExternalProject [1] stuff works in CMake and how it could be better integrated into OE.
So for now I suggest to just deactivate it and then later re add it once I figured out a way to properly handle ExternalProject.

[1] https://cmake.org/cmake/help/latest/module/ExternalProject.html
>>  # Building with ninja fails on missing third_party/lib/libcheck.a (which
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


