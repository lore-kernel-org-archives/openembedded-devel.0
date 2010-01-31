Received: from mail-pz0-f177.google.com ([209.85.222.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbTk3-0002pe-JC
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 07:57:10 +0100
Received: by pzk7 with SMTP id 7so3151353pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 22:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=KiLSXmrhECiMcrAkPsJXtY5osZmZibrWeYZS+kHZW0w=;
	b=p4dL6LDbQLUIkzvIXWz2FDbLSmnFShgdmF5UKXb7BonyFU17uho6bA9oszAC1tA5cN
	nOjAQvzU6pWLli4lCbfUeNCn9JOLH9CRIN8hT0pMPSFMqu1O3IRR9nGnFh0TESM6MEFe
	N4sAfyc1nuh017pFpi+qJpu8vkbE8NjcnS1LU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=P9ioen2kL6uDVIcwks6ohd/tOAMc+CCBFtZpa31fRDMCu2KyncjWRstUfhxuESyOuE
	03eQCRmyMz+BAlBzjlYlyMN7MhGIOD1MPlWFYNfg+Es9raUJAnwSfWDwdawH/LExfJjZ
	Ij2KMwSAQaJaS3GLCLbdA+d9pGJODsQsGV4t8=
Received: by 10.142.119.20 with SMTP id r20mr2039162wfc.96.1264920881511;
	Sat, 30 Jan 2010 22:54:41 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 23sm3259927pzk.8.2010.01.30.22.54.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 22:54:40 -0800 (PST)
Date: Sun, 31 Jan 2010 14:54:32 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dxg6szmn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.177
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: building chumby-kernel_2.6.16-chumby-1.2.bb failed due to arm-linux-ar: command not found
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
X-List-Received-Date: Sun, 31 Jan 2010 06:57:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to build openembedded with the following configuration in my  
local.conf
MACHINE=chumby
DISTRO=micro
LIBC=glibc
But when building chumby-kernel-2.6.16-chumby, I met an error with the  
following information:

| make[1]: `include/asm-arm/mach-types.h' is up to date.
|   CHK     usr/initramfs_list
|   CHK     include/linux/compile.h
|   LD      sound/arm/built-in.o
| /bin/sh: arm-linux-ar: command not found

for more detailed information, please see
http://tinderbox.openembedded.net/packages/451662/

It seems that the ar used to build kernel is incorrect. It should be  
arm-oe-linux-gnueabi-ar not arm-linux-ar

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


