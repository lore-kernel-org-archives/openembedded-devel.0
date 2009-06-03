Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MBrVd-0000kK-CB
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 16:32:05 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MBrMy-0006LU-DL
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 15:23:08 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MBrMy-0005Hm-7q
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 15:23:08 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A26841F.2080208@cbnco.com>
References: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
	<1244022557.2611.14.camel@mill.internal.reciva.com>
	<4A26841F.2080208@cbnco.com>
Date: Wed, 03 Jun 2009 15:23:08 +0100
Message-Id: <1244038988.2611.73.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Wed, 03 Jun 2009 14:32:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-03 at 10:09 -0400, Michael Smith wrote:
> Phil Blundell wrote:
> > On Tue, 2009-06-02 at 21:27 -0400, Michael Smith wrote:
> >> 1) split the syslog initscript into busybox-syslog, as is already done for 
> >> busybox-httpd and busybox-udhcpd;
> 
> > The only practical way to do #1 is to make busybox Depend: on the
> > newly-created busybox-syslog package.  Otherwise, folks who do "ipkg
> > install busybox" in the expectation of getting the syslog bits will be
> > disappointed.
> 
> Would RRECOMMENDS have the same effect? It works for rootfs 
> (busybox-syslog ends up in the root image). But I don't know if ipkg 
> cares about recommends.
> 
> I'd prefer RRECOMMENDS to RDEPENDS, because if I don't have 
> CONFIG_SYSLOGD=y, I can make busybox-syslog be empty so it won't get 
> created and nothing will complain.

RRECOMMENDS would work, but ipkg will issue an ugly diagnostic
("unsatisfied recommendation for...") if busybox-syslog is missing.  I'm
not sure what other package managers will do here.

It might be better to stick with RDEPENDS and either (i) arrange for the
dependency to be conditional on CONFIG_SYSLOGD having been enabled,
which you could do with a bit of python in busybox.bb, or (ii) write a
bit of general-purpose post-processing code in package.bbclass to knock
out dependencies on empty packages that have been eliminated.

p.




