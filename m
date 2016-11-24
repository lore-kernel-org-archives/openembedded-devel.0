Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA3BD719A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 08:23:03 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id o20so1503919lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=OjPb6ku8ndt0Bdr3Wv6GRzj3KDkJkFHqW9iNS/u6gZ4=;
	b=G15H1Oqva1HxkO7SNMfSAbddgeEXIkL7C9BgTF00fEXiCMiDprBkTVfTPToaqnPYGF
	fyHe6VBYX2ZL0IXGs+swgyB2zeyX6MgAsXGvnW2hY8h4LaR3FjeinPjiMlG11ocMBJOy
	MAC9NjAiFjF+LGr3tBBWvDZXZcNpvl8WZiuVvWoXpZo9zxPRQ8C/o7NTeZWgOjYK1iwk
	yY+4DuC40ne4sYj14LiJ8fN5pH9iPTv4axwG16FI5fCgAVBcF1mzcZiXysd3Da/DUJHc
	k6p3sSACzf34WoP3XIjMaDjsmoBS9ZJTMLcp8US5YiCIQHo4caI1CTOKU1Im/8IcNwB9
	45Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=OjPb6ku8ndt0Bdr3Wv6GRzj3KDkJkFHqW9iNS/u6gZ4=;
	b=Pvl+hoxqLI1PeW5b2ffbNRggemYD0sJa9CPV9+wQW86jn6eITqHIt4YcWXyP9fXDrk
	FpzS2If7r1Wx+0TU7NH6zJQXo1hDL3qO4ru26pPHeQd4/WVnAUzALI33nkB5MU7gnRKF
	TTqaTTcCEqfMiGFXV/SZMLFNAl87ZEA8Uf134+gSpifNwRMXjFNEqcWuH1FkMN3sE0uC
	4XhiW9dXod0IQBqheX1WNUcv2fl+zwn7w0/lY9IaBlDOLoYpdaqxdQHn8KLgRj2DnIbs
	YQIrb1ViVtsIH2vBRCyLcxtymqiUUG+wRYtcqx6f9SQ8YZjcI9adnPYsLf6cm01Xpd8o
	/sOg==
X-Gm-Message-State: AKaTC00TePXqyzWYIY9ekpysSE21E55l1tc/6H7FakvVUEbFVXETJBlBcE+Q4g8FPky2SA==
X-Received: by 10.25.17.207 with SMTP id 76mr454714lfr.93.1479975784101;
	Thu, 24 Nov 2016 00:23:04 -0800 (PST)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	z1sm7974164lja.27.2016.11.24.00.23.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 00:23:03 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1479455334-21184-1-git-send-email-samuli.piippo@qt.io>
	<20161123152941.GC3265@jama> <20161123154346.GD3265@jama>
	<20161123185251.GG3265@jama> <20161123201431.GI3265@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <02f7b3e7-93d4-58ae-ebd8-f54fe5781ce1@gmail.com>
Date: Thu, 24 Nov 2016 10:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161123201431.GI3265@jama>
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
X-List-Received-Date: Thu, 24 Nov 2016 08:23:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 23.11.2016 22:14, Martin Jansa wrote:
> On Wed, Nov 23, 2016 at 07:52:51PM +0100, Martin Jansa wrote:
>> On Wed, Nov 23, 2016 at 04:43:46PM +0100, Martin Jansa wrote:
>>> On Wed, Nov 23, 2016 at 04:29:41PM +0100, Martin Jansa wrote:
>>>> On Fri, Nov 18, 2016 at 09:48:54AM +0200, Samuli Piippo wrote:
>>>>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>>>>> the contents of an environment value when qmake is run instead of when
>>>>> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>>>>> for qmake to find them. configure's setBootstrapVariable function needs
>>>>> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>>>>>
>>>>> qt.conf generation for qtbase recipes is not needed, as configure will
>>>>> generate its own version based on configure arguments. Skip running
>>>>> qmake, since configure is now automatically invoked when it's run in
>>>>> qtbase's root folder.
>>>>>
>>>>> Update PACKAGECONFIGs for qtbase to match current configure options.
>>>>>
>>>>> Merge the two qtwayland recipes to one that supports all three targets
>>>>> (target, native, nativesdk) without need for additional patch.
>>>>>
>>>>> Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
>>>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>>>> ---
>>> ...
>>>>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>>>>> index e1e25ba..a1dd16a 100644
>>>>> --- a/recipes-qt/qt5/qt5-git.inc
>>>>> +++ b/recipes-qt/qt5/qt5-git.inc
>>>>> @@ -2,7 +2,7 @@
>>>>>  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
>>>>>
>>>>>  QT_MODULE ?= "${BPN}"
>>>>> -QT_MODULE_BRANCH ?= "5.7"
>>>>> +QT_MODULE_BRANCH ?= "5.8"
>>>>>  QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
>>>>>
>>>>>  # each module needs to define valid SRCREV
>>>>> @@ -12,4 +12,4 @@ SRC_URI = " \
>>>>>
>>>>>  S = "${WORKDIR}/git"
>>>>>
>>>>> -PV = "5.7.0+git${SRCPV}"
>>>>> +PV = "5.8.0+git${SRCPV}"
>>>>
>>>> This version is wrong as 5.8.0 wasn't released yet (was it?), so this PV
>>>> shouldn't sort higher then 5.8.0 release.
>>>>
>>>> I'll change it to:
>>>> 5.7.99+5.8.0-beta+git${SRCPV}
>>>> like I did in previous releases.

Yes, it's still in beta stage.

>>>
>>> There is also some issue with qtwayland and qtenginio reported in:
>>> http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/110021.html
>>>
>>> I'm trying to reproduce it with only oe-core+meta-qt5, because the qtwayland
>>> one might be caused by bbappend in meta-luneui, but qtenginio might be
>>> easier to reproduce.

Enginio examples are broken, as there are new checks in Qt 5.8.
Enginio is deprecated and won't be receiving much attention any more, 
but build can be fixed easily with:
EXTRA_QMAKEVARS_PRE += "CONFIG+=install_ok"

>>
>> Local build confirmed that qtwayland issue was caused by that bbappend,
>> but qtenginio error is still there and I've also noticed that with:
>>
>> PACKAGECONFIG_append_pn-qtbase = " icu gl accessibility directfb examples kms"
>> PACKAGECONFIG_remove_pn-qtbase = "gl"
>>
>> qtbase.do_compile fails with:
>> http://errors.yoctoproject.org/Errors/Details/107134/
>> and this configuration was working with 5.7 version, is directfb
>> unsupported now in 5.8 or does it just need some tweaks in qtbase
>> PACKAGECONFIGs?
>
> directfb_egl was introduced to qtConfig in:
>
> commit 60985aa42b37217fb4c01ed85bbf6f14410c3491
> Author: Lars Knoll <lars.knoll@qt.io>
> Date:   Fri Aug 5 13:35:39 2016 +0200
>
>     Use qtConfig throughout in qtbase
>
> ...
>
> index d4977bf..de0344f 100644
> --- a/src/plugins/platforms/directfb/directfb.pro
> +++ b/src/plugins/platforms/directfb/directfb.pro
> @@ -24,7 +24,7 @@ HEADERS = qdirectfbintegration.h \
>      qdirectfbeglhooks.h
>
>  # ### port the GL context
> -contains(QT_CONFIG, directfb_egl) {
> +qtConfig(directfb_egl) {
>      HEADERS += qdirectfb_egl.h
>      SOURCES += qdirectfb_egl.cpp
>      DEFINES += DIRECTFB_GL_EGL
>
>
> But there is no directfb_egl in src/gui/configure.json
>

I'm not sure what's the actual status of DirectFB within Qt is, but it's 
not actively developed or tested at all, and it's currently broken as 
you found out.
I created bug for Qt for this: https://bugreports.qt.io/browse/QTBUG-57306

