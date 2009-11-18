Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAkIM-0001tt-1a
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 14:10:05 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAkH1-0004WX-EB
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 13:08:39 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NAkH1-00054y-4n
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 13:08:39 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091118113842.GB17441@zlo.nu>
References: <1258467896-28370-1-git-send-email-zlo@zlo.nu>
	<1258541929.26517.96.camel@mill.internal.reciva.com>
	<20091118113842.GB17441@zlo.nu>
Date: Wed, 18 Nov 2009 13:08:35 +0000
Message-Id: <1258549715.23826.1.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] cURL: Add 7.19.7 which supports CRLs.
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
X-List-Received-Date: Wed, 18 Nov 2009 13:10:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-18 at 12:38 +0100, Marc Olzheim wrote:
> Ok, could you apply the second hunk in that patch then ? Otherwise curl
> 7.19.7 will miss its checksum.

Ah yes, right.  I've added the checksums to the .bb file (though not
actually checksums.ini) now.

> I did not add yet another curl-native in my patch because I did not
> think that OE needed CRLs to work, but I can send a patch for that as
> well of course.

As far as I know, you're right that there's no need for CRLs in the
native package.  So I shouldn't bother if I were you.

p.




