Received: from mail-pz0-f189.google.com ([209.85.222.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NXxBP-0000AH-5s
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 14:34:50 +0100
Received: by pzk27 with SMTP id 27so4633575pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 05:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=o/Xus1XsD0O4maQcEJ210Z3xQXXf5iOSm2mwk7jVSAE=;
	b=lkFLHT80wUJhe78hk3hYw/deaQiKRJ+gaSAU4zcqI01o/EWL8I9vkT4w/BLRCVv+1U
	sk+VrXJfshDg4LIpJQ/s7kCADqJEyqc4B+NVFUMdjNxtsgmua/DxNxIwwkDAUxB+kJJt
	xpS78X0rU7zL38Ju43HXbWnchl8weQn5EDzj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=MQJLkWhZ119eTTJB66OC0Qt28IDcZQ5PX6hASxIk4PtyED0ZywvQPsLHdl+D4YfqPD
	JfWoqONNxEikmWVPyyORTqjj3tajsMrcPflMH/z//HirgwV5Su68AP5W47kdnosf7vK2
	lY6JaPI2kFjAgrzpeueJsfeeKeVPkRixc3TrE=
Received: by 10.143.20.19 with SMTP id x19mr15622wfi.231.1264080749219;
	Thu, 21 Jan 2010 05:32:29 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.209])
	by mx.google.com with ESMTPS id 22sm1078368pzk.10.2010.01.21.05.32.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 05:32:28 -0800 (PST)
Date: Thu, 21 Jan 2010 21:32:16 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6vw72i1mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.189
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: I realy think we should upgrade PREFERRED_VERSION_glibc to 2.9 in conf/distro/include/sane-toolchain.inc
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
X-List-Received-Date: Thu, 21 Jan 2010 13:34:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I think we should upgrade PREFERRED_VERSION_glibc from 2.6 to 2.9 in  
conf/distro/include/sane-toolchain.inc. The reasons are:

1. Most of distributions have upgraded their preferred glibc to 2.9 long  
time ago.
conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_glibc 		?= "2.9"
conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_glibc-initial 	?= "2.9"
conf/distro/jlime-2009.1.conf:PREFERRED_VERSION_glibc-initial = "2.9"
conf/distro/jlime-2009.1.conf:PREFERRED_VERSION_glibc = "2.9"
conf/distro/kaeilos.conf:PREFERRED_VERSION_glibc 		?= "2.9"
conf/distro/kaeilos.conf:PREFERRED_VERSION_glibc-initial 	?= "2.9"

 from the above, you can get to know that most distributions have upgraded  
their preferred glibc to 2.9 from 2008 ago.

Of course, there are still some distributions which uses old glibc. The  
only reason I guess is that we have not updated them for a long time. (for  
 from tinderbox, you can get to know that these distributions have not been  
built for a long time)


2. from tinderbox, you can see that the glibc-2.9 is well-tested, no  
glibc-2.6
http://tinderbox.openembedded.net/packages/?name=glibc&page=1

 from the above link, you can get to know that the glibc-2.9 not  
glibc-2.6.1 has had most testing.

3. the last reason is that I have built some projects with glibc-2.6,  
unless with the old binutils, the glibc-2.6 always failed to build.

So, I think it is the time to upgrade PREFERRED_VERSION_glibc to 2.9 in  
sane-toolchian.inc

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


