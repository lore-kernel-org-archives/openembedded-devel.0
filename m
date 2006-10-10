Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GXFsR-0002US-ED
	for openembedded-devel@openembedded.org; Tue, 10 Oct 2006 13:34:27 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9ABSBZS025786 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2006 13:28:11 +0200
Message-ID: <452B83DC.2020503@dominion.kabel.utwente.nl>
Date: Tue, 10 Oct 2006 13:28:28 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20060914001918.GA8432@twibble.org>
In-Reply-To: <20060914001918.GA8432@twibble.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: site/* Common site files
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
X-List-Received-Date: Tue, 10 Oct 2006 11:34:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> Here's the common site file stuff again. The main patch is at the end
> and includes one fix for the "common" site file which was broken in
> the last patch (cleaned up the code and broke it).
> 
> It'd be nice to move forward on this. I'm going to remove all this
> from my tree now to stop me from accidental using it (again!).
> 
> What this does is gives some flexibility with regards to site file
> processing:
> 
>  - It allows site files to be per recipe. So instead of updating a
>    global site file they can be added to the individual packages. 
>    This is particularly in the case where the same variable needs to
>    be set differently for different packages.
> 
>  - It allows site file aliases, so i386-linux, i486-linux, i586-linux
>    and i686-linux could all be use a common i86-linux site file (the
>    individual files could still be used if there was anything
>    actually specific to i386 or i486 etc)
> 
>  - It allows for common site files including a global common file,
>    libc specific common site files, endianess specific site files and
>    bitsize specified endianess files.
> 
> 
> The main things I wanted from this are:
> 
>  - merge all those x86 files
> 
>  - replace stuff that manually looks in the site files to determine
>    endianess
> 
>  - replace stuff that manually clears the site file entries because
>    existing entries break it
> 
>  - allow site files to be per package
> 
>  - allow a common site files for things that are the same regardless
>    of target.

The consensus is that we want this in OE, how to we proceed to get this added into .dev?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFK4PcMkyGM64RGpERAg+nAJsF8M2FpWE68BKU5Zl5e7MSZsufVQCgpvue
1xiW0sH+Uv37gvoij/tKhBo=
=aiqh
-----END PGP SIGNATURE-----


