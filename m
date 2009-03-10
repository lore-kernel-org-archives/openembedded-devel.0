Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Lh34H-0006uX-Lx
	for openembedded-devel@openembedded.org; Tue, 10 Mar 2009 15:36:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2AAptpE008365;
	Tue, 10 Mar 2009 10:51:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07844-10; Tue, 10 Mar 2009 10:51:51 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2AApk7q008359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Mar 2009 10:51:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <200903100058.15789.raj.khem@gmail.com>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-19-git-send-email-openembedded@haerwu.biz>
	<200903100058.15789.raj.khem@gmail.com>
Date: Tue, 10 Mar 2009 10:54:14 +0000
Message-Id: <1236682454.5349.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org,
	Marcin Juszkiewicz <openembedded@haerwu.biz>
Subject: Re: [PATCH 18/70] yum-native: Add some hacks to make yum work	better in the cross build case (from Poky)
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
X-List-Received-Date: Tue, 10 Mar 2009 14:36:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2009-03-10 at 00:58 -0700, Khem Raj wrote:
> On Wednesday 04 March 2009 07:52:33 Marcin Juszkiewicz wrote:
> > From: Richard Purdie <richard@openedhand.com>
> >
> > git-svn-id: https://svn.o-hand.com/repos/poky@5110
> > 311d38ba-8fff-0310-9ca6-ca027cbcb966 ---
> >  packages/yum/yum-native/hacks.patch |   66
> > +++++++++++++++++++++++++++++++++++ packages/yum/yum-native_3.2.18.bb   |  
> >  3 +-
> >  2 files changed, 68 insertions(+), 1 deletions(-)
> >  create mode 100644 packages/yum/yum-native/hacks.patch
> >
> > diff --git a/packages/yum/yum-native/hacks.patch
> > b/packages/yum/yum-native/hacks.patch new file mode 100644
> > index 0000000..0486b5f
> > --- /dev/null
> > +++ b/packages/yum/yum-native/hacks.patch
> > @@ -0,0 +1,66 @@
> > +---
> > + rpmUtils/arch.py        |    3 +++
> > + rpmUtils/transaction.py |    1 +
> > + yum/constants.py        |    2 +-
> > + yum/depsolve.py         |    2 ++
> > + 4 files changed, 7 insertions(+), 1 deletion(-)
> > +
> > +Index: yum-3.2.18/rpmUtils/arch.py
> > +===================================================================
> > +--- yum-3.2.18.orig/rpmUtils/arch.py	2008-08-26 12:43:14.000000000 +0100
> > ++++ yum-3.2.18/rpmUtils/arch.py	2008-08-26 12:50:11.000000000 +0100
> > +@@ -275,6 +275,7 @@ def getCanonX86_64Arch(arch):
> > +     return arch
> > +
> > + def getCanonArch(skipRpmPlatform = 0):
> > ++    return "arm"
> 
> Does this mean that it will only work for arm ? It would be nice if it could 
> work for other arches too.

It was tested on arm since I reasoned if I could make that work,
everything else should follow too. You're right, these arm references
need fixing though. The main point is that we at least now know where
the values that need fixing are, making the job much easier!

I developed a strong dislike of rpm and yum when doing this as the
amount that is hardcoded is scary :(

-- 
RP



