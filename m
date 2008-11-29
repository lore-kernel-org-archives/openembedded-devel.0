Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L6WWt-0000Bd-G1
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2008 21:35:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 0AB8B1405334;
	Sat, 29 Nov 2008 21:28:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbpgXvNhRSjV; Sat, 29 Nov 2008 21:28:36 +0100 (CET)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id B79CD1405326;
	Sat, 29 Nov 2008 21:28:35 +0100 (CET)
Date: Sat, 29 Nov 2008 21:32:01 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081129213201.21d91e2d@zaurus>
In-Reply-To: <1227919728-4878-1-git-send-email-dbaryshkov@gmail.com>
References: <1227919728-4878-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.14.2; arm-angstrom-linux-gnueabi)
Mime-Version: 1.0
Cc: dbaryshkov@gmail.com
Subject: Re: [PATCH] zaurus-updater: add support for home partition reflashing
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
X-List-Received-Date: Sat, 29 Nov 2008 20:35:03 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Dne Sat, 29 Nov 2008 03:48:48 +0300
Dmitry Baryshkov <dbaryshkov@gmail.com> napsal(a):

> Sometimes one needs to clean/reflash the home partition.
> Add support for flashing home.bin/HOME.BIN files onto "home" mtd
> device.

Somebody may found it useful (e. g. for initial setup).

Note that on models with HDD it will not do what is expected.
It will format 2nd NAND partition, but /home is on /dev/hda2.

When you are discussing updater, I would like to discuss few additional
changes:

1. Decrease number of reserved sectors while formatting the HDD. 5% is
far too much of space unusable for packages installation. I have 5%
free, but unable to run applications using /tmp. I propose 0% (or only
a few blocks).

2. Support for langpacks. OE does not create langpack yet, but it would
be nice to be able to flash localized system.

3. I am using post-flash customization using a combination of additional
files and patches. It would be nice to have something like that
directly as an updater feature.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


