Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id B270D609C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:06:28 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id c41so6685714yho.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ggo5JZ5lFJsHAXgs7i5diGx0HDZVY47q2ghLhxo+kYs=;
	b=dCsj6mo9RZAIoFsHY8zZhDaJAwKQHHn/WZlje97UTkeHSnc0ZQ1OpDvntLDawqYQQk
	aym6SAb+9bGI5G1X7WiU007B2Fg/zqwOobls9HBuYSif31lSFI6WnTI0r8dmb3OoGADn
	2xg95NYX0gbFbBdYYHT13N6Eo8JBRBgJ2oKytmjtZhxjNbOjvdvj9UaYuwatPMxuMPY8
	j1IxD2/pRWNynznpW6qS9MaMjRX9fM1NotXGer2FgJl+cd/8Tox6HFh+h3zs3fXuV4bD
	Me1d2bABawRf7hn0u0FBTK3MM4QpBsWAF8r/w8CEVEpXrI0rvbLqj+OP4HJrp59t8oHG
	Nywg==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr47122957yhi.67.1407787590117;
	Mon, 11 Aug 2014 13:06:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 11 Aug 2014 13:06:30 -0700 (PDT)
In-Reply-To: <CAOd_LFyOC8uR2gk=u2YpB1cq8P_hkqHoYKDxUmou=y1UcBDnVA@mail.gmail.com>
References: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKrhpyVAXkrCeEk2yqjvwm1G34aqF-sP__fQvQ8yyMCJyA@mail.gmail.com>
	<CAOd_LFyOC8uR2gk=u2YpB1cq8P_hkqHoYKDxUmou=y1UcBDnVA@mail.gmail.com>
Date: Mon, 11 Aug 2014 17:06:30 -0300
X-Google-Sender-Auth: g9absJJ6c0tRznvbOeyEdOBL1Xw
Message-ID: <CAP9ODKpGbmi=dsvubh9O-ok9_Enc5cewtdC6TQ+H0OJo3Y3_-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] evtest: Stop using Cgit based archive
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
X-List-Received-Date: Mon, 11 Aug 2014 20:06:37 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

On Mon, Aug 4, 2014 at 6:26 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> On Mon, Aug 4, 2014 at 2:46 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Hello Martin,
>>
>> On Mon, Aug 4, 2014 at 3:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> The Cgit based archive may change depending on the order of images,
>>> timestamp and like causing checksum to change.
>>>
>>> This patch uses the same 1.25 version but fetching it using Git, so no
>>> code changes are done.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Please queue this update for Daisy as well, as this is failing to
>> fetch currently (cced other Daisy maintainers).
>>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Acked-by: Cliff Brake <cbrake@bec-systems.com>

Please merged this.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

