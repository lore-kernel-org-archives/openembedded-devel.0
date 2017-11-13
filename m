Return-Path: <ian@boundarydevices.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8F59A70016
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 21:56:42 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 78so21709418qkz.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 13:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JCHO5FHZ+r9mnTjRKnSM/8q5lUmIK8W1h5JnzCgn5d0=;
	b=XA9FPG3JnPtVJDZfGHNxl1k9ojSa1gxRppHdonOnZdEYr5ExQPy8GNqKkHHv90Y4Yi
	QrNb4CO5HtxMlT5od6seYyUVCjYVwgm+CSv0vozlUPnxc6+02Hl/jROQR6tKOgUmzGBf
	FPoMGMuz9C7ZNWXunpF3poyy5PooZHaeXp6NQvTOuep6WFTyFss/uzbGsn+yO5rq+Cn/
	QKFQLFXQLmvYe47/tNuSma5IryE1Glqisp7lZSyXKbpP+fNqdgvKz/rGJz80yE2pCjmi
	kbqAmZP54Q0ZPrPKAvl16QqPxTfWj2NWrj3R8jz2wg3lpLT9FtXTeAUa1nLsFxdJHz4L
	OO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JCHO5FHZ+r9mnTjRKnSM/8q5lUmIK8W1h5JnzCgn5d0=;
	b=hEB8c/0V11ew207in0PK61cW7gyK9M/MZhzOK0EmoQvlag7vZ2ZpaN1KPm7+4uWd/+
	V3o/bdvAJPsCH0Ewz3vZimXmTAMCQxvZfhgB1vOHPxY8jMJJs+UlVTwyOBo2N4qvbd4Z
	7+/sXelBnejD/SzNjFeJ5ZMOh93C8hzaGf32xsYn/VyKRAwoZEFNMyhY/H81q4jpKxh3
	tTna+zruH9Jobyf87DUlCW+hF5yQv4lfnQ7VW9dFQU/AbyUcC0yn+++MuPQhcUTVfX+t
	3Mhru459UzOAfwmxEY+tj7ePBi5Q9+T+s46djE8QnlGlH/dt0/BPghr0q8YR82kaMrHm
	A1bQ==
X-Gm-Message-State: AJaThX60trlYhCgApu6Afbd1FQbwaFuM5eNepnOts1pdBAqcko6b9kKi
	79w3wSLBs9UDeozGPTODvD5DxPomaQyIwTCmdsCuVw==
X-Google-Smtp-Source: AGs4zMZASg/XqmLsTDLphKwSt2zMzYOcA5/i0MEB8raXoydULK7o/kdqPO3QJh157JjMvbA7Zyais5dbLAnhSpXlZho=
X-Received: by 10.55.102.207 with SMTP id a198mr8021873qkc.345.1510610203460; 
	Mon, 13 Nov 2017 13:56:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.37.203 with HTTP; Mon, 13 Nov 2017 13:56:42 -0800 (PST)
In-Reply-To: <CADseiPnGDYTz-Ht=kTxGt+UpfeNx-Q6dGY-jOa=11JgvOEcuGQ@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapRKjZZ=yCYpfrm3CDVZez0JbLeaKHaZg2J3WhjBvRR6jg@mail.gmail.com>
	<CADseiP=dhrkCrqBnO+g-HZQZaGgf1ywZwFcd-0bpE9K-qhALPQ@mail.gmail.com>
	<CAP9ODKqhY9miP9wf0rv_mhtyn9_dV6-Cm3=J6yOhmx-Y6qpGiw@mail.gmail.com>
	<CADseiPnGDYTz-Ht=kTxGt+UpfeNx-Q6dGY-jOa=11JgvOEcuGQ@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
Date: Mon, 13 Nov 2017 13:56:42 -0800
Message-ID: <CADseiP=TheGrsE+Pc=G8NAgVcmRx9e+VhNa4fbRSdN_miZhk4A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Mon, 13 Nov 2017 21:56:42 -0000
Content-Type: text/plain; charset="UTF-8"

Nevermind, found it. I'll test that.

On Mon, Nov 13, 2017 at 1:51 PM, Ian Coolidge <ian@boundarydevices.com>
wrote:

> Where is this commit? I don't see 568227133be3f9f015679df3525f6c4f86304fd0
> in meta-browser?
>
> On Sat, Nov 11, 2017 at 9:25 AM, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> On Fri, Nov 10, 2017 at 10:10 PM, Ian Coolidge <ian@boundarydevices.com>
>> wrote:
>> ...
>> > Are there any obvious flags or compile options I'm missing here? I
>> haven't
>> > tied debugging into this yet, which is my next step here. Just wanted to
>> > know if I was missing something obvious.
>>
>> Maybe this fixes it?
>>
>> commit 568227133be3f9f015679df3525f6c4f86304fd0
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Tue Nov 7 15:26:52 2017 -0800
>>
>>     gcc7/gcc6: Fix unaligned STRD issue on ARM
>>
>>     Backport
>>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445
>>
>>     Fixes [YOCTO 12297]
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> Please check if it helps you, otherwise please open a github issue so
>> we can keep track of it.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>
>
>

