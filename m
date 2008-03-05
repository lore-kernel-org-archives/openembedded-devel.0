Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JX0Xi-0003LX-LG
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 21:48:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KlMSZ017802
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:47:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17263-09 for <openembedded-devel@openembedded.org>;
	Wed,  5 Mar 2008 20:47:18 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KlDfd017795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:47:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803040313g4e5bc379oa54d245c19eb1b6e@mail.gmail.com>
References: <c384c5ea0803020930s27303ee1q2719373db77fd8ba@mail.gmail.com>
	<1204485449.8223.36.camel@dax.rpnet.com>
	<c384c5ea0803040313g4e5bc379oa54d245c19eb1b6e@mail.gmail.com>
Date: Wed, 05 Mar 2008 20:47:14 +0000
Message-Id: <1204750034.8110.181.camel@dax.rpnet.com>
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
X-List-Received-Date: Wed, 05 Mar 2008 20:48:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-04 at 12:13 +0100, Leon Woestenberg wrote:
> On Sun, Mar 2, 2008 at 8:17 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> >  repository which would go to different files in DL_DIR but use the same
> >  scm directory. One solution is to override SVNDIR/GITDIR/CVSDIR.
> >
> bitbake.conf:143:DL_DIR = "${TMPDIR}/downloads"
> bitbake.conf:144:CVSDIR = "${DL_DIR}/cvs"
> bitbake.conf:145:SVNDIR = "${DL_DIR}/svn"
> bitbake.conf:146:GITDIR = "${DL_DIR}/git"
> 
> Can we change this into:
> 
> DL_DIR = "${TMPDIR}/downloads"
> CO_DIR = "${DL_DIR}"
> CVSDIR = "${CO_DIR}/cvs"
> SVNDIR = "${CO_DIR}/svn"
> GITDIR = "${CO_DIR}/git"
> 
> So that I can override CO_DIR robustly, even when a fourth revision
> control system comes into play?
> 
> (CO_DIR as in checkout directory)

I agree with that change, it makes sense. Do you want to check it in or
should I?

Cheers,

Richard




