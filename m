Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QApiQ-0007N2-Bk
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:34:06 +0200
Received: from localhost.localdomain (95.249.56.93) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A960886AAC9 for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:31:49 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 22:31:44 +0200
Message-Id: <1302899505-22207-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: emacs-x11 "compilation" failure
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
X-List-Received-Date: Fri, 15 Apr 2011 20:34:06 -0000

Hi,
I found a patch on the old patchwork for emacs 23.2
I tried it and improved it a bit.
emacs compiles fine,but not emacs-x11:
I've the following error:
  LC_ALL=C qemu-arm -cpu cortex-a8 -s 1048576 -L .../work/armv7a-angstrom-linux-gnueabi/emacs-x11-23.2-r1.0/qemu-treedir  temacs -batch -l loadup dump
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  make[1]: *** [emacs] Segmentation fault

Note that we can't get rid of qemu because it makes an architecture 
  specific memory dump dump during the compilation:

See the following link for more details:
http://www.gnu.org/s/emacs/manual/html_node/elisp/Building-Emacs.html

I really wonder how to handle that?
Add -ggdb3 in bitbake.conf for the native stuff, clean my tmpdir and 
  rebuild emacs from scratch?

So far I tried:
running temacs on target for both x11 and non-x11 => success
so I belive the segmentation fault is from qemu...
I've tried getting a core of qemu, without success...
it says core dumped, I did man core and looked in it why the core was 
  not produced and tried to eliminate the possible causes, 
  without success, I even did that:
    echo '| cat > some/path/that/has/the/right/permissions/core' > /proc/sys/kernel/core_pattern
  or that:
    echo '| cat > $PWD/core' > /proc/sys/kernel/core_pattern
  Without success.

Denis.



