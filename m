Return-Path: <rcagley@gmail.com>
Received: from mail-yk0-f169.google.com (unknown [209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE3265FC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 22:46:00 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so3399719ykr.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h4Ium/xbuDTMooZwsolKdIv3A1iwZ/cacKkTwXCix0k=;
	b=DRcZAwsbnrmp9TjQD2p8ialEvdB+ku0kgaEUIQcZXlOGdufZXTMZrxb1ekB86CDsjo
	+7uU9EmUa4uy9/XexnDQICtSV5JG7Qa1XQM2TeVjdVjjxLvgKZBarVARO/T7DhFbvZif
	e7DmSAQ5kaeSeDVKKAlYFanh000cn7PgSYn+svdO/jTa+kAn08x9fIYqNMPc++1pK5do
	Its2T8X6OIodn/XuGBtXZF4/oAqNOLG+B1rsyyNQDzcwrqtsA3vYkv6he1vfZvfpTcUG
	s+kDZsS4KDDyYcq+IwrX13R3cQV/aFQbcc3G4XOhv3QEGNb2nykaiZf8L/zB4GwIkD37
	wgFg==
MIME-Version: 1.0
X-Received: by 10.236.119.99 with SMTP id m63mr1037776yhh.65.1400798761956;
	Thu, 22 May 2014 15:46:01 -0700 (PDT)
Received: by 10.170.110.8 with HTTP; Thu, 22 May 2014 15:46:01 -0700 (PDT)
In-Reply-To: <1584812.c16lcQ9U8e@peggleto-mobl5.ger.corp.intel.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
	<537D0D26.8070505@balister.org>
	<CAN-NoH1coG9-Go6qqOQU_-vu3QqhdE30znM-PCgMPZtAd5To+Q@mail.gmail.com>
	<1584812.c16lcQ9U8e@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 22 May 2014 15:46:01 -0700
Message-ID: <CAN-NoH0xVXhEAmSx6b8XMqchp4Q_qGe9onC3Gp6wT4HDJNW3xg@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: how to create a new layer
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
X-List-Received-Date: Thu, 22 May 2014 22:46:01 -0000
Content-Type: text/plain; charset=UTF-8

> One other thing to note - if there are overrides for the previous machine
> (e.g. in bbappends you may see _zedboard-zynq7) you should change
> these to _me so that they still apply.
>

What is the threshold for making a new machine? That is, if I just
have a .bbappend file I want, that should just involve creating a new
layer and putting the bbappend file in the correct location. I
shouldn't have to change anything else correct?

For instance, if I just want to change the kernel configuration with a
frag file I can put linux-xlnx_3.8.bbappedn in
meta-me/recipes-kernel/linux and that's all I need?

I guess I'm just confused at what point I actually need a new machine.

