Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MBfPR-0006OU-O2
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 03:36:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B9BA24CD485
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2009 21:27:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09625-08 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  2 Jun 2009 21:27:59 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 8B1B54B288D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2009 21:27:59 -0400 (EDT)
Date: Tue, 2 Jun 2009 21:27:59 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: busybox & syslog init script
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
X-List-Received-Date: Wed, 03 Jun 2009 01:36:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

Currently busybox deb upgrades break (at least with Busybox dpkg): the 
prerm script returns failure because the last command executed is 
"/etc/init.d/syslog stop", and by then the /bin/sh link has been removed 
so the #!/bin/sh line fails to find the interpreter. (Even if it could, 
the start-stop-daemon link would be gone, too.)

busybox inherits update-rc.d, and updatercd_prerm() is always appended 
onto the end of the prerm; I don't know of a way to make it prepend 
instead. So I figure there are two ways to fix it:

1) split the syslog initscript into busybox-syslog, as is already done for 
busybox-httpd and busybox-udhcpd;
2) or, manually handle the stuff the update-rc.d class would normally take 
care of for busybox, so the syslog initscript stays in the busybox 
package.

I'd prefer #1, but I don't think I could ever track down all the in-tree 
and out-of-tree images that depend on busybox, and add "busybox-syslog" to 
all of them. I guess I'll try #2. Just checking if someone has a better 
idea.

Thanks,
Mike


