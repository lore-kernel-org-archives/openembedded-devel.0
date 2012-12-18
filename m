Received: from mail-lb0-f182.google.com ([209.85.217.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Tl07Q-0006sp-De
	for Openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 17:34:16 +0100
Received: by mail-lb0-f182.google.com with SMTP id go10so851710lbb.27
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:cc:subject:content-type:content-transfer-encoding;
	bh=Jb9klvBXOJhJ5QuDJTh6QLzL+B+Yg0pbPwqoJhkfTsk=;
	b=q6P7UTk7rbEjBjgbrgl/twYoCkY4h7paKGj0lzgCI77OlOU5dA+YQTljw+oVFMEw3o
	G9LdQyVHQAb5UH0xukFrNPzUrOemO+ZiBQ9f3YqlX341RNSVll57q2Q+PNM8l+FQOV1/
	xynavTwDO+VlQYPAg93On/JCbZdxVlksryhgb/on3Jf8Bp+dLP2ZO4ZkLr49HoL+UBUY
	tHdxKOGE/Ah7EP3LVewjdBnLKiVO5AglkH3BATKSkm1c5Y97+FMB2XvJ6h/VW71QKLxy
	Pz29x6AuQxLyxof0jMIjvpU/dToHUASgIPzlgHsEpTuMHvAPiI4h8vRtzXBQ2XacAo3B
	SIkg==
X-Received: by 10.152.125.240 with SMTP id mt16mr2399227lab.17.1355847569963; 
	Tue, 18 Dec 2012 08:19:29 -0800 (PST)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id fv12sm925460lab.12.2012.12.18.08.19.27
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2012 08:19:28 -0800 (PST)
Message-ID: <50D0978D.9090805@gmail.com>
Date: Tue, 18 Dec 2012 17:19:25 +0100
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: oe-core 2.6 kernel support
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
X-List-Received-Date: Tue, 18 Dec 2012 16:34:16 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
after a lot of time spent trying to create my own oe-core BSP based on 
old recipes I have been using in oe-classic, I found that there is any 
BSP working with oe-core and using old kernels (< 3.0).

Probably for most of you this is obsolete and irrelevant topic because 
everybody is focused on new CPUs (> Armv5)

I avoid to discuss what I tried in older to create an oe-core/yocto BSP 
(using 2.6.30)  and I will focus on an example that anyone can easily 
verify.

Paul had kindly pointed me to the meta-handheld stuff so I tried oe-core 
+ meta-handheld and I built:
  akita -> ok (3.2.32-git)
  hx4700 -> ok (3.0.1)
  h3600 -> fails (2.6.29)

I wonder if it could be a gcc (4.7.2) issue with older kernels and 
moreover if anybody experienced this or has successfully built something 
with old kernels.

Any hint would be greatly appreciated.

TIA
-- 
Marco


