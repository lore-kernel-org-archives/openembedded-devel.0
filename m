Received: from [209.85.217.180] (helo=mail-gx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michaelhaojie@gmail.com>) id 1LwjTU-0002WT-SV
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 22:55:21 +0200
Received: by gxk28 with SMTP id 28so296798gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=6dlzchBlIc9as04gTfFYl31YDLS7K34ECdtkpH9n0Uk=;
	b=dKD8Blnx97dxoBeuWyLVcNkw1od2IzES0P0EAmnZD0xtCAAe9e1zDAevuQhzw2ZuCv
	TwPa1MyISH9n8PImjvcQR0oxWOS2QmYJYNtdwn3ROYjWypI3Ldb80y2WlcHpDffDaXP/
	bMmDeMR1PoLqk8/cEiKa0d7Yc7Fu5BkrqW9ho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=o9U/+VjD2XdH3RmjUB3JSDh6lxNCxEVVKT7jqypWRjFpt+uRa9K+5DTQJfM6B1w6Zl
	sVuoCAdpnGuMDmi7ZLGQYrZ4lAeYbeSxoRtXflGs72QEQ1/QDh9ikqjfLUecGH97iiSn
	ownFuGs522owRG5yG/VPv5OO26EBx3oEPLPDM=
Received: by 10.90.33.15 with SMTP id g15mr189038agg.88.1240433442069;
	Wed, 22 Apr 2009 13:50:42 -0700 (PDT)
Received: from ?10.0.0.69? (66.236.178.138.ptr.us.xo.net [66.236.178.138])
	by mx.google.com with ESMTPS id 38sm1045860agd.9.2009.04.22.13.50.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 13:50:41 -0700 (PDT)
Message-ID: <49EF8312.5080309@gmail.com>
Date: Wed, 22 Apr 2009 16:50:26 -0400
From: Jie Hao <michaelhaojie@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.14.1240394403.21785.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.14.1240394403.21785.openembedded-devel@lists.openembedded.org>
Subject: error when build console-image
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
X-List-Received-Date: Wed, 22 Apr 2009 20:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When I try to build the console-image, it gives me an error like this:

NOTE: package 
linux-omap-2.6.29-r30+gitr58cf2f1425abfd3a449f9fe985e48be2d2555022: task 
do_fetch: started
fatal: Not a git repository
NOTE: Task failed: Fetch failed: Fetch command export 
SSH_AUTH_SOCK=/tmp/keyring-mXGBLO/ssh; export 
PATH=/home/jie/oe/tmp/staging/i686-linux/usr/bin/beagleboard-angstrom-linux-gnueabi:/home/jie/oe/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/jie/oe/tmp/staging/i686-linux/usr/sbin:/home/jie/oe/tmp/staging/i686-linux/usr/bin:/home/jie/oe/tmp/cross/armv7a/bin:/home/jie/oe/tmp/staging/i686-linux/sbin:/home/jie/oe/tmp/staging/i686-linux/bin:/home/jie/oe/opt/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; 
git fetch 
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git 
master failed with signal 128, output:
fatal: Not a git repository

NOTE: package 
linux-omap-2.6.29-r30+gitr58cf2f1425abfd3a449f9fe985e48be2d2555022: task 
do_fetch: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/jie/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb do_fetch failed
ERROR: Task 514 
(/home/jie/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb, do_fetch) 
failed

Any suggestion or remind?

Thanks,

Jie



