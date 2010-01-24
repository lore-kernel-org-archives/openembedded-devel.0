Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZ48b-0003jj-Hn for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:12:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZ46J-0004Ss-Mp
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:10:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 16:10:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 16:10:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Jan 2010 16:09:45 +0100
Message-ID: <hjhnrn$lpi$1@ger.gmane.org>
References: <fca63bcf1001240522q1863fb51xa1a041d3e0b8cdf@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <fca63bcf1001240522q1863fb51xa1a041d3e0b8cdf@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gpsd re-write
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
X-List-Received-Date: Sun, 24 Jan 2010 15:12:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-10 14:22, Michael Lippautz wrote:
> Hej,
> 
> As I am re-writing the gpsd package, a few questions did come up.
> 
> 1) gpsd can deal with multiple different gps devices (being served as
> different nodes). Is it sufficient to start gpsd with a control socket
> and add recipe for gps devices that just add init script that are
> executed after gpsd startup. These init scripts could add the device
> over the control socket. I.e. a recipe gpsd-device-... could add the
> /dev/ttyACM0 node, using the control socket.
> 
> 2) Since gps devices can also be integrated into platforms (machines)
> a second approach using RDEPENDS_${PN}_machine can be used to build a
> machine specific package. This machine specific package could init the
> device and also attach it using the socket.
> 
> Is it "ok" to create such machine specific packages, i.e.
> gpsd-hardware-om-gta01 ? How about "device" specific recipes (should
> they be done in an other way)?
> 
> Additionally I can also add an /etc/default/gps-hardware file that
> uses update-alternative to add the device at program startup.
> 
> Are these approaches correct? Don't want to sit and write these if
> they are rejected anyways ;)

Your approaches are a lot better than the current 'gpsd only starts if
it was built for your machine *AND* OE has a config for it'

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXGK4MkyGM64RGpERAk7CAJ4kbdekGFkioFbpHZ/28fsmqcOqtACfQgx3
i5aHG9ULaUksACfO759u7sc=
=VAwM
-----END PGP SIGNATURE-----



