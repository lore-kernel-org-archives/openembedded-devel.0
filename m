Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ju06M-0006vQ-BD
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 08:59:38 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ju05h-0000Y1-JU
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 06:58:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 06:58:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 06:58:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 May 2008 08:58:48 +0200
Message-ID: <fvu8b8$kl2$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
Sender: news <news@ger.gmane.org>
Subject: Disapproval of revision b8e46b797b32111526a2116d020fdd9e1c079965
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
X-List-Received-Date: Thu, 08 May 2008 06:59:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

This morning I get:

  File "/OE/bitbake/lib/bb/build.py", line 136, in exec_func_python
     utils.better_exec(comp, g, tmp, bbfile)
   File "/OE/bitbake/lib/bb/utils.py", line 144, in better_exec
     exec code in context
   File "patch_do_patch", line 100, in <module>
   File "patch_do_patch", line 98, in patch_do_patch
   File "<bb>", line 339, in Resolve
__builtin__.CmdError: Command Error: exit status: 1  Output:
Applying patch amd64.patch
patching file longlong.h
Hunk #1 FAILED at 715.
1 out of 1 hunk FAILED -- rejects in file longlong.h
Patch amd64.patch does not apply (enforce with -f)

So I look at the commits:

Commit by Laibsch on org.oe.dev :: rb8e46b79... / (14 files in 7 dirs):
gmp: consolidate common patches unchanged across versions into files/

koen@lieve:/OE/org.openembedded.dev/packages/gmp$ find . | grep amd64
./files/amd64.patch

Ok, so there really is only one patch. Let's do an experiment:

koen@lieve:/OE/org.openembedded.dev/packages/gmp$ mtn up -r f3aafac3
mtn: expanded selector 'f3aafac3' -> 'i:f3aafac3'
mtn: expanding selection 'f3aafac3'
mtn: expanded to 'f3aafac33dd3d98133bfd91efdee783ccd8da959'
mtn: selected update target f3aafac33dd3d98133bfd91efdee783ccd8da959
mtn: [left]  71c3bbc5e67f712d2f13eedc29e54d1d2e9c64c8
mtn: [right] f3aafac33dd3d98133bfd91efdee783ccd8da959
mtn: renaming packages/gmp/files/amd64.patch to 
packages/gmp/gmp-4.1.2/amd64.patch
mtn: adding packages/gmp/gmp-4.1.4/amd64.patch
mtn: renaming packages/gmp/files/sh4-asmfix.patch to 
packages/gmp/gmp-4.1.4/sh4-asmfix.patch
mtn: adding packages/gmp/gmp-4.2.1/amd64.patch
mtn: adding packages/gmp/gmp-4.2.1/sh4-asmfix.patch
mtn: renaming packages/gmp/files/x86-fat.diff to 
packages/gmp/gmp-4.2.1/x86-fat.diff
mtn: adding packages/gmp/gmp-4.2.2/amd64.patch
mtn: adding packages/gmp/gmp-4.2.2/sh4-asmfix.patch
mtn: adding packages/gmp/gmp-4.2.2/x86-fat.diff
mtn: dropping packages/gmp/files
mtn: updated to base revision f3aafac33dd3d98133bfd91efdee783ccd8da959

koen@lieve:/OE/org.openembedded.dev/packages/gmp$ find . | grep amd64
./gmp-4.1.2/amd64.patch
./gmp-4.1.4/amd64.patch
./gmp-4.2.1/amd64.patch
./gmp-4.2.2/amd64.patch

OK, so I have the patches back, now see if they are all the same, as 
claimed by the commit:

koen@lieve:/OE/org.openembedded.dev/packages/gmp$ find . | grep amd64 | 
xargs md5sum
9c015f16636e1fd0d2f374672b7004a5  ./gmp-4.1.2/amd64.patch
a9876747e7ae95ee64f505022b92bb10  ./gmp-4.1.4/amd64.patch
a9876747e7ae95ee64f505022b92bb10  ./gmp-4.2.1/amd64.patch
a9876747e7ae95ee64f505022b92bb10  ./gmp-4.2.2/amd64.patch

Nope they aren't. Revision disapproved to unbreak my build.
This is the second time this week[1] that a 'cleanup' breaks the build. 
Please pay more attention (e.g. 'for bb in *.bb ; do bitbake -b $bb -c 
patch ; done') when doing things like this.


[1] 
http://lists.linuxtogo.org/pipermail/openembedded-commits/2008-May/014437.html



