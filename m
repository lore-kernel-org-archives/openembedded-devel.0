Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GFZxM-0006vt-I0
	for openembedded-devel@openembedded.org; Tue, 22 Aug 2006 19:22:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7MHKTKc019081;
	Tue, 22 Aug 2006 18:20:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08766-04; Tue, 22 Aug 2006 18:20:19 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7MHKEvI018990
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 22 Aug 2006 18:20:14 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org, oe@handhelds.org
Date: Tue, 22 Aug 2006 18:20:16 +0100
Message-Id: <1156267216.5920.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [oel] do_fetch[nostamp]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2006 17:22:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen removed do_fetch[nostamp] from .dev earlier on (which I'm in total
agreement with) but its going to cause pain for a few people as
everything will need to be rebuilt.

http://www.rpsys.net/openzaurus/temp/make_fetch_stamps is a quick hack
to add the missing fetch stamps to you stamps directory and can save
rebuilding everything (run it with the stamps directory path as the
first argument).

Cheers,

Richard



