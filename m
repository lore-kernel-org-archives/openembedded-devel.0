Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD297740C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 16:06:00 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AttVvmxAUpwstyDKla89LUyQJP3N1i/DPJgcQr6Af?=
	=?us-ascii?q?oPdwSPT8rsbcNUDSrc9gkEXOFd2CrakV16yL7OuwAyQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5br5+NhW7oAfeusQVn4dpN7o8xAbOrnZUYe?=
	=?us-ascii?q?pd2HlmJUiUnxby58ew+IBs/iFNsP8/9MBOTLv3cb0gQbNXEDopPWY15Nb2tRbY?=
	=?us-ascii?q?VguA+mEcUmQNnRVWBQXO8Qz3UY3wsiv+sep9xTWaMMjrRr06RTiu86FmQwLuhS?=
	=?us-ascii?q?waNTA27XvXh9RtgqxFrhKvpx9xzYDab46aNvVxYqzTcMgGRWdDRMtdSzBND428?=
	=?us-ascii?q?YoYJEuEPPfxYr474p1YWqRWxHxWjBOT0xT9PnnD7wbc63P4uEQHb2gwvAswBv2?=
	=?us-ascii?q?zOotLvLqcdT+G0x7TPwDXBdfxWwy3y6IfVchAnvP6DQ6l9ccveyUY1EwPFj0+f?=
	=?us-ascii?q?pZb5MDOS0+QAqm6W5PduW+Kojm4osQBxoj63y8gwionJnIUVylXF9SVkxYY5P9?=
	=?us-ascii?q?q4SFR0YdOiDZBetDmaOpNyT88/WW1kpTs2x78ctZO/eCUG0okryh7fZvCfboSF?=
	=?us-ascii?q?4RHuWPySLDp5nn5oeq+ziwys/UWvyuDxUNS/3kxQoSpfiNbMs2gA1xnU6seaVP?=
	=?us-ascii?q?Rw5lyh2TOT1wDL7eFEPFw0mbLbK5E/xr4wkYIesUrZES/wmUT2jamWeVs+9uip?=
	=?us-ascii?q?5OToeLHmpp6GOINulg7+NaEultS+AeQ+LAcOQ3CW9OCh2LH54EH1XbdHgucyn6?=
	=?us-ascii?q?TdqpzWOMQWq66hDw9QyIkj6hK/Dzm80NQfmHkKNFBFdwidj4fzNFHOPfb4Auqh?=
	=?us-ascii?q?jFm3kTdryOrJPrngAprXNHTMjLDhfbNl505G1AUz1cxf545TCrwZJ/LzQlH+tN?=
	=?us-ascii?q?rGAR88KAO73fvoB8hj2YwDQG6AH7GWML3Mvl+M/e8vJ+iMZJQJuDbmMfQl4Obu?=
	=?us-ascii?q?gmE/mVADeKmmxoUYZ22lEft4PkqVe33sgs0OETRCgg1rS/TnjlCHWzNfa3u+Gq?=
	=?us-ascii?q?4x+Dw/IIanFpvYAIe1jbqM2S22EpFbaiZBEF/fP23vctCmUvwLYiWlC9VonSEC?=
	=?us-ascii?q?WbWWcw472APm4A3z0bNoM+zY9wUZupvn1dEz7OrWw0JhvQdoBtiQhjneB1p/mX?=
	=?us-ascii?q?kFEmc7?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DVBQBOb4tY/5tjdVteGwEBAQMBAQEJA?=
	=?us-ascii?q?QEBFwEBBAEBCgEBgwoBAR9hAydfn2CTIIIPggwqhXgCgh9BFgEBAQEBAQEBAQE?=
	=?us-ascii?q?BYSiCMxmCHgEFgQkLGC5XEwgBAYlhAQmvUIpsAQEBAQYBAQEBAQEihkuCBYJqh?=
	=?us-ascii?q?RWFGQWbUYZnixKBeYg8hj+IJYpZJgYrgUuHCnSJAAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2DVBQBOb4tY/5tjdVteGwEBAQMBAQEJAQEBFwEBBAEBCgE?=
	=?us-ascii?q?BgwoBAR9hAydfn2CTIIIPggwqhXgCgh9BFgEBAQEBAQEBAQEBYSiCMxmCHgEFg?=
	=?us-ascii?q?QkLGC5XEwgBAYlhAQmvUIpsAQEBAQYBAQEBAQEihkuCBYJqhRWFGQWbUYZnixK?=
	=?us-ascii?q?BeYg8hj+IJYpZJgYrgUuHCnSJAAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,296,1477954800"; d="scan'208";a="154404160"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 27 Jan 2017 17:05:58 +0100
Received: from [188.86.71.245] (helo=[192.168.1.6])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cX92E-0001yB-N0 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:05:58 +0100
To: openembedded-devel@lists.openembedded.org
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <af85ea87-57e1-d529-9dcb-e31b6f922d1b@igalia.com>
Date: Fri, 27 Jan 2017 17:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
Subject: Re: [meta-browser][PATCH v2] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Fri, 27 Jan 2017 16:06:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 27/01/17 15:06, Julien Brianceau (jbriance) wrote:
>> ...
>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>> Hi Jacob,
>>>
>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
>> patch for it to work, or else I get an error in
>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>> interface is required by ozone-wayland), but this patch seems to not be
>> related to RaspberryPi itself.
>>> Basically, it seems that USE_XKBCOMMON is not defined when compiling
>> keycodes.
>>>
>>> Is it something that you saw as well? Or do you have a different
>> setting/experience?
>>>
>>> Just for reference, here is the patch I need (right now, I'm
>> triggering it from meta-raspberrypi, but I believe it may be needed in
>> meta-browser).
>>>
>>> --- a/ui/events/keycodes/events_keycodes.gyp	2017-01-23
>> 19:12:01.767271256 +0800
>>> +++ b/ui/events/keycodes/events_keycodes.gyp	2017-01-23
>> 19:12:11.503048216 +0800
>>> @@ -21,6 +21,9 @@
>>>          'scoped_xkb.h',
>>>          'xkb_keysym.h',
>>>        ],
>>> +      'defines': [
>>> +        'USE_XKBCOMMON',
>>
>> This seems fine to me. It should also be proposed upstream as well I
>> think.
>>
> 
> For the record, I've already tried to upstream a similar change (see Patch Set 1 of review https://codereview.chromium.org/2239833003/), but only the GN part has been accepted as gyp support has been removed in Chromium 54.
> 

This error definitely rings a bell to me, although I haven't reproduced
it in my latest builds for minnowboard. It could happen with certain
build flags, maybe some of those are enabled for arm builds but not for
intel ones.

The patch looks definitely good, and because gyp is deprecated in
upstream master, I think it's ok to keep it downstream. Thank you :)

-- 
Jacobo

