Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9971D60CFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:57:52 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so3870595pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pUOMEpZN5AvhEnxm3bG8qO1DDYzBzTmbZHbaA5TzNaY=;
	b=KJLhnHXqhYx/RDKJYpjAW4eOfaqd77/FIwNQcjaGMglWzns7osT3RL/nRZAH4MZnY8
	hwmvEeoJW5k/F8B9a7rK1St4NiLeduydjSC/blw+bgXf2wzC0EQUDER3gnzqyyBvFkcO
	Yd+m66NT5YBN/MWXgHeGjOipj/Gpu7sMpOCa1fofBJL0oEw2Jy3cr1eYnkeNp5Iclih+
	9ISlKTaSfu7pI3iEQBqWEMIbK8cTc7KFq6OaiYmwq8AdBBe4VGS35/60tQ3SuYQfc2bV
	fb/C1+qg0u8c93kNeO3UqpLaeUpbJp5Hma5boFvflP8zL78ANbmyRrNQ0uZJPNHocPZm
	vHmA==
X-Gm-Message-State: ALoCoQnccRaFcETDrycD2pTlbaY3HrlxMXfHk/9dcnWie1vEg2x0N7wd60LTDJNIKPTHdVsR6exq
X-Received: by 10.66.141.109 with SMTP id rn13mr13390797pab.117.1407355073052; 
	Wed, 06 Aug 2014 12:57:53 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id vy3sm2099122pbc.92.2014.08.06.12.57.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 12:57:52 -0700 (PDT)
Message-ID: <53E288BE.3050703@mvista.com>
Date: Wed, 06 Aug 2014 12:57:50 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Joe MacDonald <joe_macdonald@mentor.com>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>	<20140806183909.GO14848@jama>
	<20140806185145.GF14621@mentor.com>	<20140806193732.GQ14848@jama>
	<20140806194236.GH14621@mentor.com>
In-Reply-To: <20140806194236.GH14621@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 19:57:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/06/2014 12:42 PM, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable version] On 14.08.06 (Wed 21:37) Martin Jansa wrote:
>
>> On Wed, Aug 06, 2014 at 02:51:45PM -0400, Joe MacDonald wrote:
>>> [Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable version] On 14.08.06 (Wed 20:39) Martin Jansa wrote:
>>>
>>>> On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
>>>>> Version 1.12.0 is out, update the SRC_URI and associated variables.
>>>>
>>>> One more issue:
>>>>
>>>> WARNING: QA Issue: wireshark rdepends on c-ares but its not a build
>>>> dependency? [build-deps]
>>>>
>>>> it's strange, but it's new with 1.12.0 final.
>>>
>>> This is likely auto-detected and the behaviour is different depending on
>>> the presence or absence of c-ares.  I'm inclined to disable the
>>> dependency in wireshark, but calling it out explicitly is fine with me
>>> too.
>>
>> That's what my test-dependencies.sh script is testing and it was
>> returning clean result for rc2, that's why it's surprising, but
>> wireshark isn't alone with this issue, so follow-up patch is completely
>> fine (it can also include that PE bump).
>
> Yeah, makes sense.  That's what I've done in the patch I just sent out.
> I went ahead and disabled c-ares since that looked like the path of
> least resistance, and it can be re-introduced later if required.
> (Unless, of course, Armin already has an update for that part.)

nope.  I am in slow-mo today.

thanks.
- Armin
>
> -J.
>
>>
>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/097223.html
>> libcap libnl libnl-genl libnl-nf libnl-route portaudio-v19 sbc were
>> floating with rc2, all of them fixed (according to test-dependencies.sh)
>> by
>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/097255.html
>>
>> Regards,
>>
>>>>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>>>> ---
>>>>>   .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 ----------------------
>>>>>   ...wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} | 10 +--
>>>>>   2 files changed, 5 insertions(+), 104 deletions(-)
>>>>>   delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch
>>>>>   rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} (81%)
>>>
>>>
>>>
>>> --
>>> -Joe MacDonald.
>>> :wq
>>
>>
>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>>
>>

