Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1INR9X-0005YA-Fk
	for openembedded-devel@openembedded.org; Tue, 21 Aug 2007 12:40:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7LAd5Cd016070
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 11:39:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15901-04 for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 11:39:01 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7LAcwbR016064
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 11:38:58 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Tue, 21 Aug 2007 11:38:57 +0100
Message-Id: <1187692737.6234.14.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: Merging multimachine.bbclass as the default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2007 10:40:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've just discovered some problems with the way we store data in
${STAGING_DIR}/pkgdata. The problem is it can be machine specific e.g.
machine A might build kernel module X, machine B might not. This means
the data there can be invalid and if you try to re build packages it can
crash and burn badly.

In principle this is simple to fix, we just define the PKGDATA path in
bitbake.conf and then override it in multimachine.bbclass.

It does make me wonder if its time to merge multimachine into the
standard class/conf files though? It doesn't seem to harm anything, it
seems to work well and lots of people are using it. Anyone for or
against making it default?

We could even create a "nomultimachine.bbclass" if people wanted a
compatibility route but I think it might be a bit pointless...

Cheers,

Richard







