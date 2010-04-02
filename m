Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxoON-0008C4-6r
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 23:27:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o32LNjN5006277
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Apr 2010 22:23:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05515-07 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Apr 2010 22:23:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o32LNZbe006271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Apr 2010 22:23:37 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hp471c$59h$1@dough.gmane.org>
References: <E1NxKhE-0007AO-Bh@melo.openembedded.org>
	<1270159668.6277.138.camel@trini-m4400> <hp471c$59h$1@dough.gmane.org>
Date: Fri, 02 Apr 2010 22:23:35 +0100
Message-ID: <1270243415.4993.173.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : relocatable: Class to post-process packages for relocatability
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
X-List-Received-Date: Fri, 02 Apr 2010 21:27:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-04-02 at 09:40 +0200, Koen Kooi wrote:
> On 02-04-10 00:07, Tom Rini wrote:
> > On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
> >> +def rpath_replace (path, d):
> >> +    bindirs = bb.data.expand("${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${PREPROCESS_RELOCATE_DIRS}", d).split()
> > 
> > Is that last variable there to let recipes add non-standard locations to
> > the search path?

Yes, as long as all users append to it, it will work like that and that
use makes sense.

> > [snip]
> >> -       required_utilities = "patch help2man diffstat texi2html
> > makeinfo cvs svn bzip2 tar gzip gawk md5sum"
> >> +       required_utilities = "patch help2man diffstat texi2html
> > makeinfo cvs svn bzip2 tar gzip gawk md5sum chrpath"
> > 
> > How hard would it be to add a chrpath-native recipe and maybe treat this
> > like we used to treat qemu?  Don't see it in yum on my rhel5 box.
> > Thanks.
> 
> We already have that from our previous chrpath experiments :) See
> recipes/chrpath

As does Poky. The tricky bit isn't the recipes, its the dependencies and
making sure we don't end up with any binaries that haven't had the
relocation treatment.

Cheers,

Richard



