Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6004371B2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 02:17:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id m5so2902286pff.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 18:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aG21b7T747hvyNRczxiIacUmAhzf9O6ewBy8R7cq1Jk=;
	b=hNkJQtgfyA0SSfn9H+e0VULfjBa64Kc04HGYQG/QyrGOzddNGdlrmYusVAoFen84tl
	L1xSisKp4iZPVxhDF0HHbsK4FOHr2KaGbh83rLNv1H9hH4uCuro0kWJ5cKP7QDzL7+pQ
	E016GmPhads+HpxC1hn0PynE2o7ZWj7fqM0MDVTB83y5neh30v2TNqZTNWPYcX+zd8YP
	SfGfxYUaTlwmjjQ8wPQ4TlaklaEZpn8h4Ye79+u5yzdGe8BYlbmBLHaEAvxoLcW/Id43
	KoNQuGRq8q2LgFjmR7it0KsFOr2EL5DBVO/zPcfRlAMndFHaM6Y1AlHcWe46hwNBggZ0
	rvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aG21b7T747hvyNRczxiIacUmAhzf9O6ewBy8R7cq1Jk=;
	b=StWkP5xGLzPZC78uBmyuQHz2GZj2Z3cidWB3ptLR4DfIdloqxZk9hH3dy7FsSQVSCh
	kjsvOs6Jp6MZNlvk/Y9dG/pb4z5bHQCN+EwMoyiFKqyYfBARPZmXv0PfFwbNb6xoZrY3
	r8CO6176gO2Iv/3QuDKw7f3d3QndoEJLKzdTpedw0eL2OIuI5HQw65WumQszI+R3R61f
	3cOxrqqK1D7eBRfz0BdifDX6Ycuj3z6knUauK5aVLLS6aC7CZktlX4n5AbsCjZu666vq
	prFPHxTP10QXV0oBBXS43vx9uW3ucMD4oCVszsmdIkc8W+V8bUQ5Q48+SFcfhCKixtrz
	XZBA==
X-Gm-Message-State: APf1xPDE7vgiPZ9VNry+5tFFAjKq4ueaPxIh+KNipp4OjygZbFQfi8sr
	4mpUpNxRa59d/hdDMeshYkld+z0VthuXGkQQalY=
X-Google-Smtp-Source: AH8x225o1E9S8ANacjmMFTuzIwa2Deie/mVCtI/PDPF4HUH1ZYOG9UgQq34u+zMA/nrhus3Eftqf8isl3j3oOWx4S/w=
X-Received: by 10.99.172.2 with SMTP id v2mr109157pge.204.1519352279334; Thu,
	22 Feb 2018 18:17:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Thu, 22 Feb 2018 18:17:28 -0800 (PST)
In-Reply-To: <20180223012757.GA1413@jama>
References: <20180222042940.3770-1-raj.khem@gmail.com>
	<20180222042940.3770-2-raj.khem@gmail.com>
	<20180223012757.GA1413@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Feb 2018 18:17:28 -0800
Message-ID: <CAMKF1soxS4aUMzd5d+uiHvnEjFEh5vyUvZcGQ_9CUdNugb7LvQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: Add packageconfigs for renameat2 and getentropy use
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
X-List-Received-Date: Fri, 23 Feb 2018 02:17:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 22, 2018 at 5:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Feb 21, 2018 at 08:29:40PM -0800, Khem Raj wrote:
>> These features depend on underlying syscall support in kernel
>> and if older kernels are in use, then we can have a knob to
>> turn them off.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-qt/qt5/qtbase_git.bb | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index e495b8c..843648f 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -71,7 +71,7 @@ PACKAGECONFIG_DISTRO ?= ""
>>  PACKAGECONFIG_RELEASE ?= "release"
>>  # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
>>  # PACKAGECONFIG_OPENSSL ?= "openssl"
>> -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
>> +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests renameat2 getentropy"
>
> Should renameat2 be enabled by default?
>
> Either the test for it is broken in 5.11 or it's not available in
> default setup.
>

Its ok to keep them enabled by default. but I think this is a bug that
should be reported
to upstream QT, if the feature is knobbale then it should have worked.

