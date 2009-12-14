Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NK5zM-0000cS-O8
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 09:09:07 +0100
Received: by pzk30 with SMTP id 30so2032447pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 00:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:date:subject
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=dJyLp/7MXh8Xh3vQ3DUDn7JMH4txB0ORhX0t+mhDVoY=;
	b=AH4sr/D5bB8NKhD9o9G/cs4e6y2lD6Upqmrpg/xmsvQMlgi+waMN2Gx3oQPHLHJIqg
	Wy8qr0S8iR2QVapswpDRj/UQBU2eyhR3vdyy97M3XVSf6FNB931ReMcx/QZu3N52kvXM
	njyxGAfK+FrfjD5QLZhSWaR2eyiQAdGp4Wf6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:date:subject:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=f14cjgFrk6H9oPjTkRA6fO7oi0z2MBEiAsvWGYKr2xKxaH4NlUslI9IKFmpXywr8Iw
	62n4vbDEG+4USBOsWAzEYbYwUA814MJJELvzth2QHAR+i3GMTg7F0NeHhNE4ADhjHLBw
	SC0iLlAx4Qvesuffily2Jqh1XuxBkjbbtLLsE=
Received: by 10.140.57.11 with SMTP id f11mr3025925rva.3.1260778038623;
	Mon, 14 Dec 2009 00:07:18 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.125.108])
	by mx.google.com with ESMTPS id 21sm4816189pzk.15.2009.12.14.00.07.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 00:07:17 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Dec 2009 16:07:08 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4w4tyyrmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How generate dependence file without native packages
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
X-List-Received-Date: Mon, 14 Dec 2009 08:09:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to generate linux root fs dependence files using the following  
command:
bitbake -g base-image

   But I found the dot file generated contains lots of native packages  
dependence which makes the dot file very very large.

Is there any way to generate dependence without native packages?

Thanks a lot!


-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


