Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjjJP-0006K8-B6
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 01:07:14 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGO00BT8DM1DPK1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Mar 2009 19:06:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E707D6B83A8; Tue,
	17 Mar 2009 20:06:00 -0400 (EDT)
Date: Tue, 17 Mar 2009 20:06:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090318000600.GA20384@denix.org>
References: <1237328436.20770.57.camel@homestead>
MIME-version: 1.0
In-reply-to: <1237328436.20770.57.camel@homestead>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Wed, 18 Mar 2009 00:07:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 17, 2009 at 10:20:36PM +0000, Shane Dixon wrote:
> I've been digging through the bitbake files and I don't see any recipe
> for cleaning the tmp folder.  I typically just blow away the entire tmp/
> folder and build again, but then I'm spending time rebuilding the native
> packages and crosscompiler.
> 
> Is there a bitbake recipe for cleaning out all non-native and
> non-crosscompiler packages from tmp or am I stuck just starting over
> each time?

If you have packaged staging enabled (see INHERIT += "packaged-staging"), you 
can try setting DEPLOY_DIR_PSTAGE (or entire DEPLOY_DIR) outside of TMPDIR.

Then you can safely kill TMPDIR and 
${DEPLOY_DIR_PSTAGE}/${DISTRO}${PSTAGE_EXTRAPATH} while keeping 
${DEPLOY_DIR_PSTAGE}/${DISTRO}${PSTAGE_EXTRAPATH}${TMPDIR//\//-}

That would _reuse_ staging packages for native, cross and sdk packages and 
_rebuild_ the target ones.

The above directories in my case are:
[1] /home/oe/deploy/pstage/angstromglibc
[2] /home/oe/deploy/pstage/angstromglibc-home-oe-tmp

Kill the [1] and keep the [2] :)

Hope this helps.

-- 
Denys


