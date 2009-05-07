Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M1wCt-00011y-RN
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 07:31:43 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M1w6z-0001AP-Aq
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 09:25:37 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 May 2009 09:25:32 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <loom.20090506T211326-740@post.gmane.org>
In-Reply-To: <loom.20090506T211326-740@post.gmane.org>
MIME-Version: 1.0
Message-Id: <200905070925.32935.khimov@altell.ru>
Subject: Re: Development and Open Embedded
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
X-List-Received-Date: Thu, 07 May 2009 05:31:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 07 May 2009 01:33:45 Michael Sundius wrote:
> I'm wondering if anyone has done such a thing as creating a
> recipe that forgoes the "fetch" task and point the ${S} to
> a local devel tree.. then adds an extra onto the make command
> to place the object in another directory (maybe ${O})...

One of our engineers (Alexey Zaytsev <zaytsev@altell.ru>) have done this for 
kernel:

==================================================================
python do_fetch() {
        linux_prefetch = bb.data.getVar('LINUX_PREFETCH', d)

        if not linux_prefetch:
                bb.build.exec_func('base_do_fetch', d)
}

python do_unpack() {
        import os

        linux_prefetch = bb.data.getVar('LINUX_PREFETCH', d)

        if not linux_prefetch:
                bb.build.exec_func('base_do_unpack', d)
        else:
                s = bb.data.expand(bb.data.getVar('S', d), d)
                os.system("ln -sf %s %s" % (linux_prefetch, s))
                config = "file://" + bb.data.getVar('LINUX_CONFIG', d)
                oe_unpack_file(bb.fetch.localpath(config, d), d)
}
==================================================================

You set LINUX_PREFETCH to point to git tree in local.conf and LINUX_CONFIG to 
config file (LINUX_CONFIG is set in kernel .bb file). That's it. I think it's 
very hacky and generally don't like the approach, but the thing works and he's 
been working successfully with this hack building two kernels from the same 
source base. Of course, there is also separate directory building there, but 
that's done in classes (will try to extract a good patch).

Also, just to give more hack directions, there is "git/git_repo/.git" in 
sources directory that can be symlinked into "${S}/git/.git", that would allow 
using "bitbake -c compile -f" to rebuild the package working with sources in 
normal way. I think making bitbake patch to add this symlink would be a bit 
better to start with, but then there should be some enforcement of local HEAD 
usage without constant "rev=..." specifying in .bb.


