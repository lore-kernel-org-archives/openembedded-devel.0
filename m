Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HeB51-0006Rj-G0
	for openembedded-devel@openembedded.org; Wed, 18 Apr 2007 16:24:19 +0200
Received: from [130.89.6.69] (vpn006069.vpn.utwente.nl [130.89.6.69])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3IEOFox012218 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2007 16:24:16 +0200
Message-ID: <46262A0F.1050805@dominion.kabel.utwente.nl>
Date: Wed, 18 Apr 2007 07:24:15 -0700
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
	<20070418090235.GA21841@twibble.org>
In-Reply-To: <20070418090235.GA21841@twibble.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2007 14:24:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> On Tue, Apr 17, 2007 at 12:02:03AM +0200, Koen Kooi wrote:
>> Hi,
>>
>> Marcel Holtmann just pointed me to the fact that OE mount /var as tmpfs for
>> almost all machines, which wipes /var/lib at boot, which will break bluez and
>> dpkg.
>>
>> What would be the best way to preserve /var/lib (and maybe others) across boots?
> 
> This has been brought up a few times and no one has really had a good
> answer for it. I think /var/lib at a minimum needs to be made
> persistent.
> 
> After thinking about it a bit I've got the following proposal:
> 
>  - make /var a standard directory (no tmpfs)
> 
>  - make /var/volatile a tmpfs filesystems (or /var/tmpfs)
> 
>  - symlink things that are to be made volatile from /var into
>    /var/volatile
> 
> So the default /var would end up looking like this:
> 
>  /var/volatile       tmpfs mount
>  /var/volatile/lock  *
>  /var/volatile/run   *
>  /var/volatile/tmp   *
>  /var/volatile/cache *
>  /var/volatile/log   *
>  /var/backups
>  /var/lib
>  /var/lock           symlink to /var/volatile/lock
>  /var/run            symlink to /var/volatile/run
>  /var/tmp            symlink to /var/volatile/tmp
>  /var/cache          symlink to /var/volatile/cache
>  /var/local
>  /var/log            symlink to /var/volatile/log
>  /var/spool
>  /var/www
> 
> * == created by the existing volatiles system
> 
> (According to the FHS /var/tmp should also persist over reboots.)
> 
> This also has an advantage in the situation where I want to make
> something persistent I just have to break the symlink. So for the
> logs for example I could just have "rm /var/log && mv
> /var/volatile/log /var/log" and from then on the logs would remain.

Sound like a good idea, do you have a patch for this?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGJioPMkyGM64RGpERAtdLAKCTf6YqOUnM4+5bKPQPN6eMIorcTwCffjnL
IP97PHEx2lA0PkrRN9um1RM=
=GNuM
-----END PGP SIGNATURE-----


