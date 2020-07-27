Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.59358.1595866629670116479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=h4mTR0TW;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id j22so3421011lfm.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vyo3ejdeiKuEMNEq5FECv+rrwWgqTap4q5k3dq9jAUo=;
        b=h4mTR0TWXTUr4oul7jP9AyNvQ2WKiOdx6kcu8kl+ogmM74lsc7BtoAyk+tSK7uEzpD
         p0ULVSx78Xkiv7DopugsdPDzagjj7mDjiPXAhVA/YXQYTYJE6bd3IxLCA1+D8tCKzTXo
         c1RJ371uQjLAgz8EdVOtTbdE4e2jiV4K3lxIUcBIoCJy1a7zPgf9AxMufKuT4ZbEY1Y4
         F9pb+QMXCUMfe5QjPZuW/CxFBgo+75Z3CrxSbKDmgAoMlq3vNZNf0MS+tcP3fIZDGqqK
         IyMuQYTNzFo4O0ZEPSqnGN+6FFDbypuOAzVkrAtSfwBBKo7FtBGWmf1dVtvHbnatPRS4
         JUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vyo3ejdeiKuEMNEq5FECv+rrwWgqTap4q5k3dq9jAUo=;
        b=JMfnHI7z7pc51VZtS7E6FXPhx44G9/nTSsg2596J78g0bMrKPMQbNSJKm4if6eRCr5
         QfvhRXFRGXaZ58jAq7XR+Wzlej4Fwfe8+1BIDXOlTyeaEFk263FFI70p4PKMvA7s4q4Z
         QxFXQUnVzzuNbfbubRvRHBXcrjHGdupcgseGoYg2Thh4X7LwmwqCqRuM9raaJYsFJVjx
         mhIeQCOviAWMbx/QDweX2w+m/FGxqGZGenb11NElRfO2dwi1yatn0GdUm4lGNxRLRzfM
         ShtEVdw8pXxMx4g07hFBrE9Z/wGv7SpkYWzV512WofkjRsDUGFL8JfWAQotoF9ABSBas
         SP7Q==
X-Gm-Message-State: AOAM530XSpadfcNrQr/+XwOfeyxEPDyd4Nduc/GkWOItHt2ZJKZsrx9X
	Bgv0jaYEd8ZBaGRqp7YCnHgb5Q==
X-Google-Smtp-Source: ABdhPJyXvqWht1wNX14tDreAQHutxEaIjyy7DB9UytcTkD8CbWTPo9UYz4nqcGYQFieXkIyREmZ7Ng==
X-Received: by 2002:a19:c752:: with SMTP id x79mr11705230lff.197.1595866627760;
        Mon, 27 Jul 2020 09:17:07 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id 20sm2122808ljj.51.2020.07.27.09.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 09:17:06 -0700 (PDT)
Subject: Re: [oe] [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com,
 openembedded-devel@lists.openembedded.org,
 libcamera-devel@lists.libcamera.org, raj.khem@gmail.com,
 madhavan.krishnan@linaro.org
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com>
 <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
 <20200727111107.GD5925@pendragon.ideasonboard.com>
 <886753d5-5f11-c240-272f-5a25c096823b@linaro.org>
 <20200727160310.GE17521@pendragon.ideasonboard.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <2a89b48b-b4f7-1bf7-1a32-27d22360ee2d@linaro.org>
Date: Mon, 27 Jul 2020 19:17:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727160310.GE17521@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 27.07.2020 19:03, Laurent Pinchart wrote:
> Hi Andrey,
> 
> On Mon, Jul 27, 2020 at 06:46:47PM +0300, Andrey Konovalov wrote:
>> On 27.07.2020 14:11, Laurent Pinchart wrote:
>>> On Mon, Jul 27, 2020 at 12:58:23PM +0300, Andrey Konovalov wrote:
>>>> On 27.07.2020 12:42, Kieran Bingham wrote:
>>>>> On 27/07/2020 10:21, Andrey Konovalov wrote:
>>>>>> libcamera checks if RPATH or RUNPATH dynamic tag is present in
>>>>>> libcamera.so. If it does, it assumes that libcamera binaries are
>>>>>> run directly from the build directory without installing them, and
>>>>>> tries to use resorces like IPA modules from the build directory.
>>>>>> Mainline meson strips RPATH/RUNPATH out at install time (for
>>>>>> meson versions up to 0.54; the things are somewhat changed in 0.55).
>>>>>> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
>>>>>> That's why we need to remove this tag manually in do_install_append().
>>>>>
>>>>> Uh oh, what's changed... (I'll have to go take a look).
>>>>>
>>>>>     -
>>>>> https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-now-more-careful
>>>>>
>>>>> If we're reliant upon meson behaviour which is no longer consistent,
>>>>> then we are going to have to do something else in libcamera.
>>>>
>>>> I haven't tried meson 0.55 yet, but my impression was that 0.55 should work
>>>> just as before for "usual" (as per libcamera's README) libcamera build. And
>>>> starting from 0.55 the patch in openembedded-core to disable RPATH/RUNPATH removal
>>>> *might* be dropped - if all the packages would be able to set RUNPATH to
>>>> what they need, and meson would detect that OK in all those cases.
>>>
>>> I think that if the problem is caused by a meson patch in openembedded,
>>> then it would make sense to fix it there. We can decide to address the
>>> issue in libcamera itself if it's found to affect other distributions
>>> too, or if meson's behaviour changes in an incompatible way.
>>
>> It looks like it is not openembedded only issue:
>>
>> -------- Forwarded Message --------
>> Subject: [libcamera-devel] [PATCH v4 0/2] package/libcamera: bump version to 96fab38
>> Date: Tue, 16 Jun 2020 20:59:49 +0200
>> From: Peter Seiderer <ps.report@gmx.net>
>> To: buildroot@busybox.net
>> CC: libcamera-devel@lists.libcamera.org, Yann E . MORIN <yann.morin.1998@free.fr>
>>
>> <snip>
>>
>> With the following patch libcamera is forced to believe it is running
>> in a installed environment:
>>
>> diff --git a/src/libcamera/utils.cpp b/src/libcamera/utils.cpp
>> index d55338f..4ff9dac 100644
>> --- a/src/libcamera/utils.cpp
>> +++ b/src/libcamera/utils.cpp
>> @@ -346,15 +346,18 @@ details::StringSplitter split(const std::string &str, const std::string &delim)
>>     */
>>    bool isLibcameraInstalled()
>>    {
>> +#if 0
>>    	/*
>>    	 * DT_RUNPATH (DT_RPATH when the linker uses old dtags) is removed on
>>    	 * install.
>>    	 */
>>    	for (const ElfW(Dyn) *dyn = _DYNAMIC; dyn->d_tag != DT_NULL; ++dyn) {
>> -		if (dyn->d_tag == DT_RUNPATH || dyn->d_tag == DT_RPATH)
>> +		if (dyn->d_tag == DT_RUNPATH || dyn->d_tag == DT_RPATH) {
>> +			printf("XXXXX - dyn->d_un.d_ptr: %s\n", (char*)dyn->d_un.d_ptr);
>>    			return false;
>> +		}
>>    	}
>> -
>> +#endif
>>    	return true;
>>    }
>>
>> Maybe this is because of the buildroot local meson patch ([1]), leading
>> to an empty (but not absent) RPATH?
> 
> buildroot preserves empty RPATH when installing. Maybe we could adapt
> isLibcameraInstalled() to return true only if RPATH is found *and* not
> empty ?
> 
> For openembedded, why is RPATH stripping skipped ?

Not sure if I can give a proper explanation, so I would better refer you to:

https://patches.openembedded.org/patch/156584/
https://github.com/mesonbuild/meson/issues/2567 (rpurdie's comments especially)

Maybe the fix done in meson 0.55 would let distributions to re-enable RPATH stripping:
   https://mesonbuild.com/Release-notes-for-0-55-0.html#added-ability-to-specify-targets-in-meson-compile
   https://github.com/mesonbuild/meson/pull/7103
   https://github.com/mesonbuild/meson/pull/7472
- but I don't know if/when this could happen. For me it looks like a lot of re-testing
at least (distros have a whole lot of packages which could be affected).

>> <snip>
>>
>> [0:02:18.125804232] [252] DEBUG IPAManager ipa_manager.cpp:316 IPA module /usr/lib/libcamera/ipa_rpi.so signature is not valid
>>
>> <snip>
>>
>> This can be avoided with the following patch/hack (disable signature check):
>>
>> diff --git a/src/libcamera/ipa_manager.cpp b/src/libcamera/ipa_manager.cpp
>> index 505cf61..3d64898 100644
>> --- a/src/libcamera/ipa_manager.cpp
>> +++ b/src/libcamera/ipa_manager.cpp
>> @@ -301,6 +301,9 @@ std::unique_ptr<IPAProxy> IPAManager::createIPA(PipelineHandler *pipe,
>>
>>    bool IPAManager::isSignatureValid(IPAModule *ipa) const
>>    {
>> +#if 1
>> +	return true;
>> +#else
>>    #if HAVE_IPA_PUBKEY
>>    	File file{ ipa->path() };
>>    	if (!file.open(File::ReadOnly))
>> @@ -320,6 +323,7 @@ bool IPAManager::isSignatureValid(IPAModule *ipa) const
>>    #else
>>    	return false;
>>    #endif
>> +#endif
>>    }
>>
>>    } /* namespace libcamera */
>>
>>
>> Maybe related to the buildroot finalize and/or sanitizing RPATH in target tree
>> step (and/or strip after install with BR2_ENABLE_DEBUG=y/BR2_STRIP_strip=y
>> enabled)?
> 
> For this, let's first see how module re-signing works with
> openemebedded, possibly improving the resigning script. If it's
> successful, I think we can then use the same methods for buildroot and
> other distributions. A packaging document to explain all this would be
> useful.

Sounds good.

Thanks,
Andrey

>> -------- End of Forwarded Message --------
>>
>>>>> /me sighs ...
>>>>>
>>>>>> IPA module is signed (with openssl dgst) after it is built. But
>>>>>> during packaging the OE build system 1) splits out debugging info,
>>>>>> and 2) strips the binaries. So the IPA module *.so file installed
>>>>>> isn't the one which the signature was calculated against. Then
>>>>>> the signature check fails, and libcamera tries to run the IPA
>>>>>> module isolated (in a sandbox), which doesn't work if the IPA
>>>>>> module wasn't designed to run isolated. The easiest way to fix that
>>>>>> is to disable splitting out debug information and stripping the binaries
>>>>>> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
>>>>>> INHIBIT_PACKAGE_STRIP.
>>>>>
>>>>> This sounds like an effective solution for openembedded, but it needs to
>>>>> be fixed in libcamera all the same.
>>>>>
>>>>> I'll try to follow up with the meson guys to see what we can do,.
>>>
>>> We re-sign the IPA modules at install time for this very specific
>>> reason. If openembedded modifies the binaries after installing them,
>>> should it re-run the signing script ?
>>>
>>>>>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>>>> ---
>>>>>>     .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
>>>>>>     1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>>>>> index 00a5c480d..573366f08 100644
>>>>>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>>>>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>>>>> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
>>>>>>     
>>>>>>     S = "${WORKDIR}/git"
>>>>>>     
>>>>>> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
>>>>>> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
>>>>>>     DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
>>>>>>     
>>>>>>     RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
>>>>>>     
>>>>>>     inherit meson pkgconfig python3native
>>>>>>     
>>>>>> +do_install_append() {
>>>>>> +        chrpath -d ${D}${libdir}/libcamera.so
>>>>>
>>>>> Aha, I didn't know about chrpath, that looks helpful. Perhaps part of
>>>>> the solution will be handling our own strip/install actions to do this
>>>>> explicitly in the build.
>>>>>
>>>>> It will be a pain to have to pull in another external dependency though...
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>     FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>>>>>     FILES_${PN} += " ${libdir}/libcamera.so"
>>>>>>     
>>>>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>>>>> +INHIBIT_PACKAGE_STRIP = "1"
>>>>>> +
> 
