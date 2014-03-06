Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBC16F588
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 14:00:02 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ks9so2632413vcb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2XimYAFMJXChEJNgDTF5skI4iQ4iV299cTqonciJKhQ=;
	b=diXolB8vX2n5b7OAwY5TZo9C6qSyOGRBRVl2V18CzRJQQ4lpxRpS1jNBRbkfBvl4l/
	xIfhWXdVWslnNt3fSD/8hybDK7kun6agexgsKZ1eVvTmDcEHBBmxTSay9uFwX08hskrI
	Hggull6sZ/vBFcvh31GMBsag8S3nR9ZVGn3F/qAeue9LcQ3c8sDvMIVKGbovbDcxwUXm
	Xgrx6AUXQ1CPnjX6crwTFNF8z1eHgx1BWmWlo+jtJTxWfpxXlX9WVa7pi7v/zdO/U89T
	mOZowOkCgZ3d6rail3znR+Hy2mbbUoCGgVCeb1/pKkekjhUQizLEukzZvQ9VKyNTdApN
	ArlA==
MIME-Version: 1.0
X-Received: by 10.58.95.161 with SMTP id dl1mr5409384veb.21.1394114403578;
	Thu, 06 Mar 2014 06:00:03 -0800 (PST)
Received: by 10.52.35.170 with HTTP; Thu, 6 Mar 2014 06:00:03 -0800 (PST)
In-Reply-To: <CALbNGRSk-Cbv8nyEhUANsJ+ib2U7xfTDqTYogVoohFb=17WB5Q@mail.gmail.com>
References: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
	<1393348614-15618-2-git-send-email-schnitzeltony@googlemail.com>
	<20140225172747.GR26981@jama>
	<CALbNGRSk-Cbv8nyEhUANsJ+ib2U7xfTDqTYogVoohFb=17WB5Q@mail.gmail.com>
Date: Thu, 6 Mar 2014 15:00:03 +0100
Message-ID: <CALbNGRQWbBfSLrCHespVnOvywa+ah+dBhy2A3Mz9XCKvj6WY_w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.1] qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms]
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
X-List-Received-Date: Thu, 06 Mar 2014 14:00:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 8:06 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Feb 25, 2014 at 6:27 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Tue, Feb 25, 2014 at 06:16:54PM +0100, Andreas M=C3=BCller wrote:
>>> * there is no kms around
>>> * mesa is the default implementation for (lib)gbm (see config.tests/qpa=
/kms)
>>> * in configure we find:
>>>   | if [ "$CFG_KMS" =3D "yes" ]; then
>>>   |     if [ "$CFG_EGL" =3D "no" ]; then
>>>   |         echo "The KMS plugin requires EGL support and cannot be bui=
lt"
>>>   |         exit 101
>>>   |     fi
>>>   | fi
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  recipes-qt/qt5/qtbase.inc | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>>> index 116c86f..6c6ec5a 100644
>>> --- a/recipes-qt/qt5/qtbase.inc
>>> +++ b/recipes-qt/qt5/qtbase.inc
>>> @@ -108,7 +108,7 @@ PACKAGECONFIG[gtkstyle] =3D "-gtkstyle,-no-gtkstyle=
,gtk+"
>>>  PACKAGECONFIG[directfb] =3D "-directfb,-no-directfb,directfb"
>>>  PACKAGECONFIG[linuxfb] =3D "-linuxfb,-no-linuxfb"
>>>  PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
>>> -PACKAGECONFIG[kms] =3D "-kms,-no-kms,kms"
>>> +PACKAGECONFIG[kms] =3D "-kms,-no-kms,virtual/mesa virtual/egl"
>>
>> Maybe we should introduce some virtual/gbm later, but I'm ok with
>> virtual/mesa until we have it.
> virtual/mesa has different meanings gbm / wayland-egl - it took me a
> while to get mesa-free...
>>
>> Also there is no virtual/mesa in oe-core/dylan, but I guess that there
>> is minimum user with dylan who also want kms.
>>
ping for master?

Andreas

