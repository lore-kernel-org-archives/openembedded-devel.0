Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1Jgq3M-0001oy-NT for openembedded-devel@lists.openembedded.org;
	Wed, 02 Apr 2008 01:38:08 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 02BA3AEC67
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2008 19:38:08 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute1.internal (MEProxy); Tue, 01 Apr 2008 19:38:07 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id CF5793A063; Tue,  1 Apr 2008 19:38:07 -0400 (EDT)
Message-Id: <1207093087.11184.1245545471@webmail.messagingengine.com>
X-Sasl-Enc: EsE8CDg/ulnDZ7G24mgsC8hjvINCkb5WZGK6eNTv7ZHb 1207093087
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1207030242.29161.1245367579@webmail.messagingengine.com>
In-Reply-To: <1207030242.29161.1245367579@webmail.messagingengine.com>
Date: Wed, 02 Apr 2008 09:38:07 +1000
Subject: Re: gcc disable-libunwind-exceptions, VFP, iWMMXt, crunch - nokia800, mx31ads, etc
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
X-List-Received-Date: Tue, 01 Apr 2008 23:38:08 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"


On Tue, 01 Apr 2008 16:10:42 +1000, "Hasjim Williams"
<openembedded-devel@lists.futaris.org> said:
> Hi All,
> 
> I was recently looking in gcc-cross-4.2.2.bb and 4.3.0.bb and noticed
> that in our EXTRA_OECONF we have:
> 
> --disable-libunwind-exceptions

Sorry all, this is due to my misunderstanding of what this does. 
gcc-cross can be compiled with libunwind extensions:

http://www.nongnu.org/libunwind/

Obviously we don't have anything in the oe tree that uses this (to
determine the call-chain of a program), and there is no libunwind.bb. 
Would it be possible to build gcc with libunwind support?  AFAIK, only
the git development tree has support for ARM.

I guess it would mean another stage after or that replaces gcc-cross,
and a different glibc?  Or could we have some sort of
TARGET_UNWIND_SUPPORT variable or something similar?

Incidentally, someone wanted to put a patch to disable some other libs
in gcc:
http://projects.linuxtogo.org/pipermail/openembedded-commits/2007-November/010465.html

It would be good if we could figure out a nice way to enable/disable
certain libraries, much like the way TARGET_FPU affects certain
packages.

> Also, I couldn't build glibc-intermediate (with system-wide iwmmxt) with
> the tag enabled, when building with binutils-2.18, gcc-4.3.0 and
> glibc-2.6.1 ...

NB, this is also why yesterday I couldn't build glibc as I hadn't
installed libunwind, i.e. created a libunwind bb.





