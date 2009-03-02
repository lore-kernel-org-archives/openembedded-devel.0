Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1LeFY9-0006vX-7n
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 22:19:50 +0100
Received: by an-out-0708.google.com with SMTP id d40so3164752and.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2009 13:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:content-disposition:message-id;
	bh=6wc4nYUXFXXm1wXJp0bLPXGhh449BXg7V7teOtXSj4Y=;
	b=S+P+jNoACFMXDpu2pTFtRhR4qxOHrMRefgBI1lOUDOnCmf7Jw30kk4frZ/0gF5l9N3
	caJ9CKZ1sGmnERFUlHcvYgHbfRfr7PlvNql0HRLkqlz8p1dy7K9ao/UuogvNAHwXLl/t
	+ygzCwYXC2PAk3vDwCfOrR0Ks9qMAARquGiEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	b=BV9CwbdloiNvLHJHR/O8REFZc9TMsvI8oiFEEgzRVDAxqIxc5hhWizVeehKvNsHsy3
	j2wXvKt8QSeSqJQvyPap4Npt8aADM2A9EePs5WOD23aIUoaR8BuqXVZXZV8aWI86j8hm
	2qa7wr3c5SBRrTcVUj8TWL4eJ7dL1JwIj+vdI=
Received: by 10.100.134.10 with SMTP id h10mr5177086and.28.1236028548335;
	Mon, 02 Mar 2009 13:15:48 -0800 (PST)
Received: from vincy (anyhost.homeauto.com [65.14.111.202])
	by mx.google.com with ESMTPS id d35sm7941175and.18.2009.03.02.13.15.47
	(version=SSLv3 cipher=RC4-MD5); Mon, 02 Mar 2009 13:15:48 -0800 (PST)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Mar 2009 15:15:46 -0600
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200903021515.46131.e.robertson.svg@gmail.com>
Subject: sysvinit runlevels
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
X-List-Received-Date: Mon, 02 Mar 2009 21:21:22 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I'm building a busybox based distro using busybox init. I notice sysvinit run 
levels unexpectedly showed up my rootfs. Is this normally what it does and I 
need to explicitly remove them? 
Also, I couldn't find the "?=" operation in the bitbake manual so I assumed it 
a condition statement and is overridden of the variable is defined, it this 
true?
Thanks.   


