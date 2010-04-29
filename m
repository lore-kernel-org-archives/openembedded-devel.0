Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.oe@pilsoft.com>) id 1O7XKo-0007LB-KO
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 19:15:36 +0200
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 8692881819C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 19:11:51 +0200 (CEST)
Received: from mail.pilsoft.com (mna75-2-82-67-197-228.fbx.proxad.net
	[82.67.197.228])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9C53881812A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 19:11:49 +0200 (CEST)
Received: from [192.168.33.16] ([192.168.33.1]) BY mail.pilsoft.com
	([192.168.33.30])
	WITH ESMTP (4D WebSTAR V Mail (5.4.1)); Thu, 29 Apr 2010 19:11:46 +0200
From: David Hemmo <david.oe@pilsoft.com>
Date: Thu, 29 Apr 2010 19:11:48 +0200
Message-Id: <957DA1DB-B1DC-43D4-AACC-D647DFBD43D7@pilsoft.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1078)
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 212.27.42.3
X-SA-Exim-Mail-From: david.oe@pilsoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problem compiling mono
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
X-List-Received-Date: Thu, 29 Apr 2010 17:15:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello All,

the problem arises when bitbake tries to configure : =
mono-mcs-intermediate_2.4.2.3.bb

here is the error I get in the log file:

automake (GNU automake) 1.10.3
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later =
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.10
install: cannot change permissions of `/usr/share/aclocal-1.10': No such =
file or directory

I guess the culprit is the target prefix override in =
mono-mcs-intermediate.inc, but I don't know how to fix it :-(
I don't feel comfortable allowing openembedded to access /usr or /etc =
...

I hope someone will be able to help

Thanks

David Hemmo=20=


