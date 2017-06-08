Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 619EF781F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:53:55 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id l75so12357755ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Zf031yqog1u+3AsWnp4nLARLSWGIwH7gzGdzPuGBmM=;
	b=kr80ZuGP8CfsT5O4BqSVtVMM4/rNCVigoyOs0cHDv80xPONfpBs05uDQnnVJ5AfiZV
	ztLZS33DuDAK2DRrAvCWOA9Eg6yUGkXMn0JU+01YCxJPgHv7P1xpx4nUBXNQGU653ZW6
	upiYeRjiO2U3ExZOjRfen/gQN94/lghHUPyBe/WkLK4tJGsM2QDd9TpvvapuxwrzH8YM
	jXJA9qVIlV5QzXPaVQm/K7CXFNbWBo5oRZtK2cjlmZR3w8k8Xk/7TvSuAMzokXhr7F35
	nYrKQu4cPT0YPSbL/ieHh7DUysEZ00vriKIO7UBGprWyM3jKynkSPRMYLo7/lsIJeuMG
	MSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Zf031yqog1u+3AsWnp4nLARLSWGIwH7gzGdzPuGBmM=;
	b=Y1Z4+ib6VvFrptvE32o3W0xKpbqRZmY0aEh9aEW4tPUinKpkGNW63zfj3Nvz5gR3GT
	dilClNk9nG6YzwSm2WOTndAKCPg/kZPY3HTsta/d9HJ8KtHBuWJS6pb6kzBOdUUm+uuE
	KQSvrrlxmx8K5fo4dwQvTZRHF17Y9WQhC4CZ1hMWpEYPI93C4USiC3uBEr8D9v3+wyQq
	cM7AxGM3vXUTV5EEmYZC21IpCIEA3ysnORQbuKByMUTqmQYUuJs5jf9t8oDXWnJRXZrc
	XkMnePpD5tWUDctveWsuHux0khxyCWOfwDFjFmq2NpE0Gr2O9e+lir7t2J3o1FRHctV0
	PjNw==
X-Gm-Message-State: AODbwcCzJHhGt6ixKMOSrsxZwMif4PRbelQ+E2S7c5yWt9iazGgpCf/i
	cHIo3LxlR+jFSR8ctouDxm/GI9qO8A==
X-Received: by 10.129.55.14 with SMTP id e14mr10727977ywa.33.1496926436278;
	Thu, 08 Jun 2017 05:53:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 8 Jun 2017 05:53:55 -0700 (PDT)
In-Reply-To: <91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Jun 2017 14:53:55 +0200
Message-ID: <CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 08 Jun 2017 12:53:55 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, will include v3 in next build.

Full report with v2 included:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113073.html

There is another issue in qtwebview, which should have the same restriction
as qtwebengine otherwise for qemuarm it causes:

    * ERROR: Nothing PROVIDES 'qtwebengine' (but
/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtwebview_git.bb
DEPENDS on or otherwise requires it)
    * ERROR: qtwebengine was skipped: incompatible with machine
qemuarm (not in COMPATIBLE_MACHINE)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.



On Thu, Jun 8, 2017 at 2:47 PM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> Patch updated to fix build issues with qtlocation and qtremoteobjects
>
> On 08.06.2017 15:30, Samuli Piippo wrote:
>
>> * adapt QtWebEngine recipe to use GN instead of GYP
>> * add QtRemoteObjects and QtWebView as a new Qt modules
>> * update available QtBase configure arguments
>> * remove obsolete patches
>> * patch all .pc files to remove build paths
>> * include generated QML cache files in packages
>> * the patch "configure paths for target qmake properly" could not
>>    be applied anymore and support must be done differently
>>
>> * QtWebEngine now requires gcc-multilib to be installed
>>    on the host system
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

