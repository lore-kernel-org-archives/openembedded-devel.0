Received: from [209.85.134.190] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJdQA-00064R-Ns
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2008 00:29:46 +0100
Received: by mu-out-0910.google.com with SMTP id w9so972725mue.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 15:29:53 -0800 (PST)
Received: by 10.78.190.10 with SMTP id n10mr8424246huf.37.1201562992892;
	Mon, 28 Jan 2008 15:29:52 -0800 (PST)
Received: from widy.localdomain ( [88.231.77.184])
	by mx.google.com with ESMTPS id c18sm2394873hub.50.2008.01.28.15.29.48
	(version=SSLv3 cipher=OTHER); Mon, 28 Jan 2008 15:29:49 -0800 (PST)
Date: Tue, 29 Jan 2008 01:41:17 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080129014117.60ed9f77@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: [RFC] Setting default IMAGE_FSTYPES to tar.gz in bitbake.conf
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
X-List-Received-Date: Mon, 28 Jan 2008 23:29:46 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

Currently, we have in bitbake.conf:

IMAGE_FSTYPES ?= "jffs2"

jffs2 is a special filesystem format, suitable for limited number of
hardware on the global scale. So I would like to propose to replace
that default with some neutral and well-know format, say tar.gz.


Oh, and btw, I have a bunch of standalone filesystem conversion scripts
which I can't find time to RFC for addition to contrib/. While OE has
ability to generate images in different formats, sometimes there's a
need/easier to convert one existing flexible format. Few usecases I
personally had:

1. I don't have jffs2 in IMAGE_FSTYPES, as I don't flash stuff, so
having that would increase image generation runs and wasted disk space.
But when I needed to play with LiveRamdisks, which use jffs2, I just
converted tar.gz to jffs2.

2. For Angstrom loopback installs, I run scripts which convert
specific tar.gz to ext2 right on the download server, instead of
downloading, converting and uploading back, of overloading autobuilder
with generating ext2 for each image.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


