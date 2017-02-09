Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id AED4871DD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 08:39:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h65so11390974lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=jz09m145482NvJtJztbxDg7V+tAQ0sXR4l3a4CsR4G4=;
	b=tD+1y5MOGuEhA9HizZ+pwB15FXWn8Ri5ni+tfO4gYApqXOmJRYV3jYQcgu2lVVIH7G
	Zjc4KHVFnwObtLUnwUy4tn3JDZCPYTEu0+G/3j2KlhUVQdcyx4Qa5JgmhdBEW4OwU0bv
	+WAs/9kSqtAHHQYg0qcIdQ5W2f+Y51HeQ7WAhmkbx/q8mXjWeaP2Tr191BuZaDvU8V+u
	x4/VNBuxB7YMhk2M/EutatwsdhIklNitHULBIjqvhqbbYKIcL8FSXYrYFBcdtDXTROIY
	gka1OqKdUlqcTxb2KHNi+Gm4FNTPqulbOHqOg0vnVCQueVQPWg9xSz1TOyjhxHj35FAA
	Dm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jz09m145482NvJtJztbxDg7V+tAQ0sXR4l3a4CsR4G4=;
	b=Ie33j9H4sQLm4pbaJbzrfuGT+NBVFVcf2AMW0jltGdhB9sfH28shXw2r7YQqrLXQOp
	J0djqSBzukyB5hp1yApJf3ve/UEGGhKVR+66ywoxwjUA5/cidT8lWCgl9gIsk7KyYj4r
	jPQrE6vAgQipFyaqlPh6j/HWKtbwF7oFIufECDZrl3G+H8LCiyIShfOBQuNz4EMls30y
	Q02OkQKz7J5dL4gMR+njDeA5pXZN1ox7oBFRcLNlQoGpVBLhbswOopFWipfS6dJjwRtB
	F6Nr/UYNaPcsdQsB1OtGEPrn60Uo2v2nJYHARnF7uwGDEXDPLWdstCstiacOD+SSmyA5
	/Nsw==
X-Gm-Message-State: AMke39kuwmg0g1kUVrlx7XiMltAaJQxQ36avu7UQdRn0MPmtBrTR1KWviLhomBKUxa7H8g==
X-Received: by 10.46.69.215 with SMTP id s206mr734995lja.26.1486629540682;
	Thu, 09 Feb 2017 00:39:00 -0800 (PST)
Received: from [10.9.21.21] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	x78sm3218476lfb.44.2017.02.09.00.38.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 00:38:59 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
	<20170207120034.GC3276@jama>
	<AM5PR0402MB281713F0BB2D14E79F61E00DE2420@AM5PR0402MB2817.eurprd04.prod.outlook.com>
	<CA+chaQc9+Pxi5LDw1cBf2CFmYwTrNwkumuyobMO2A_TMdgW0FQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <9bcacfd6-2dcf-9c71-7a40-468a76f66efd@gmail.com>
Date: Thu, 9 Feb 2017 10:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc9+Pxi5LDw1cBf2CFmYwTrNwkumuyobMO2A_TMdgW0FQ@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Thu, 09 Feb 2017 08:39:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

In 5.8 (master), there is now a "system-assimp" PACKAGECONFIG option 
that correctly enables/disables assimp dependency.

>>>> fatal error: assimp/Importer.hpp: No such file or directory

Is this really a fatal build error or a config test error?
In case qt3d doesn't find system assimp, it will use its internal copy 
of it.


On 02/08/2017 09:43 PM, Martin Jansa wrote:
> RSS:
> http://git.openembedded.org/openembedded-core/commit/?id=809746f56df4b91af014bf6a3f28997d6698ac78
> http://lists.openembedded.org/pipermail/openembedded-architecture/2017-January/000384.html
> and following threads
>
> For morty and older releases you need to disable autodetection in qt3d
> sources when the assimp PACKAGECONFIG is not enabled (see PACKAGECONFIG in
> other recipes for some examples how to do it - but for qt5 it's often
> tricky as it rarely has enable/disable options usable in configure and has
> to be patched).
>
> Otherwise assimp can still be detected when it's built as a dependency of
> some other recipe and might be removed from sysroot while qt3d build is
> already running and causing the issues you were trying to fix.
>
> On Wed, Feb 8, 2017 at 6:42 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
>>
>>
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
>> openembedded-devel-bounces@lists.openembedded.org] On
>>> Behalf Of Martin Jansa
>>> Sent: Tuesday, February 07, 2017 6:01 AM
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
>>>
>>> On Fri, Jan 27, 2017 at 04:54:00PM -0600, Tom Hochstein wrote:
>>>> Fix build error:
>>>>
>>>> fatal error: assimp/Importer.hpp: No such file or directory
>>>
>>> I'm was able to build qt3d without this dependency, is there something
>>> in your config which enabled it? Or is it autodetected from sysroot
>>> which wont be an issue anymore with master and RSS, but your change
>>> doesn't fix the autodetection for older branches.
>>
>> We do enable assimp from another recipe.
>>
>> I am unable to reproduce the original problem either.
>>
>> Without the explicit dependency, it would seem that the build would at
>> best be non-deterministic, enabling or disabling assimp support based
>> solely on the timing of the Yocto tasks. I'm not aware of the technologies
>> you allude to. Do they provide some determinism for this case?
>>
>>>
>>>> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>>>> ---
>>>>  recipes-qt/qt5/qt3d_git.bb | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
>>>> index 2276c36..7c31213 100644
>>>> --- a/recipes-qt/qt5/qt3d_git.bb
>>>> +++ b/recipes-qt/qt5/qt3d_git.bb
>>>> @@ -19,6 +19,7 @@ PACKAGECONFIG ??= ""
>>>>  PACKAGECONFIG_class-native ??= "tools-only"
>>>>  PACKAGECONFIG_class-nativesdk ??= "tools-only"
>>>>  PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
>>>> +PACKAGECONFIG[assimp] = ",,assimp"
>>>>
>>>>  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
>>>>
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>>
>>> https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.
>> openembedded.org%2Fmailman%2Flistinfo%2Fopenembedde
>>> d-
>>> devel&data=01%7C01%7Ctom.hochstein%40nxp.com%
>> 7Cfa462298ac744a52797808d44f50f020%7C686ea1d3bc2b4c6fa92cd99c5c301635
>>> %7C0&sdata=mLf9Lt9hQ5Rn8Ygbq7PczLY4Ix%2BscnMCbhC%2BDyUwLLM%3D&reserved=0
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

