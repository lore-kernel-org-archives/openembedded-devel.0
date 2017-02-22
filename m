Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 30F6E731E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:50:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 134so654879wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ySMq1th+6IMHoj2AMG0zLrFnrbOyOs9847+MvINJrNg=;
	b=DWnXlOai1pMvzuvIVAtk3zJpF5pijniEE49HL2tPcIryyua1kStPvMEjZcg6DxWkYk
	Y35D8Mm+gsjkvm7W2p/1ug+JgnJ4S47QufcUao1PcYXMeeAEsPWFyx7Tl86ektF0NDp3
	rvc3CdiEdWdc44kgg/ty2SN+0ey1o5XSUrkERMwzBvpkRnRRuklOQI/mDCAGrOClKcS8
	8ZojoMUABZRmENscDnl5F2FJLA7k9yBQJkFVgYGr30e3S+hVpawMikoALzS2paweXu3H
	/N2lIZNpuv48mxRd8oY9qCebeKv09t8SNQVWOdaFGtrJnHKYwtoCnJwLy95dnSnnvsVi
	BNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ySMq1th+6IMHoj2AMG0zLrFnrbOyOs9847+MvINJrNg=;
	b=k5DBdkz7pJAmJmoYpep42vcWb7xB3IMDUQ/IitO24aySgnu9FbgHYuS6/l4Wc0mf/q
	oB9nfTupnXjE4nrr4B6Ih9XXjY+C6E43+HQathi/W9wkX8PyIFXuOary9SWK0ErVfDf9
	TW7ryJTy+8T4GwHO1HrpepUIEjcqxPEYYK5yNNR/qNasOzCxtpaZu5Q76LLpBQwYQVkG
	bHLfbyxIeo6QlhoV0j53Rs8Ev3JrgsKAY+45XxEcJzh3wBAW5SVjxucVKb8rmsO+RV3v
	pgBnzst6/blQuuGfohhmvT60jutHb6xVkZ/jFNUawa/QOuZ1p0YHB5hrKDaAWl2QtvC7
	7caw==
X-Gm-Message-State: AMke39mS+NGqfMmRqPBGzVeNThAAE+W3ECcm6n1LTwASsZw7wUsnmdeupcJ/QgcJs5flciPL1CXa1rdIrt4/9A==
X-Received: by 10.28.96.130 with SMTP id u124mr3396984wmb.81.1487782250263;
	Wed, 22 Feb 2017 08:50:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Wed, 22 Feb 2017 08:50:49 -0800 (PST)
In-Reply-To: <eb0664e2-0745-dfa5-7c5d-8ced33e83b46@intel.com>
References: <1486559284-23081-1-git-send-email-amarnath.valluri@intel.com>
	<eb0664e2-0745-dfa5-7c5d-8ced33e83b46@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Feb 2017 17:50:49 +0100
Message-ID: <CA+chaQfZej7_bhk33yAOcrFdEeQAF3G5uvfkTF1eGJAXTJxJhw@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] libgphoto: Replace 'lib' with ${nonarch_base_libdir}
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
X-List-Received-Date: Wed, 22 Feb 2017 16:50:54 -0000
Content-Type: text/plain; charset=UTF-8

I don't see it in patchwork, please resend.

On Wed, Feb 22, 2017 at 4:02 PM, Amarnath Valluri <
amarnath.valluri@intel.com> wrote:

> ping - reminder request for feedback
>
> On 08.02.2017 15:08, Amarnath Valluri wrote:
>
>> Make use of bitbake variable for udev ruls folder. This change makes the
>> recipe
>> more portable.
>>
>> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
>> ---
>>   meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
>> b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
>> index 098da79..fa07cd3 100644
>> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
>> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
>> @@ -23,7 +23,7 @@ SRC_URI[libgphoto2.sha256sum] =
>> "031a262e342fae43f724afe66787947ce1fb483277dfe5a
>>     inherit autotools pkgconfig gettext lib_package
>>   -EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev
>> ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>> +EXTRA_OECONF = " --with-drivers=all udevscriptdir=${nonarch_base_libdir}/udev
>> ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>>     PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[gd] = ",--without-gdlib,gd"
>>
>
>

