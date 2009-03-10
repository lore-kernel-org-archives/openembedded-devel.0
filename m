Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Lh31E-0006qh-8q
	for openembedded-devel@openembedded.org; Tue, 10 Mar 2009 15:33:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2AEXIIF009837
	for <openembedded-devel@openembedded.org>; Tue, 10 Mar 2009 14:33:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09407-08 for <openembedded-devel@openembedded.org>;
	Tue, 10 Mar 2009 14:33:14 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2AEXBSh009830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 10 Mar 2009 14:33:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <180e2c240903091803w6fd8a472sf67997340cb54422@mail.gmail.com>
References: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
	<1236602555.8807.6.camel@port4>
	<180e2c240903091803w6fd8a472sf67997340cb54422@mail.gmail.com>
Date: Tue, 10 Mar 2009 14:35:40 +0000
Message-Id: <1236695740.5349.53.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: QA Issue: sanity test failed issue
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
X-List-Received-Date: Tue, 10 Mar 2009 14:33:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-03-10 at 09:03 +0800, yajin zhou wrote:
> Thanks very much.
> I check the do_stage log of ncurses and find the problem is caused by the
> '/' in TMPDIR. It will confuse the sed. So one tip of using OE: do NOT add
> '/' to your TMPDIR.

A check for that should be added to sanity.bbclass...

Cheers,

Richard



