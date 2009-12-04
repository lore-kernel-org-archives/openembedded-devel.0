Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NGfIk-0008Jg-5G
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 22:02:57 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E751E110025E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 22:01:14 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2131E11001B9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 22:01:14 +0100 (CET)
Received: from rhein.familie-heinold.de (g225147097.adsl.alicedsl.de
	[92.225.147.97]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 22:01:14 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 335343C04A; Fri,  4 Dec 2009 22:01:13 +0100 (CET)
Date: Fri, 4 Dec 2009 22:01:13 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091204210112.GA22210@rhein.zuhause.netz>
References: <1259880334.25344.7.camel@mattotaupa.wohnung.familie-menzel.net>
	<1259939828.4859.1456.camel@pblack-ubuntu>
MIME-Version: 1.0
In-Reply-To: <1259939828.4859.1456.camel@pblack-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [abiword] CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/freetype2
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
X-List-Received-Date: Fri, 04 Dec 2009 21:02:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The problem here is the libwmf plugin, which is enabled to auto. OE hasnt packed
libwmf yet(besides the lib was last updated 2002). So if you have libwmf-dev package
installed on your hostmachine the autotools will find libwmf-config from host
and set CLFAGS for the host libwmf, which is infect /usr/include.

There are 3 solutions:

- package libwmf into oe
- run abiword configure with --enbale-plugin "list of all plugins without libwmf"
- edit .m4 files so it dont includes wmf plugin

Bye Henning


