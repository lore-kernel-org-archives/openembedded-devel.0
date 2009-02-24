Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LboFo-0005zt-26
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 04:46:44 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFJ00EQYX0VCPNS@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	23 Feb 2009 21:43:44 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0AB226B83B5; Mon,
	23 Feb 2009 22:43:43 -0500 (EST)
Date: Mon, 23 Feb 2009 22:43:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090224034342.GA14034@denix.org>
References: <1235372951.19710.3.camel@ubuntu2>
	<5c5e5c350902222346n632f3598vbc3965761c58229b@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <5c5e5c350902222346n632f3598vbc3965761c58229b@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Machine for Dual Core
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
X-List-Received-Date: Tue, 24 Feb 2009 03:46:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 23, 2009 at 08:46:06AM +0100, Elena of Valhalla wrote:
> On Mon, Feb 23, 2009 at 8:09 AM, Paolo Cremonese <pisa.t@teledata-i.com> wrote:
> > what type of "machine" have I to use to build an image for a Pentium
> > Dual Core?
> 
> i586-generic will run, is currently working (unlike AFAIK i686) and
> could do if you're using it for tests

Please be more specific. i686-generic/Angstrom work fine here. There were 
issues with glibc, fixed by 0f1aa27588234f2ecce8d52af478c44fa2c0d9a3

By default, i686-generic will optimize for PentiumPro, but there are tune-* 
files for other variants, including Prescott and Nocona...

-- 
Denys


