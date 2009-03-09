Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <yajinzhou@vm-kernel.org>) id 1LgbiQ-00020P-0l
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 10:24:08 +0100
Received: by wf-out-1314.google.com with SMTP id 28so1872278wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2009 02:19:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.69.20 with SMTP id r20mr2459798wfa.188.1236590351699; Mon, 
	09 Mar 2009 02:19:11 -0700 (PDT)
In-Reply-To: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
References: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
Date: Mon, 9 Mar 2009 17:19:11 +0800
Message-ID: <180e2c240903090219jc22e662w6dddd0476c321fd1@mail.gmail.com>
From: yajin zhou <yajinzhou@vm-kernel.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 09 Mar 2009 09:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I find the error information in gpe-image-1.0-r0/temp/log.qa_package:

.la contains reference to the workdir, staging,
/staging/mipsel-angstrom-linux/usr/lib/libncurses.la
.la contains reference to the workdir, staging,
/staging/mipsel-angstrom-linux/usr/lib/libmenu.la

The bug 4348(http://bugs.openembedded.net/show_bug.cgi?id=4348) says this
error does not effect the software built. So I can omit this error although
it sounds strange to do so......

-- 
yajin

http://vm-kernel.org

On Mon, Mar 9, 2009 at 2:31 PM, yajin zhou <yajinzhou@vm-kernel.org> wrote:

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
> ERROR: Build of /home/yajin/OE/openembedded/packages/images/gpe-image.bbdo_qa_staging
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
>
>
>
>
>

