Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GHrhR-0007jj-DW
	for openembedded-devel@openembedded.org; Tue, 29 Aug 2006 02:43:30 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 330E6AD931
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 10:41:25 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16950-04 for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 10:41:22 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 9291F145DC
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 10:41:22 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 79EA8F16942; Tue, 29 Aug 2006 10:41:22 +1000 (EST)
Date: Tue, 29 Aug 2006 10:41:22 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060829004122.GA22529@twibble.org>
References: <20060828235951.GA16344@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20060828235951.GA16344@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: patcher changes - quilt patching breakage?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 00:43:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 29, 2006 at 09:59:51AM +1000, Jamie Lenehan wrote:
> I've got huge amounts of breakage from quilt due to the patching
> related changs. Is anyone else seeing this. It looks like I can't
> apply any patches more than one.. which is rather wierd.

The problem is that my build directory is:

 /data/oe/build/titan-glibc-24

and I have a directory called:

 /data/oe/patches

It appears that quilt searches throught he path for a directory
called "patches" and uses that for all it's patches. So the patches
are being stored in my /data/oe/patches directory instead of in the
package itself.

The patch command used to mkdir the patches directory, but this is no
longer happening. The following patch appears to make things work
again - does this look correct to people who understand this patch
class?

#
# old_revision [14917049ca38865d541726340df4e735749d9fc9]
#
# patch "classes/patch.bbclass"
#  from [06bfa04274235a178643633deba99054024b741c]
#    to [43a7cdac0d459f62c68c6d258f001d3b06688906]
#
============================================================
--- classes/patch.bbclass       06bfa04274235a178643633deba99054024b741c
+++ classes/patch.bbclass       43a7cdac0d459f62c68c6d258f001d3b06688906
@@ -174,6 +174,9 @@ def patch_init(d):
                def __init__(self, dir, d):
                        PatchSet.__init__(self, dir, d)
                        self.initialized = False
+                       p = os.path.join(self.dir, 'patches')
+                       if not os.path.exists(p):
+                               os.mkdir(p)

                def Clean(self):
                        try:

-- 
 Jamie Lenehan <lenehan@twibble.org>


