Received: from [209.85.198.228] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <yajinzhou@vm-kernel.org>) id 1LgZ66-00010B-IQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 07:36:24 +0100
Received: by rv-out-0506.google.com with SMTP id g9so1565185rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2009 23:31:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.217.17 with SMTP id p17mr2389159wfg.235.1236580288739; 
	Sun, 08 Mar 2009 23:31:28 -0700 (PDT)
Date: Mon, 9 Mar 2009 14:31:28 +0800
Message-ID: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
From: yajin zhou <yajinzhou@vm-kernel.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: QA Issue: sanity test failed issue
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
X-List-Received-Date: Mon, 09 Mar 2009 06:36:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi everyone,

I use OE to build gpe-image for mipsel target. Everything goes OK except
some 'strip' problems. However I make some changes to the bb files to make
the build going on.

But at last I meet a sanity test failed issue and I do not know how to fix
it. I search it in google and it seems some one else has met the same
problem. But I do not find the way to solve this problem. Following is the
building log. Can anyone tell me how to solve this issue or give me some the
clue to debug it.  Thanks very much.


NOTE: Running task 4925 of 4927 (ID: 11,
/home/yajin/OE/openembedded/packages/images/gpe-

image.bb, do_qa_staging)
NOTE: package gpe-image-1.0: started
NOTE: package gpe-image-1.0-r0: task do_qa_staging: started
NOTE: QA checking staging
ERROR: QA Issue: libncurses.la failed sanity test (workdir) in path

/home/yajin/OE/angstrom-stable//staging/mipsel-angstrom-linux/usr/lib
ERROR: QA Issue: libmenu.la failed sanity test (workdir) in path
/home/yajin/OE/angstrom-

stable//staging/mipsel-angstrom-linux/usr/lib
ERROR: QA Issue: libpanel.la failed sanity test (workdir) in path
/home/yajin/OE/angstrom

-stable//staging/mipsel-angstrom-linux/usr/lib
ERROR: QA Issue: libform.la failed sanity test (workdir) in path
/home/yajin/OE/angstrom-

stable//staging/mipsel-angstrom-linux/usr/lib
ERROR: QA staging was broken by the package built above
ERROR: Error in executing: /home/yajin/OE/openembedded/packages/images/
gpe-image.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of
/home/yajin/OE/openembedded/packages/images/gpe-image.bbdo_qa_staging

failed
ERROR: Task 11 (/home/yajin/OE/openembedded/packages/images/gpe-image.bb,
do_qa_staging)

failed
NOTE: Tasks Summary: Attempted 4924 tasks of which 4924 didn't need to be
rerun and 1

failed.
ERROR: '/home/yajin/OE/openembedded/packages/images/gpe-image.bb' failed
NOTE: build 200903091051: completed

