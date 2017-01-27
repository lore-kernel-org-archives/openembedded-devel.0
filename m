Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F84371A19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:51:20 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y143so19002443pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=dI18KpeuYDzu/yJ0w9cgy8z1VfzVrKxnqPALaE2ZoSc=;
	b=HMgRP+EA7M4yJRxbO/i/bcR1SNLQH3CmqEibtbJd11b9F+M1ILkIoexxvY82sE3pQE
	Sthmt83cl2Xoc1N3pdfoENMpIgIgUtC1MdQ4i0b6+XQqXgN9U/MDfMOTGLGeVUYGOdSH
	60b0iT4MHIHnK3Ew0NULY2ZtOS26/s2QdQRKCZwMSrNXCZitkz9ZA/qtunKNmfewrkxx
	RRspZ6HZJkWWnrPl5rVk7014NvQDxdNuvFzAFmo1yBe3mkC4oHitIgDlOfgBjBReS1tm
	YFt0ZZXM7QHz5etXR8pHXQB1M14DlIFR+zSD3nuZlmSPQMrMhD0vRjea+rM+Vifx1kut
	SHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dI18KpeuYDzu/yJ0w9cgy8z1VfzVrKxnqPALaE2ZoSc=;
	b=OGeYp33wlg19eWgNOelyZLYe4xfVj6RcL+TehWcvV2sb+cfX+1ef83Tdx6adLcxpCX
	0FOgQ+6LlaGCM73AwPnr/TkMoPdvoUKjA7JSKx8zQ0wGfhWVg9hFrLynXXce4Wmvkqmv
	sGVRznesxo4srqGXbJPl8Q1vHKJ6IaZrmOyAUN4MjSUlIl5TfcURJHZKoGrafAFaiEB9
	ULNWdlh3bvmxwtg6H9fRHVdPYa49bpr6nDoK1p39R+M2z9VtPH0NR1RrClap9Wt4mcyt
	R23FfOwUp3W3cn730O3b1z6dNazFNeINFMvRhOrx0FcC+DfteXWJl47euWw38S8aUnuE
	Eqvw==
X-Gm-Message-State: AIkVDXKdggT8Q2ZvvAbDJ2CtyChnm35aPi7YVFA/4w5ZzznPOLP84XEE571Mgwy3n34NVg==
X-Received: by 10.98.110.194 with SMTP id j185mr10710232pfc.157.1485539481114; 
	Fri, 27 Jan 2017 09:51:21 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6d8d:a1ec:12d:52de])
	by smtp.gmail.com with ESMTPSA id
	u24sm12938781pfi.25.2017.01.27.09.51.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 09:51:20 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
Date: Fri, 27 Jan 2017 09:51:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
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
X-List-Received-Date: Fri, 27 Jan 2017 17:51:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: vendredi 27 janvier 2017 02:47
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
>> 53.0.2785.14
>>
>>
>>
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

thats we should make a note of this in patch header. We will have to
remove it or replace it as well when we upgrade chromium.
> Julien
> 

