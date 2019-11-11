Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 00AD57F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 12:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BW555ZvHz3P;
	Mon, 11 Nov 2019 13:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573476794;
	bh=nhxBpXsNYzZ0eNXuANSHr12SVMHjaHZUnT6S11378mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2WdQLi67yDzrSwbeT4nujKFJlwzATWEJOsx+s68odeR1jiwJvD8O7EKezZYJw6Qv
	oLMz6bVw41de2QwO/9Qdxiiruf+d1dD2CEYzDy1PMnWQt8E+6yZDjD0+8fSwEjwuiM
	cKmsKJiPoaBC/H8I9bzyNKVXbQUot0Tdd7DFiqUKaLo8NMdH5g+qRlH+QABZLQvsXM
	ZaOjnyFgC6hiFdHjr6x+Jn++MvkRReEB93UVtYPSOBWf0EAAZ9WImWnh3z40PtBLju
	p4zaO3vCjtpms56JNA2eynbQZq3DuXe36EFnXmA5KS+YhOdXIwVJ5ryFLUToH0g79l
	youE6/sjqGfD2fQTTPaz6T2kZ6l05aO4f7FOfF1j9e06Pt8X7TjwwBmjokrghPHJou
	iOFI0jRLFh8y5oet1N+2joBKaQOUyWIeaJqVsaCtNhcMgrNcooBpF8SqrPOBnKvd35
	dImv4yVRcByuyJ5xFaw8WsZqlxqB/jdnuXqzGY0MOfkUQVILY/xMFpRrKMqjRGiKM5
	hMQ7mizl7yurN0jjxrBfbMoQvfZ1PiC/P3dUrwXPWmJNjH5TYa/UnrH7inpKqF4TbW
	RFVhsqIZZp4Vh+pVmDLxZdN6Z+NWMiNH2X4H8SMOZZcXZBpnsUHfhxxaSgZFkdKyhr
	Ew0JPGSaljy/y6Tn5WBKRXbg=
Date: Mon, 11 Nov 2019 14:53:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20191111125310.GE28797@localhost>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
	<CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
	<620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
	<20191107161829.GA31984@localhost>
	<c8687700-81fa-df75-2e55-9c6af1087675@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c8687700-81fa-df75-2e55-9c6af1087675@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Mon, 11 Nov 2019 12:53:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 08, 2019 at 09:42:38AM +0800, Hongxu Jia wrote:
>...
> a serial of dependencies should be affected
> 
> meta-python/recipes-devtools/python/python-pytest.inc:19:
> ${PYTHON_PN}-pluggy \
>...
> I think the original purpose to add python-more-itertools is to fix the
> 
> missing dependency issue, but the contributor does not test on python2
>...

Thanks, I missed that this was done to add a missing dependency.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


