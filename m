Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GMZ64-0006aJ-Qu
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 01:52:21 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 1D9E491198
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2006 09:49:03 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11456-09
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2006 09:49:00 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 8453A160E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2006 09:49:00 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 75650EFEE22; Mon, 11 Sep 2006 09:49:00 +1000 (EST)
Date: Mon, 11 Sep 2006 09:49:00 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060910234900.GA25953@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: sanitize.py
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
X-List-Received-Date: Sun, 10 Sep 2006 23:52:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Nice work on sanitize.py, I like it!

Here's a few things I'd like to see changed:

* For initscripts the order should be:

  INITSCRIPT_PACKAGES
  INITSCRIPT_NAME
  INITSCRIPT_PARAMS

since the PACKAGES lists which packages we are going to have
initscripts for while the NAME and PARAMS are repeated for each one
of those packages, like this:

  # Main init script starts all deamons
  # Seperate init script for watchquagga
  INITSCRIPT_PACKAGES                     = "${PN} ${PN}-watchquagga"
  INITSCRIPT_NAME_${PN}                   = "quagga"
  INITSCRIPT_PARAMS_${PN}                 = "defaults 15 85"
  INITSCRIPT_NAME_${PN}-watchquagga       = "watchquagga"
  INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"

Also it seems to split these up when they probably should be kept
together. ie, the above currently comes out as this:

  INITSCRIPT_NAME_${PN}                   = "quagga"
  INITSCRIPT_NAME_${PN}-watchquagga       = "watchquagga"

  # Main init script starts all deamons
  # Seperate init script for watchquagga
  INITSCRIPT_PACKAGES = "${PN} ${PN}-watchquagga"

  INITSCRIPT_PARAMS_${PN}                 = "defaults 15 85"
  INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"


* For alternatives the order should be:

  ALTERNATIVE_NAME
  ALTERNATIVE_PATH
  ALTERNATIVE_LINK
  ALTERNATIVE_PRIORITY

since NAME and PATH are required while LINK and PRIORITY are
optional. I think it's better to always have the two required entries
first and then the optional ones, like this:

  ALTERNATIVE_NAME = "awk"
  ALTERNATIVE_PATH = "gawk"
  ALTERNATIVE_LINK = "${bindir}/awk"
  ALTERNATIVE_PRIORITY = "100"

It also splits these up and they should probably be kept together as
well. ie, the above currently comes out as this:

  ALTERNATIVE_LINK = "${bindir}/awk"

  ALTERNATIVE_NAME = "awk"

  ALTERNATIVE_PATH = "gawk"

  ALTERNATIVE_PRIORITY = "100"


* It doesn't know about the PKG variable (the name of the package,
  used to prevent debian.bbclass from changing the name to an
  internal shared library name.):

  ## Warning: unknown variable/routine "PKG_${PN}-ospfd         = ${PN}-ospfd"
  ## Warning: unknown variable/routine "PKG_${PN}-ospfclient    = ${PN}-ospfclient"


* It doesn't know about pre/post rm/install scripts (maybe it's not
  meant to?):

  ## Warning: unknown variable/routine "pkg_prerm_${PN} () {"
  ## Warning: unknown variable/routine "        ${sysconfdir}/init.d/quagga stop"
  ## Warning: unknown variable/routine "}"
  ## Warning: unknown variable/routine "pkg_prerm_${PN}-ospfd () {"
  ## Warning: unknown variable/routine "        ${sysconfdir}/init.d/quagga stop ospfd"
  ## Warning: unknown variable/routine "}"

-- 
 Jamie Lenehan <lenehan@twibble.org>


