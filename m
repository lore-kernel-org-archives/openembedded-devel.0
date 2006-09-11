Received: from [81.255.54.11] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <c.romain@laposte.net>) id 1GMuxH-0004C5-Na
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 01:12:43 +0200
Received: from [192.168.2.2] (86.201.49.78) by mx.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 44F4DD2800620F0C for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 01:09:21 +0200
Message-ID: <4505DEB3.1080407@laposte.net>
Date: Tue, 12 Sep 2006 00:09:55 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Mail/News 1.5 (X11/20060114)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <20060910234900.GA25953@twibble.org>
In-Reply-To: <20060910234900.GA25953@twibble.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: Re: sanitize.py
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
X-List-Received-Date: Mon, 11 Sep 2006 23:12:43 -0000
Content-Type: multipart/mixed; boundary="------------040506040109030009060003"

--------------040506040109030009060003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jamie,

Jamie Lenehan wrote:
> Nice work on sanitize.py, I like it!
>
> Here's a few things I'd like to see changed:
>
> * For initscripts the order should be:
>
>   INITSCRIPT_PACKAGES
>   INITSCRIPT_NAME
>   INITSCRIPT_PARAMS
>
> since the PACKAGES lists which packages we are going to have
> initscripts for while the NAME and PARAMS are repeated for each one
> of those packages, like this:
>
>   # Main init script starts all deamons
>   # Seperate init script for watchquagga
>   INITSCRIPT_PACKAGES                     = "${PN} ${PN}-watchquagga"
>   INITSCRIPT_NAME_${PN}                   = "quagga"
>   INITSCRIPT_PARAMS_${PN}                 = "defaults 15 85"
>   INITSCRIPT_NAME_${PN}-watchquagga       = "watchquagga"
>   INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"
>
>   
Corrected!
> Also it seems to split these up when they probably should be kept
> together. ie, the above currently comes out as this:
>
>   INITSCRIPT_NAME_${PN}                   = "quagga"
>   INITSCRIPT_NAME_${PN}-watchquagga       = "watchquagga"
>
>   # Main init script starts all deamons
>   # Seperate init script for watchquagga
>   INITSCRIPT_PACKAGES = "${PN} ${PN}-watchquagga"
>
>   INITSCRIPT_PARAMS_${PN}                 = "defaults 15 85"
>   INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"
>
>
>   
Corrected!
> * For alternatives the order should be:
>
>   ALTERNATIVE_NAME
>   ALTERNATIVE_PATH
>   ALTERNATIVE_LINK
>   ALTERNATIVE_PRIORITY
>
> since NAME and PATH are required while LINK and PRIORITY are
> optional. I think it's better to always have the two required entries
> first and then the optional ones, like this:
>
>   ALTERNATIVE_NAME = "awk"
>   ALTERNATIVE_PATH = "gawk"
>   ALTERNATIVE_LINK = "${bindir}/awk"
>   ALTERNATIVE_PRIORITY = "100"
>
>   
Corrected!
> It also splits these up and they should probably be kept together as
> well. ie, the above currently comes out as this:
>
>   ALTERNATIVE_LINK = "${bindir}/awk"
>
>   ALTERNATIVE_NAME = "awk"
>
>   ALTERNATIVE_PATH = "gawk"
>
>   ALTERNATIVE_PRIORITY = "100"
>
>
>   
Corrected!
> * It doesn't know about the PKG variable (the name of the package,
>   used to prevent debian.bbclass from changing the name to an
>   internal shared library name.):
>
>   ## Warning: unknown variable/routine "PKG_${PN}-ospfd         = ${PN}-ospfd"
>   ## Warning: unknown variable/routine "PKG_${PN}-ospfclient    = ${PN}-ospfclient"
>
>   
PKG key added!
> * It doesn't know about pre/post rm/install scripts (maybe it's not
>   meant to?):
>
>   ## Warning: unknown variable/routine "pkg_prerm_${PN} () {"
>   ## Warning: unknown variable/routine "        ${sysconfdir}/init.d/quagga stop"
>   ## Warning: unknown variable/routine "}"
>   ## Warning: unknown variable/routine "pkg_prerm_${PN}-ospfd () {"
>   ## Warning: unknown variable/routine "        ${sysconfdir}/init.d/quagga stop ospfd"
>   ## Warning: unknown variable/routine "}"
>
>   
Corrected! (pkg pre rm/install were missing)

In attachment the new version of sanitize.py. Among the above 
corrections, it handles more cases so it is less buggy for sure.
I send it to you as a patch. Can anyone please commit the patch ? (sorry 
to ask but I don't have right to commit)

Thank you for pointing that out :-)

Best regards,

  Cyril

--------------040506040109030009060003--
