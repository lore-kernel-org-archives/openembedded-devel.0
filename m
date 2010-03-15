Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nr2Xk-0003gB-D1
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 06:08:45 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id B28801B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 05:08:43 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 06:05:02 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
MIME-Version: 1.0
Message-Id: <201003150605.03085.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Request for help to address known security issues
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
X-List-Received-Date: Mon, 15 Mar 2010 05:08:45 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

the following OE packages seem to be vulnerable to known security issues and I 
would like to get some help in updating these....

wget 1.9.1: http://www.FreeBSD.org/ports/portaudit/06f142ff-4df3-11d9-
a9e7-0001020eed82.html

perl 5.8.8: http://www.FreeBSD.org/ports/portaudit/4a99d61c-
f23a-11dd-9f55-0030843d3802.html

perl-native 5.8.8: Same as above

squid 2.6: probably deserves an update...
squid-native too..

faad2 2.0: http://www.FreeBSD.org/ports/portaudit/445ed958-b0d9-11dd-
a55e-00163e000016.html

cyrus-sasl 2.1.19: 
http://www.FreeBSD.org/ports/portaudit/14ab174c-40ef-11de-9fd5-001bd3385381.html

cscope 15.5: http://www.FreeBSD.org/ports/portaudit/c14aa48c-5ab7-11de-
bc9b-0030843d3802.html

freeciv 2.0.8: http://www.FreeBSD.org/ports/portaudit/2d9ad236-4d26-11db-
b48d-00508d6a62df.html

php-native and php should probably use the same versions...

lighttpd 1.4.18: 
http://www.FreeBSD.org/ports/portaudit/1ac77649-0908-11dd-974d-000fea2763ce.html, 
http://www.FreeBSD.org/ports/portaudit/fb911e31-8ceb-11dd-
bb29-000c6e274733.html, 
http://www.FreeBSD.org/ports/portaudit/1a3bd81f-1b25-11df-
bd1a-002170daae37.html

ipsec-tools 0.6.7: http://www.FreeBSD.org/ports/portaudit/abcacb5a-e7f1-11dd-
afcd-00e0815b8da8.html

cyrus-imapd 2.2.12: 
http://www.FreeBSD.org/ports/portaudit/012b495c-9d51-11de-8d20-001bd3385381.html, 

gallery 1.5.5: http://www.FreeBSD.org/ports/portaudit/fc9e73b2-8685-11dd-
bb64-0030843d3802.html

thunderbird 1.0.7... I don't list all....


vnc 3.3.7: http://www.FreeBSD.org/ports/portaudit/4645b98c-
e46e-11da-9ae7-00123fcc6e5c.html

findutils 4.2.29: 
http://www.FreeBSD.org/ports/portaudit/7ca2a709-103b-11dc-8e82-00001cd613f9.html

streamripper 1.61.10: http://www.FreeBSD.org/ports/portaudit/4d4caee0-
b939-11dd-a578-0030843d3802.html

libvorbis 1.2.3: Maybe we need an extra patch 
http://www.FreeBSD.org/ports/portaudit/94edff42-d93d-11de-
a434-0211d880e350.html

gftp 2.0.18: Maybe we need an extra patch 
http://www.FreeBSD.org/ports/portaudit/f8b0f83c-8bb3-11dc-
bffa-0016179b2dd5.html

gnupg 1.4.2.2: numerous issues... 
http://www.FreeBSD.org/ports/portaudit/f900bda8-0472-11db-
bbf7-000c6ec775d9.html, 
http://www.FreeBSD.org/ports/portaudit/ed529baa-21c6-11db-
b625-02e081235dab.html, 
http://www.FreeBSD.org/ports/portaudit/34c93ae8-7e6f-11db-
bf00-02e081235dab.html, 
http://www.FreeBSD.org/ports/portaudit/4db1669c-8589-11db-
ac4f-02e081235dab.html, 
http://www.FreeBSD.org/ports/portaudit/30394651-13e1-11dd-
bab7-0016179b2dd5.html


wv 1.2.0: http://www.FreeBSD.org/ports/portaudit/d29dc506-8aa6-11db-
bd0d-00123ffe8333.html

imlib 1.9.15: Maybe we need a patch 
http://www.FreeBSD.org/ports/portaudit/2001103a-6bbd-11d9-851d-000a95bc6fae.html

bogofilter 0.96.0: 
http://www.FreeBSD.org/ports/portaudit/b747b2a9-7be0-11da-8ec4-0002b3b60e4c.html

cdrtools-native 2.01: http://www.FreeBSD.org/ports/portaudit/fdbbed57-
f933-11d8-a776-00e081220a76.html

ez-upupdate 3.0.10: http://www.FreeBSD.org/ports/portaudit/e69ba632-326f-11d9-
b5b7-000854d03344.html

gzip 1.3.5: http://www.FreeBSD.org/ports/portaudit/11a84092-8f9f-11db-
ab33-000e0c2e438a.html

apr 1.3.5: http://www.FreeBSD.org/ports/portaudit/eb9212f7-526b-11de-
bbf2-001b77d09812.html

grip 3.2.0: http://www.FreeBSD.org/ports/portaudit/bcf27002-94c3-11d9-
a9e0-0001020eed82.html

socat 1.3.2.1:  http://www.FreeBSD.org/ports/portaudit/f3017ce1-32a4-11d9-
a9e7-0001020eed82.html

unrar 3.4.3: http://www.FreeBSD.org/ports/portaudit/94234e00-be8a-11db-
b2ec-000c6ec775d9.html

unrar-native: same thing..

dnsmasq 2.47: http://www.FreeBSD.org/ports/portaudit/80aa98e0-97b4-11de-
b946-0030843d3802.html

bitlbee 1.0. 4: 
http://www.FreeBSD.org/ports/portaudit/24ec781b-8c11-11dd-9923-0016d325a0ed.html

postgressql: http://www.FreeBSD.org/ports/portaudit/51436b4c-1250-11dd-
bab7-0016179b2dd5.html

ctorrent 3.3.1: http://www.FreeBSD.org/ports/portaudit/83d7d149-b965-11de-
a515-0022156e8794.html

nsd 2.0.0: http://www.FreeBSD.org/ports/portaudit/37a8603d-4494-11de-
bea7-000c29a67389.html

curl-sdk: It should match curl-native and curl... currently 
http://www.FreeBSD.org/ports/portaudit/5d433534-f41c-402e-ade5-
e0a2259a7cb6.html

gnome-screensaver: 2.28.0 
http://www.FreeBSD.org/ports/portaudit/0a82ac0c-1886-11df-
b0d1-0015f2db7bde.html

if everybody would randomly grab two/three recipes we could have all of this 
fixed in a day...


