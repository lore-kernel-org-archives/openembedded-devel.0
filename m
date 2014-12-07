Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3419E72425
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Dec 2014 19:20:49 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 142so1705114ykq.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2014 11:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=oSMmTs+jUlVKH5hxMRVmpdldb0NyG+wqPGfb9hLJ8ss=;
	b=eeW9W8WNJuRNTm9s48WnJTNVxQI2yzX6nrdDSfavekRSNSVgRYOD7cZsdhpwvPrA5z
	q5rTezyuolW+E184hN14Lwpn4UKKVY3NBVlFUdJn+mOdAF3g6XZnaWAAmRVgmbjaNjbA
	vwiJfa6w83HOrRFGBLNjJtG2CT9da64oxa3UbqhBP6e4kLdKhWDRZGYmjqBHDjHTaBWm
	HpFv5HuW/hON/jojqVmWfoRMpWQGVesZsblkhpEuPCNvB+u1waSPpMLBCqVwM7OrQ9Op
	icjpp/FFkf+Ubwmd2hBMOIm9T/x3uo/hbdhfN8S2UdRRnEnnFJqJDJ0jgUORlT1F4Z4A
	gOig==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr30423957ykm.50.1417980049892; 
	Sun, 07 Dec 2014 11:20:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Sun, 7 Dec 2014 11:20:49 -0800 (PST)
In-Reply-To: <20141206065116.GA2448@jama>
References: <1417801829-2363-1-git-send-email-rapphil@gmail.com>
	<20141205225538.GB2446@jama>
	<CAENGNhd1fzx8SOchN1oYi5VJYyAujDwwNmHx81XpdOu66GGXxA@mail.gmail.com>
	<20141206065116.GA2448@jama>
Date: Sun, 7 Dec 2014 17:20:49 -0200
X-Google-Sender-Auth: HDSfQYWwu_oXzt6zy0h-8DUznrY
Message-ID: <CAP9ODKooUNkj1esSv+7gn1SrTSng9eRoico=sEuNRnPauMKr7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libftdi: update to 1.1
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
X-List-Received-Date: Sun, 07 Dec 2014 19:20:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 6, 2014 at 4:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Dec 05, 2014 at 11:15:56PM -0200, Raphael Philipe wrote:
>> Hi Martin,
>> do you mean to use the -M40 parameter for git format-patch?
>>
>> I did that, but the produced patch was exacly the same as without it.
>
> It was supposed to better detect renamed file and sent easier to review
> patch, you can experiment a bit more with the number, but don't worry
> too much.
>
>> Please noticed that I deleted libftdi_0.19.bb and created libftdi_1.1.bb.
>
> Yes that's correct and why I was expecting git to show smaller diff.

You can try -M only or -M95. So you 'force' it to deal it as a rename.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

