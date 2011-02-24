Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PsRsM-0001lb-3C
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 04:28:22 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH300D2GQVZZPS4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	23 Feb 2011 21:26:36 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 85EF214AF6D; Wed,
	23 Feb 2011 22:26:23 -0500 (EST)
Date: Wed, 23 Feb 2011 22:26:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110224032623.GA17536@denix.org>
References: <1298511101-5170-1-git-send-email-denis@denix.org>
	<4D65C99F.5060909@opendreambox.org>
MIME-version: 1.0
In-reply-to: <4D65C99F.5060909@opendreambox.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] busybox: fix udhcp check for NFS rootfs for new	style /proc/mounts
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
X-List-Received-Date: Thu, 24 Feb 2011 03:28:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 24, 2011 at 03:59:43AM +0100, Andreas Oberritter wrote:
> Hello Denys,
> 
> On 02/24/2011 02:31 AM, Denys Dmytriyenko wrote:
> > diff --git a/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
> > new file mode 100644
> > index 0000000..46aaab9
> > --- /dev/null
> > +++ b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
> > @@ -0,0 +1,16 @@
> > +diff -uNr busybox-1.13.2.orig/examples/udhcp/simple.script busybox-1.13.2/examples/udhcp/simple.script
> > +--- busybox-1.13.2.orig/examples/udhcp/simple.script	2011-02-23 00:30:32.000000000 -0500
> > ++++ busybox-1.13.2/examples/udhcp/simple.script	2011-02-23 17:05:37.873381763 -0500
> > +@@ -10,7 +10,12 @@
> > + 
> > + # return 0 if root is mounted on a network filesystem
> > + root_is_nfs() {
> > ++	# old style mounts
> > + 	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
> > ++	if ! $? ; then
> > ++		# new style mounts
> > ++		grep -qe '^.*:.* / \(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
> > ++	fi
> 
> Would "grep -qe '^\S\+ / \(nfs\|smbfs\|ncp\|coda\) ' /proc/mounts" work
> for both cases?

Andreas,

As I mentioned in the patch description:

* The regexp in grep can be simplified and rolled into one, but may become
less strict...

So, it's definitely possible, but I was worried the regexp would become too 
loose and return false positives. Plus, I'm not sure how \S\+ would work on 
spaces in the pathname, such as My\ Documents.

> > diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
> > index 7623944..aefa57f 100644
> > --- a/recipes/busybox/busybox_1.1x.inc
> > +++ b/recipes/busybox/busybox_1.1x.inc
> > @@ -5,6 +5,7 @@ SRC_URI = "\
> >    file://fdisk_nios2.patch \
> >    file://udhcpscript.patch \
> >    file://udhcpc-fix-nfsroot.patch \
> > +  file://udhcpc-new-nfsroot.patch \
> 
> Should the two patches above be merged into a single patch?

That can be done, if people feel strongly about it...

-- 
Denys


