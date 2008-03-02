Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JVthv-0003dZ-2h
	for openembedded-devel@openembedded.org; Sun, 02 Mar 2008 20:18:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m22JHfYO003152
	for <openembedded-devel@openembedded.org>; Sun, 2 Mar 2008 19:17:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03036-02 for <openembedded-devel@openembedded.org>;
	Sun,  2 Mar 2008 19:17:33 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m22JHSeR003141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 2 Mar 2008 19:17:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803020930s27303ee1q2719373db77fd8ba@mail.gmail.com>
References: <c384c5ea0803020930s27303ee1q2719373db77fd8ba@mail.gmail.com>
Date: Sun, 02 Mar 2008 19:17:29 +0000
Message-Id: <1204485449.8223.36.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Multiple bitbake and a shared DL_DIR location - race	conditions?
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
X-List-Received-Date: Sun, 02 Mar 2008 19:18:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-03-02 at 18:30 +0100, Leon Woestenberg wrote:
> in setting up a few automated builds, I have shared the DL_DIR amongst
> the builds.
> 
> I would like to allow the builds to overlap in time, at least make
> sure the builds are robust to this, but I doubt this is possible at
> all.
> 
> Are there any race conditions with the current approach?
> 
> I.e. what if two fetch tasks from concurrent instances of bitbake
> decide to download a package?

Each file in DL_DIR has a .lock file which bitbake has to acquire before
it will actually make the transfer. DL_DIR itself is therefore safe.

What might not be safe is the cvs/svn/git subdirs underneath this since
you could have two recipes trying to get different revisions of the same
repository which would go to different files in DL_DIR but use the same
scm directory. One solution is to override SVNDIR/GITDIR/CVSDIR.

Cheers,

Richard




