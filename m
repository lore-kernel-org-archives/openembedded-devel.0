Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1Nz9wA-0006wH-2J
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 16:39:31 +0200
Received: from [10.250.128.186] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 072A312EC32F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Apr 2010 10:00:34 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270160485.6277.143.camel@trini-m4400>
References: <E1NxKhE-0007AF-AE@melo.openembedded.org>
	<1270160485.6277.143.camel@trini-m4400>
Date: Tue, 06 Apr 2010 15:35:28 +0100
Message-ID: <1270564528.9623.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: enhancements from Poky for fetching and relocatability
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
X-List-Received-Date: Tue, 06 Apr 2010 14:39:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 15:21 -0700, Tom Rini wrote:
> On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
> > Module: openembedded.git
> > Branch: rpurdie/work-in-progress
> > Commit: ccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=ccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> > 
> > Author: Joshua Lock <josh@linux.intel.com>
> > Date:   Wed Mar 31 11:22:02 2010 +0100
> > 
> > packaged-staging: enhancements from Poky for fetching and relocatability
> 
> Question.  Do we really want to rename DEPLOY_DIR_PSTAGE to PSTAGE_DIR.
> Is that really a nomenclature change like that?  I see it's still soft
> assign so outsideof TMPDIR can work still, so it's fine otherwise.  Just
> checking.
> 

I changed the name because we now have two pstage directories and wanted
the change to be apparent and I dropped the DEPLOY_ prefix as I moved
the default location outside of the deploy dir.

Does that seem reasonable?

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



