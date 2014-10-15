Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 450BD60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 17:46:09 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so1379963qcr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 10:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=udbMVqCyuCYN2zXhOzwGjs3xJJABk+e+5lfWSD3zQH0=;
	b=zV8lw45pyQJ9AaRqrVtIMDZ2ZzF+w0pdZWaDlWcscwvf8Y1otVKidFvEm46cz0LLTG
	OY7sdWJhDgBwYhaeD7VFMyBU4Mcz9CtWEIcY/1dkP72/JlbRl8whEbyGB370HuDaVu0Q
	vKdRBlejN/vXNKCAuQFw7ON6LoVQK1D7eYRI3bVKKzHsd6mIjke2rnrmVjYrAZMAN6r3
	MLmdKNajciGoboVfqdcNmiRSU/P6bTyedblfGIvV6RHUIebhd8zDPcb/+HBO9z1d2iE2
	qyo5J7+UOAJ0G3Y5CIHQap9zYgsONAUOz0EQqWxRWsoboeDawbh0ks3YrCmETL8fKBOB
	/IEQ==
X-Received: by 10.140.23.198 with SMTP id 64mr181541qgp.62.1413395168693; Wed,
	15 Oct 2014 10:46:08 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Wed, 15 Oct 2014 10:45:28 -0700 (PDT)
In-Reply-To: <20141015103818.GP3000@jama>
References: <1413366811-1259-1-git-send-email-jackie.huang@windriver.com>
	<20141015103818.GP3000@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 15 Oct 2014 18:45:28 +0100
X-Google-Sender-Auth: u_GdyXX2N2XzoCoekvLaR07xUQQ
Message-ID: <CANyK_8e+OeoHRKN+nriKpQNRuekQBxH_7We9rtMrBQG=wqZ2=A@mail.gmail.com>
To: OE Devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vim: add recipe for vim-tiny
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
X-List-Received-Date: Wed, 15 Oct 2014 17:46:19 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 11:38, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 15, 2014 at 05:53:31AM -0400, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Changes:
>> - split the vim recipe to two files
>> - add bb for vim-tiny based on PACKAGECONFIG defined in .inc file
>> - use trim_version to get VIMDIR
>
> If you really want to revert following 2 patches, then you need to provide
> more justifications for your patch and also confirm that the recipes don't
> stage conflicting files in sysroot anymore (I don't see any change in recipe
> preventing that).
>

Agreed. There may be a use for having both vim and vim-tiny in a
package feed, but I think we need a better way of handling it than
this.

This patch is difficult to fully review as it mixes conceptually
different changes together. If this or something similar does go in
after further discussion, it needs to be split up.

Thanks

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

