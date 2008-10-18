Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KrJUW-0006EC-4W
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 23:37:44 +0200
Received: by qw-out-1920.google.com with SMTP id 5so339822qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 14:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=AWpz8Xq23mUtJKl4okeJL22HZFHlMwEQ5NjDVDSzIog=;
	b=M1u2E5iaNXO36K9Jm1JV0cfGxRILee4D6VDj6Wp2scyT4nu7cd6br5ITbsTfj2rz0x
	Iy4YuM1N5yAeO3VhJbvnV4TLf6WLK2++x9sTB3mlN7ZmCUIKlgSdkZeF/hyYpUJJQlEJ
	kL6Gt4y/9m/lGMcmZ05Fy0Gna2gIbvo+7qD2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=TCxuJ5Ho+WVupzuQkurYTm5DiAxpO9y0StnlDR90rul2dfkf4r+QpPsfm2NeT5nsvV
	PzKwZIZ1YpttVw5oOTz1VuuCBMRH4d2f19aJr7pxjTnMFKWc6B2nZkGMNjh9ZH4C4vKX
	pr+QYj3D5VOU7bAZAKaKXxzcbwJfpRWaJDN+0=
Received: by 10.214.148.4 with SMTP id v4mr7761684qad.47.1224365853276;
	Sat, 18 Oct 2008 14:37:33 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Sat, 18 Oct 2008 14:37:33 -0700 (PDT)
Message-ID: <c384c5ea0810181437s57b8c8a3xe0acdc4b9172a7f6@mail.gmail.com>
Date: Sat, 18 Oct 2008 23:37:33 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"Alex Raimondi" <mailinglist@miromico.ch>
In-Reply-To: <48F825DE.90104@miromico.ch>
MIME-Version: 1.0
References: <48F825DE.90104@miromico.ch>
Subject: Re: Adding support for our
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Oct 2008 21:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Alex,

On Fri, Oct 17, 2008 at 7:42 AM, Alex Raimondi <mailinglist@miromico.ch> wrote:
>
> We have a new AVR32 based embedded linux board (www.miromico.com/hammerhead), which is available now.
> We would like to use OpenEmbedded as our major build system to allow our customers to build their u-boot,
> kernel and rootfs.
>
I am in the same ballpark; but for a custom board (not for sale).

> Is there such a thing as a board maintainer in oe? If yes, how can we become one?
>
Simply maintain the machine file and/or board-targetted images, the
kernel config (or patches) for your board, in some cases
board-specific packages.

Send patches using the bugtracker. If you provided quality patches,
you can request for commit access, but we ask you to be familiar with
OE first.

> We allready adapted a few bb files to get oe building our u-boot and kernel. Should we push out these changes?
> How?
>
bugtracker, sometimes being on #oe helps to speed up stuff. (have
people review/commit interactively).

> We have two developers working at this project. Our board is AVR32 based. So, if oe is our major build system we would have to take care that avr32 allway builds. This means testing, fixing, extending support. I hope this would be benefit enough to endure our newbie questions while we are getting known with the build system.
>
I regularly build for AVR32 (at32stk1000 and custom board) and
although it's the newest arch in OE AFAIK, I am quite happy with the
status of AVR32 support in OE. We are mostly waiting for upstream to
have AVR32 integrated (GCC, binutils, ulibc etc).


Another help might be to provide some OE developers with your board.
It helps having a more continuous developer base activity.
Please consider.


Regards,
-- 
Leon


