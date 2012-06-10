Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jayakumar.lkml@gmail.com>) id 1SdXbx-0007qL-3d
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 04:10:37 +0200
Received: by yhjj56 with SMTP id j56so1870108yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2012 19:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=AOCfMEJJySv1dLTEQrmo2MM7kqLKYPvl69kFmAz26pA=;
	b=Jh89tVnTEYgotb5Qyg38naNqdojBI7UZ3F1MOIOH5qPmWoACI0l2CmSBGiaID257wH
	dfQmbw48KjYuim6QxfAMkqaBU3bvQgR6cLvP5iOAT9VlF3eR28bfYtH/aL6p86QffbnH
	LNdFCTfCtjAN96ykJPiZWXIclywOVW+TWkxsiHmGIo25xSlPHI3NwjOCwImRuHgdmtYh
	RNGReR2E6cjShouuJrxAIgq0SwkXOJY81NGZtGSlR11uq42A6eiZF6g0cX3a6yWjpBe0
	xXtWcQwb3j/GgWG3l/KC9OVtNq6NPMp4E6SHunIj5qB2doTEiahkrEtEfS8VA27WQU3r
	f/ZA==
MIME-Version: 1.0
Received: by 10.236.76.233 with SMTP id b69mr14655366yhe.52.1339293605003;
	Sat, 09 Jun 2012 19:00:05 -0700 (PDT)
Received: by 10.236.46.202 with HTTP; Sat, 9 Jun 2012 19:00:04 -0700 (PDT)
In-Reply-To: <4FD3DC0B.6010700@gmail.com>
References: <CADqH6VxvxeF=UoY+JuN_JP+McpWAf8FoB5HZ-aprDG3PfpkdqQ@mail.gmail.com>
	<4FD3DC0B.6010700@gmail.com>
Date: Sun, 10 Jun 2012 10:00:04 +0800
Message-ID: <CADqH6VxsnMWPzANnL7zwGCyGC2oVYWVS0mBt4QT59FC8Qht=AQ@mail.gmail.com>
From: Jaya Kumar <jayakumar.lkml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libcurl and __isoc99_sscanf@GLIBC_2.7
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
X-List-Received-Date: Sun, 10 Jun 2012 02:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jun 10, 2012 at 7:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 6/7/2012 4:20 AM, Jaya Kumar wrote:
>> I was wondering if that is correct behavior? I don't have an
>> understanding of why sscanf seems to have a dependency on glibc
>> 2.7. I encountered this issue because I took the curl libs,
>> unpacked them in my metatoolchain libs, and then tried to link my
>> app against it and got:
>
> how did you build those curl libs ?

Hi Khem,

Thanks for your reply. I had built curl using OE, ie:
MACHINE=beagleboard bitbake curl. I figured out the source of my
problem. The meta-toolchain I had been using was using an older libc,
whereas my OE build (since I had used oebb.sh update) had switched to
using eglibc where the c99 extensions were present. So I switched to
using the prebuilt toolchain and everything works fine now.

Thanks,
jayakumar


