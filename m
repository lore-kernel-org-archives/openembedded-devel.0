Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Patrick_Fischer@gmx.de>) id 1JuU7c-0007i8-HN
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 May 2008 17:02:56 +0200
Received: (qmail 32570 invoked by uid 0); 9 May 2008 15:02:03 -0000
Received: from 213.39.239.91 by www172.gmx.net with HTTP;
	Fri, 09 May 2008 17:02:03 +0200 (CEST)
Date: Fri, 09 May 2008 17:02:04 +0200
From: "Patrick Fischer" <Patrick_Fischer@gmx.de>
Message-ID: <20080509150204.118180@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #1735141
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1/y20JshtryY7p5r3f89VDBkveY/qDMCA612rCqX9
	1+AfooeIWtgt7N/tsNDuU25BcS4uF6gz4f7g== 
X-GMX-UID: PxNBOEJPZCEEWYsDf2whDEl4IGhpZcYK
Subject: do_rootfs file or not to file....
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
X-List-Received-Date: Fri, 09 May 2008 15:02:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello oe

maybe i have a email problem. so sorry if you receive this email double.

We have a strange do_rootfs problem.
After update to Ubuntu 8.04 and debian testing we can't run do_rootfs anymore.

Sometimes it is a file which is no file or a dir which is not a dir:

In this case a dir was created with mkdir and the next ls -l line shows that 
it is a file:

######
+ rm -rf /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
+ mkdir -p /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
+ ls -l /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
-rwxr-xr-x 2 root root 4096 May  8 
14:03 /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
+ 
cp -r /usr/src/trunk/projects/base/build/tmp/rootfs/usr/local/ /usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/
cp: target `/usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/' is not 
a directory
######

Also it could be inverted. A file copied by cp is a dir.

######
mkfs.jffs2 -x 
lzo --root=/usr/src/trunk/projects/base/build/tmp/rootfs/../rootfs_2/ --faketime --output=/usr/src/trunk/projects/base/build/tmp/deploy/images/rootfs.jffs2 --little-endian -e 
128 --pad=27131904 
mkfs.jffs2: opening 
directory /usr/src/trunk/projects/base/build/tmp/rootfs_2/lib/libblaconfig.so.0: 
Not a directory 
######

The really strange thing is that if I run 
the /usr/src/trunk/projects/base/build/tmp/work/boxr5-1.0-r0/temp/run.do_rootfs.12648 
by hand, it works fine. The Problem is not always at the same line!!

I read something about "switch from RiserFS to ext3" but I have ext3.
/bin/sh is bash

I'm not sure but the scripts are called from within python??
The workstation which failed are using Python 2.5.2.
Python 2.4.4 -> works
Python 2.5.2 -> fails 

I'm not allown, in this Forum some people have the same problem: 
http://www.dream-multimedia-tv.de/board/thread.php?postid=17280#post17280

Maybe somebody knows a fix.

Best Regards
Patrick Fischer

-- 
GMX startet ShortView.de. Hier findest Du Leute mit Deinen Interessen!
Jetzt dabei sein: http://www.shortview.de/?mc=sv_ext_mf@gmx


