Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NzrgA-0004Ew-VU
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 15:21:58 +0200
Received: by bwz20 with SMTP id 20so1695869bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=rA7ab61HK+TP/KuLgN8vF5kTy9ByTWHMvEQWH859YIs=;
	b=t97/2qCcLYyWy2j3D+OiuQnca6EevV9mL/JOkwz3Lqq8gUng8efJizvyNFoNVn9gNc
	dak7AURv5h+PaIKNmJWxREtrI1/Pt2cBURnb7KNkzBvLsmzFDIRcR5W9dKlYJr4lr/hd
	vDFN7klm3biRsumWU4RIClbFAk2LIaNbdUxIM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=NBqkUkQQjkOSbJG/vaignIINDxPctCeUqt7jJLiCiOhsZuz7ieglab7uMlm06//9VT
	C26DW7dnYgrR1nyzpaRPRvDLocHKB9lDBrOz0D2YM0j/6maPbi+oSWZDnjnOnPD843cy
	vY5c9Ba3JNT9QJlCHyoReiT6YcoCzIycmdb2A=
Received: by 10.204.85.73 with SMTP id n9mr146552bkl.71.1270732712156;
	Thu, 08 Apr 2010 06:18:32 -0700 (PDT)
Received: from [192.168.178.21] (85-127-232-178.dynamic.xdsl-line.inode.at
	[85.127.232.178])
	by mx.google.com with ESMTPS id 16sm37387bwz.13.2010.04.08.06.18.31
	(version=SSLv3 cipher=RC4-MD5); Thu, 08 Apr 2010 06:18:31 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100408125317.GC2262@xora-desktop.xora.org.uk>
References: <l2pfca63bcf1004080544ze5d9af0cw4c3b1ea9ea30e597@mail.gmail.com>
	<20100408125317.GC2262@xora-desktop.xora.org.uk>
Date: Thu, 08 Apr 2010 15:19:02 +0200
Message-ID: <1270732742.4395.2.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.0.1 
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3-mkcard.sh: Adding sleep and umounts to fix race cond.
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
X-List-Received-Date: Thu, 08 Apr 2010 13:22:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 08.04.2010, 13:53 +0100 schrieb Graeme Gregory:
> Wont those extra umounts make the script exit when I have set my
> machine not to automount the partitions?
> 
> Graeme

...
umount: /dev/mmcblk0p1: not mounted
mkfs.vfat 3.0.2 (28 Feb 2009)
...

Nope, just adds some output. ($? would indicate failure on the command
but script continues)

Regards,
Michael




