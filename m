Received: from [206.190.52.47] (helo=smtp108.biz.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <neha.agarwal@aegismobility.com>) id 1JID0B-0003YS-9n
	for openembedded-devel@openembedded.org; Fri, 25 Jan 2008 02:05:03 +0100
Received: (qmail 50484 invoked from network); 25 Jan 2008 01:05:05 -0000
Received: from unknown (HELO nagarwaldt)
	(neha.agarwal@aegismobility.com@24.84.32.239 with login)
	by smtp108.biz.mail.re2.yahoo.com with SMTP; 25 Jan 2008 01:05:04 -0000
X-Yahoo-Newman-Property: ymail-3
From: "Neha agarwal" <neha.agarwal@aegismobility.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jan 2008 17:05:13 -0800
Message-ID: <005501c85eee$578dfe50$e10b10ac@nagarwaldt>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: Ache6xc5EA8HRitRTMaf59jYg+4TDQAAkjnQ
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
In-Reply-To: <47992AD2.7040805@kernelconcepts.de>
Subject: task-base image issue!
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
X-List-Received-Date: Fri, 25 Jan 2008 01:05:04 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
I am trying to create an image to make my diskless Xeon linux intel blade
become standalone.
I am running a "bitbake task-base"
With local .conf as 
DISTRO = "generic"
IMAGE_FSTYPES = "jffs2 tar"
MACHINE = "i686-generic"

I can see my build completed but there is no "rootfs" folder created under
tmp.Also I can't find any "jffs2" file anywhere.

All what I see under tmp/deploy/images

1)bzImage-i686-generic.bin -> bzImage-2.6.21-r12-i686-generic.bin
2)modules-2.6.21-r12-i686-generic.tgz
3)bzImage-2.6.21-r12-i686-generic.bin

Please let me know what's going wrong.
Also how do I use the image generated to boot my diskless system so that it
becomes standalone? Using tftp?DHCP?

Thanks in advance.

Regards,
Neha



