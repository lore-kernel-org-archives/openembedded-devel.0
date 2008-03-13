Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1JZjwr-00013U-Ew
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 10:42:12 +0100
Received: by nf-out-0910.google.com with SMTP id h3so2276573nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 02:39:57 -0700 (PDT)
Received: by 10.78.129.16 with SMTP id b16mr508610hud.34.1205401196279;
	Thu, 13 Mar 2008 02:39:56 -0700 (PDT)
Received: by 10.78.81.13 with HTTP; Thu, 13 Mar 2008 02:39:56 -0700 (PDT)
Message-ID: <d2b9ea600803130239u6e6e6fa9leb796827f85155be@mail.gmail.com>
Date: Thu, 13 Mar 2008 10:39:56 +0100
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fraqbd$k6k$2@ger.gmane.org>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org> <fraqbd$k6k$2@ger.gmane.org>
X-SA-Exim-Connect-IP: 64.233.182.190
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 09:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 13, 2008 at 9:58 AM, Koen Kooi <koen@dominion.kabel.utwente.nl>
wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Philip Balister schreef:
> | Given the only serious contenders for possible SCM's for OE appear to be
> | git or Hg, I am curious about the expertise level available on this
> list.
>
> A big problem with git:
>
> * it cannot import a flat OE repository (e.g a mtn checkout of .dev)
> * it cannot import a OE repo with history (e.g with mtn2git)
>
> Why? Git can't store empty dirs, and we use that in a few key places in
> OE. Holger 'solved' that in mtn2git by putting in a lot .dummy files
> into those dirs, but those will end up in your packages and rootfses.
>

There is a patch for handling empty directories in git.
http://kerneltrap.org/mailarchive/git/2007/7/18/252001
But it seems like the conclusion was tracking empty directories are not
necesarely such a good idea after all.

Other projects seems to have overcome it as well:
http://groups.google.com/group/rails-oceania/browse_thread/thread/2c8611dc93917952/e175f72310823547

Linus is all for adding tracking of empty directories, but is not working on
it himself.

I don't know if anybody is working on it, or if it really is of such vital
importance to us.
The alternative of adding a dummy file (fx. .gitignore) to those empty
directories that we do want to track, would of-course require that we have
these excluded when copying to fx. rootfs trees.

/Esben

