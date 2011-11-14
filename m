Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aspnair@gmail.com>) id 1RPtdD-0005Ms-F4
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 11:19:15 +0100
Received: by iahk25 with SMTP id k25so5837842iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 02:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YlcqYDrSOn7PSCmpwmTn66aFdGXZbpq+yCRYJkwlF6A=;
	b=VZ+JRkNpjofvqzJfxOpOtkgb76y6UZUSVEfDre5kcjyiiPiAydOseNd6cQsKKSrVg4
	fJfF85FC4A6wD4pAooGiRONpW0qvb3kYc1tfcAY/IwNEMZG9WnACpBP6OrPweOhxN/sx
	vdKJ3oFNmySO5huUj0mA86X0JEcrN8YoCwhBY=
MIME-Version: 1.0
Received: by 10.231.62.75 with SMTP id w11mr5139766ibh.6.1321265573033; Mon,
	14 Nov 2011 02:12:53 -0800 (PST)
Received: by 10.231.199.12 with HTTP; Mon, 14 Nov 2011 02:12:52 -0800 (PST)
Date: Mon, 14 Nov 2011 15:42:52 +0530
Message-ID: <CAHBw83f=g2zU5o1MCMLg=TYuEMiSpHwwQCL98dZwfF8U7tS5sg@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Using Multiple images for different partitions
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
X-List-Received-Date: Mon, 14 Nov 2011 10:19:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear All,

This question is about creating multiple images/tasks for one specific
requirement.  I just want to know how this could be done in OE.

I have a few custom applications/libraries to be installed in a separate
partition and they need to be separate from the normal rootfs.  The
dependency is like the following

          custom_app1                      custom_app2
          |        |                       |         |
          v        v                       v         v
      custom_lib1 custom_lib2         custom_lib4 custom_lib2
          |                                |
          v                                v
      custom_lib3                     custom_lib5

I do have a recipe from each of the custom_app and custom_lib above and
they all compile very well.  If I package them under a single image
(image1), then everything is fine.

Now I have to split the images for different partitions
image1: Normal OE rootfs except the above apps/libraries,
        but all their other dependencies including libc etc.
        (for partition1)
image2: Squashfs filesystem with the above
        custom_app[1-2] and custom_libs[1-5], but nothing else.
        (for parititon2)

There is no problem in running bitbake two times to create these two
images.  It is also fine to get a tar.gz instead of squashfs filesystem.

Any suggestions on how to do this?

Thanks and Regards

Anand


-- 
http://saurorja.org
Twitter: @anand_sivaram

