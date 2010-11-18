Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PIxLg-0000QW-7q
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 06:47:58 +0100
Received: by ywg8 with SMTP id 8so1245438ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 21:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=dE9rE1CWhl1l0D2GokY1YMkPlVFI57Ry2U8/HE5ol+E=;
	b=kYYw4P0vGkNdha0I2Cl02ObJkfGiAPSPd3vdNoJwj7pLQScwKnx9NLMIvN+TT6JJvE
	EQnQcXZpP5bFxYflVbnYhPTa9b9fdnuSYCAKACll3pSSwltr2wTLWVxBmJ+hLtL3HGOv
	/gj1PTq6N4C8+vlssa0+gY59PhmImtl2vHAPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=gv5GDCz1sOkNyc1HMaoTOfffUnKQNdLJkpK4weItSX3EO8ULrsjuK6JdSf5r78v6Q5
	jdqyGdBhEnD07ReICvRQs/Ui0239SgPRXn7H4N7flmhlaNnmir9MkKZt3G8WpbsfpdQO
	xEMqbcSbcTg0GKlMBLTM7/6XB6ny95h2D5pUA=
Received: by 10.91.10.7 with SMTP id n7mr386075agi.99.1290059207750;
	Wed, 17 Nov 2010 21:46:47 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 55sm7315yhl.32.2010.11.17.21.46.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Nov 2010 21:46:46 -0800 (PST)
Message-ID: <4CE4BDC1.3060505@gmail.com>
Date: Thu, 18 Nov 2010 16:16:41 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake micro-image failure
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
X-List-Received-Date: Thu, 18 Nov 2010 05:47:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Build Configuration:
BB_VERSION        = "1.11.0"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "c7be1ba"
TARGET_ARCH       = "mipsel"
TARGET_OS         = "linux"
MACHINE           = "qemumipsel"
DISTRO            = "micro"
DISTRO_VERSION    = "20101118"

... snip ...

| Collected errors:
|  * check_data_file_clashes: Package libc-thread-db wants to install file /mnt/oe/tmp/rootfs/micro-image/lib/libthread_db.so.1
|       But that file is already provided by package  * libc6-dev
|  * opkg_install_cmd: Cannot install package udev.
NOTE: package micro-image-1.0-r0: task do_rootfs: Failed
ERROR: Function 'do_rootfs' failed (see /mnt/oe/tmp/work/qemumipsel-oe-linux/micro-image-1.0-r0/temp/log.do_rootfs.16406 for further information)
ERROR: '/home/grg/oe2/openembedded/recipes/images/micro-image.bb' failed




