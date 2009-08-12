Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MbAZ4-00026x-4o
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 11:56:14 +0200
Received: by fxm12 with SMTP id 12so3594872fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=RXkB/olgmPhv5kDTuG9EQVnmh/Yxlgm1XEwsgK9mprA=;
	b=fyhWUtS+ooGXbvypM7mXqLoVprSggZ5tqJgIYZLLjsSVUeCk+zRCRPBUJcZsdNFSxc
	q6hZ91h9DmA1Ih7aymKRYFElor2S+a7xpgLwh8j08lvQKHKmH29i/CJaBGxVXEsCF3RC
	G/oNtqydSUjd79GlIsWRONDvCSFiM4L+9QiBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=pE58FW2quZBBhxgUcZ3tFaEfgBkYeDbGpDy/PIPP+zOxi8EOMHr837MCvnPTqSG45G
	GYvDq6JAAJ0LaGLf274SxwXgl9UmJT/U9DdXL68n0LYoqdmnF0tTfFF03g7I+epW4MZQ
	HCkVNEdmNiVozbGH9UNj9w3gOYNEqib9HYnM0=
MIME-Version: 1.0
Received: by 10.204.117.141 with SMTP id r13mr7604199bkq.122.1250069988111; 
	Wed, 12 Aug 2009 02:39:48 -0700 (PDT)
Date: Wed, 12 Aug 2009 10:39:48 +0100
Message-ID: <91283b620908120239t3d70a9e7sd2e3d6822d3203fb@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ip route add nat - returns RTNETLINK answers: Invalid argument
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
X-List-Received-Date: Wed, 12 Aug 2009 09:56:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I am trying to set up routing between my wireless (wlan0) to my eth0 port.

I have set up the wlan0 as follows:

allow-hotplug wlan0
iface wlan0 inet static
        address 192.168.10.100
        netmask 255.255.255.0
        wireless-mode ad-hoc
        wireless-essid dock-amp

eth0 as:

auto eth0
iface eth0 inet dhcp


Both interfaces have been proven to work.

Within sysctl.conf net.ipv4.ip_forward=1

eth0 has ip address 192.168.2.207, wlan0 is as above, I want to allow
devices connected wireless to access the web so I have tried to set up nat
to allow packets to get routed through to 192.168.2.207.

I used the following command:

ip route add nat 192.168.2.207 via 192.168.10.100

To this I get the following error        RTNETLINK answers: Invalid argument

I have looked at www.policyrouting.org, but I cannot see what I am doing
wrong. Any help would be great.

Thanks,
Stuart

