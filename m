Received: from [209.85.142.184] (helo=ti-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KIjfO-0008HX-V0
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2008 14:30:03 +0200
Received: by ti-out-0910.google.com with SMTP id d10so2367283tib.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2008 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=5ShGwWsCbBn03v4UiU90MtYkvdwePfz02Q6tT9pjqc0=;
	b=ezxRY3aBDKKY+Y/pimmDgnKWdyVXn/fl0ILEd5lcAmKVPBI1SaU5NPShoSsBthjHsE
	Ezi2+MzOrRid1IRbEmIJ4ubIi2wTUf37GOYQxYK4duuCELs266AfGtEJgMaeB3+mUYlb
	ayWwR+lG/zr/lkl2OJ+/tESTI9ZiZzoKQiAcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=GawWAO1+knXTP1gHCzw7uaasWCx5yjM6pfvmlSRgnr37MXmkpZMyHW4Os1TQ0mF0QA
	FLtlqHZKl3sii7R9OULj1BQQHkLlLvHyldYiTp6WOZ/yBcagKT8JsU+/9yG7fDa6Q3JK
	BtWfQOTiVWjeR0zpFDxwZgs1xLKPCdMlnB1JQ=
Received: by 10.151.106.4 with SMTP id i4mr177008ybm.119.1216124964301;
	Tue, 15 Jul 2008 05:29:24 -0700 (PDT)
Received: by 10.150.178.1 with HTTP; Tue, 15 Jul 2008 05:29:24 -0700 (PDT)
Message-ID: <d1b08f940807150529k4c318da1h54d93ec13a010cfe@mail.gmail.com>
Date: Tue, 15 Jul 2008 14:29:24 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: RFC: udev_124
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 12:30:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Trying to solve an apparent race condition I upgraded to udev_124.

The mtn diff is attached here:
http://bugs.openembedded.net/show_bug.cgi?id=4118

Looking at http://git.kernel.org/?p=linux/hotplug/udev.git;a=summary
there are a couple of interesting patches: I applied the 'udevadm:
settle - add verbose output when running into timeout' but I'd apply
the 'udev.conf: udevcontrol -> udevadm control' patch too.

The recipe configures and compiles fine  (see
http://tinderbox.openembedded.net/packages/73537/ )

Ant


