Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYDFQ-0004tI-Mi
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 07:44:03 +0100
Received: by gxk27 with SMTP id 27so820419gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 22:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=65XRl653LQXwRWFORRBSHPZchA0KFapqdN0b1XcCORQ=;
	b=c8rLvSXE+WQeGqsRDrgLxBv2p0sfnIilxJ6bkLDBIhzH6trGqGgzV6aLgJ5XNeG7Xv
	yL8vSUNMkbBHG3TauzGWVQXyxqfgecSF+CQdaXH54Es6LXi/1oNnyC77zMv1PdiE7OQ4
	WEbDU9FCmIzwbfwvJA8M6QkSFycLjParRAWHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=nBS8XCRUT4fvir0T5Q7xMO8+WJzDFIntX4c9r9kMTCD9hiudb5F+IVvEZEh2d8jQzf
	s3tpiEaPNR0qr+g34Ye+YEFaOdHT7dKz+dmDmlv+gnJFeOJT0CbnCQAhrs/dlcFS7iZd
	jgroY9HoL5iUDiDz5ZfDBz7LeWdgJvKEQ10q0=
Received: by 10.101.214.5 with SMTP id r5mr3396829anq.3.1264142502872;
	Thu, 21 Jan 2010 22:41:42 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 23sm701417ywh.33.2010.01.21.22.41.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 22:41:41 -0800 (PST)
Date: Fri, 22 Jan 2010 14:41:30 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6w8vggrmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: why PREFERRED_PROVIDER_virtual/kernel in conf/machine/sun4cdm.conf does not work
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
X-List-Received-Date: Fri, 22 Jan 2010 06:44:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to build an openembedded project with the following setting:
MACHINE=sun4cdm  DISTRO=micro LIBC=eglibc
But I noticed the following warning message after parsing the bb files:

NOTE: multiple providers are available for virtual/kernel (linux-palmpre,  
linux-rt, gumstix-kernel, linux);
NOTE: consider defining PREFERRED_PROVIDER_virtual/kernel
NOTE: Preparing runqueue
NOTE: Dependencies saved to 'depends.dot'
NOTE: Task dependencies saved to 'task-depends.dot'

My question is:
In the conf/machine/sun4cdm.conf, there is the defination of  
PREFFERRED_PROVIDER_virtual/kernel, see the following line:
REFERRED_PROVIDER_virtual/kernel = "linux-sun4cdm"
Why did it not work at all?

Anyone can give me some hints?

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


