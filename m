Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PMSUe-0002P2-Ql
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 22:39:41 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E4AC711000B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 22:38:24 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 260F3110009C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 22:38:23 +0100 (CET)
Received: from rhein.familie-heinold.de (g225147044.adsl.alicedsl.de
	[92.225.147.44]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 22:38:23 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 5A2C43C121; Sat, 27 Nov 2010 22:38:19 +0100 (CET)
Date: Sat, 27 Nov 2010 22:38:19 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101127213818.GA1180@rhein.zuhause.netz>
References: <4CF120CB.9030808@sensortherm.de>
MIME-Version: 1.0
In-Reply-To: <4CF120CB.9030808@sensortherm.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: disko
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
X-List-Received-Date: Sat, 27 Nov 2010 21:39:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 27, 2010 at 04:16:27PM +0100, Klaus Schwarzkopf wrote:
> Hi,
> 
> disko needs scons to build, but the recipes depends not to
> python-scons-native. I changed DEPENDS in disko.inc from
> - DEPENDS = "sqlite3 libpng jpeg curl alsa-lib freetype libxml2
> libsigc++-2.0 openssl"
> + DEPENDS = "python-scons-native sqlite3 libpng jpeg curl alsa-lib
> freetype libxml2 libsigc++-2.0 openssl"
> 
> but it doesn't help.
> 
> Can you help me?
> 
> Regards,
> 
> Klaus

Hi Klaus,

hm normaly the scons.bbclass should take care of it, but seems it does not for
i386/x86_64. Could please try a newer bitbake version and send the install log
of the python-native-scons

Bye Henning


