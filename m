Received: from [213.207.90.162] (helo=daffy.sipo.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lists@t3i.nl>) id 1JjvvC-00043L-Ck
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 14:30:30 +0200
Received: from nobody by daffy.sipo.nl with local (Exim 4.63)
	(envelope-from <lists@t3i.nl>) id 1JjvvB-0007Hc-E0
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 14:30:29 +0200
To: openembedded-devel@lists.openembedded.org
From: "RvP" <lists@t3i.nl>
Mime-Version: 1.0
X-Mailer: Mr.Mail 0.6alpha
X-Originating-IP: 83.83.2.224
X-MsgID: php47fe08655d6fa
Message-Id: <E1JjvvB-0007Hc-E0@daffy.sipo.nl>
Date: Thu, 10 Apr 2008 14:30:29 +0200
Subject: Question about configuration
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
X-List-Received-Date: Thu, 10 Apr 2008 12:30:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi,

I am new to oe, and have a question about configuration of bb files. I have
copied an image bb file and task bb file into my own directory and manually
modified it. When I first built the image (bb my-image) then everything
worked fine. However, when I modified the task file (which is the image
depends on), then changes id not become effective after running 'bb my-image'
again.

In the task file, I changed some of the _STANDARD_RRECOMMENDS lines, which
should include some extra kernel modules. The modules have been build as part
of the kernel but thy don't show up in the rootfs. Also, if I remove some of
the kernel modules from the _STANDARD_RRECOMMENDS, then they will still show
up after building.

I am sure that the bb files are ok. If I clean and build everything from the
start (incl. toolchain) using my modified bb files, then the rootfs and
deployment image show up as expected.

I gues my question is: what should I do to make changes in my task bb file
effective? Is there a cache that should be flushed, or should I run some
extra command?

Thanks,
Richard.



