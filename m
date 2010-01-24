Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NZ2Sa-0003t9-Nw
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 14:25:03 +0100
Received: by bwz9 with SMTP id 9so1943126bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=ZVTSFLZ3vfejWe0DWABC3VrjZzx6zfTRC49dWrZ7pME=;
	b=RT15o+zUYWynhpacJ4W/3NpyedBE00kXwymRf3rLg6CClInrC0Tcy78GFZbsfHbQY3
	G/MFoajQgLy68waQ2D9ZH+ENuZIS6Ymc0LdYzgkAJTUE0pyCm4xQToeefICL5xW404qo
	1UG7rEjRD0iuvvPv+AcODs0QJ39RLLf9HDe5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EZnVlPiza+UEijHIv8bNLZYGoCbBMFgTAKtQy05XCweDshRXfBNzoK6UMw2CHf2JBA
	kJR6W+03m5bKxDZTpGtp6PNcCgXd4bbp1RJanvaTDqsTJc91MIevlrY4kLBonuX0TJRT
	SPGLrrmN1DLXSdaB2uZuWcydEWH1JilBYS09I=
MIME-Version: 1.0
Received: by 10.204.20.131 with SMTP id f3mr152199bkb.162.1264339361446; Sun, 
	24 Jan 2010 05:22:41 -0800 (PST)
Date: Sun, 24 Jan 2010 14:22:41 +0100
Message-ID: <fca63bcf1001240522q1863fb51xa1a041d3e0b8cdf@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gpsd re-write
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
X-List-Received-Date: Sun, 24 Jan 2010 13:25:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hej,

As I am re-writing the gpsd package, a few questions did come up.

1) gpsd can deal with multiple different gps devices (being served as
different nodes). Is it sufficient to start gpsd with a control socket
and add recipe for gps devices that just add init script that are
executed after gpsd startup. These init scripts could add the device
over the control socket. I.e. a recipe gpsd-device-... could add the
/dev/ttyACM0 node, using the control socket.

2) Since gps devices can also be integrated into platforms (machines)
a second approach using RDEPENDS_${PN}_machine can be used to build a
machine specific package. This machine specific package could init the
device and also attach it using the socket.

Is it "ok" to create such machine specific packages, i.e.
gpsd-hardware-om-gta01 ? How about "device" specific recipes (should
they be done in an other way)?

Additionally I can also add an /etc/default/gps-hardware file that
uses update-alternative to add the device at program startup.

Are these approaches correct? Don't want to sit and write these if
they are rejected anyways ;)

regards,
Michael


