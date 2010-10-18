Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P7tEP-0004CZ-Bg
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 19:10:45 +0200
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 0965FCCD2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 19:10:07 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjERAL8cvExT4zjzPGdsb2JhbAAHgxieGQEBAQE1rXOSJYEigzN0BIlbbw
X-IronPort-AV: E=Sophos;i="4.57,345,1283724000"; d="scan'208";a="1682698780"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 18 Oct 2010 19:10:04 +0200
Message-ID: <4CBC7F6A.9040000@atmel.com>
Date: Mon, 18 Oct 2010 19:10:02 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org>
In-Reply-To: <i9hpii$gf2$1@dough.gmane.org>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Mon, 18 Oct 2010 17:10:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 18-10-10 15:38, Ulf Samuelsson wrote:
>> Marcin Juszkiewicz skrev:
>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.com
>>> napisaB(a):
>>>
>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>> Do you plan to duplicate that file with each kernel you will produce?
>>> Create include/at91-sam9.inc and put it there.
>>>
>>> Regards, 
>> This is to allow different kernel versions for different AT91 chips.
>> This allows both a "stable" version, and a development kernel
>> to be easily handled.
> 
>> The file defines (amongst other things) the
>> * kernel version,
>> * u-boot version
>> * at91bootstrap version
>> so you need one file per version.
> 
> NAK! Machines don't get to decide versions! Please revert that commit
> and come up with a better way, e.g. default_preference in the recipes or
> distro include files.

If I look at the machine files, almost all of them provide
a preferred kernel / u-boot. Some also provide version.

The patch will move the definition from the machine file to the include
file for a few board, so reverting the patch will not solve the problem,
just spread it out into multiple files.
The patch also adds some boards.

Having default preference in recipes is not going to make it easy to
switch between version so I don't like that method at all.


Using the distro to select boot and kernel, seems flawed since none of
the stuff will reside in the file system (my file system)
but at least this is easily maintainable.

The best right now seems to be to make a new distro file for each kernel
version, which just includes Angstrom and adds version info for kernel,
u-boot and at91bootstrap.

Long term, I think that there should be something equivalent to DISTRO
for the files outside the file system, and that you should be able to
select between multiple variants like you select a DISTRO today,
but I am not yet into bitbake, so I can't tell where to start.

Since the reversal of the patch, wont solve anything,
I suggest we agree on how to proceed, and then do the fixes.
Is including Angstrom from a kernel specific distro file OK?

If a distro file is to include another file, then
you have to be able to tell different kernels for


I guess we could do:

require   conf/distro/include/$(SOC_FAMILY).inc

conf/distro/include/at91.inc would contain:


PREFERRED_VERSION_at91bootstrap = "2.13"
PREFERRED_VERSION_u-boot = "2009.11"

Not sure how to do machine dependent kernel version

PREFERRED_VERSION_linux_at91sam9g45ek = "2.6.30"
does not feel like it would work.
Ideas?




--------------------------------------------

ulf@bulwark:~/Skrivbord/home/projects/OE_atmel/openembedded/conf/machine$
grep PREFERRED_VERSION_linux *
acern30.conf:PREFERRED_VERSION_linux ?= "2.6.14"
at32stk1000.conf:PREFERRED_VERSION_linux = "2.6.28"
at91cap9adk.conf:PREFERRED_VERSION_linux = "2.6.28"
at91-l9260.conf:PREFERRED_VERSION_linux = "2.6.25"
at91sam9260ek.conf:PREFERRED_VERSION_linux = "2.6.28"
at91sam9261ek.conf:PREFERRED_VERSION_linux = "2.6.28"
at91sam9263ek.conf:PREFERRED_VERSION_linux = "2.6.28"
at91sam9rlek.conf:PREFERRED_VERSION_linux = "2.6.28"
canyonlands.conf:PREFERRED_VERSION_linux = "2.6.26"
ea3250.conf:PREFERRED_VERSION_linux-ea3250 = "2.6.27.8"
eee701.conf:PREFERRED_VERSION_linux ?= "2.6.33"
em-x270.conf:PREFERRED_VERSION_linux = "2.6.23"
gesbc-9302.conf:PREFERRED_VERSION_linux ?= "2.6.24"
ghi270.conf:PREFERRED_VERSION_linux-handhelds-2.6               =
"2.6.21-hh11"
jornada6xx.conf:PREFERRED_VERSION_linux-jlime-jornada6xx = "2.6.32"
kixrp435.conf:PREFERRED_VERSION_linux = "2.6.30"
lsmipsel.conf:PREFERRED_VERSION_linux-lsmipsel	 	= "2.6.23.17"
micro2440.conf:# PREFERRED_VERSION_linux = "2.6.29"
n1200.conf:PREFERRED_VERSION_linux-n1200 = "2.6.27-rc9+git"
n2100.conf:PREFERRED_VERSION_linux = "2.6.20"
netvista.conf:PREFERRED_VERSION_linux = "2.6.23"
rx1950.conf:PREFERRED_VERSION_linux = "2.6.35"
sarge-at91.conf:PREFERRED_VERSION_linux  = "2.6.21"
stamp9g20evb.conf:PREFERRED_VERSION_linux = "2.6.29"
storcenter.conf:PREFERRED_VERSION_linux-storcenter = "2.6.27.7"
tx25.conf:PREFERRED_VERSION_linux = "2.6.29+2.6.30-rc4"
tx27.conf:PREFERRED_VERSION_linux = "2.6.28"


ulf@bulwark:~/Skrivbord/home/projects/OE_atmel/openembedded/conf/machine$
grep "PREFERRED_PROVIDER_virtual/kernel" *
acern30.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
adsp-bf537-stamp.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-bfin"
adzs-bf538f-ezlite.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-bfin"
adzs-bf548-ezlite.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-bfin"
alix.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
am3517-evm.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
am37x-evm.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
amsdelta.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-amsdelta-2.6"
archos5.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-archos"
archos5it.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-archos"
asus620.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
asus730.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
at2440evb.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at32stk1000.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at91cap9adk.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at91-l9260.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at91sam9260ek.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at91sam9261ek.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at91sam9263ek.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
at91sam9rlek.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
atngw100.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
aximx50.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
babbage.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
bd-neon.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
beagleboard.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
ben-nanonote.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben"
boc01.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
bug20.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
bug.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-bug"
calamari.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
canyonlands.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
chumby.conf:PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}-kernel"
chumby-falconwing.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-imx"
cm-x270.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
cm-x300.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
colinux.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-colinux"
cs-e9302.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
d201gly2.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
davinci-sffsdr.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
db1200.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
devkitidp-pxa255.conf:PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}"
dht-walnut.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-${MACHINE}"
dm37x-evm.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
dockstar.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
ea3250.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-ea3250"
eee701.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
efika.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux-rt"
efikamx.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux-efikamx"
em-x270.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
ep93xx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
epia.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-epia"
er0100.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-er0100"
eseries.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
eteng500.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
eten-m800.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux-eten"
fsg3be.conf:PREFERRED_PROVIDER_virtual/kernel ?= "fsg3-kernel"
gamecube.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
geodegx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-geodegx"
geodelx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-geodelx"
gesbc-9302.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
ghi270.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
guinness.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-x86"
h1910.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
h1940.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-h1940"
h2200.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
h3600.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
h3900.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
h4000.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
h5000.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
h6300.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-h6300-omap1"
hipox.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
htcalpine.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
htcapache.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
htcblueangel.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
htcdream.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-leviathan"
htchimalaya.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
htcsable.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
htctornado.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-tornado-omap2"
htcuniversal.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
htcwallaby.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
hx2000.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-rp"
hx4700.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
i586-generic.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
i686-generic.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
iei-nanogx-466.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
igep0020.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-igep2"
imote2.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-zigbee"
ion.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
jornada56x.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
jornada6xx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada6xx"
jornada7xx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada7xx"
kb9202.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
kilauea.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
kixrp435.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
ks8695.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-${MACHINE}"
lite5200.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
logicpd-pxa270.conf:PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}"
looxc550.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
lsmipsel.conf:PREFERRED_PROVIDER_virtual/kernel 		= "linux-lsmipsel"
m8050.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
magicbox.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-${MACHINE}"
magician.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
mainstone.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-${MACHINE}"
mh355.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
micro2440.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-mini2440"
micro2440.conf:# PREFERRED_PROVIDER_virtual/kernel = "linux"
mini2440.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-mini2440"
mini6410.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
mnci.conf:PREFERRED_PROVIDER_virtual/kernel = "mnci-ramses"
mp900c.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-mobilepro900"
mpc8313e-rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
mpc8315e-rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
mpc8323e-rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
mpc8544ds.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
mpc8641-hpcn.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
mtx-1.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-mtx-1"
mtx-2.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-mtx-2"
mtx-3a.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-mtx-3a"
mtx-3.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-mtx-3"
mx21ads.conf:PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}-kernel"
mx27ads.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
mx31ads.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
mx31moboard.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
n1200.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-n1200"
n2100.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
native.conf:PREFERRED_PROVIDER_virtual/kernel = "native-kernel"
navman-icn330.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-navman"
neek.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-nios2"
netbook-pro.conf:PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}-kernel"
netvista.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
neuros-osd2.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-neuros"
neuros-osd.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-neuros"
nhk15.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
nokia770.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-nokia800"
nokia800.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-nokia800"
nokia900.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
om-3d7k.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-2.6.29"
omap1510inn.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-2.6"
omap1610h2.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-2.6"
omap1710h3.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap1"
omap2420h4.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap2"
omap2430sdp.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap2"
omap3evm.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
omap3-pandora.conf:PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}-kernel"
omap3-touchbook.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
omap4430-panda.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap4"
omap5912osk.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
omapzoom2.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-zoomsync"
omapzoom36x.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-zoomsync"
omapzoom.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
om-gta01.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-2.6.29"
om-gta02.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-2.6.34"
overo.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
p1020rdb.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
p2020ds.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
palmpre.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-palmpre"
palmtt.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
palmz71.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
progear.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemuarm.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemumips64.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemumips.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemumipsel.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemuppc.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemush4.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
qemux86.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
rb500.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-rb500"
ronetix-pm9261.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
ronetix-pm9263.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
rt3000.conf:PREFERRED_PROVIDER_virtual/kernel = "rt3000"
rx1950.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
rx3000.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
sarge-at91.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
sequoia.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
sgh-i900.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-sgh-i900"
sh7785lcr.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
shark.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-z"
simpad.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
smartq5.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
smartqv7.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
smdk2440.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-smdk2440"
smdk2443.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-smdk2443"
smdk6410.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
stamp9g20evb.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
stb225.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
storcenter.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-storcenter"
sun4cdm.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-sun4cdm"
titan.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-titan-sh4"
topas910.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
tqm8540.conf:PREFERRED_PROVIDER_virtual/kernel ?= "linux"
triton.conf:PREFERRED_PROVIDER_virtual/kernel = "triton-kernel"
ts72xx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
tx25.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
tx27.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
wgt634u.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-brcm"
vmware.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
vortex86sx.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
wrap.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
wrt54.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-wrt"
x86-32-nocona.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-x86"
x86.conf:PREFERRED_PROVIDER_virtual/kernel = "linux"
x86-prescott.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-x86"
x86-uml.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-uml"
xilinx-ml403.conf:#PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-slab"
xilinx-ml410.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-${MACHINE}"
xilinx-ml507.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-ml507"
xilinx-virtex4.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
xilinx-virtex5.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
xo.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-xo"
xxs1500.conf:PREFERRED_PROVIDER_virtual/kernel = "linux-xxs1500"



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



