Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MdQ8W-0008KI-M4
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:58:12 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MdPro-0002jz-Bk
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 15:40:52 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MdPrl-0005Al-HW
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 15:40:49 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A8AB6C4.8040805@xora.org.uk>
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
	<4A8AB6C4.8040805@xora.org.uk>
Date: Tue, 18 Aug 2009 15:40:45 +0100
Message-Id: <1250606446.7556.16.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Tue, 18 Aug 2009 14:58:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-08-18 at 15:12 +0100, Graeme Gregory wrote:
> > pkg_postinst_${PN}-chmodsshdir () {
> >         chmod 700 /home/root/.ssh
> > }
> >
> >   
> You above recipe doesnt create a package called.
> 
> ${PN}-chmodsshdir
> 
> you also need to add something like
> 
> if test "x$D" != "x"; then
>     exit
> fi
> 
> to the beginning of the postinst to stop it running during image creation.

Or, perhaps even better, add ${D} to the chmod command's argument so
that it can run correctly during image creation.  Deferring this to boot
time would work, but it'd slow down the initial "ipkg configure" run for
no real gain.

p.




