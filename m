Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53F25719C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 10:47:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so4615211wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GlEvhrUglEq8D5npRCI+IfHhohuDFuLyUw/M6vs42eE=;
	b=RXEV9kwOxfxjxZwcRxYVsb/DSTr4hBK7dr/hJuqQADOuTKUWoflzgDqxulPpMGFbUT
	4d3MOn5p78OJiAdHVCeRfsXj2Gr8pZT43+o/l8wO2XIbecyhXm1aa13c9tG/o6umcxmO
	bszmqsN5ECNZUHOWgbuO9tNnAJsyB27bX7Goei4Pk9865r75Q4yU++Mywjlh1XYmovvp
	5TV2iKTDys1nSIrKjD0Pxsh7nKunLH9fa5XTxXK7dUNFR6/ZSyEVk1XyxIQbxPozTybh
	BTioCDg5esNC056ge/IqQwgOy7tldPU6xDm1UZpSmFLEPag4t+iXkt5UrGGdpMce0pus
	Hc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GlEvhrUglEq8D5npRCI+IfHhohuDFuLyUw/M6vs42eE=;
	b=O8IZJpXs86vQaNMnJQaomnjL3mjObY841uOBy6/wqUZqlXc5+s1EcyVTce3kzb2tqf
	/5f0dgxhWLNHhtj774662rn0KcveeIrPBvyfW7qpdp1/CEfRJQy6UhZdDuhb6YyCNbfr
	xUIH+/MllwY7fTgBG7rN/FSQu5t8B80ovgg4pzc7Ot/erojnf7W9KvFXHnCvFQPYvev+
	hDNKMLgg664K9HmFeykhXsolupKtwYYFoUfWi9ZvcymIak9AXbURKUsClgi36m7gwE+K
	51oC0Nsm6BY0AbqJwpN6s65CYP80/EcILkgln/r/VbwhV+5bH+kvwDcuUhTdJn6lltPu
	Qewg==
X-Gm-Message-State: AKaTC0105SWMsgHjeP19xY1aTxwDM9pFX4buurBRbsNUKFRe3K6pDCvi1GJw6FtXCTo7YsXx3ZBLVDMr7TGJ9g==
X-Received: by 10.28.184.88 with SMTP id i85mr1566749wmf.49.1479984476924;
	Thu, 24 Nov 2016 02:47:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Thu, 24 Nov 2016 02:47:56 -0800 (PST)
In-Reply-To: <02f7b3e7-93d4-58ae-ebd8-f54fe5781ce1@gmail.com>
References: <1479455334-21184-1-git-send-email-samuli.piippo@qt.io>
	<20161123152941.GC3265@jama> <20161123154346.GD3265@jama>
	<20161123185251.GG3265@jama> <20161123201431.GI3265@jama>
	<02f7b3e7-93d4-58ae-ebd8-f54fe5781ce1@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Nov 2016 11:47:56 +0100
Message-ID: <CA+chaQcSCsVDCfqPZn7p2vJrMrf0tCgBoiBDBLUm1rP3zWXoUg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCHv2] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 24 Nov 2016 10:47:56 -0000
Content-Type: text/plain; charset=UTF-8

Please send v3 with all 3 fixes.

On Thu, Nov 24, 2016 at 9:23 AM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> On 23.11.2016 22:14, Martin Jansa wrote:
>
>> On Wed, Nov 23, 2016 at 07:52:51PM +0100, Martin Jansa wrote:
>>
>>> On Wed, Nov 23, 2016 at 04:43:46PM +0100, Martin Jansa wrote:
>>>
>>>> On Wed, Nov 23, 2016 at 04:29:41PM +0100, Martin Jansa wrote:
>>>>
>>>>> On Fri, Nov 18, 2016 at 09:48:54AM +0200, Samuli Piippo wrote:
>>>>>
>>>>>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>>>>>> the contents of an environment value when qmake is run instead of when
>>>>>> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>>>>>> for qmake to find them. configure's setBootstrapVariable function
>>>>>> needs
>>>>>> to change $$(..) to normal $(...) operator to work with qmake's
>>>>>> Makefile.
>>>>>>
>>>>>> qt.conf generation for qtbase recipes is not needed, as configure will
>>>>>> generate its own version based on configure arguments. Skip running
>>>>>> qmake, since configure is now automatically invoked when it's run in
>>>>>> qtbase's root folder.
>>>>>>
>>>>>> Update PACKAGECONFIGs for qtbase to match current configure options.
>>>>>>
>>>>>> Merge the two qtwayland recipes to one that supports all three targets
>>>>>> (target, native, nativesdk) without need for additional patch.
>>>>>>
>>>>>> Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
>>>>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>>>>> ---
>>>>>>
>>>>> ...
>>>>
>>>>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>>>>>> index e1e25ba..a1dd16a 100644
>>>>>> --- a/recipes-qt/qt5/qt5-git.inc
>>>>>> +++ b/recipes-qt/qt5/qt5-git.inc
>>>>>> @@ -2,7 +2,7 @@
>>>>>>  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
>>>>>>
>>>>>>  QT_MODULE ?= "${BPN}"
>>>>>> -QT_MODULE_BRANCH ?= "5.7"
>>>>>> +QT_MODULE_BRANCH ?= "5.8"
>>>>>>  QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
>>>>>>
>>>>>>  # each module needs to define valid SRCREV
>>>>>> @@ -12,4 +12,4 @@ SRC_URI = " \
>>>>>>
>>>>>>  S = "${WORKDIR}/git"
>>>>>>
>>>>>> -PV = "5.7.0+git${SRCPV}"
>>>>>> +PV = "5.8.0+git${SRCPV}"
>>>>>>
>>>>>
>>>>> This version is wrong as 5.8.0 wasn't released yet (was it?), so this
>>>>> PV
>>>>> shouldn't sort higher then 5.8.0 release.
>>>>>
>>>>> I'll change it to:
>>>>> 5.7.99+5.8.0-beta+git${SRCPV}
>>>>> like I did in previous releases.
>>>>>
>>>>
> Yes, it's still in beta stage.
>
>
>>>> There is also some issue with qtwayland and qtenginio reported in:
>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2
>>>> 016-November/110021.html
>>>>
>>>> I'm trying to reproduce it with only oe-core+meta-qt5, because the
>>>> qtwayland
>>>> one might be caused by bbappend in meta-luneui, but qtenginio might be
>>>> easier to reproduce.
>>>>
>>>
> Enginio examples are broken, as there are new checks in Qt 5.8.
> Enginio is deprecated and won't be receiving much attention any more, but
> build can be fixed easily with:
> EXTRA_QMAKEVARS_PRE += "CONFIG+=install_ok"
>
>
>
>>> Local build confirmed that qtwayland issue was caused by that bbappend,
>>> but qtenginio error is still there and I've also noticed that with:
>>>
>>> PACKAGECONFIG_append_pn-qtbase = " icu gl accessibility directfb
>>> examples kms"
>>> PACKAGECONFIG_remove_pn-qtbase = "gl"
>>>
>>> qtbase.do_compile fails with:
>>> http://errors.yoctoproject.org/Errors/Details/107134/
>>> and this configuration was working with 5.7 version, is directfb
>>> unsupported now in 5.8 or does it just need some tweaks in qtbase
>>> PACKAGECONFIGs?
>>>
>>
>> directfb_egl was introduced to qtConfig in:
>>
>> commit 60985aa42b37217fb4c01ed85bbf6f14410c3491
>> Author: Lars Knoll <lars.knoll@qt.io>
>> Date:   Fri Aug 5 13:35:39 2016 +0200
>>
>>     Use qtConfig throughout in qtbase
>>
>> ...
>>
>> index d4977bf..de0344f 100644
>> --- a/src/plugins/platforms/directfb/directfb.pro
>> +++ b/src/plugins/platforms/directfb/directfb.pro
>> @@ -24,7 +24,7 @@ HEADERS = qdirectfbintegration.h \
>>      qdirectfbeglhooks.h
>>
>>  # ### port the GL context
>> -contains(QT_CONFIG, directfb_egl) {
>> +qtConfig(directfb_egl) {
>>      HEADERS += qdirectfb_egl.h
>>      SOURCES += qdirectfb_egl.cpp
>>      DEFINES += DIRECTFB_GL_EGL
>>
>>
>> But there is no directfb_egl in src/gui/configure.json
>>
>>
> I'm not sure what's the actual status of DirectFB within Qt is, but it's
> not actively developed or tested at all, and it's currently broken as you
> found out.
> I created bug for Qt for this: https://bugreports.qt.io/browse/QTBUG-57306
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

