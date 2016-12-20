Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id F3E62772E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:58:44 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id c13so77902194lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=X4rp4tolcevAU5WhKU0WFswCx7sfCNmafxY7n8mZd0M=;
	b=T0oxHqIZCd0tlETtr5+pNUTRa8JfhJd6lkMcEkF3mKjwbb+06C9nDNYaxyKgtm7sRR
	/Hcm6us2Oacnoiy7Pnf0qjieNr1tvzGMg5RQ2tGgt/JEb+yxVs6MiZ1kO0o3PL27CY1x
	QQ3+stw9Iqh7Dy9seW4Z4bg+iOw2bHA9VctrQhq5yy8zAuUrsFhkPBOazZePTt1dNx7c
	uMTLO5Yxq5ekLLeq2vgaR1hmqTkXiLzw+Bx7589D9crHFmO/cvyU9OdukSBJS82JW860
	gP2rbX7JfiZZHIizCgG/+PH3nKEUup0dvpF4B5Bm8X9nFqfNxdgJjmAI48AiFC5aMfDj
	vRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=X4rp4tolcevAU5WhKU0WFswCx7sfCNmafxY7n8mZd0M=;
	b=YB4BzBeB4njpN1f4RVkj8cgf61dWJH0IUAc4itm/GOgYUYnafN3nPaZiEBna86tSdl
	z7ASAdVC9IxGr9InsB3Kzi5zV4rkiENnjeU6f+EoMalrkgg+VhZoTQDorERHkXqG6N51
	EIctM+E+mLox+ROcpfZVPxpx4Uu08gDEnGiOXrG3AN4K2AGPuCJUL0nkQBoeBrCOnYeb
	4kMPCX7kiTIJ9yCPOM9TSgHvXzKRt/4X1WsYaCbK/Ddz9U6b/abMJkx76GeuL3BJLXls
	XZEAD5ym2luF6ekUYyha+uEi6JAZ6fIyXDmeSWEeaOwlUuGGQqHWpW79q+bUsO/7KZU3
	uLKw==
X-Gm-Message-State: AIkVDXIklTJIxfez07PqWG1NPgwXtODYtBx73bSt5wmhfBOULP47vT3ustXB/cLcyYjeYw==
X-Received: by 10.46.1.227 with SMTP id f96mr10550136lji.14.1482245925332;
	Tue, 20 Dec 2016 06:58:45 -0800 (PST)
Received: from [10.9.21.21] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	37sm2548829lfw.45.2016.12.20.06.58.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 06:58:44 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
	<20161220143047.GF3275@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <2c948f51-9a0d-e74d-e5bc-1bf581530c4e@gmail.com>
Date: Tue, 20 Dec 2016 16:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161220143047.GF3275@jama>
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
X-List-Received-Date: Tue, 20 Dec 2016 14:58:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 20.12.2016 16:30, Martin Jansa wrote:
> On Thu, Dec 15, 2016 at 04:49:55PM +0200, Samuli Piippo wrote:
>> Changes from v3 patch:
>> - sha1s updated to expected RC content
>> - fixed the qt3d assimp build-deps issue
>> - the new Qt configuration system taken into use where applicable
>>
>> webengine build problem with x86_64 host and x86 target is still there.
>
> This version seems to fail in qtwayland:
>
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20161218_140914.log//2_max/failed/qtwayland.log
>
> | ERROR: Feature 'xcomposite-glx' was enabled, but the pre-condition
> 'features.wayland-client && features.opengl && !features.opengles2 &&
> libs.xcomposite && libs.glx' failed.

What kind of configuration is used for qtbase?
To me it seems that one of these checks fail: features.opengl && 
!features.opengles2

>
> Is the configure more strict in new version or do we need to change the
> default config for qtwayland builds?
>
>>
>> -samuli
>>
>> On 15.12.2016 15:48, Samuli Piippo wrote:
>>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>>> the contents of an environment value when qmake is run instead of when
>>> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>>> for qmake to find them. configure's setBootstrapVariable function needs
>>> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>>>
>>> qt.conf generation for qtbase recipes is not needed, as configure will
>>> generate its own version based on configure arguments. Skip running
>>> qmake, since configure is now automatically invoked when it's run in
>>> qtbase's root folder.
>>>
>>> Update PACKAGECONFIGs for qtbase to match current configure options.
>>>
>>> The new Qt configuration system [1] can be used with a new variable
>>> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
>>> arguments.
>>>
>>> Merge the two qtwayland recipes to one that supports all three targets
>>> (target, native, nativesdk) without need for additional patch.
>>>
>>> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

