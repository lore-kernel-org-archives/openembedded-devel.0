Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Pxc50-0006jm-EV
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 10:22:46 +0100
Received: by iyb26 with SMTP id 26so1432295iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 01:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=IAvEk60LY7srfggcnri6RNrhUONC8bwAR2rOfUgRurA=;
	b=p4THXhZY2A6KvCKWShEHRbE3flAdAR1j+sXogmJycsmLLaYJ1Kzb5xp1IxG2IREJDu
	cQHcT0r/oDwNi6yLdXbqDWeug2e3Pf5Q2FkCIvGDsSZ67ZnU8deuCQSV35ejLp1/Oi4O
	VwijzslWn4vktANg/wJuSBHrWCDlQSBJXgEEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=nTBzYy67+hujQQtt6xnZD9EhYPweSqIiKG1f/1cvvgKjW9xLy3S9PgTwEAQ4v6JT1V
	bzfUDWRlDT3FR2st1VxiLDlv3jkapxomVpvatz/SuL92BLzN+YQJKbgox9z1WycNylU2
	J5pgWUBTdzo+vJ6f29gOjfNLLio03OdbDMMZ0=
MIME-Version: 1.0
Received: by 10.42.168.131 with SMTP id w3mr5097869icy.122.1299748860195; Thu,
	10 Mar 2011 01:21:00 -0800 (PST)
Received: by 10.42.117.138 with HTTP; Thu, 10 Mar 2011 01:21:00 -0800 (PST)
Date: Thu, 10 Mar 2011 10:21:00 +0100
Message-ID: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] cpio.lzma compression level in bitbake.conf
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
X-List-Received-Date: Thu, 10 Mar 2011 09:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

in bitbake.conf we use the maximum lzma compression level (-c -9) for
the initramfs:

IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
(find . | cpio -o -H newc | lzma -c -9
>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
${EXTRA_IMAGECMD}"

This makes decompressor fail on devices with 32Mb RAM (see
http://paste.debian.net/110203/ ).
Same kernel boots with compression set to -7.

Some figures can be obtained here:
http://www.gsp.com/cgi-bin/man.cgi?section=1&topic=lzcat

It was suggested we should introduce something like
LZMA_COMPRESSION_LEVEL or use internal tables to find better level
from targets memory amount.
In the meanwhile I think we should change the defaults in bitbake.conf.

Opinions?

Andrea


