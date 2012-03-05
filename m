Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S4hsM-0001Nk-8e
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 01:03:34 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0F00ACUOYMGIV3@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	05 Mar 2012 16:54:23 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0D68B20264; Mon,
	05 Mar 2012 17:54:22 -0500 (EST)
Date: Mon, 05 Mar 2012 17:54:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120305225422.GD2030@denix.org>
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
MIME-version: 1.0
In-reply-to: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Disable GNU Hash check ?
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
X-List-Received-Date: Tue, 06 Mar 2012 00:03:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 05, 2012 at 06:53:05PM +0100, Hauser, Wolfgang (external) wrote:
> Hello,
> 
> I have to create a package containing static and dynamic libraries and
> some files.
> The libraries are delivered by a vendor and we have to use(install) them
> as they are.
> 
> While bitbaking the QA procedure complains about missing GNU Hashes. 
> 
> Is there a possibility to disable this check for a single recipe ?
> 
> I am using bitbake 1.10.2 and an OE mainenance-2011.03 based tree.

INSANE_SKIP_${PN} = "True"

-- 
Denys


