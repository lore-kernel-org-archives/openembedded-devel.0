Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 38C2671D7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 22:53:18 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so445886wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=s0h+dYJQJMo5JZ/ley0iK6dmc178vLRtgYxGxe2UgDU=;
	b=RQCinZTf2yBTgtWn+VbdittIE+TJzAT40l0zvgX56Z10uq2l5LRr+dgZ4BWhOV7exK
	ehq2c5HUrElyhmYCq5ekRllg1XayscebVc+nNFdBOiAqm0xGYsH6zhGuHxBqjmiuPdfV
	q5+6/ge6xeK0D9RpaQYANwuMgkkMJ/0z9jqmk/qPDFU77FbmtDz7U7OPcZ6dQJamrZRi
	yoOjj9tO7DeSXC2hyDaaM0ZzowldI6/QsnGY6X3+4K8MehH7KnlAKvvlpQ/N8h5+xfwh
	tQ+ckENTn63bzTtNkvwc7pPZGOH1BO+QtLDkBV01IeV7TQOxhzc7HqMjQ0Ty4FB44Lzx
	GljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=s0h+dYJQJMo5JZ/ley0iK6dmc178vLRtgYxGxe2UgDU=;
	b=AZGdKcCOORcioL/h8cAhCpkA/TqEa6fEFpR1OxC4WNTfwBD4HXgl7q4+BI3ml7TRt9
	k5Ex1atGRXYIFSvd/xaT2ocEXDjo5n8FYw6tyIlZmB0vjzO59t5ll8z+6u9iNGQisGNG
	JQ4jZsKvrjavj3UB9KDBq2iIZj0g0v2dCpNd494iL6u1D/CxSnfMZdCOLVwWpoDnwLQc
	w20Kyr7JrSCPFvTX7iEOWmh0AH1pdm0dgUQiuH6vTSmLI5QYYZY7/da0b9P/DrSos1L1
	/X1XgB5I0dq0Lvh7cYHhqHw7l0VYCggd2G+2497GzT/4zFzbyyfekGoKiL0ckQcVjfN0
	GOnQ==
X-Gm-Message-State: AKaTC03Lh65DTq0D72lSxawVmodCDX0RawjgpefyCOM2S29utKPHzd5HVnZ1NZ9mG6n0DB1VummBEraoP31w+A==
X-Received: by 10.194.113.169 with SMTP id iz9mr25820420wjb.57.1481669599742; 
	Tue, 13 Dec 2016 14:53:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.69.70 with HTTP; Tue, 13 Dec 2016 14:52:58 -0800 (PST)
In-Reply-To: <CA+chaQdhYEi2kVhefPQfFdK4xWkq23Sb2gj7LuU_wK9BbPEeyQ@mail.gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
	<20161213210404.6940-7-ricardo.ribalda@gmail.com>
	<CAMKF1soyeu_47SQ3GyjOCOEiuOX=NxzahEAd+d2GOwdaiUj0Wg@mail.gmail.com>
	<CAPybu_3fk_MvXWQ-++XruYCqwHAsC5r-GMv0Hbx+O9jaj5UqHg@mail.gmail.com>
	<CA+chaQdhYEi2kVhefPQfFdK4xWkq23Sb2gj7LuU_wK9BbPEeyQ@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 13 Dec 2016 23:52:58 +0100
Message-ID: <CAPybu_3gOJFLNVHcNUfw2NTME9hXZ_M0r5hYnZVpcBE8_OOHzw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] opencv: Add new PACKAGECONFIG lapack
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
X-List-Received-Date: Tue, 13 Dec 2016 22:53:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

Sorry, I meant DEPENDS. I will take a look for checking how difficult
is to add the WITH params, with some luck it is accepted upstream.

Regards!

On Tue, Dec 13, 2016 at 11:37 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Definitely not RDEPENDS (that would make it even worse by not ensuring that
> lapack is staged soon enough to be detected during opencv configure).
>
> Best way is to patch the configure to support WITH parameters like for
> other optional dependencies.
>
> On Tue, Dec 13, 2016 at 10:30 PM, Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
>> Hi Khem
>>
>>
>>
>> On Tue, Dec 13, 2016 at 10:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> >
>> > not that this problem does not exist right now but this is a dangling
>> dependency
>> > what happens if I  dont have lapack in PACKAGECONFIG but lapack
>> > package is staged
>> > already may be via other deps
>> >
>>
>> What is the proper way to to it? Add it as an RDEPENDS?
>>
>> Sees a bit too much to require lapack for every build if it is only
>> used by an optional package.
>>
>> Thanks!
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

