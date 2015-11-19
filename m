Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id BC4DE6010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:06:07 +0000 (UTC)
Received: by ioir85 with SMTP id r85so87946888ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nLvCoFC3OnXIT9L1Hdx0tflVJng9nCZPamBxQhfGQqA=;
	b=V7fuddJMBz7eqTG6cvd3p+IuiClUQEzBS7sgUkGhD9+tyJxOizSQaJNoEXLusC4s4B
	3XlpzgGcPzPJM55l8UXajnFVoBXu+D9QlefRG6DYqi2rspR2oEow+nFMEbj7gws9KC3Z
	RN+aPsBaAiR7RGeaLWvrNPTFPu8fBZfHlmTs/t4BShj6m10oC+fUCelvRCwxcloDqyKZ
	8jhBR/5ZSWsOxxyP7p6xFFYlw0q5YYbCilOZkHYKlvOjfpPswOsv5Ut3pnqo2YaSDcMx
	aQVLp1V3o+RFonOtTvyXoIAZ1Uq/UwJrG43VaCFPkN/0muc4yrzW6hHXQwSks1MfLD5L
	o9QQ==
MIME-Version: 1.0
X-Received: by 10.107.135.30 with SMTP id j30mr7469959iod.148.1447938367757;
	Thu, 19 Nov 2015 05:06:07 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 19 Nov 2015 05:06:07 -0800 (PST)
In-Reply-To: <CALbNGRTYEUrOur2hWhUa+WQApav7gagoA0S=Cd+e76Yk_RZA4w@mail.gmail.com>
References: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
	<1446658209-27822-2-git-send-email-schnitzeltony@googlemail.com>
	<20151104225422.GB2556@jama>
	<CALbNGRTYEUrOur2hWhUa+WQApav7gagoA0S=Cd+e76Yk_RZA4w@mail.gmail.com>
Date: Thu, 19 Nov 2015 14:06:07 +0100
Message-ID: <CALbNGRTRM=tkVgGaogRhSvwQsSeA9ZPxA0sxEKprXad9U45pTg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: align target qmake paths
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
X-List-Received-Date: Thu, 19 Nov 2015 13:06:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2015 at 12:32 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Nov 4, 2015 at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Wed, Nov 04, 2015 at 06:30:09PM +0100, Andreas M=C3=BCller wrote:
>>> With this we can setup qt-creator to build/debug on target again.
>>
>> Can we apply this change to qtbase-native and nativesdk-qtbase as well
>> or will it break things?
> Have not tested but I don't expect it to work for our cross/sysroot
> magic: the patch wipes all host/sysroot paths out of (target) qmake.
>>
>> With 5.6 I was finally able to use the same patches for target qtbase
>> and native(sdk) with only:
>>     file://0008-Always-build-uic.patch \
>>     file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
>> included only for native(sdk) that makes my qtbase branches in
>> github.com/meta-qt5/qtbase a lot easier to maintain.
> Understood, happy and fully agreed :)
>>
>> If it cannot be changed for all, can we make it conditional, e.g.
>> [ "$QT_CROSS_COMPILE" =3D "yes" ]
>> like in new version of:
>> https://github.com/meta-qt5/qtbase/commit/10283d010d7a66c485cda1e9b1c0cf=
7c41e358b3
>>
> Need a look into but this seems to me the path to take: handling
> conditionals during build is what configure is made for :)
>
> As you might guess: I am using qt-creator on target from time to time
> for building/debugging simple projects or profiling QML - so I am very
> interested in qt-creator working on target.
>
Hey Martin,

just saw that you applied this one to jethro-next - please wait with
applying to jethro. I'll send new versions for master & jethro
hopefully with same patch content with conditional modification of
configure and setting linux-g++ as mkspec because linux-oe-g++ on
target causes trouble.

Regards

Andreas

