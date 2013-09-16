Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8266041D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 19:13:03 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so3332063veb.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=t29bwailXjckQT0KjOMk2AS+6hL7Nzuj9R42VcHb/ck=;
	b=vCT32yUMjqBAEGkBxU3BvJY+H2YXZkf3T6fFHNxHUleWGk9Le87KX3AGzAPmG2s3Ue
	k2uYV3ha/rS6NTIo7FTLGLLvuRcxqAtKvUSSM+puW3DyxZlJ4PAp4xS+HztEqZqyvSWE
	3EGHDcYbPthEYUz0X8aoCpXVxJPQ7ZLuIev7axmP76RWNm1AWqpPB6/VscLKm7L5FTye
	GSoLIl+NJBsXCYMkhi0hphmsrz+cFCRT/HomTHHSDOMspOmSzWjBAXJlv53HcB7cr0Ok
	DBH6SynHvJYZ4GAvaAE5lxx+XNgFFLwyGT9a4U40gZA1ICycdM9sx2+PVMbGVNX4VkBs
	ojdQ==
X-Received: by 10.220.174.200 with SMTP id u8mr28444268vcz.6.1379358784542;
	Mon, 16 Sep 2013 12:13:04 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Mon, 16 Sep 2013 12:12:24 -0700 (PDT)
In-Reply-To: <CAKS01ondqDK+WSxXaFSSk6_gBp5V9A6=Qh7g_TQz8WWUAaoHhQ@mail.gmail.com>
References: <CAKS01onp9CcPLNOybKbTh9bsp4QwuLJtJABrU7_zDe=Px0t6Nw@mail.gmail.com>
	<02f901ceb2d2$d93db7e0$8bb927a0$@oss.bmw-carit.de>
	<CAKS01ondqDK+WSxXaFSSk6_gBp5V9A6=Qh7g_TQz8WWUAaoHhQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 16 Sep 2013 20:12:24 +0100
X-Google-Sender-Auth: 69M4qXMJPTui0rQapa5WPVgWIDY
Message-ID: <CANyK_8fQ_fm0RW=BmBrciy+9CPjpxu2i4SYNOr+2N6fD8EVP9g@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: using deb as source while building image.
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
X-List-Received-Date: Mon, 16 Sep 2013 19:13:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 September 2013 13:32, Anup Kini <akini@synapticon.com> wrote:
> I am trying to understand how deb packages can be used to build the image.
> Since, i need to install a few pre-built application.
> let me know if you have any pointers on how to proceed with this.
>

Packages pre-built for another distribution generally won't work as
intended within an OpenEmbedded/Yocto system. Just as you wouldn't
install a Ubuntu package on a RHEL system, you shouldn't install a
Ubuntu package on an OpenEmbedded based system. What's the exact
software you need?

You could use the recipe search on layers.openembedded.org to see if a
recipe already exists for the software you need, if it doesn't then
it's usually not too difficult to write your own recipe.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

