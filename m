Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNkB7-0005ED-TL
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 10:40:21 +0100
Received: by pxi12 with SMTP id 12so4183730pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 01:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject:date
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=YR01NWPpzU6oYvWfWBkHw+gF1bAxwuYRjl5GTMLc0x4=;
	b=fOQWElhNtvTmecQU6MUY/4cNEr83Od6h7C+bF8OBLljieXgknf+AbdlVjExNbZ0WUr
	TTQnzXwFmMI2GcYW74dR8HrAr8iSyUp7cQCRiLMmpxfXmeMXxVnmgDAPjYOGJYJ0GDRH
	pRns9DC4ImhwT6MEBeVKmM5/B8MnQ0BLn2hnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:date:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=voEc8QEzuQvp2TgThWPRH45JWqI3xG8kZ6dcUc0jACdyalUZgtV56YiHjrOGjIIJWW
	kM3JuTxwDhxUrLqpBmw/EE5ExChYj+AqqCuyHe+HHOSvHL34jdohTkhGgrnaCcf/R9KV
	eSN1QChOXmSdOqTep/mpCOrpkZhZECte944yQ=
Received: by 10.142.8.38 with SMTP id 38mr7602009wfh.58.1261647503385;
	Thu, 24 Dec 2009 01:38:23 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 20sm7643489pzk.1.2009.12.24.01.38.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 01:38:22 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Dec 2009 17:38:18 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5frp4oumn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Missing or unbuildable dependency chain when machine == qemux86 and distro == minimal
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
X-List-Received-Date: Thu, 24 Dec 2009 09:40:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I met the following error when building base-image. So I think it is  
better to remove the ANGSTROM_FEED_CONFIGS reference in base-image.bb, so  
that it is distro-independent.

camelguo@guohr-laptop-ubuntu:/opt/workdir/oe/build/gulessoft-oe-standard-conf$  
bitbake base-image
NOTE: Handling BitBake files: \ (7951/7951) [100 %]
NOTE: Parsing finished. 7365 cached, 314 parsed, 272 skipped, 0 masked.
NOTE: oestats: build 46915
NOTE: Resolving any missing task queue dependencies
ERROR: Required build target 'base-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['base-image',  
'${ANGSTROM_FEED_CONFIGS}']

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


