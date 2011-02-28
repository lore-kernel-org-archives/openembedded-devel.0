Received: from srv10.nortechonline.net ([89.151.113.230]
	helo=mail.nortechonline.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Nick.Lee@nortechonline.co.uk>) id 1Pu7SF-0006tA-3c
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 19:04:19 +0100
Received: from [192.168.50.11] (192.168.50.11) by SRV10.nortechonline.net
	(89.151.113.230) with Microsoft SMTP Server id 8.3.137.0;
	Mon, 28 Feb 2011 18:01:50 +0000
Message-ID: <4D6BE30D.6080602@nortechonline.co.uk>
Date: Mon, 28 Feb 2011 18:01:49 +0000
From: Nick Lee <nick.lee@nortechonline.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
In-Reply-To: <AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
X-EsetResult: clean, is OK
X-EsetId: 0AB0FE203F873E3F58F2
Subject: Kernel Module Compilation
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
X-List-Received-Date: Mon, 28 Feb 2011 18:04:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I'm compiling a kernel module under openembedded, and it inherits from 
module and update-rc.d.  I want to pass a preprocessor directive, 
TESTFLAG, to my module source code.  I've tried setting -DTESTFLAG in 
CFLAGS, KERNEL_CFLAGS and EXTRA_CFLAGS in my recipe and in the Makefile 
for my module.  In none of these cases do I get TESTFLAG defined in my 
module code.  The best I can get is a helpful suggestion to use 
EXTRA_CFLAGS, which doesn't work.

What on earth am I doing wrong?  It doesn't seem like a particularly 
unusual thing to want to do!  I've spent most of a day trawling the 
internet and openembedded archives for a solution to this problem, and 
have found nothing.  Maybe it shows a lack of google skills on my part...

Nick


