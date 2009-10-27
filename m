Received: from [208.97.132.5] (helo=homiemail-a24.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1N2mAG-0003rV-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 14:32:47 +0100
Received: from [192.168.1.154] (unknown [195.190.170.102])
	by homiemail-a24.g.dreamhost.com (Postfix) with ESMTPA id 5B4092C806B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 06:31:39 -0700 (PDT)
Message-ID: <4AE6F615.4080204@SSpaeth.de>
Date: Tue, 27 Oct 2009 14:31:01 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 208.97.132.5
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gst-plugins-base -> gnome-vfs question
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
X-List-Received-Date: Tue, 27 Oct 2009 13:32:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Current "gst-plugins-base" in org.oe.dev unconditionally depends on
"gnome-vfs" which in turn pulls in stuff like "avahi".

Is that what most people in OE want? It can be turned off on compile
time with: "--disable-gnome_vfs", making it optional.

I don't want avahi on my Freerunner, just because I want sound on it :-).

Should we look into an OEXTRA_CONF solution? Let me know if I have said
something dumb here or overlooked something obvious.

Thanks,
spaetz


