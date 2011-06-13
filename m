Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1QWBRs-0001Ed-0P
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 20:01:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B49B7D5192B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 13:57:52 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24439-09 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 13 Jun 2011 13:57:52 -0400 (EDT)
Received: from [172.20.22.83] (dmzgw2.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 8AB8FD3E7B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 13:57:52 -0400 (EDT)
Message-ID: <4DF64F9F.5030309@cbnco.com>
Date: Mon, 13 Jun 2011 13:57:51 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: bitbake says do_rootfs fails without even forking it
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
X-List-Received-Date: Mon, 13 Jun 2011 18:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm using a fairly old oe-dev tree from late 2010. I upgraded bitbake to 
the 1.12 branch recently and haven't been able to build an image. This 
is what bitbake reports:


DEBUG: Executing task do_rootfs
NOTE: package toastix-image-20.12-r0: task do_rootfs: Started
DEBUG: Zero size logfn 
/home/michael/git/toastix/tmp/work/shogo2-oe-linux-gnueabi/toastix-image-20.12-r0/temp/log.do_rootfs.28992, 
removing
ERROR: Task 12 
(/home/michael/git/toastix/public/recipes/images/toastix-image.bb, 
do_rootfs) failed with exit code '1'

In strace, I can see a child process (or thread) is writing the 
run.do_rootfs file; checking the size of the log file; deleting the log 
file; sending an event back on a pipe; and calling exit_group(1).

It doesn't actually execute the run.do_rootfs file.

I can execute the rootfs script manually:

tmp/sysroots/x86_64-linux/bin/fakeroot -- bash -c \
	'. run.do_rootfs.17415 && do_rootfs'

and it fails, after a while, when rootfs_deb_do_rootfs tries to call 
"log_check rootfs". log_check() is defined in image.bbclass, but somehow 
it didn't make it into the run.do_rootfs script, even though the next 
function up in image.bbclass, insert_feed_uris, was included.

Questions:
1. What's the mechanism by which log_check is supposed to be included in 
the run.do_rootfs script?
2. Is anyone else using oe-dev with bitbake 1.12? It doesn't look like 
much has changed in the image classes since late 2010, so whatever 
problem I'm having, I'd think others could be having it, too.
3. How can I figure out why bitbake is not running the do_rootfs script? 
Passing lots of -D flags didn't help.

Thanks,
Mike


