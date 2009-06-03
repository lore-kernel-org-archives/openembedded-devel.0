Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MBsLA-00086C-Q2
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:25:20 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MBsCU-00089C-8E
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 16:16:22 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MBsCT-0005jK-V0
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 16:16:22 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A268E88.1030605@cbnco.com>
References: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
	<1244022557.2611.14.camel@mill.internal.reciva.com>
	<4A26841F.2080208@cbnco.com>
	<1244038988.2611.73.camel@mill.internal.reciva.com>
	<4A268E88.1030605@cbnco.com>
Date: Wed, 03 Jun 2009 16:16:21 +0100
Message-Id: <1244042181.2611.91.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: busybox & syslog init script
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
X-List-Received-Date: Wed, 03 Jun 2009 15:25:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-03 at 10:54 -0400, Michael Smith wrote:
> I was thinking about this and I'm not sure how to get the python bit to 
> run after do_fetch (so defconfig is available in ${WORKDIR}). It's 
> probably possible but it would take quite a bit of fiddling, and would 
> only save an ipkg warning for the few of us who don't set 
> CONFIG_SYSLOGD=y. Currently, all in-tree configs set CONFIG_SYSLOGD.

Something like:

python do_dependency_massage() {
   # my python code here
}

addtask dependency_massage after do_configure before do_compile

But yeah, using RRECOMMENDS is probably an okay solution too.  I
wouldn't have a problem with that.

p.




