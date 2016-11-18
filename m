Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD7171AA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:48:51 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2B9AwBKzS5Y/5tjdVtdHAEBBAEBCgEBgzcBAQEBAR9YLFSNP5cQkCCCOIIOIBmBTiSCR4M2AoIaPxQBAgEBAQEBAQFiKIRoAQEBAQIBIw8BRhALGAICJgICVwYBDAYCAQGIYAwBCat7gimLVgEBAQEBBQEBAQEjgQmFM4F9gl2HFTiCXQWaSIZAijKCP41oSZEaHjeFBIFGPTQBAYhIAQEB
X-IPAS-Result: A2B9AwBKzS5Y/5tjdVtdHAEBBAEBCgEBgzcBAQEBAR9YLFSNP5cQkCCCOIIOIBmBTiSCR4M2AoIaPxQBAgEBAQEBAQFiKIRoAQEBAQIBIw8BRhALGAICJgICVwYBDAYCAQGIYAwBCat7gimLVgEBAQEBBQEBAQEjgQmFM4F9gl2HFTiCXQWaSIZAijKCP41oSZEaHjeFBIFGPTQBAYhIAQEB
X-IronPort-AV: E=Sophos;i="5.31,656,1473112800"; d="scan'208";a="80045591"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 18 Nov 2016 10:48:52 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c7fmu-0004ed-9I; Fri, 18 Nov 2016 10:48:52 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1c7fmu-0002Ub-6q; Fri, 18 Nov 2016 10:48:52 +0100
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
	<d960264f-ef18-8875-cdfb-29a1b604ec87@gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <97dbec03-3c2a-0b32-db48-ea4e2bd9c093@igalia.com>
Date: Fri, 18 Nov 2016 10:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d960264f-ef18-8875-cdfb-29a1b604ec87@gmail.com>
Cc: eric@eukrea.com, otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH 1/3] Set CHROMIUM_ENABLE_WAYLAND flag in chromium-wayland recipe
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
X-List-Received-Date: Fri, 18 Nov 2016 09:48:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 17/11/16 19:09, Khem Raj wrote:
> 
> 
> On 11/17/16 9:34 AM, Jacobo Aragunde Pérez wrote:
>> It makes no sense to trigger a build of chromium-wayland and not
>> enable CHROMIUM_ENABLE_WAYLAND, so we are doing it directly in the
>> recipe now.
>>
>> We are allowed to remove some conditionals, now we know the value of
>> the flag beforehand.
>>
>> Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
>> ---
>>  recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
>> index bbba147..f66e77c 100644
>> --- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
>> +++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
>> @@ -1,3 +1,5 @@
>> +CHROMIUM_ENABLE_WAYLAND = "1"
>> +
>>  include chromium-browser.inc
>>  
>>  DEPENDS += "wayland libxkbcommon"
>> @@ -21,15 +23,12 @@ SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f6
>>  OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
>>  OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
>>  
>> -SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch', '', d)}"
>> +SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
>>  
>>  # Component build is unsupported in ozone-wayland for Chromium 48
>>  python() {
>> -    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
>> -        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
>> -            bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
>> -    else:
>> -        raise bb.parse.SkipPackage("CHROMIUM_ENABLE_WAYLAND isn't enabled")
>> +    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
>> +        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
>>  }
>>  
> 
> 
> you still need to skip parsing this recipe if user has not enabled wayland
> 

Will do, thanks for the tip.

> 
>>  CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
>>
> 

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

