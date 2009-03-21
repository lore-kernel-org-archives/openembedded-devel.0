Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LlAzS-0005QO-BL
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 00:52:35 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGV00HS1RKYSOL8@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	21 Mar 2009 18:51:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D9D8E6B83A8; Sat,
	21 Mar 2009 19:50:57 -0400 (EDT)
Date: Sat, 21 Mar 2009 19:50:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090321235057.GA12678@denix.org>
References: <80a0c20d0903191458m2c450cb3se2ed0c2ef2680c78@mail.gmail.com>
	<gpvlao$cps$1@ger.gmane.org>
	<b6ebd0a50903201805l2eb43d3v8c1f88979e0f1db2@mail.gmail.com>
	<gq29fi$k9s$1@ger.gmane.org>
	<d1b08f940903211621u72551e45w22aeeb217712cd00@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <d1b08f940903211621u72551e45w22aeeb217712cd00@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: packaged-staging not working properly
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
X-List-Received-Date: Sat, 21 Mar 2009 23:52:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Mar 22, 2009 at 12:21:37AM +0100, Andrea Adami wrote:
> Unfortunately I somehow confirm the issue with virtual/kernel: I moved
> DEPLOY_DIR = and now $srcfle = $destfile in  package_stagefile_shell()
> .
> 
> DEPLOY_DIR = "/oe/build/deploy/${ANGSTROMLIBC}"
> 
> NOTE: package linux-rp-2.6.26-r9: task do_deploy: started
> ERROR: function do_deploy failed
> ERROR: log data follows
> (/oe/build/tmp/angstrom/work/c7x0-angstrom-linux-gnueabi/linux-rp-2.6.26-r9/temp/log.do_deploy.1405)
> | cp: `/oe/build/deploy/glibc/images/c7x0/zImage-2.6.26-r9-c7x0.bin'
> and `/oe/build/deploy/glibc/images/c7x0/zImage-2.6.26-r9-c7x0.bin' are
> the same file
> 
> base.bbclass
>  package_stagefile_shell()
>  ...
> 
> destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`
> 
> Unsure if it's Angstrom-specific or not.

It's a known issue - http://bugs.openembedded.net/show_bug.cgi?id=4580

-- 
Denys


