Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC266E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:30:07 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 30so9289788lfy.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=MO/yLOUMB3PG2jCE1+dnscHI//9wjApBl+dyQ39S66w=;
	b=kYZv5XvHm7B332e38bb71iBdVEmbuOqVFxG+SO5BxtaoQlleLXXjc/0c5jX3/cT+3L
	BPQ28Mc4vrGbMsHYAKVJTvTT89SYmMxz9HCl0Zw3aqsHVmcQMtKYbLXVDoupRAtc5H1T
	Li4Rys3xIC2VkYJpPd7cqo8knJ2vA+sulcwLCtep/kjjkEFqzlP/Xvj8az0h0zWouF5Y
	Q7eobyp+9njO4FlPWeJbJj1BzWNVisK1qmXj8yx+mSHG09vCuCHVrIBJE1nNp1vtTJHe
	stB3nRqasB+1S1b5HXfVUwwxZm8oaa6LESNrMUd00bQg+h7/Qq+sOGAJjRr91Nu9uiTe
	bCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=MO/yLOUMB3PG2jCE1+dnscHI//9wjApBl+dyQ39S66w=;
	b=r9GSIcPXkCdvp2zaKgRb1oFtvSQSvhzIU7y38hAV7t/7sQqOKDN1YLR2Y/cu2JL3mo
	9Jg+9bIWqOzWb3tqxPWKZvy5skHnPt+P6gEtudtxAvrGFOPCz21Sv7eJGkqwKD9uWGmj
	icB3KCbkGkRdkq1PHXMeCLZo1sauqm0QABYQuxdZcz3f4nzt2w8hlcIBVLLQevBHofxU
	yeurBqVJwphIzfZDHm4stBWQNSByM21tDOS9ZYTUnnVJI6datYt0EnPDD+kTkfUbOG1Q
	e/9gOU0pq7x8KtS+hhUZwaBBnonNSqJ1E3C3UvZxFRsTG2Eq5G30XPNYis2Bm3vvBdk6
	XNyg==
X-Gm-Message-State: AIkVDXKCNXGcFY7C44rTQSWL+5pXl2Eg4Qg3QtJw0ohUpul9mij4x3S8R2apIlVo/WAaCQ==
X-Received: by 10.46.5.215 with SMTP id 206mr10560216ljf.17.1482247807734;
	Tue, 20 Dec 2016 07:30:07 -0800 (PST)
Received: from [10.9.21.21] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	h35sm4863132lji.29.2016.12.20.07.30.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 07:30:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
	<2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
	<20161220150507.GH3275@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <bc4be429-a64c-ba6d-163b-79c791fa7dfe@gmail.com>
Date: Tue, 20 Dec 2016 17:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161220150507.GH3275@jama>
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Tue, 20 Dec 2016 15:30:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 20.12.2016 17:05, Martin Jansa wrote:
> On Tue, Dec 20, 2016 at 04:58:49PM +0200, Samuli Piippo wrote:
>> On 20.12.2016 16:30, Martin Jansa wrote:
>>> On Thu, Dec 15, 2016 at 04:49:55PM +0200, Samuli Piippo wrote:
>>>> Changes from v3 patch:
>>>> - sha1s updated to expected RC content
>>>> - fixed the qt3d assimp build-deps issue
>>>> - the new Qt configuration system taken into use where applicable
>>>>
>>>> webengine build problem with x86_64 host and x86 target is still there.
>>>
>>> This version seems to fail in qtwayland:
>>>
>>> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20161218_140914.log//2_max/failed/qtwayland.log
>>>
>>> | ERROR: Feature 'xcomposite-glx' was enabled, but the pre-condition
>>> 'features.wayland-client && features.opengl && !features.opengles2 &&
>>> libs.xcomposite && libs.glx' failed.
>>
>> What kind of configuration is used for qtbase?
>> To me it seems that one of these checks fail: features.opengl &&
>> !features.opengles2
>
> The same as when building previous version of this patch.
>
> on top of meta-qt5 default there is:
>
> PACKAGECONFIG_GL = "gles2 eglfs"

The gles2 here causes the failure, since xcomposite-glx checks for 
"!features.opengles2"
This makes sense since you want to have desktop opengl enabled together 
with wayland GLX.

> PACKAGECONFIG_DISTRO = "sql-sqlite icu glib accessibility mtdev examples
> fontconfig"
>
> QT_CONFIG_FLAGS += "-qpa wayland-egl"
>
> from meta-luneui/recipes-qt/qt5/qtbase_git.bbappend
>
> and
> PACKAGECONFIG_append_pn-qtbase = " freetype fontconfig"
> from world_fixes.inc
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20161217_135213.log/world_fixes.inc
>>
>>>
>>> Is the configure more strict in new version or do we need to change the
>>> default config for qtwayland builds?
>>>
>>>>
>>>> -samuli
>>>>
>>>> On 15.12.2016 15:48, Samuli Piippo wrote:
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
>>>>> The new Qt configuration system [1] can be used with a new variable
>>>>> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
>>>>> arguments.
>>>>>
>>>>> Merge the two qtwayland recipes to one that supports all three targets
>>>>> (target, native, nativesdk) without need for additional patch.
>>>>>
>>>>> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

