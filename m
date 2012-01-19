Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jtobias@viaas.com>) id 1RnyRF-0002Nf-Q2
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 21:18:25 +0100
Received: by wibhr14 with SMTP id hr14so305487wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 12:10:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.77.228 with SMTP id v4mr46741676wiw.8.1327003846044; Thu,
	19 Jan 2012 12:10:46 -0800 (PST)
Received: by 10.180.87.69 with HTTP; Thu, 19 Jan 2012 12:10:46 -0800 (PST)
Date: Thu, 19 Jan 2012 12:10:46 -0800
Message-ID: <CAJfOToU8WxeyhJsParQnx+g=iatJDhquu_UHdy7wQcC87YkE=Q@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
Subject: Network Interfaces (wire & wireless)
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
X-List-Received-Date: Thu, 19 Jan 2012 20:18:25 -0000
Content-Type: text/plain; charset=UTF-8

Hello All,

I have two network interfaces (wire and wireless), both of them are
connected to the network correctly. It looks like my kernel is using
the wireless interface to send my data over the network. I would like
to tell to the kernel which interface should be use if my both
interfaces are connected to the network. So, I executed the commands
below and set the phy0 with higher priority than my wifi, but it's not
working.
Any idea how to fix it?

#(wired)
/sbin/ip route flush table phy0
/sbin/ip route add table phy0 to 192.168.1.0/24 dev eth0
/sbin/ip route add table phy0 to default via 192.168.1.1 dev eth0

#(wireless)
/sbin/ip route flush table wifi
/sbin/ip route add table wifi to 10.0.1.0/24 dev ra0
/sbin/ip route add table wifi to default via 10.0.1.1 dev ra0

/sbin/ip rule add from 192.168.1.0/24 table phy0 priority 1000
/sbin/ip rule add from 10.0.1.0/24 table wifi priority 1002

/sbin/ip route flush cache

Thanks,

john


