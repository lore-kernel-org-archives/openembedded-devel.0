Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MBnEm-00005F-Vx
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 11:58:25 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MBn60-0007GK-80
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 10:49:20 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MBn5y-0002va-6j
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 10:49:18 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
References: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>
Date: Wed, 03 Jun 2009 10:49:17 +0100
Message-Id: <1244022557.2611.14.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Wed, 03 Jun 2009 09:58:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-02 at 21:27 -0400, Michael Smith wrote:
> 1) split the syslog initscript into busybox-syslog, as is already done for 
> busybox-httpd and busybox-udhcpd;
> 2) or, manually handle the stuff the update-rc.d class would normally take 
> care of for busybox, so the syslog initscript stays in the busybox 
> package.
> 
> I'd prefer #1, but I don't think I could ever track down all the in-tree 
> and out-of-tree images that depend on busybox, and add "busybox-syslog" to 
> all of them. I guess I'll try #2. Just checking if someone has a better 
> idea.

The only practical way to do #1 is to make busybox Depend: on the
newly-created busybox-syslog package.  Otherwise, folks who do "ipkg
install busybox" in the expectation of getting the syslog bits will be
disappointed.  This means that there's no need to root out all the
images and add busybox-syslog explicitly; it'll be pulled in
automatically when the images are created.

If that works for you then I think you might as well go ahead and do #1.
Otherwise, yes, I agree that #2 sounds like the only other viable
option.

p.




