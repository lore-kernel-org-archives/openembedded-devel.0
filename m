Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE78608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:14:19 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so126720985wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=/BGBo2BAp3a1/zZ60WIDdvWZNCj1SuxpfFNP7iGWUPg=;
	b=yFZRZVD0hXWC4DpSvjiT21FbRQjA4hFRLquGMDtpUbU4V/rQHe4SZz1siPio7dKZgU
	cI3i7ZpG9zZuy7punjFoiu7EcLMd2ASj7/s1chS2DN3wV8LNcr9+URPgvLAmgbebJJGP
	lenWYc0z4CjPz4vq7nTuO1Nu+sYFTpmgZkeAqJUMslj03s5lNnspsDfubifuipDl9P5B
	dfYWdLZn3BEDJblwLvKWBG+iW0loZE33O6Eum8RqNG57XrixdeI6872HiesTKF/UxAlP
	GvMR8RCyaLUnc/Odp3amb3k0IJuJeAIm2XURGQSVTVLbRMXImKz2zJdX42KIFQOOs+7z
	rO3Q==
X-Received: by 10.195.11.3 with SMTP id ee3mr20471105wjd.89.1439964859956;
	Tue, 18 Aug 2015 23:14:19 -0700 (PDT)
Received: from [192.168.0.14] (lns-bzn-49f-62-147-165-143.adsl.proxad.net.
	[62.147.165.143]) by smtp.googlemail.com with ESMTPSA id
	jr5sm29526013wjc.14.2015.08.18.23.14.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 23:14:18 -0700 (PDT)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
	<1438562844-16736-2-git-send-email-TicoTimo@gmail.com>
	<CANx9H-DRLk5sOcmPtoGgHQRAa5y+Ef8ihbBvMAb7S7ptOaE7dQ@mail.gmail.com>
	<20150818094429.GI2458@jama>
	<CANx9H-D_onDGKhvi08xPXXuNwzJ13dfYObE_=k+J0g2G4-R1aQ@mail.gmail.com>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <55D41EB8.5050503@videolan.org>
Date: Wed, 19 Aug 2015 08:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-D_onDGKhvi08xPXXuNwzJ13dfYObE_=k+J0g2G4-R1aQ@mail.gmail.com>
Subject: Re: [meta-oe][meta-multimedia][PATCH 2/2] vlc: update to 2.2.1
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
X-List-Received-Date: Wed, 19 Aug 2015 06:14:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/19/2015 05:05 AM, Tim Orling wrote:
> On Tue, Aug 18, 2015 at 2:44 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
>> On Sun, Aug 02, 2015 at 06:07:57PM -0700, Tim Orling wrote:
>>> I accidentally left libvorbis as a dependency in vlc.inc, which is not
>>> needed (tremor provides what was needed).
>>>
>>> You can pull the corrected recipes from:
>>>
>>>
>> http://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/vlc-2.2.1
>>>
>>> --Tim
>>
>> It still fails with that libtool error:
>> http://errors.yoctoproject.org/Errors/Details/14498/
>> but I'll merge it anyway, because it doesn't make things worse than old
>> version.
>>
>> It is having a problem with the assembly files (e.g.
> vlc-2.2.1/modules/arm_neon/i422_yuyv.S )
> 
> 
> Anybody have any ideas? I would guess that --tag=CC would still apply, but
> I don't see any obvious support for assembly files in the libtool docs.
> 
> --Tim

This vlc.inc diff lets VLC build correctly for me:

-    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g
${B}/doltlibtool
+    sed -i -e
s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g
${B}/doltlibtool

