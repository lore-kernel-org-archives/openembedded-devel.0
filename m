Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JuUF2-0007vX-AP
	for openembedded-devel@openembedded.org; Fri, 09 May 2008 17:10:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JuUEE-00084J-QV
	for openembedded-devel@openembedded.org; Fri, 09 May 2008 15:09:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 09 May 2008 15:09:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 09 May 2008 15:09:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 09 May 2008 17:09:39 +0200
Message-ID: <g01pfj$o6j$1@ger.gmane.org>
References: <20080509150204.118180@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <20080509150204.118180@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: do_rootfs file or not to file....
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 09 May 2008 15:10:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Patrick Fischer wrote:
> Hello oe
>
> maybe i have a email problem. so sorry if you receive this email double.
>
> We have a strange do_rootfs problem.
> After update to Ubuntu 8.04 and debian testing we can't run do_rootfs anymore.
>
> Sometimes it is a file which is no file or a dir which is not a dir:

Sound like fakeroot issues, you have 2 options to 'fix' it:

* cat /dev/urandom > /dev/zero while doing do_rootfs
* upgrade the fakeroot-native recipe

regards,

Koen


>
> In this case a dir was created with mkdir and the next ls -l line shows that
> it is a file:
>
> ######
> + rm -rf /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
> + mkdir -p /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
> + ls -l /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
> -rwxr-xr-x 2 root root 4096 May  8
> 14:03 /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
> +
> cp -r /usr/src/trunk/projects/base/build/tmp/rootfs/usr/local/ /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
> cp: target `/usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/' is not
> a directory
> ######
>
> Also it could be inverted. A file copied by cp is a dir.
>
> ######
> mkfs.jffs2 -x
> lzo --root=/usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/ --faketime --output=/usr/src/trunk/projects/base/build/tmp/deploy/images/rootfs.jffs2 --little-endian -e
> 128 --pad=27131904
> mkfs.jffs2: opening
> directory /usr/src/trunk/projects/base/build/tmp/rootfs_2/lib/libblaconfig.so.0:
> Not a directory
> ######
>
> The really strange thing is that if I run
> the /usr/src/trunk/projects/base/build/tmp/work/boxr5-1.0-r0/temp/run.do_rootfs.12648
> by hand, it works fine. The Problem is not always at the same line!!
>
> I read something about "switch from RiserFS to ext3" but I have ext3.
> /bin/sh is bash
>
> I'm not sure but the scripts are called from within python??
> The workstation which failed are using Python 2.5.2.
> Python 2.4.4 ->  works
> Python 2.5.2 ->  fails
>
> I'm not allown, in this Forum some people have the same problem:
> http://www.dream-multimedia-tv.de/board/thread.php?postid=17280#post17280
>
> Maybe somebody knows a fix.
>
> Best Regards
> Patrick Fischer
>




