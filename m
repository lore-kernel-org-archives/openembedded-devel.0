Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OWCgK-00037A-Ck
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 20:15:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o66IAtCh000631
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Jul 2010 19:10:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32549-08 for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jul 2010 19:10:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o66IAnBG000625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Jul 2010 19:10:50 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <lyeifgcyxm.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <AANLkTik1mhR1trtNfJcNrehMg0gs2lNSXyp51PPpaSPu@mail.gmail.com>
	<lyeifgcyxm.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 06 Jul 2010 19:10:40 +0100
Message-ID: <1278439840.30247.3632.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native glibc-initial-2.9 unpack error
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
X-List-Received-Date: Tue, 06 Jul 2010 18:15:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-07-06 at 19:17 +0200, Enrico Scholz wrote:
> Jan Paesmans <jan.paesmans@gmail.com> writes:
> 
> > cp: cannot create regular file `/ld.so.conf': Permission denied
> 
> bb.decodeurl (bitbake 1.10) seems to be buggy:
> 
> | >>> import bb
> | >>> bb.decodeurl("file://ld.so.conf")
> | ('file', '', 'ld.so.conf', '', '', {})
> | >>> bb.decodeurl("file://etc/ld.so.conf")
> | ('file', 'etc', '/ld.so.conf', '', '', {})
> | >>> bb.decodeurl("file://etc/test/ld.so.conf")
> | ('file', 'etc', '/test/ld.so.conf', '', '', {})
> 

There was a fix recently added to bitbake master for this:

http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8

Cheers,

Richard



