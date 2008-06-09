Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K5d2j-0002I9-U8
	for openembedded-devel@openembedded.org; Mon, 09 Jun 2008 10:47:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K5cxh-0002vx-IG
	for openembedded-devel@openembedded.org; Mon, 09 Jun 2008 08:42:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 09 Jun 2008 08:42:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Jun 2008 08:42:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 09 Jun 2008 10:42:36 +0200
Message-ID: <g2iqds$r84$1@ger.gmane.org>
References: <g2h415$pk1$1@ger.gmane.org>	<20080608185242.GA3463@cimmeria.hyboria>
	<g2hb9s$eg3$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <g2hb9s$eg3$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 09 Jun 2008 08:47:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Graeme Gregory wrote:
>> On Sun, Jun 08, 2008 at 07:14:13PM +0200, Koen Kooi wrote:
>>> Hi,
>>>
>>> Lately I have been wondering why things like avahi and umount don't work
>>> properly any more in angstrom 2008, and I found out why:
>>>
>> This is http://bugs.openembedded.net/show_bug.cgi?id=4316 ??
>
> That is exactly the problem I'm seeing. It also narrows down which
> packages need a PR bump after it gets fixed.

The (incomplete) list of affected recipes:

alsa-state
angstrom-zeroconf-audio
asterisk
asterisk-core-sounds-en-alaw
asterisk-core-sounds-en-g729
asterisk-core-sounds-en-gsm
asterisk-core-sounds-en-ulaw
asterisk-extra-sounds-en-alaw
asterisk-extra-sounds-en-g729
asterisk-extra-sounds-en-gsm
asterisk-extra-sounds-en-ulaw
asterisk-moh-freeplay-alaw
asterisk-moh-freeplay-g729
asterisk-moh-freeplay-gsm
asterisk-moh-freeplay-ulaw
avahi
bacula-client
base-passwd
binutils
callweaver
changedfiles-modules
clamav
codec-engine
console-tools
crossword
cyrus-imapd
cyrus-sasl
dbus
dsplink
e2fsprogs
eglibc-package
exmap-console
fluxbox
foonas-init
glibc-package
gpe-helpviewer
gpe-mini-browser
gpe-session-scripts
gpe-session-scripts-phone
gpsd
h2200-bootloader
hostap-conf
iputils
ixp4xx-kernel
keylaunch-conf
libnss-mdns
librsvg
varous kernels
lirc-modules
logrotate-script
madwifi-modules
madwifi-ng
matchbox-keyboard-inputmethod
matchbox-sato
mnci-ramses
module-init-tools
modutils
multitap-pad
mysql
ncurses
ndisc6
net-snmp
netkit-tftpd
nokia770-init
nylon-scripts
nylon-statistics
openldap
openmoko-icon-theme-standard
openmoko-icon-theme-standard2
openmoko-icon-theme-standard2-qvga
openmoko-mediaplayer2
openmoko-session
openmoko-session2
openmoko-terminal
openprotium-init
openssh
opie-autorotateapplet
opie-batteryapplet
opie-brightnessapplet
opie-cardapplet
opie-cardmon
opie-clipboardapplet
opie-clockapplet
opie-dasher
opie-dvorak
opie-handwriting
opie-irdaapplet
opie-jumpx
opie-keyboard
opie-keyview
opie-kjumpx
opie-kpacman
opie-lockapplet
opie-memoryapplet
opie-multikey
opie-multikeyapplet
opie-networkapplet
opie-notesapplet
opie-pcmciaapplet
opie-pickboard
opie-pyquicklaunchapplet
opie-screenshotapplet
opie-taskbar-images
opie-ttf-support
opie-unikeyboard
opie-vmemo
opie-volumeapplet
opie-wirelessapplet
osso-application-installer
osso-core-config
ppp-dialin
ppp-dsl
prism2-firmware-update
ptim-helper
pulseaudio
qpf
rp-pppoe
sato-icon-theme
sgml-common
shared-mime-info
sharp-compat-libs
slugos-init
syslog-ng
sysvinit
ttf
u-boot
uim
unionroot-utils
update-modules
usb-gadget-mode
util-linux
util-linux-ng
vsftpd-charconv
wifi-radar
xorg-font-common



