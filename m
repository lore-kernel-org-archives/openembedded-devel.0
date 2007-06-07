Received: from [128.178.50.26] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1HwIT7-0004jg-HB
	for openembedded-devel@openembedded.org; Thu, 07 Jun 2007 15:56:05 +0200
Received: (qmail 18680 invoked by uid 107); 7 Jun 2007 13:53:38 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp3.epfl.ch with SMTP; 7 Jun 2007 13:53:38 -0000
Received: from (unknown [128.178.50.22]) by MAILAV3.epfl.ch with smtp
	id 0977_7e384f40_14fe_11dc_ab3e_0014221528b0;
	Thu, 07 Jun 2007 15:53:37 +0200
Received: from lsa1pc7.epfl.ch (128.178.145.53)
	by smtp1.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 07 Jun 2007 15:53:38 +0200
X-Sendermtaip: 128.178.145.53
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jun 2007 15:53:37 +0200
User-Agent: KMail/1.9.6
References: <200706071519.54448.valentin.longchamp@epfl.ch>
	<9A71D45A-41AE-400D-8CC1-BDF905FD4F7C@gmx.net>
In-Reply-To: <9A71D45A-41AE-400D-8CC1-BDF905FD4F7C@gmx.net>
MIME-Version: 1.0
Message-Id: <200706071553.38056.valentin.longchamp@epfl.ch>
Subject: Re: JFFS2 trouble
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
X-List-Received-Date: Thu, 07 Jun 2007 13:56:09 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Holger Freyther wrote:
>
> > However, according to the jffs2 documentation, I should use /dev/
> > mtd2 and
> > not /dev/mtdblock2:
> > http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock
>
> Fromt the FAQ you pointed us to: "There are two cases where this does
> not work. The first is when JFFS2 is used as a root filesystem. For
> now, this requires the mtdblock device to be specified for root= on
> the kernel commandline. The second case is when the mount binary that
> is being used does not play nicely with the above format. The busybox
> version of mount is known to not work without the mtdblock device."
>
> I know you don't have a rootfs on jffs2 but do you use busybox mount?
>

That was one of the first things I had tried to test but I have forgotten to 
tell about it in the mail. Anyway, OE does not include mount in busybox and 
builds the "usual" one:

> root@mx31ads:~$ which mount
> /bin/mount
> root@mx31ads:~$ ls -al /bin/mount
> lrwxrwxrwx    1 root     root           16 Jan  1 00:00 /bin/mount ->
> mount.util-linux root@mx31ads:~$ ls -al /bin/mount.util-linux
> -rwsr-xr-x    1 root     root        60604 Jan  1 00:00
> /bin/mount.util-linux root@mx31ads:~$ mount --version
> mount: mount-2.12

But thank you for the quick and pertinent answer.

-- 
Valentin Longchamp
PhD Student
http://people.epfl.ch/valentin.longchamp


