Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MTWLB-0001NB-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 09:34:17 +0200
Received: from w1722.wlan.rz.tu-bs.de ([134.169.206.198] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MTW7H-0002xH-Mt by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2009 09:20:10 +0200
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1MTW7H-0000g0-Ev
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 09:19:55 +0200
Date: Wed, 22 Jul 2009 09:19:55 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090722071955.GA1523@excalibur.local>
References: <20090721144752.GA26047@excalibur.local>
	<4A65D66B.8050108@balister.org>
	<20090721151040.GB26047@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20090721151040.GB26047@excalibur.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: devmem2 checksum mismatch
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
X-List-Received-Date: Wed, 22 Jul 2009 07:34:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2009-07-21 at 17:10, Stefan Schmidt wrote:
> 
> On Tue, 2009-07-21 at 10:53, Philip Balister wrote:
> > Stefan Schmidt wrote:
> > >
> > >I just run into this one:
> > >NOTE: The MD5Sums did not match. Wanted: 'be12c0132a1ae118cbf5e79d98427c1d' and Got: 'e23f236e94be4c429aa1ceac0f01544b'
> > >NOTE: Task failed: Checksum of 'http://www.lartmaker.nl/lartware/port/devmem2.c' failed
> > >
> > >Seems they changed the file. Version control is really nothing for everybody. ;)
> > 
> > Change the checksum after looking over the file a bit to make sure
> > there is no funny business.
> 
> Will do this in the evening, have to run now. But I expect no real problems.
> Especially as we have this checksum for the file already, just on a different
> URI. Means OE already used that version at some point. :)

I just reviewed the file and pushed the chages to checksums.ini. The file itself
was small and easy enough to understand for a fast review.

regards
Stefan Schmidt


