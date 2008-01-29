Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JJe0G-0006fT-A1
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 01:07:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0T07AsW031448
	for <openembedded-devel@openembedded.org>; Tue, 29 Jan 2008 00:07:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31364-03 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jan 2008 00:07:06 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0T075gN031442
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 29 Jan 2008 00:07:06 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080129014117.60ed9f77@widy.localdomain>
References: <20080129014117.60ed9f77@widy.localdomain>
Date: Tue, 29 Jan 2008 00:07:05 +0000
Message-Id: <1201565225.4687.98.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Setting default IMAGE_FSTYPES to tar.gz in	bitbake.conf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2008 00:07:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-01-29 at 01:41 +0200, Paul Sokolovsky wrote:
> Currently, we have in bitbake.conf:
> 
> IMAGE_FSTYPES ?= "jffs2"
> 
> jffs2 is a special filesystem format, suitable for limited number of
> hardware on the global scale. So I would like to propose to replace
> that default with some neutral and well-know format, say tar.gz.

This has been discussed before and I'd like to see that changed. The
complication is that "bitbake image" is meant to give a sane default
image for a given machine without any tweaking by the user and a load of
machines depend on the jffs2 default. 

I'm not an ipaq expert but I'd guess a number of them use jffs2, as
probably do some of the htcs, the at91 board and the motorola phones.
Someone needs to go through and check the machines. Since this is pretty
daunting to fix, I've just gone through and I think the following files
need that line adding as they appear to use jffs2 in some form:

at32stk1000.conf
at91sam9260ek.conf
at91sam9261ek.conf
at91sam9263ek.conf
bd-neon.conf
fic-gta01.conf
eseries.conf
h1910.conf
h2200.conf
h3600.conf
h5000.conf
h6300.conf
hx4700.conf
gesbc-9302.conf
./include/motorola-ezx-base.inc (hence e680.conf rokre2.conf rokre6.conf
a1200.conf a780.conf)
./include/gumstix.inc (hence gumstix-connex.conf gumstix-verdex.conf)
omap1510inn.conf
omap1610h2.conf
omap1710h3.conf
omap2420h4.conf
omap2430sdp.conf
omap5912osk.conf
palmtt.conf
palmz71.conf
shark.conf
simpad.conf
triton.conf
xxs1500.conf

I'm unsure of the following machines:

acern30.conf
adsp-bf537-stamp.conf
adzs-bf538f-ezlite.conf
adzs-bf548-ezlite.conf
asus620.conf
asus730.conf
atngw100.conf
aximx50.conf
aximx50v.conf
colinux.conf
davinci-dvevm.conf
davinci-sffsdr.conf
db1200.conf
devkitidp-pxa255.conf
dht-walnut.conf
efika.conf
em-x270.conf
ep93xx.conf
er0100.conf
eteng500.conf
geodegx.conf
geodelx.conf
ghi270.conf
guinness.conf
h1940.conf
h3800.conf
h3900.conf
h4000.conf
htcalpine.conf
htcapache.conf
htcblueangel.conf
htchimalaya.conf
htcsable.conf
htctornado.conf
htcuniversal.conf
htcwallaby.conf
jornada56x.conf
jornada6xx.conf
jornada7xx.conf
kb9202.conf
ks8695.conf
logicpd-pxa270.conf
looxc550.conf
magicbox.conf
magician.conf
mainstone.conf
mnci.conf
mpc8313e-rdb.conf
mpc8323e-rdb.conf
mtx-1.conf
mtx-2.conf
mtx-3a.conf
mtx-3.conf
mx21ads.conf
navman-icn330.conf
netbook-pro.conf
netvista.conf
palmld.conf
palmt650.conf
palmt680.conf
palmtc.conf
palmtt2.conf
palmtt3.conf
palmtt5.conf
palmtx.conf
palmz31.conf
palmz72.conf
rb500.conf
rt3000.conf
rx1950.conf
rx3000.conf
titan.conf
ts72xx.conf
wl500g.conf
wrap.conf
xilinx-ml403.conf
xilinx-ml410.conf

I've ruled the rest out. If someone who knows a load of the above
machines could confirm or deny that they use jffs2 images that would be
great...

> Oh, and btw, I have a bunch of standalone filesystem conversion scripts
> which I can't find time to RFC for addition to contrib/. While OE has
> ability to generate images in different formats, sometimes there's a
> need/easier to convert one existing flexible format. 

I'd say feel free to add them...

Regards,

Richard



