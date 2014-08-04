Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD9B60196
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:26:13 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id j5so45198qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 14:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tqe1IqiPJCJetxYIFtYOL/AGlV0jMx+Oj0IcdE2iV/E=;
	b=jg5e7sHSmN7SoPSNOuFDuMOa8Ulu50+W3n9LLaPyVa9ou3GzqCQ2Paqp0NScF0T0pe
	X1BnRbyS6cU2gmxKe4PMd0GGBxkV7kk7UIq7RYXUUcfCQdpXbalix01uRYXngNSeTnr3
	RpT1/bk+cIrn/FK2wD9BZHCJcNnJoxgfSy/Wi7A6hN/K01puBg1CSHKBEaS1GOihoeOw
	0TMIvJKTkSvvmD9M6y/axjiXzJdKE95+5WcGIWVbGEw3fwgyeBxCf0hcdXPe4Tbxgvmn
	5F76/Ch9x52Mvlahtu9n7+NNsKgfOWsxmLmO5PkVMdQVYRfiYGVrMgRAlW2awGyOje0t
	8F8A==
MIME-Version: 1.0
X-Received: by 10.224.111.193 with SMTP id t1mr18328049qap.103.1407187574739; 
	Mon, 04 Aug 2014 14:26:14 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.88.233 with HTTP; Mon, 4 Aug 2014 14:26:14 -0700 (PDT)
In-Reply-To: <CAP9ODKrhpyVAXkrCeEk2yqjvwm1G34aqF-sP__fQvQ8yyMCJyA@mail.gmail.com>
References: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKrhpyVAXkrCeEk2yqjvwm1G34aqF-sP__fQvQ8yyMCJyA@mail.gmail.com>
Date: Mon, 4 Aug 2014 17:26:14 -0400
X-Google-Sender-Auth: HPxHFXFLrUmJee0YAsbGhZzK2vA
Message-ID: <CAOd_LFyOC8uR2gk=u2YpB1cq8P_hkqHoYKDxUmou=y1UcBDnVA@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 04 Aug 2014 21:26:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 2:46 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Hello Martin,
>
> On Mon, Aug 4, 2014 at 3:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> The Cgit based archive may change depending on the order of images,
>> timestamp and like causing checksum to change.
>>
>> This patch uses the same 1.25 version but fetching it using Git, so no
>> code changes are done.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Please queue this update for Daisy as well, as this is failing to
> fetch currently (cced other Daisy maintainers).
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Cliff Brake <cbrake@bec-systems.com>

