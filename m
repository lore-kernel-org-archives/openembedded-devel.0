Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NceAO-0006Ky-4u
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 13:17:11 +0100
Received: by pxi9 with SMTP id 9so1277956pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 04:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:cc
	:to:mime-version:content-transfer-encoding:from:organization
	:message-id:user-agent;
	bh=P9hXaj3HuI9SHLgTJFesxN7wSBp+STqsYVZc3kda3gs=;
	b=B93GUdQuoPuUoiYG//eb4udvYz784nJFmaKlWpxzkk6i+Po8zPfBY3/dtz7ked0gt1
	BmX/Qsx6ElsGnpVBX1mfaeYu22vGqr2CBU81lpxGYrX5uwytXAGAQgxRcF1G6qr2xlTR
	1U6ESpXSfdxf5wKroaOlW2OtJt/TzPYTgLqP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:cc:to:mime-version
	:content-transfer-encoding:from:organization:message-id:user-agent;
	b=wThAms7RDQTcKINAPfdOoLdyF6+biDStO7b+B0JSF4t0Zn5NF4k3uIBoo5f+7cVit1
	8hjBGmWLCNoxJnI/PEIIfV8oke+a1oc6NsXMPFw/mr50BePovfzw6rn9H04g2csAffwf
	7/rIRBxot5xi8TE94hpd+IyGKgOnLXQ2o4oCc=
Received: by 10.142.74.12 with SMTP id w12mr1081341wfa.204.1265199279566;
	Wed, 03 Feb 2010 04:14:39 -0800 (PST)
Received: from camelguo ([123.162.69.234])
	by mx.google.com with ESMTPS id 20sm3672498pzk.9.2010.02.03.04.14.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 04:14:38 -0800 (PST)
Date: Wed, 03 Feb 2010 20:14:27 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7jv92y7mn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: slapin@ossfans.org
Subject: building linux-hackndev-2.6 failed due to lack of defconfig for palmz31
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
X-List-Received-Date: Wed, 03 Feb 2010 12:17:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to build openembedded with the following setting:
DISTRO=micro
MACHINE=palmz31
LIBC=glibc

   But when building linux-hackndev-2.6, it failed due to lack of defconfig  
for palmz31 in recipes/linux/linux-hackndev-2.6 directory.
the following is the raw information:

NOTE: Running task 555 of 646 (ID: 1,  
/opt/workdir/oe/openembedded/recipes/linux/linux-hackndev-2.6_git.bb,  
do_setscene)
NOTE: Running task 628 of 646 (ID: 2,  
/opt/workdir/oe/openembedded/recipes/linux/linux-hackndev-2.6_git.bb,  
do_fetch)
NOTE: Running task 629 of 646 (ID: 4,  
/opt/workdir/oe/openembedded/recipes/linux/linux-hackndev-2.6_git.bb,  
do_unpack)
NOTE: Running task 630 of 646 (ID: 14,  
/opt/workdir/oe/openembedded/recipes/linux/linux-hackndev-2.6_git.bb,  
do_distribute_sources)
NOTE: Unpacking  
/opt/sources/git_git.hackndev.com.hackndev.linux-hnd.git_8f62c3b8a7e7de042846211f387a867f6703f272.tar.gz  
to  
/media/work-disk/workdir/arm-926ejs-test/work/palmz31-oe-linux-gnueabi/linux-hackndev-2.6-2.6.21-hnd3-r14/
NOTE: Unpacking  
../../openembedded/recipes/linux/linux-hackndev-2.6/defconfig to  
/media/work-disk/workdir/arm-926ejs-test/work/palmz31-oe-linux-gnueabi/linux-hackndev-2.6-2.6.21-hnd3-r14/
cp: cannot stat  
`/opt/workdir/oe/openembedded/recipes/linux/linux-hackndev-2.6/defconfig':  
No such file or directory
NOTE: Task failed:

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


