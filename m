Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OUI9X-00014Q-Ou
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 13:42:00 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BD2C0110009E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 13:37:16 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E0EFC110009C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 13:37:15 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052231110.adsl.alicedsl.de
	[78.52.231.110]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 13:37:15 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id BAE943C12E; Thu,  1 Jul 2010 13:37:11 +0200 (CEST)
Date: Thu, 1 Jul 2010 13:37:11 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100701113709.GA8914@rhein.zuhause.netz>
References: <i0hp61$n03$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i0hp61$n03$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: java staging problem
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
X-List-Received-Date: Thu, 01 Jul 2010 11:42:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the problem is in java-library.bbclass which defines it's own stage.

The quickest solution is to add 

do_stage_append() {
	oe_jarinstall -s serializer-${PV}.jar serializer.jar
}

to the xalan recipe will do it after the Email.

The best solution is to remove the do_stage from java-library.bbclass
and teach the new staging system to put the java.jars into the nonearch-java-sysroot.

As Marcin pointed out earlier staging the jar's under arch-sysroot breaks
building whith multiple-archs in the same tmp-dir.

Bye Henning

PS: Seems I didn't hit this because of all my building machine has xalan installed from os.


