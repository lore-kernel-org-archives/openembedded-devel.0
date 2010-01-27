Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <baggerml@gmail.com>) id 1Na7aT-0006jF-Uw
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 14:05:40 +0100
Received: by fxm4 with SMTP id 4so5804202fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=N8dXkrCQL0yYUhGcuxjTtBCIZQLI7r0k82iAo7T6dmw=;
	b=ms8idiZj581EN2Vzbgm6fXxMAhml6zBwBiBeeg5FBN2HSKrTDFKMQd3NtV3HXHwM+x
	snCOlTbkqqr6mQxf6eyMOFnYDnnh5Hjtnu8abXQjAYW/8JTpESTdOzPugTBSOxlyISUr
	OxpHEibO60V+7N4tiE1FsWxhdq4vAavF97CI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Ab1xzKt/W51qnE9PPY5PW5eQdMMUC94HaOlmZXRviCkd4ongraaWpBmWJue8UJhoxI
	Zz3c8q8f2CSCAYGYAX5iGBCxxlFpkTCID2Rxz6h4tkJZ9s2Pe1b1BKe3Ffj3m1EGzlEw
	n2iNuYPB035WzgwZCQK6U5CJPfEpAdQwrq2wk=
Received: by 10.223.164.136 with SMTP id e8mr3744660fay.18.1264597390002;
	Wed, 27 Jan 2010 05:03:10 -0800 (PST)
Received: from ?10.10.10.170? (p128.cn.medi-a.ru [77.246.96.128])
	by mx.google.com with ESMTPS id 13sm3874038fxm.13.2010.01.27.05.03.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Jan 2010 05:03:09 -0800 (PST)
Message-ID: <4B60398C.4080605@gmail.com>
Date: Wed, 27 Jan 2010 16:03:08 +0300
From: Alex <baggerml@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: baggerml@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: kernel booting and params
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
X-List-Received-Date: Wed, 27 Jan 2010 13:05:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone!

Trying to find information about kernel booting gave me nothing so I 
decided to write here.

The question is: how does linux kernel know where to get its parameters' 
string? To be more precise, what actions in general should a linux 
bootloader do to tell the kernel its params and boot it?

Maybe someone knows where to find an information about it?

Exploring the sources of GRUB seemed  hard to me to understand...

Thanks anyway!


