Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HYfoU-0002JY-Kt
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 12:00:30 +0200
Received: by nz-out-0506.google.com with SMTP id m22so995848nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2007 03:00:29 -0700 (PDT)
Received: by 10.64.242.5 with SMTP id p5mr12017043qbh.1175594429661;
	Tue, 03 Apr 2007 03:00:29 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id c1sm10108915nzd.2007.04.03.03.00.28;
	Tue, 03 Apr 2007 03:00:29 -0700 (PDT)
Date: Tue, 3 Apr 2007 13:00:33 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <583221585.20070403130033@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <4610C6E6.30102@kernelconcepts.de>
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>
	<460F5F87.3060403@dominion.kabel.utwente.nl>
	<4610C6E6.30102@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev prismstumbler: add 0.7.4pre1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2007 10:00:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Florian,

Monday, April 2, 2007, 12:03:34 PM, you wrote:

> Hi,

> Koen Kooi schrieb:
>> That is against our versioning policy, this way you can't upgrade to 0.7.4 when it gets
>> released[1]. Use _0.7.3+0.7.4pre1 instead.

> I remember we had these kind of trouble with ipkg before.

  Why we and why ipkg? Any packaging system which tries to do its work
well hits into such issues. In this regard, OE follows Debian's way to
handle this. (Even though I was unable to find exact best
practices to resolve such cases, they only mumble that it should be
done: http://www.debian.org/doc/debian-policy/ch-binary.html#s-versions ;
anyway, + notation is what actually being used).

  I'm not sure how other packaging systems solve this, for example,
look at FC6 RPM pile shows that they have *pre* stuff without clearly
distinguishable pattern of handling it syntactically. But it's known
where that leads to - to inability to upgrade to a new distro release.

> Wouldn't it be better
> to make it possible to handle this properly? I guess we will run into this again
> and again in future.

> Greetings

> Florian




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



