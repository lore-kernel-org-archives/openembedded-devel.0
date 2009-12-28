Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NP6e6-0005Wf-El
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 04:51:53 +0100
Received: by iwn32 with SMTP id 32so6733387iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2009 19:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:date:subject:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=p7zJLR7zfkgwwRV+K9SY4iZcFNF1lYvW0sbApAYtS3g=;
	b=qc2vXWPoR8xQ9RiXndQaOoPanv81+62SD0MmX3fyWqqQCAShceem6vgyd5jKB05WB4
	T432gaPVs85IxC2Rcx7gmOkhbN+Gx9heyGkNsp9o+qIQv2iTCHo9+VHL2jHU/3s5eN7+
	0qL4/lXK0TeM/6iMihsBXX94FK5Nv+SiOcmwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:date:subject:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=TQL1EhteyUZnGAX2Ms6HZYY9XA1Ru5HSmVSRFJvJUP+MKPqlLUQ6vJXDGWlHMpcbBg
	swo2yecReIfRp1nz1YxPknQsXyCLF5AFQt+UzzXKLgeMQ1eeLU8+wLtjPvB4OAvw2K0N
	bK4kHOV/qOFiMuZ+Vt7SJvcdqTbMCrn2ag8KI=
Received: by 10.231.170.136 with SMTP id d8mr1476344ibz.17.1261972193115;
	Sun, 27 Dec 2009 19:49:53 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.70.72])
	by mx.google.com with ESMTPS id 22sm10678673iwn.12.2009.12.27.19.49.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 27 Dec 2009 19:49:52 -0800 (PST)
Date: Mon, 28 Dec 2009 11:49:45 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5mp87ximn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Mon, 28 Dec 2009 03:51:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
    I found a build error when building openembedded using:
1. MACHINE = qemux86 DISTRO=micro-uclibc, see the follow url for detailed.
http://tinderbox.openembedded.net/packages/391641/
2. MACHINE = qemux86 DISTRO=minimal-uclibc, see the following url for  
detailed
http://tinderbox.openembedded.net/packages/391427/

It seems that the comiler can not find the fenv.h which should be provided  
by uclibc.

/media/work-disk/workdir/oe-qemux86-micro-uclibc/work/i686-oe-linux-uclibc/gcc-cross-intermediate-4.4.2-r1.1/gcc-4.4.2/libgcc/config/libbid/bid_decimal_globals.c:47:18:  
error: fenv.h: No such file or directory

Any advice is welcome.


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


