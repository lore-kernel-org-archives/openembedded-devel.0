Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NNcWP-0004ge-Uk
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 02:29:49 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BDA3E11000B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 02:27:54 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9B7561100092
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 02:27:53 +0100 (CET)
Received: from rhein.familie-heinold.de (f052239021.adsl.alicedsl.de
	[78.52.239.21]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 02:27:53 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id EB7033C112; Thu, 24 Dec 2009 02:27:52 +0100 (CET)
Date: Thu, 24 Dec 2009 02:27:52 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091224012752.GA25454@rhein.zuhause.netz>
References: <op.u5e34zgkmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u5e34zgkmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how can I upload my OE building failure information and log to tinderbox of OE
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
X-List-Received-Date: Thu, 24 Dec 2009 01:29:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the magic is the following putting into your local.conf

INHERIT += "oestats-client"
OESTATS_SERVER = "tinderbox.openembedded.net"
OESTATS_BUILDER = "youruploadername"


Bye Henning


