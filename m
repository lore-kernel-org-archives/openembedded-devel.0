Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3D48B78355
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 14:17:38 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id a41so28009695wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 06:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pO7rMRPk/uGA2Sf3BIxyr9RYeshEuiZyf+oXcrW0nxI=;
	b=HPG14bBMSUNo87M6TPPN9aeDdVmt168yHqjTICrQ/IZnFrBEzpkhisw4vrHkkjUFfW
	RIwBkyZMUi5sXPvZetjg84juIUymBIxlS6UySM+lwOWbkxZ6+VJ+D6absF0STx+/QBgc
	DNVTiqU0cvlaN9r2ogmVUY3k8QWWbekUgeSXe6Wt41vpq9VrRIVb8+R6A44ewhNDe3aU
	e3XDTfmpFtz6jfFuyVg9EII6HReaJDAjFS8N9zR3tZUsYh/05916EvfCkJZwHePm7ZoK
	wnap6U8XjTudiuqf7kD9eTmsgmN6fbgJpv5WlmHHrjjx8pvbludBXYvJobKCe4QPenby
	tRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pO7rMRPk/uGA2Sf3BIxyr9RYeshEuiZyf+oXcrW0nxI=;
	b=Mu1O+tgc5OCoTcFsTLLAuseYqsifA1Mt6/QTWNLHHRa/hsdPPv/Lvl5eHilh09YQyL
	1qi7I4+Y+eXMQrZXQSvEkOEPYdA6u17jhF3f467FE+6Dyr/kbzPZmn2qxjr4Mu2j+wE9
	qvIACsLno1wL6KmNgBOQda14XTzB+/EHm0AOUPp9jz1La7dTNgB4yB2Mn4f/S6+PXo7v
	oRUeNUGtOLAxAGZHuc/EQ0A9F0ZA9Y9GR74KggRa3W62sYQVpW6/ZOs/BoKkg15/tu+x
	JM00utuxcDaM+9AtJpulH9dDpLeym2XAGgAe3GVxam59PLc6MXN4SqFAwnkNWdr0iRGN
	u28w==
X-Gm-Message-State: AKGB3mLqQvlRF6awNfVxSmcQAAPHIgWW/s2dXIbBFWCLnN729IugdFFb
	LmJd4VNTu3mFyk/H6M0bWhsX2WTI59hmhkDYtB3ucw==
X-Google-Smtp-Source: ACJfBotzQZW5+/jnuPs7HVNo5mGi65LlCFhmsZ5ZuRFGQYF/1MiT7t9oHD6SrILN4XuRi8EVdB6cdHFweJc2dSGJ8ZM=
X-Received: by 10.223.167.70 with SMTP id e6mr14727898wrd.235.1513952259991;
	Fri, 22 Dec 2017 06:17:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.162.211 with HTTP; Fri, 22 Dec 2017 06:17:39 -0800 (PST)
In-Reply-To: <CAP9ODKriaPa3BsT8WnM8iG69m5aMvEf=0=iYKk0ngOndsu_43w@mail.gmail.com>
References: <CAPbeDCmTsCfrCAya_XQhN+Y5tKW7QnHQjeQThh6iT5ecneLEsw@mail.gmail.com>
	<CAPbeDC=7U8UMCzDnL2MoQW18JMDpLPBnSbHKf=mmOk0GnSiBKw@mail.gmail.com>
	<CAP9ODKriaPa3BsT8WnM8iG69m5aMvEf=0=iYKk0ngOndsu_43w@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Fri, 22 Dec 2017 15:17:39 +0100
Message-ID: <CAPbeDC=6wyEYz0GjekHoY=VzVsSqzV6DpHE7Opd5-yg8yrv9PQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] pyro, rocko and per-recipe sysroots
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
X-List-Received-Date: Fri, 22 Dec 2017 14:17:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Otavio,

On Fri, Dec 22, 2017 at 1:26 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Fri, Dec 22, 2017 at 7:30 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> Hi,
>>
>> On Fri, Dec 22, 2017 at 8:55 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>> Hi all,
>>>
>>> I'm trying to get a recent yocto build together with meta-java up and
>>> running, but ran into some problems:
>>>
>>> 1. For rocko, I don't see the corresponding branch in meta-java,
>>> should I use "master" ?
>>> 2. For pyro, there is a branch in meta-java, but the build fails
>>> unless I backport the patch in commit
>>> c4b9b97c7c60ad5c0c3392ccf143b2e4e6c7df24:
>>>
>>> "java-library.bbclass: compatibility with per-recipe sysroots"
>>>
>>> Could we get this patch officially backported to pyro ?
>>>
>>
>> One more patch I needed backported for pyro to build:
>>
>> 2a706cd2d656a203ecb83bef1c687703c969732e
>> "icedtea-native: Fix segmentation build during build"
>>
>> since I'm on Fedora with a recent gcc7 I assume.
>
> I backported both for pyro; please try rocko using master ... I've
> been using it without problem for few customers.

Thanks, with those pyro is building fine now, will try rocko with
meta-java/master next.

/Jacob

