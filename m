Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1Ga4W4-00036I-7H
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 08:03:00 +0200
Received: by py-out-1112.google.com with SMTP id i75so211133pye
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2006 22:56:04 -0700 (PDT)
Received: by 10.35.121.9 with SMTP id y9mr16989480pym;
	Tue, 17 Oct 2006 22:56:04 -0700 (PDT)
Received: by 10.35.15.3 with HTTP; Tue, 17 Oct 2006 22:56:04 -0700 (PDT)
Message-ID: <427d64720610172256kbad5556n6ac7caf4bc9b965a@mail.gmail.com>
Date: Wed, 18 Oct 2006 13:56:04 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: why the files in rootfs /dev folder are regular files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 06:03:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
    I'm using angstrom/mainstone config.
    After build a bootstrap-image, I found that the files in
rootfs/dev folder are all regular files. Is this OE bug?

axel@kdc:/opt/oe/build$ ls tmp/rootfs/dev/ -l
total 0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 apm_bios
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 console
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 fb0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda1
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda10
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda11
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda12
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda13
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda14
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda15
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda16
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda17
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda18
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda19
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda2
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda3
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda4
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda5
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda6
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda7
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda8
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 hda9
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 kmem
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mem
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd1
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd2
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd3
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd4
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd5
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd6
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtd7
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock1
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock2
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock3
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock4
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock5
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock6
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 mtdblock7
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 null
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 ram0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 ram1
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 ram2
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 ram3
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty1
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty2
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty3
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty4
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty5
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty6
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty7
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 tty8
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 ttyS0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 ttySA0
-rw-r--r-- 1 axel axel 0 Oct 18 13:38 zero
axel@kdc:/opt/oe/build$ ls

Regards,
Axel


