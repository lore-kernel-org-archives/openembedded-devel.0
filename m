Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NXrxK-0003Wy-VL
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 08:59:58 +0100
Received: by bwz9 with SMTP id 9so4751887bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 23:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=d8NaePp+zQcYyvl2QdGMpOrkHRQZXbFGTvjZNw6tqFY=;
	b=WDqphKV8dhkrgciw2gh88N8yDHyGFlZn2vMeCqHLL+9RMRWufYJ29Md5S4evXLzvE9
	gl8JxjweCUIwfWGEe0jRuK0Uj+adNjqgARYOLf3bri/5LUy2IRgEyL62XIbOqDyIVs0K
	uI0AdeCXlYPfI13DSLmYVCXm+g+E5IpoxOYNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=b2Fwbzh6uC//bWGH9pFcXRMeyCKn2/+eA0B0S6Y8sR42JAbdmncX17QOgSI3ZgiNjD
	PVcMC8nperhONQYVTsawWR144Fn8FxQIQbCh6o7ae2/PfqZEk0wgc8rHvpUWVdMS7c9B
	kABUYBPH823A+duMYhqpfJy7UpN39Y509EKtE=
Received: by 10.204.34.212 with SMTP id m20mr560448bkd.55.1264060658423;
	Wed, 20 Jan 2010 23:57:38 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.149.140])
	by mx.google.com with ESMTPS id 13sm315076bwz.6.2010.01.20.23.57.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 23:57:37 -0800 (PST)
Message-ID: <4B5808EE.9010909@gmail.com>
Date: Thu, 21 Jan 2010 12:57:34 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Serial console problem: Id "S0" respawning too fast
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
X-List-Received-Date: Thu, 21 Jan 2010 07:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I want to set up board only with serial console interface (no tty0).

Kernel bootargs: console=ttyS0,115200n81 root=/dev/nfs rw 
nfsroot=192.168.0.100:/srv/nfs/armrfs ip=dhcp init=/sbin/init

Inittab has only one getty line: S0:2345:respawn:/sbin/getty 115200 ttyS0

I can see boot log, but it is really hard to login. And even if I could 
login, it's impossible to execute any commands, shell dies and login 
message appear again. Here is log of what usually happen:
------------------------------------------------
OpenEmbedded Linux phy3250 ttyS0

minimal .dev-snapshot-20100119 phy3250 ttyS0

phy3250 login: root
O
O
O
OpenEmbedded Linux phy3250 ttyS0

minimal .dev-snapshot-20100119 phy3250 ttyS0

phy3250 login: r
OpenEmbedded Linux phy3250 ttyS0

minimal .dev-snapshot-20100119 phy3250 ttyS0

phy3250 login: root
O
O
INIT: Id "S0" respawning too fast: dis
INIT: no more processes left in this r

O
O
O
O
O
O
O
O
O
INIT: Id "S0" respawning too fast: dis

O
O
O
O
O
O
O
O
O
INIT: Id "S0" respawning too fast: dis
------------------------------------------------

Tried to decrease baudrate to 38400 -- same trouble. Really don't know 
what to do with it. Maybe I miss some kernel or getty options or 
something else?

-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



