Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbU2v-0006Xr-Kn
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 08:16:40 +0100
Received: by pxi9 with SMTP id 9so2992515pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:cc:mime-version:content-transfer-encoding:from:organization
	:message-id:user-agent;
	bh=aRMhC5l/QPUqVNQ7wTY9zbPHNrVGUdqk+scNIIEkSLM=;
	b=AoGdVRJkFo74cEqp+S/cqkZr5dH9/Zg4aGIA3mzlBWRROBw8h3+1oncgvRm8g2r2Rd
	Z9EDS7pQQVkk+dhkfmtDqQt21cO0VJOwNQbLafw00BQXPEqv64yLU0ALmvU67Gcdnidw
	OvquJeRz97iqdfxxxAH5yclQ19G1U/3s3BgJI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:cc:mime-version
	:content-transfer-encoding:from:organization:message-id:user-agent;
	b=KzjOf5iL0OiK/YWoZHT+XICaN39l2M/irnVzJOTgz2sUwzPUnfSUQyy2Wb0FfciuJt
	epq+BhtN4TQXkpIZi5bFCE8umpAAuKPs30owhorRV2DuHQr/K2a3k4ZCFL9NfnU8Ye6K
	kso0ao1VIsfL1Icpvrm5KEyBCiYmrGtt+bVCE=
Received: by 10.141.2.21 with SMTP id e21mr2069420rvi.53.1264922051906;
	Sat, 30 Jan 2010 23:14:11 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3288741pzk.2.2010.01.30.23.14.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 23:14:11 -0800 (PST)
Date: Sun, 31 Jan 2010 15:14:01 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dydnc4mn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: failed to apply oxnas.diff when building linux_2.6.24.bb for oxnas machine
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
X-List-Received-Date: Sun, 31 Jan 2010 07:16:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to building openembedded with the following configuration in my  
local.conf:
MACHINE=oxnas
DISTRO=micro
LIBC=glibc
But when building linux_2.6.24 for oxnas, the oxnas.diff can not be  
applied to the kernel with plenty of hunks failed.

Hunk #1 FAILED at 2104.
Hunk #2 FAILED at 2128.
2 out of 2 hunks FAILED -- rejects in file sound/oss/via82cxxx_audio.c

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


