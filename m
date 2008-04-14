Received: from [213.207.90.162] (helo=daffy.sipo.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lists@t3i.nl>) id 1JlKdU-0006kX-2X
	for openembedded-devel@openembedded.org; Mon, 14 Apr 2008 11:06:00 +0200
Received: from nobody by daffy.sipo.nl with local (Exim 4.63)
	(envelope-from <lists@t3i.nl>) id 1JlKdS-0003do-UZ
	for openembedded-devel@openembedded.org; Mon, 14 Apr 2008 11:05:58 +0200
To: openembedded-devel@openembedded.org
From: "RvP" <lists@t3i.nl>
Mime-Version: 1.0
X-Mailer: Mr.Mail 0.6alpha
X-Originating-IP: 83.83.2.224
X-MsgID: php48031e76ddcb5
Message-Id: <E1JlKdS-0003do-UZ@daffy.sipo.nl>
Date: Mon, 14 Apr 2008 11:05:58 +0200
Subject: task configuration not evaluated?
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
X-List-Received-Date: Mon, 14 Apr 2008 09:06:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi,

I asked this question about configuring the image and task bb files last
week, but don't have an answer yet.

I modified the packages/tasks/task-slugos.bb file after building the SlugOS
image and did a bb slugos-image'. A new image was built, but the changes I
put in the task-slugos.bb were not taken into account. More specifically: I
removed the via-velocity kernel module from the SLUGOS_STANDARD_RRECOMMENDS
and added another (fs) module. However, after building the new image, the
via-velocity module was still included in the rootfs, and the module I added
was not. I tried to run several tasks (a.o. 'bb slugos-image -c configure')
but that didn't work.

What should I do to make changes in the task file effective (except for
rebuiling everyting...)?



