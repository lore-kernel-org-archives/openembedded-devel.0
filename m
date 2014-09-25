Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8955860144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:21:45 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 53987F811F1; Thu, 25 Sep 2014 05:21:47 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 936FEF811F0;
	Thu, 25 Sep 2014 05:21:45 -0600 (MDT)
Message-ID: <5423FB0C.60408@mlbassoc.com>
Date: Thu, 25 Sep 2014 05:22:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1411637549-5623-1-git-send-email-dv@pseudoterminal.org>	<5423F3FE.80508@mlbassoc.com>
	<5423F9BD.9080202@pseudoterminal.org>
In-Reply-To: <5423F9BD.9080202@pseudoterminal.org>
Subject: Re: [meta-browser][PATCH] chromium: Add missing impl side painting patch
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
X-List-Received-Date: Thu, 25 Sep 2014 11:21:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-25 05:17, Carlos Rafael Giani wrote:
> On 09/25/2014 12:52 PM, Gary Thomas wrote:
>> On 2014-09-25 03:32, Carlos Rafael Giani wrote:
>>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>> ---
>>>   ...terization-whitelist-unlocking-impl-side-.patch | 73 ++++++++++++++++++++++
>>>   recipes-browser/chromium/chromium_37.0.2062.94.bb  |  2 +-
>>>   2 files changed, 74 insertions(+), 1 deletion(-)
>>>   create mode 100644 recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
>>>
>>> diff --git a/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
>>> b/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
>>> new file mode 100644
>>> index 0000000..3e9d269
>>> --- /dev/null
>>> +++ b/recipes-browser/chromium/chromium/0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch
>>> @@ -0,0 +1,73 @@
>>> +From 96a5a12ecd5b144bfeaa1d2116c2d1996bbb8f6c Mon Sep 17 00:00:00 2001
>>> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
>>> +Date: Mon, 22 Sep 2014 23:15:42 +0200
>>> +Subject: [PATCH] Disable rasterization whitelist, unlocking impl side painting
>>> +
>>> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>> +---
>>> + gpu/config/software_rendering_list_json.cc | 49 ------------------------------
>>> + 1 file changed, 49 deletions(-)
>>> +
>>> +diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
>>> +index 52614eb..bd0bf01 100644
>>> +--- a/gpu/config/software_rendering_list_json.cc
>>> ++++ b/gpu/config/software_rendering_list_json.cc
>>> +@@ -1144,55 +1144,6 @@ LONG_STRING_CONST(
>>> +       "features": [
>>> +         "all"
>>> +       ]
>>> +-    },
>>> +-    {
>>> +-      "id": 96,
>>> +-      "description": "GPU rasterization is whitelisted on N4, N5, N7 and Moto X",
>>> +-      "cr_bugs": [362779],
>>> +-      "exceptions": [
>>> +-        {
>>> +-          "os": {
>>> +-            "type": "android"
>>> +-          },
>>> +-          "machine_model_name": ["Nexus 4", "Nexus 5", "Nexus 7",
>>> +-                                 "XT1049", "XT1050", "XT1052", "XT1053",
>>> +-                                 "XT1055", "XT1056", "XT1058", "XT1060"]
>>> +-        },
>>> +-        {
>>> +-          "os": {
>>> +-            "type": "android",
>>> +-            "version": {
>>> +-              "op": ">=",
>>> +-              "value": "4.4.99"
>>> +-            }
>>> +-          }
>>> +-        }
>>> +-      ],
>>> +-      "features": [
>>> +-        "gpu_rasterization"
>>> +-      ]
>>> +-    },
>>> +-    {
>>> +-      "id": 97,
>>> +-      "description": "Additional GPU rasterization whitelist for field trial",
>>> +-      "cr_bugs": [380694],
>>> +-      "exceptions": [
>>> +-        {
>>> +-          "os": {
>>> +-            "type": "android"
>>> +-          },
>>> +-          "machine_model_name": ["HTC One",
>>> +-                                 "C5303", "C6603", "C6903",
>>> +-                                 "GT-I8262", "GT-I8552", "GT-I9195", "GT-I9300",
>>> +-                                 "GT-I9500", "GT-I9505", "GT-N7100",
>>> +-                                 "SAMSUNG-SCH-I337", "SCH-I545", "SGH-M919",
>>> +-                                 "SM-N900", "SM-N9005", "SPH-L720",
>>> +-                                 "XT907", "XT1032", "XT1033", "XT1080"]
>>> +-        }
>>> +-      ],
>>> +-      "features": [
>>> +-        "gpu_rasterization_field_trial"
>>> +-      ]
>>> +     }
>>> +   ]
>>> + }
>>> +--
>>> +1.9.1
>>> +
>>> diff --git a/recipes-browser/chromium/chromium_37.0.2062.94.bb b/recipes-browser/chromium/chromium_37.0.2062.94.bb
>>> index 510b644..3d4524b 100644
>>> --- a/recipes-browser/chromium/chromium_37.0.2062.94.bb
>>> +++ b/recipes-browser/chromium/chromium_37.0.2062.94.bb
>>> @@ -8,7 +8,7 @@ SRC_URI = "\
>>>           file://oe-defaults.gypi \
>>>           ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>>>           ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
>>> -        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://disable-rasterization-whitelist-unlocking-impl-side-painting.patch', '', d)} \
>>> +        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://0001-Disable-rasterization-whitelist-unlocking-impl-side-.patch', '', d)} \
>>>           ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://0002-Disable-API-keys-info-bar.patch', '', d)} \
>>>           file://unistd-2.patch \
>>>           file://google-chrome \
>>>
>>
>> Why is this important since it appears to only affect Android
>> based devices (and this is for OE builds)?
>>
>
> By default, it is only enabled for certain Android devices. With this patch, it is enabled for all devices, including for OE builds. impl side painting is still in an experimental
> stage, but promises better performance, which is why I made it an opt-in PACKAGECONFIG.

That makes more sense, thanks.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

