Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NrINp-0002Qi-Ep
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 23:03:38 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 48149D155
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 23:00:31 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgoXAINKnktT4zvyPGdsb2JhbAAHh1qTGgEBAQE3uQuEewQ
X-IronPort-AV: E=Sophos;i="4.49,645,1262559600"; d="scan'208";a="50741364"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 15 Mar 2010 23:00:31 +0100
Message-ID: <4B9EADFC.2060302@atmel.com>
Date: Mon, 15 Mar 2010 23:00:28 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnome-mplayer fails to build due to no libstdc++.so.6 instaging (available in cross)
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
X-List-Received-Date: Mon, 15 Mar 2010 22:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I get the following error message when I include gnome-mplayer in
an image derived from x11-gpe-image.

<snip>
/arm-angstrom-linux-gnueabi/bin/ld: warning: libstdc++.so.6, needed by
<OE>/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib/libmusicbrainz3.so
not found

There is no "libstdc++.so.6" in
"<OE>/build/tmp/staging/armv5te-angstrom-linux-gnueabi/lib"

There is a "libstdc++.so.6" in
<OE>/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib

If I move the "libstdc++.so[.6[.0.10]]"  files to the staging directory
the build will complete, and gnome-mplayer runs on the target.

I tried doing
DEPENDS = "libstdc++"
in "libmusicbrainz.inc"
but get a "no buildable provider" error.

I tried
RDEPENDS = "libstdc++"
and then libmusicbrainz completes, but again gnome-mplayer exists with
the error above.

How ensure that staging gets populated with libstdc++ if libmusicbrainz
is used?

-- 
Best Regards
Ulf Samuelsson



