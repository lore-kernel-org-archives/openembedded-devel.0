Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HknVV-0003wx-FQ
	for openembedded-devel@openembedded.org; Sun, 06 May 2007 22:39:01 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l46Kcaox020604 for <openembedded-devel@openembedded.org>;
	Sun, 6 May 2007 22:38:38 +0200
Message-ID: <463E3CC8.10407@dominion.kabel.utwente.nl>
Date: Sun, 06 May 2007 22:38:32 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1178482671.6132.10.camel@localhost>
In-Reply-To: <1178482671.6132.10.camel@localhost>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: gstreamer obsoleted recipes
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
X-List-Received-Date: Sun, 06 May 2007 20:39:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Manuel Teira schreef:
> Hello all.
> 
> I've recently added some recipes for gstreamer and gst-plugins-[good|
> bad|ugly|...] in order to build the last stable releases of this
> software. I've seen that there are a lot of "old" stable releases that
> if nobody is needing, we could sanely delete from the repository.
> 
> My plan is to only left the last stable version for all the related
> packages, so, we would keep only the following recipes, in the directory
> gstreamer:
> 
> gst-ffmpeg_0.10.2.bb
> gst-plugins-base_0.10.12.bb
> gst-plugins-good_0.10.5.bb
> gst-plugins-ugly_0.10.5.bb
> gstreamer_0.10.12.bb
> 
> The only distro that seems to depend on  a fixed gstreamer version
> (0.10.11) is angstrom. But I assume that we can upgrade that requirement
> to 0.10.12 without problems.

Yes, it's safe, angstrom only had those versions locked down to select 0.10 over 0.8, but
0.8 is gone now, so those preferred_versions should be safe to remove.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGPjzIMkyGM64RGpERAky3AJ4t1RemMlENfVNDI1pdPIpIkBqJNwCfTIoq
DazvNQqprOC1w9bC1hRehq4=
=6F9d
-----END PGP SIGNATURE-----


