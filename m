Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K37JC-0006FE-W8
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 12:30:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m52AQKsK013409
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Jun 2008 11:26:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12725-01 for <openembedded-devel@openembedded.org>;
	Mon,  2 Jun 2008 11:26:11 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m52AQAiT013374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Jun 2008 11:26:10 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 02 Jun 2008 11:26:09 +0100
Message-Id: <1212402369.5008.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Merging multimachine.bbclass into the OE.dev core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 10:30:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

multimachine has been a kind of second class citizen for a long time
having been maintained in its own class.  We now have things like sdk
generation which implicitly depend on multimachine being used. I can't
think of any reason people wouldn't want to use it and it allows extra
flexibility without imposing any added limitations.

Is it time we merged it into the core classes and made it the default?

The one drawback is it will force an effective wipe tmp for anyone who
wasn't using it before.

Cheers,

Richard



