Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OlrXi-0002Bv-Si for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 00:55:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OlrXE-0005pE-89 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 00:55:04 +0200
Received: from chello084113150185.1.13.vie.surfer.at ([84.113.152.185])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:55:04 +0200
Received: from stefan by chello084113150185.1.13.vie.surfer.at with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Stefan Ring <stefan@complang.tuwien.ac.at>
Date: Wed, 18 Aug 2010 22:47:31 +0000 (UTC)
Message-ID: <loom.20100819T003820-524@post.gmane.org>
References: <i216cf$pju$1@dough.gmane.org>
	<4C46DCE3.1080207@zafena.se>	<20100721142016.GH2189@jama>
	<AANLkTikeJTj01x057Rur8H0haeDehcVVPqaQzDLq2dd6@mail.gmail.com>
	<4C4975C6.5030405@zafena.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 84.113.150.185 (Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4;
	en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.126
	Safari/533.4)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openjdk shark and cacao VMs not working - armv4 LLVM symbol powf, version GLIBCXX_3.4 not, defined
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
X-List-Received-Date: Wed, 18 Aug 2010 22:55:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Xerxes Rånby <xerxes <at> zafena.se> writes:

> > SHR root <at> gojama ~ $ java -cacao Linpack
> > LOG: [0x40190000] md_signal_handler_sigill: Unknown illegal
> > instruction 0xed1c5a06 at 0x441c2790
> > LOG: [0x40190000] Aborting...
> > Aborted
> >   
> This regression on armv4 and armv5 are most likely caused by the
> "armv7" cacao compatible patches bundled with icedtea6-1.8.

Regarding the illegal instruction, I don't think that it comes from
the icedtea patch. It sounds like the problem I had in
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=513.  It went
away when I built CACAO with -mfloat-abi=soft, not with
-mfloat-abi=softfp.

I verified that the current CACAO version works on both armv5 and
armv7. Unfortunately, I don't remember the exact build settings
anymore.



