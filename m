Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1Hc5sO-0007sU-Jp
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2007 22:26:40 +0200
Received: by nz-out-0506.google.com with SMTP id m22so520096nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2007 13:26:39 -0700 (PDT)
Received: by 10.115.108.1 with SMTP id k1mr854891wam.1176409599093;
	Thu, 12 Apr 2007 13:26:39 -0700 (PDT)
Received: by 10.114.152.15 with HTTP; Thu, 12 Apr 2007 13:26:39 -0700 (PDT)
Message-ID: <bdb0025f0704121326y3fef7ab6q62eb7b906ce3e947@mail.gmail.com>
Date: Thu, 12 Apr 2007 17:26:39 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: gcc (and others) missing some links to binaries
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
X-List-Received-Date: Thu, 12 Apr 2007 20:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

When I was using mamona I've noticed that gcc was installed but
without the gcc command... Then I realized that in package there were
only this files

/usr/bin/arm-mamona-linux-gnueabi-gcc
/usr/bin/arm-mamona-linux-gnueabi-gccbug

but not the /usr/bin/gcc or gccbug

Then I tried to build angstrom to see if this error was happening just
in mamona and for my surprise the gcc deb package for angstrom just
have this 2 binary files too:

/usr/bin/arm-angstrom-linux-gnueabi-gcc
/usr/bin/arm-angstrom-linux-gnueabi-gccbug

I've noticed that this is happening to binutils too...

Does any body have any idea about it?

I've noticed that do_install() function of gcc-package.inc try to create a link:
cd ${D}${bindir}
ln -sf ${TARGET_SYS}-gcc gcc

This is creating the link at
tmp/work/armv5te-angstrom-linux-gnueabi/gcc-4.1.2-r0/image/usr/bin

but not in
work/armv5te-angstrom-linux-gnueabi/gcc-4.1.2-r0/install/usr/bin

and I believe that deb package is using install directory not image
one when building...

Do you have any idea?

Thanks in advance...

vivijim


