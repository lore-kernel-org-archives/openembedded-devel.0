Received: from [213.251.189.42] (helo=42.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <ebenard@free.fr>) id 1MJvl0-0000R9-A3
	for openembedded-devel@openembedded.org; Thu, 25 Jun 2009 22:41:18 +0200
Received: (qmail 11630 invoked by uid 503); 25 Jun 2009 20:30:15 -0000
Received: from b6.ovh.net (HELO mail420.ha.ovh.net) (213.186.33.56)
	by 42.mail-out.ovh.net with SMTP; 25 Jun 2009 20:30:15 -0000
Received: from b0.ovh.net (HELO queue-out) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Jun 2009 20:29:29 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 25 Jun 2009 20:29:28 -0000
Message-ID: <4A43DE45.6070802@free.fr>
Date: Thu, 25 Jun 2009 22:29:57 +0200
From: Eric BENARD <ebenard@free.fr>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, slapinid@gmail.com
References: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
In-Reply-To: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
X-Ovh-Tracer-Id: 16008044876827547977
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|H 0.5/N
Subject: Re: OMAP3530 bring-up (and installation of Angstrom)
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
X-List-Received-Date: Thu, 25 Jun 2009 20:41:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sergey,

Sergey Lapin a écrit :
> I have a new OMAP3530-based board which is totally empty.
> omapzoom tools recognize ASIC ID on serial port, so I think it should
> be possible
> to bring it up this way. Do anybody have some minimal testing program
> to flip some GPIO,
> or character on serial?

if you have a SDCard connector and can select it as a boot device using 
the BOOTx signals of the OMAP3530, just try to boot it this way.
I recently bring up a OMAP3530 board using the SDCard and beagleboard's 
x-load/u-boot & kernel as a basis with a few changes (8 bits NAND width 
in my case for example).
You can try directly with the BeagleBoard's binaries, it should give you 
some log :
http://elinux.org/BeagleBoard#MMC.2FSD_boot

Eric


