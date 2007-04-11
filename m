Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Hbfu2-0007yZ-2D
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 18:42:38 +0200
Received: by wx-out-0506.google.com with SMTP id t14so249414wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 09:42:37 -0700 (PDT)
Received: by 10.90.90.16 with SMTP id n16mr745935agb.1176309757264;
	Wed, 11 Apr 2007 09:42:37 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id r15sm13901869nza.2007.04.11.09.42.35;
	Wed, 11 Apr 2007 09:42:36 -0700 (PDT)
Date: Wed, 11 Apr 2007 19:42:46 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <31907941.20070411194246@gmail.com>
To: "Wenbin Zhang" <zhangwenbin@gmail.com>
In-Reply-To: <78671ac40704100910n4da6d006icd80bf2449ed547b@mail.gmail.com>
References: <78671ac40704100910n4da6d006icd80bf2449ed547b@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: errors while "bitbake opie-image" build
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
X-List-Received-Date: Wed, 11 Apr 2007 16:42:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Wenbin,

Tuesday, April 10, 2007, 7:10:32 PM, you wrote:

> Hello, Guys,

> I am using "bitbake opie-image" do OE compiling. But got lots of errors like
> below.

Make sure you follow http://www.linuxtogo.org/gowiki/OpieWithAngstrom
.

> Someone suggested me add package "libqt4-dev", I added it, and in the
> local.conf, my ASSUME_PROVIDED is set as ASSUME_PROVIDED += "libqt4-dev
> qt4-native moc-native".

  You probably should have asked them for reasons of such suggestion.

> But I still have these errors. Anyone has ideas?
> Thanks!

> The errors are:

> | qbuttongroup.cpp:(.text+0x2b3): undefined reference to `vtable for
> QButtonGroup'

  Recently, gcc was upgraded to 4.1.2. There's always chance that it
broke C++ stuff again. I by now still didn't upgrade (just because I'm in
the middle of application-level hacking, and don't want land burn
under my feet). I'll try to check 4.1.2 during this week.

  For the future bug reports, using bug tracker, http://bugs.openembedded.org/

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



