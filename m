Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NOUoO-0001SZ-JK
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Dec 2009 12:27:59 +0100
Received: by pzk30 with SMTP id 30so6373188pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Dec 2009 03:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject:date
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=B0P4SLoMZu0cxzK4p58gZoie+gDPOD7QOBl0oMeSYYU=;
	b=HYreZ+X91A0C/cYlrfxihQtdAaruy6xxV36GyqIHXxzS/iaLOrQhUEu4yfFaE40/+q
	ydNl0XqWHsCz5ebxf7gaNkiqh1M4CuX4si+JKbL3dbSNpJhmpWb06PmkT6b9dsXXmEfG
	Uq8AdK7VNnUS/w7s4TObwmBKK1CU/Cjk92a8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:date:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=gABjMMNi1qD6AQYCwWHwoxG78/NYYOy/z5vLsEHYoVeZikLs7U4A1OamlnjcvZVcIk
	MZiREj1zFDltE13cq87N/9n/OVxzd4cKxB0u0V+/cUGlcHPI5V2UniPk4De6xNj8YqkD
	JDmLObeaXf+udgkevPOkV6JYsXnO43qR71O3E=
Received: by 10.143.154.20 with SMTP id g20mr8410566wfo.28.1261826760584;
	Sat, 26 Dec 2009 03:26:00 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.70.81])
	by mx.google.com with ESMTPS id 20sm9639884pzk.13.2009.12.26.03.25.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Dec 2009 03:26:00 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Dec 2009 19:25:50 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5jl1cnzmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How to get to know whether or not src_distribute_local worked
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
X-List-Received-Date: Sat, 26 Dec 2009 11:27:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I want to verify src_distribute_local functionality of openembedded. And  
I did the following:
1. Add the following into the local.conf
SRC_DIST_LOCAL = "copy"
INHERIT += "src_distribute_local"
2. build the project using bitbake base-image
3. then on the sources directory of deploy I found the following:

camelguo@guohr-laptop-ubuntu:/media/work-disk/workdir/oe-qemuarm-micro-uclibc/deploy$  
find ./
./
./sources
./sources/MIT
./sources/MIT/base-image
./sources/MIT/base-image/base-image.bb

I am wonderring whether or not the src_distribute_local.bbclass worked.  
According the documentation of openembedded, src_distribute_local.bbclass  
should put the source files corresponding binary packages into the sources  
directory, not package's recipes. Do I misunderstand it? Or It did not  
work correctly?

Thanks a lot!


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


