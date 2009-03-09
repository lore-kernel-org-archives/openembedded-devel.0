Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LgeuH-00065B-Br
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 13:48:33 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 9 Mar 2009 13:43:42 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 9 Mar 2009 13:43:42 +0100
Received: from [192.168.1.107] ([79.54.131.222]) by FBCMCL01B05.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 9 Mar 2009 13:43:42 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
References: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
Date: Mon, 09 Mar 2009 13:42:35 +0100
Message-Id: <1236602555.8807.6.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 09 Mar 2009 12:43:42.0504 (UTC)
	FILETIME=[ADABBA80:01C9A0B4]
Subject: Re: QA Issue: sanity test failed issue
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
X-List-Received-Date: Mon, 09 Mar 2009 12:48:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-03-09 at 14:31 +0800, yajin zhou wrote:
> Hi everyone,
> 
> I use OE to build gpe-image for mipsel target. Everything goes OK except
> some 'strip' problems. However I make some changes to the bb files to make
> the build going on.
> 
> But at last I meet a sanity test failed issue and I do not know how to fix
> it. I search it in google and it seems some one else has met the same
> problem. But I do not find the way to solve this problem. Following is the
> building log. Can anyone tell me how to solve this issue or give me some the
> clue to debug it.  Thanks very much.
> 
> 
> NOTE: Running task 4925 of 4927 (ID: 11,
> /home/yajin/OE/openembedded/packages/images/gpe-
> 
> image.bb, do_qa_staging)
> NOTE: package gpe-image-1.0: started
> NOTE: package gpe-image-1.0-r0: task do_qa_staging: started
> NOTE: QA checking staging
> ERROR: QA Issue: libncurses.la failed sanity test (workdir) in path
> 
> /home/yajin/OE/angstrom-stable//staging/mipsel-angstrom-linux/usr/lib
> ERROR: QA Issue: libmenu.la failed sanity test (workdir) in path
> /home/yajin/OE/angstrom-
> 
> stable//staging/mipsel-angstrom-linux/usr/lib
> ERROR: QA Issue: libpanel.la failed sanity test (workdir) in path
> /home/yajin/OE/angstrom
> 
> -stable//staging/mipsel-angstrom-linux/usr/lib
> ERROR: QA Issue: libform.la failed sanity test (workdir) in path
> /home/yajin/OE/angstrom-
> 
> stable//staging/mipsel-angstrom-linux/usr/lib
> ERROR: QA staging was broken by the package built above
> ERROR: Error in executing: /home/yajin/OE/openembedded/packages/images/
> gpe-image.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Build of
> /home/yajin/OE/openembedded/packages/images/gpe-image.bbdo_qa_staging
> 
> failed
> ERROR: Task 11 (/home/yajin/OE/openembedded/packages/images/gpe-image.bb,
> do_qa_staging)
> 
> failed
> NOTE: Tasks Summary: Attempted 4924 tasks of which 4924 didn't need to be
> rerun and 1
> 
> failed.
> ERROR: '/home/yajin/OE/openembedded/packages/images/gpe-image.bb' failed
> NOTE: build 200903091051: completed
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
I had it once:
The cause was that the TMPDIR that wasn't setup correctly:
I had:
TMPDIR = ${HOME}/oetmp/
instead of:
TMPDIR = ${HOME}/oetmp

the last / caused the path of something into the TMPDIR to be:
${HOME}/oetmp//work/etc...
the doubble slash prevented a regular expression from working.
The regular expression in question was changing the content of the .la
files(libtool archive).
And so the .la content were not changed.
And that triggered the QA problem because the paths inside the .la files
weren't changed(they were relative to the build directory instead of
the / path if I remember well)

Denis.




