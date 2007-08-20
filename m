Received: from [64.233.184.231] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1INFBc-0006LW-0r
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 23:53:24 +0200
Received: by wr-out-0506.google.com with SMTP id c46so1020820wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2007 14:52:24 -0700 (PDT)
Received: by 10.90.50.1 with SMTP id x1mr38155agx.1187646744057;
	Mon, 20 Aug 2007 14:52:24 -0700 (PDT)
Received: by 10.90.31.16 with HTTP; Mon, 20 Aug 2007 14:52:24 -0700 (PDT)
Message-ID: <c384c5ea0708201452q3b596e76j8d7623cd6907c799@mail.gmail.com>
Date: Mon, 20 Aug 2007 23:52:24 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46CA0337.9050709@gmail.com>
MIME-Version: 1.0
References: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
	<46CA0337.9050709@gmail.com>
Subject: Re: Add Intel Core 2 machine support (prescott and nocona)
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
X-List-Received-Date: Mon, 20 Aug 2007 21:53:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Khem,

thanks for the feedback.

On 8/20/07, Khem Raj <raj.khem@gmail.com> wrote:
> I would suggest just add conf/machine/core2.conf and another
> conf/machine/tune-core2.inc file to have the special gcc flags.  I would
> not add it as a separate arch but stick with x86. To me it sounds more
> confusing to have x86 and core separated out into two different basic
> arches.
>
My current proposal is:

conf/machine/x86_32-prescott.conf
conf/machine/include/x86_32-prescott.conf
-arch=prescott
TARGET_ARCH=i686

conf/machine/x86_64-nocona.conf
conf/machine/include/x86_64-nocona.conf
-arch=nocona
TARGET_ARCH=x86_64

starting with GCC 4.3:
conf/machine/x86_64-core2.conf
conf/machine/include/x86_64-core2.conf
-arch=core2
TARGET_ARCH=x86_64

The remaining issue is that the TARGET_ARCH suggests that the
resulting packages run on any i686 or x86_64 which is not necessarely
true due to the instruction set being used.

Although we could create more generic machines, my direct interest is
in (live) media encoding and some packages will use SSE3 and SSSE3.

Regards,

Leon.


