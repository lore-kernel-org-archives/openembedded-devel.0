Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MLDuE-00050p-M7
	for openembedded-devel@openembedded.org; Mon, 29 Jun 2009 12:16:10 +0200
Received: (qmail 6033 invoked by uid 813007); 29 Jun 2009 10:04:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Jun 2009 10:04:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jun 2009 12:04:18 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-00002-g9396b7b; KDE/4.2.4; x86_64; ; )
References: <1246138179-23626-1-git-send-email-msmith@cbnco.com>
In-Reply-To: <1246138179-23626-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
Message-Id: <200906291204.20912.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 1/2] source-checker: usability tweaks
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
X-List-Received-Date: Mon, 29 Jun 2009 10:16:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 27 czerwca 2009 o 23:29:38 Michael Smith napisa=C5=82(a):

> checksum sorter, source checker:=20

> exit(1) on failure;=20

OK with it

> send usage to stderr;=20

NACK - most of tools which I use use stdout for --help/usage stuff.

> make executable

OK

> checksum sorter:=20

> read from stdin if no arg;=20

OK

> accept --inplace option to read and write from the same file.

Idea nice but:

12:00 hrw@home:openembedded$ contrib/source-checker/oe-checksums-
sorter.py -i conf/checksums.ini
Traceback (most recent call last):
  File "contrib/source-checker/oe-checksums-sorter.py", line 104, in=20
<module>
    os.rename(outfn, args[0])
OSError: [Errno 18] Invalid cross-device link

/tmp/ is tmpfs, /home/ is ext3 and Python documentation says "The=20
operation may fail on some Unix flavors if src and dst are on different=20
filesystems".

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




