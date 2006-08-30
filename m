Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GILMh-0005ut-Nm
	for openembedded-devel@openembedded.org; Wed, 30 Aug 2006 10:24:03 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k7U8Lqw4012251 for <openembedded-devel@openembedded.org>;
	Wed, 30 Aug 2006 10:21:53 +0200
Message-ID: <44F54AA0.9050901@dominion.kabel.utwente.nl>
Date: Wed, 30 Aug 2006 10:21:52 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <20060828235951.GA16344@twibble.org>
	<20060829004122.GA22529@twibble.org>
In-Reply-To: <20060829004122.GA22529@twibble.org>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: patcher changes - quilt patching breakage?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2006 08:24:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> On Tue, Aug 29, 2006 at 09:59:51AM +1000, Jamie Lenehan wrote:
>> I've got huge amounts of breakage from quilt due to the patching
>> related changs. Is anyone else seeing this. It looks like I can't
>> apply any patches more than one.. which is rather wierd.
> 
> The problem is that my build directory is:
> 
>  /data/oe/build/titan-glibc-24
> 
> and I have a directory called:
> 
>  /data/oe/patches
> 
> It appears that quilt searches throught he path for a directory
> called "patches" and uses that for all it's patches. So the patches
> are being stored in my /data/oe/patches directory instead of in the
> package itself.
> 
> The patch command used to mkdir the patches directory, but this is no
> longer happening. The following patch appears to make things work
> again - does this look correct to people who understand this patch
> class?

That patch isn't quite right yet, consider this recipe:

- --------
MAINTAINER = "Koen Kooi <koen@linuxtogo.org>"
PV = ${DISTRO_VERSION}

do_compile() {
        mkdir -p ${D}${sysconfdir}
        echo "Angstrom ${DISTRO_VERSION}" > ${D}${sysconfdir}/angstrom-version

}
- ---------


that blows up. Does python have an os.mkdirhier?

regards,

Koen




> 
> #
> # old_revision [14917049ca38865d541726340df4e735749d9fc9]
> #
> # patch "classes/patch.bbclass"
> #  from [06bfa04274235a178643633deba99054024b741c]
> #    to [43a7cdac0d459f62c68c6d258f001d3b06688906]
> #
> ============================================================
> --- classes/patch.bbclass       06bfa04274235a178643633deba99054024b741c
> +++ classes/patch.bbclass       43a7cdac0d459f62c68c6d258f001d3b06688906
> @@ -174,6 +174,9 @@ def patch_init(d):
>                 def __init__(self, dir, d):
>                         PatchSet.__init__(self, dir, d)
>                         self.initialized = False
> +                       p = os.path.join(self.dir, 'patches')
> +                       if not os.path.exists(p):
> +                               os.mkdir(p)
> 
>                 def Clean(self):
>                         try:
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFE9UqgMkyGM64RGpERAtF9AJ9TjBGT+SZdmguS6RPAzdX4MF5jdACaA3u6
QrDSmbsuEdffrUIvI7aUUWo=
=EYCl
-----END PGP SIGNATURE-----


