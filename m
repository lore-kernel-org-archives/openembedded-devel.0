Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jacob.helwig@gmail.com>) id 1O0wKQ-0007bz-4w
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Apr 2010 14:31:54 +0200
Received: by gya1 with SMTP id 1so2243971gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Apr 2010 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:received
	:user-agent; bh=jqbbc3dlY06uwNOuG8ShY+QWPo+kHwZZ1OET0t1AF8E=;
	b=h1HJocgLNcr8k1MV57a5LpGHYmgTaS0IEMAXtd9BVGkBIFEqOEqoGZwrCwHh3fLGpn
	7BDpOMzLjjJm89vWYCsc+eq1t2E4mHn7KxmnLisPkoFrijAmuiG13Jz1v56QS1jskFPd
	r4JqwpYW260ZblEX0PJ14cgpAimIKRWbEV2gc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=cVk0C2Xds1EGotom+ZlBu2/sSdbzXiVNd5RWL1nM0+q6/dIjXqTD9SHqlrLznxQlOT
	XWiVMQ1+AbaGfCYkzndehR4IpUzwxwsMI3gni3vRCueZjs8R3PsXonDrRtFb/pDibQU/
	2wzlVizM6awVtfGPPDAU5lfhCBOPrP5ibYEm4=
Received: by 10.101.134.3 with SMTP id l3mr4535637ann.200.1270988908089;
	Sun, 11 Apr 2010 05:28:28 -0700 (PDT)
Received: from vfb-9.home ([96.225.220.117])
	by mx.google.com with ESMTPS id 23sm838664ywh.30.2010.04.11.05.28.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 11 Apr 2010 05:28:27 -0700 (PDT)
Sender: Jacob Helwig <jacob.helwig@gmail.com>
Date: Sun, 11 Apr 2010 05:28:23 -0700
From: Jacob Helwig <jacob@technosorcery.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100411122823.GA8091@vfb-9.home>
MIME-Version: 1.0
Received: by 10.229.215.2 with HTTP; Sun, 11 Apr 2010 05:23:38 -0700 (PDT)
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: jacob.helwig@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
	MSGID_FROM_MTA_HEADER,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fixing Git mis-information in "Upgrading packages" Wiki page.
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
X-List-Received-Date: Sun, 11 Apr 2010 12:31:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

http://wiki.openembedded.net/index.php/Upgrading_packages has some
pretty big mis-information about git-mv, and git-log, when it comes to
their interaction and how history is presented.

Cleaning up "Upgrading packages" is simple enough, but it seems like it
would be good to have instructions on how to actually follow the history
of a file across copies/renames, since "git mv a b" won't affect how the
history shows up compared to "mv a b && git rm --cached a && git add b"
(since the former is nothing more than short-hand for the latter).

The GitPhraseBook seems like the most appropriate place to add things
about how to get the followed history that usage of git-mv was looking
to provide.

Now that all this preamble is out of the way, we get to the real
question: What kinds of things are people doing, when they're interested
in (potentially) following the history of a recipe?  I'd be more than
happy to update the Wiki with all the use-cases.  I just want to make
sure that I don't miss any that people are looking for.

The ones I can think of off hand are:

    * Examining the your uncommitted changes (both staged, and
      unstaged), and showing potential copies/renames.

    * Showing the history of a branch/tag, and showing potential
      copies/renames.

    * Showing the history of a specific file, while following across
      copies/renames.

    * Blaming/annotating a file, and showing annotations from before a
      copy/rename.

Are there any "phrases" that I've missed that would be good to have in
the GitPhraseBook?

-Jacob


