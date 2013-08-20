Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id F098161883
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 09:37:34 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id v1so302517lbd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aDADzILLeswRferZmOW9o5Vh4fK/PJwCiitF8QZsBJc=;
	b=vn6LQRse9DC8MgluKisz0mLQqRvg2fk+rbST8+bkjOQHoR8KbONze6hW0bEq9Txo7n
	LSQfD+Hq5yILIxhkyIUhWCFMdri+jQDMU8saiaqjjd8ghiGFmNXX9/o3/ryBnVT0ReiT
	KV0Vw+YHciRyegbEGg+B9PbmWVwQ/JhE0XXQn9swlxuC5AQcfP4X1FxxkOlAXEtUVkGR
	lI9ZDjX5tMPyi63TlHU1iLIOsD7WtbpIUdynq1mt4ZaxJjujLHqVLs5N/eBiW4DtBsya
	3dRXtBYxNP9UZHSyMQF5NKgxHvDD8laIIP7IUtzG8bN5Sy27puQMwocvH8oZkdFSYP1Y
	ZifA==
MIME-Version: 1.0
X-Received: by 10.152.8.115 with SMTP id q19mr549665laa.16.1376991454985; Tue,
	20 Aug 2013 02:37:34 -0700 (PDT)
Received: by 10.112.69.171 with HTTP; Tue, 20 Aug 2013 02:37:34 -0700 (PDT)
In-Reply-To: <52132F2A.2020305@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
	<CAGNsrLDyg3Rq0Gk+sG8Vp4y0i+=me2eTjadW2tt4dyU_qU0_cw@mail.gmail.com>
	<5211762A.3020201@windriver.com>
	<CAJTo0LYFNSGhEjjMLTO4zTSTMXQC+vnxada0nb+EaVWWnn9Rxw@mail.gmail.com>
	<52132F2A.2020305@windriver.com>
Date: Tue, 20 Aug 2013 11:37:34 +0200
Message-ID: <CAAQYJAu8asnA-_5G3ucBMK7FFX7ShF0u_cDO5WP=3tJy5x3Ugw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Tue, 20 Aug 2013 09:37:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 10:56 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 08/20/2013 04:36 PM, Burton, Ross wrote:
>>
>> Hi,
>>
>> On 19 August 2013 02:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>
>>> gitpkgv.bbclass is in meta-oe.
>>>
>> Is this the only part of meta-oe that meta-filesystems needs?  If it's
>> genuinely useful should we this be considered for oe-core?
>
> I am afraid not, libimobiledevice and samba are in meta-oe,
> and they are needed by meta-filesystems.
>
> ./recipes-filesystems/ifuse/ifuse_1.1.2.bb:6:DEPENDS = "fuse
> libimobiledevice"
> ./recipes-filesystems/smbnetfs/smbnetfs_git.bb:6:DEPENDS = "fuse samba"
>
>
>> (layers that depend on meta-oe bother me, especially when they depend on
>> just a tiny fraction of it)
>>
>> Ross


Right, it should be avoided,
see for example the case of cramfs needing two extra layers for no
particular reason...
I'm still of the opinion some should be moved to oe-core, at least the
ones involved in image creation.

Cheers

Andrea


>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

