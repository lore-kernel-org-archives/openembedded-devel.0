Received: from smtp.net4india.com ([202.71.129.67])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sagarj@oriolesoftware.com>) id 1NrmyR-0001Z9-6h
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 07:43:27 +0100
Received: from [59.96.147.176] (helo=proxy)
	by smtp.net4india.com with esmtp (Exim 4.69)
	(envelope-from <sagarj@oriolesoftware.com>) id 1Nrmva-0006HI-BT
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 12:10:26 +0530
From: "Sagar Jariwala" <sagarj@oriolesoftware.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Mar 2010 12:10:27 +0530
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
In-Reply-To: <hnolb4$9o$1@dough.gmane.org>
Thread-Index: AcrFPTGkjafJxGDATYu8oJs6HNso7wAXv1rw
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-SA-Exim-Connect-IP: 202.71.129.67
X-SA-Exim-Mail-From: sagarj@oriolesoftware.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=AWL,BAYES_00,FRT_SYMBOL,
	MISSING_MID, RCVD_IN_SORBS_WEB,
	TVD_FUZZY_SYMBOL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Need HELP :: Samsung SMDK6410 root file systemusingopen-embedded
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
X-List-Received-Date: Wed, 17 Mar 2010 06:43:27 -0000
Message-ID: <MADEUP.15FE1AF41AF28296.3419@groups.io>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Koen,

Thank you for the help.

I tried building it. It generated RFS. 

I was unable to mount this FS during bootup of smdk6410 board. So I boot up
the board with ram-fs in nand and switched my root to narcissus generated
root-fs.

While running "totem" command it gave me following error. 

/ # totem
(totem:1000): GStreamer-WARNING **: Failed to load plugin
'/usr/lib/gstreamer-0.
10/libgstsubparse.so': /usr/lib/gstreamer-0.10/libgstsubparse.so: undefined
symb
ol: parse_sami
Error re-scanning registry , child terminated by signal
Run 'totem --help' to see a full list of available command line options.
/ #

What can be the potential reason for it?

Thanks,
SJ

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Koen
Kooi
Sent: Wednesday, March 17, 2010 12:45 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Need HELP :: Samsung SMDK6410 root file
systemusingopen-embedded

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-03-10 13:14, Sagar Jariwala wrote:
> Actually I need a root file system for SMDK 6410 which includes different
> applications like Mplayer and totem player.
> 
> Currently I am getting lots of error running bitbake.

Try using narcissus with the 'smartq5' machine, that's also s3c64xx based.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLn9ikMkyGM64RGpERAuSUAKCpEuUIdcP3JpU0jU9wDZ2g/D7MrQCdF+Sc
PL74xA8OpVHsOWHe5yhpyq4=
=lCyj
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




