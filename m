Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NBbsd-0002kc-QR
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 23:23:06 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 4D0101C0028F;
	Fri, 20 Nov 2009 23:21:40 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 1C39C912F2;
	Fri, 20 Nov 2009 23:21:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id bDvGcpN2sTQx; Fri, 20 Nov 2009 23:21:38 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP;
	Fri, 20 Nov 2009 23:21:38 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Fri, 20 Nov 2009 23:21:37 +0100
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 23:21:32 +0100
Message-Id: <1258755695-24978-1-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 212.18.0.10
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] extra packages for default illume keyboards
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
X-List-Received-Date: Fri, 20 Nov 2009 22:23:06 -0000


Hello all,

For SHR we want to be able to remove illumes default keyboard as most people
don't like it. To be able to do this nicely via the package manager we need to
have them in extra packages.

The first patch just moves a bunch of custom illume keyboards to the correct
place (at least I think so :)

The second patch patches e-wm to not install the three default keyboards.
Common images used by all (or at least more) keyboards will still be installed
though.

The third patch adds a recipe with three subpackages - one for each default
keyboard.

Note: this is just a draft. I did not even try if it parses, builds or even
works ;) I will do that, if something like this is acceptable.

What do you think?

Klaus 'mrmoku' Kurzmann


