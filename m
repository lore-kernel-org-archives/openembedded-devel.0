Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schuknecht@dresearch-fe.de>) id 1S7TRr-0005Jd-4J
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 16:15:39 +0100
Received: by ghbz2 with SMTP id z2so638090ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 08:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=Jw1T2wd5zykrMYj7qrPXgNn1NSSLg8AEzVFevEMH1uE=;
	b=VdHX3hlhAhlzBkYWVBcEWzm1O6NNlUztoMBDuInmFS36jrwyT0c+a76Zw3e/Yhsu5K
	SDMi0OYmNAQhsXx2udD2Tkzbod6LzhQprz6jpGfaz1cgpHmbtcfbyKnYXQMELTqky3hf
	ZrDDdZGGFvmzS4NnMZd1szTYM+Ne5SPrv3qGEzlssRtJjT90QlzABCcL2oYlHf9/jJ8e
	GGKKCbiW5SjgNOTl+/2YOWWt8ueFMo+0PI9WWhLT/SAI/85l9hGHzElyRQ2rGXp9L7dS
	ZbNVRaFYMb1mdd+cPeFBv9GRS9IedzTVV7gjlnxc8v33u3ADQU7ka9ML4SiwEvAtJ9T2
	NLdQ==
MIME-Version: 1.0
Received: by 10.60.3.99 with SMTP id b3mr8408721oeb.72.1331651214374; Tue, 13
	Mar 2012 08:06:54 -0700 (PDT)
Received: by 10.182.60.199 with HTTP; Tue, 13 Mar 2012 08:06:54 -0700 (PDT)
Date: Tue, 13 Mar 2012 16:06:54 +0100
Message-ID: <CAAwVp3u7i6ptQ=dvCV_RGwctHqDWKLXXPXKjGwZJ_okhDx8gwg@mail.gmail.com>
From: Mario Schuknecht <schuknecht@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkxB2aMdnrf38JGifzHjJuiQD00UTbKG8a/MiRhZJA1Su4Ub32hgq+bHepPtcrwc2F+pMTM
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: udev_141 vs. udev_network_queue.sh
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
X-List-Received-Date: Tue, 13 Mar 2012 15:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

we use udev_141.bb and an USB-WLAN modem. The WLAN modem is configured in
/etc/network/interfaces as ra0 and ifup ra0 works fine.
After a boot of our system the WLAN modem network interface is not
configured. I think the problem is that udev starts prior to networking.
root@3065-4-00001:~# ls -l /etc/rcS.d/
...
lrwxrwxrwx 1 root root 14 Mar 9 16:34 S03udev -> ../init.d/udev
...
lrwxrwxrwx 1 root root 20 Mar 9 16:34 S40networking -> ../init.d/networking
...

The udev script /etc/udev/scripts/network.sh writes all not configured
interfaces into the file /dev/udev_network_queue
root@3065-4-00001:~# cat /dev/udev_network_queue
eth0
lo
ra0
But no script or program check this file.
I googled  udev_network_queue and found an old bitbake recipe
http://svn.nslu2-linux.org/svnroot/slugos/releases/slugos-3.10-beta/openemb=
edded/packages/udev/udev_084.bb
that
installs  udev_network_queue.sh.
That script checks this files and starts the interfaces.

Why is this file not installed any longer? Is there any other way or
concept to handle this situation?

Kind regards,

Mario

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany

Tel: +49 30 515932-240  mailto:schuknecht@dresearch-fe.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

