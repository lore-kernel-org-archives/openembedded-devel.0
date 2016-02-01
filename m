Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 28258770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 11:14:28 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 65so82218001pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 03:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=ZSh1G+rztrzNysKeiR/MSSLlmWgd0kabge8jvEkgEZo=;
	b=b52qOaiV/OAVr0kWCJpWK9mO9G8DNQ2MkR+suuVmZ2Ny1sG4lShvOCa8Qe78Ue4I7V
	zFSF++kW4oon/1mOJNPORJLg2EJ6atLUfdxBl7cZXPupRE9EB8IkTpcIWnGesZMqGfGu
	aayAD5+QcTLp8EOiGC8VVR5VLvTt+yy65rv5jw9CoLtAe1/Tc/cHcYidf2aPqhwwkm2q
	zl6uK2getKfPW+W8kkkcCY6wXj32lUPjFCx4Bi7uMXumBdmfkLZzBy75DWjNgzvE9I7q
	fOPqWdgNvWBkKurMCrf0FkqERz8c5TkYVOSIvhihkGPXQPamS90+mSUbTVPN1UtWoYp1
	0MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ZSh1G+rztrzNysKeiR/MSSLlmWgd0kabge8jvEkgEZo=;
	b=ho4OpkZlldNBhW+Tufl21b5RoZBgc0yPUDOE37QAWz+duzYXDoNuhy2e4jVVmqZyGe
	x6OrQHVr67f++cs1Oww28VVMu1ncrHbxzxyUl31zE0y/YXnBME2K+tJ122VGVeVaGwKA
	CO6nwKCp9c4Aiz0m78dRkqyXFuwcGNtk97kemfQw10x5AoGEBbRSwi8miWCRx+YDDcEY
	m8j6Iu0r8No8Y/mbRt3Fg7VDZPhYXpXok2oSSz5bwUc4GPM+jZULAHmVi3duGC7IOvv3
	BSRfqrpUTo2VM7EYmqtgMDeF+bZla1NdCVO11L5qyavszDAS02sS2y6hCzh4bS8H9q/J
	fH5g==
X-Gm-Message-State: AG10YOSXHOqfSbgAGzRo8BlMhhmhZw3S2HTFD39F/8VE61V+3FImYyeSwvw3pQFbCHyTAQ==
X-Received: by 10.98.89.4 with SMTP id n4mr19332337pfb.81.1454325268693;
	Mon, 01 Feb 2016 03:14:28 -0800 (PST)
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com.
	[209.85.220.43]) by smtp.gmail.com with ESMTPSA id
	w12sm15885193pfa.79.2016.02.01.03.14.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 03:14:26 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f43.google.com with SMTP id yy13so80441558pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 03:14:26 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.122.97 with SMTP id lr1mr37091105pab.68.1454325266259;
	Mon, 01 Feb 2016 03:14:26 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 1 Feb 2016 03:14:26 -0800 (PST)
In-Reply-To: <56AF3715.3010402@theqtcompany.com>
References: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
	<56AF3715.3010402@theqtcompany.com>
Date: Mon, 1 Feb 2016 09:14:26 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqVJez0K=6rGfAK3OUgqdSEO4PmzVhFjnjG94WMuhvXsA@mail.gmail.com>
Message-ID: <CAP9ODKqVJez0K=6rGfAK3OUgqdSEO4PmzVhFjnjG94WMuhvXsA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [meta-qt5][PATCH] qtwebengine: build examples by default
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
X-List-Received-Date: Mon, 01 Feb 2016 11:14:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 8:44 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> On 30.01.2016 16:13, Otavio Salvador wrote:
>>
>> On Wed, Jan 27, 2016 at 12:58 PM, Manuel Bachmann
>> <manuel.bachmann@iot.bzh> wrote:
>>>
>>> From: Manuel Bachmann <mbc@iot.bzh>
>>>
>>> Just as we do for qtwebkit, let us have a patch to build
>>> qtwebengine examples by default.
>>>
>>> Otherwise, the "qtwebengine-examples" package will be
>>> empty, and attempting to add it with "IMAGE_INSTALL_append"
>>> will result in an error message.
>>>
>>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>>
>>
>> This should be a distro option and not enabled for everyone.
>>
>
> Also there is no need to do this with a patch, same result is achieved with:
>
> EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=examples"
>
> Maybe this could be added to qt5.inc as a PACKAGECONFIG option?
> This would allow easily enable examples on any qt module.

It is:

https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase_git.bb#L67

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

