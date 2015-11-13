Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 69A73772E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:53:03 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so12077411igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dQQ+IEGzkBHFATYYHELc25u1zDUxU/xiS6CjEJqf/5U=;
	b=R+my/taeikAxxQQbO5Ypq69XL9V5Uhu2ofL1JDDXsTy2eU3Yu23xl7G3uM+b5K4jgu
	KSvJB+/eQiIFxw7NCK57IL/EtuUseFd8Y8sHXd7FP6qlMez4CuGY/1AeWSwBD8Vtkr97
	liXUKVSdARgLQJbwB3bjrw5arb777PTfvurtKINrocoIcAQfdtawlwYqz0mTHj1k+C0m
	xY3Njs3Hlc7Hj+2zUyCCrQ1Zm0dCdlp6X+kmEHG0cfWcKuSfq5xm+Q06DWDPwPCDxAzl
	Bm/acLfZHR51Jz9bSb/9APcDSk8mMRZJs4fw1SwMfXJKQg/shhoMjBjXKLx7q+BQkqo6
	DKRQ==
MIME-Version: 1.0
X-Received: by 10.50.66.141 with SMTP id f13mr2465165igt.51.1447411984114;
	Fri, 13 Nov 2015 02:53:04 -0800 (PST)
Received: by 10.36.70.19 with HTTP; Fri, 13 Nov 2015 02:53:04 -0800 (PST)
In-Reply-To: <5645C04A.70900@windriver.com>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
	<CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
	<5645BD22.7030105@windriver.com> <5645C04A.70900@windriver.com>
Date: Fri, 13 Nov 2015 11:53:04 +0100
Message-ID: <CALbNGRSEf0GKr9VArkpiVZbz_Se-yxnDjyvb4ibcEy55jm+xOw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] meta-xfce/layer: explicitly set networkmanager to NETWORK_MANAGER
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
X-List-Received-Date: Fri, 13 Nov 2015 10:53:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 11:49 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 11/13/2015 06:36 PM, Hongxu Jia wrote:
>>
>> On 11/13/2015 06:19 PM, Martin Jansa wrote:
>>
>>> Why not use VIRTUAL-RUNTIME variable like in other places?
>>
>>
>
> Hi Martin,
>
> With more investigation, I am afraid it looks not good to rename
> NETWORK_MANAGER in
> oe-core:
> In meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> ......
> NETWORK_MANAGER ?= "connman-gnome"
> NETWORK_MANAGER_libc-uclibc = ""
> RDEPENDS_${PN}-base = "\
> ...
>     ${NETWORK_MANAGER} \
> ......
>
> If we name them with VIRTUAL-RUNTIME_networkmanager to replace, we have like
> this
> ......
> VIRTUAL-RUNTIME_networkmanager ?= "connman-gnome"
> VIRTUAL-RUNTIME_networkmanager_libc-uclibc = ""
> RDEPENDS_${PN}-base = "\
> ...
>     ${VIRTUAL-RUNTIME_networkmanager} \
> ......
>
> It looks too many overrides, do you have any suggestions?

Suggestion: read my previous mail :)

Andreas

