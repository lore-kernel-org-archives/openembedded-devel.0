Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KunPj-0002Hd-5k
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2008 13:11:11 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KunOo-0000W3-AF; Tue, 28 Oct 2008 12:10:14 +0000
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1KunOo-000467-8V; Tue, 28 Oct 2008 12:10:14 +0000
From: Phil Blundell <pb@reciva.com>
To: otavio@ossystems.com.br
Date: Tue, 28 Oct 2008 12:10:13 +0000
Message-Id: <1225195813.9866.33.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : xorg-xserver-common.inc: set	userid to allow Xorg to be run by users
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
X-List-Received-Date: Tue, 28 Oct 2008 12:11:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> +	chmod u+s ${D}/usr/bin/Xorg

Xorg is a pretty large and scary binary to make setuid root, not least
because I think you can run more-or-less arbitrary code if you specify a
custom config file which loads modules of your own devising.  

I'm not sure this is a good idea to have as standard policy: it seems
like the kind of thing that ought to be an opt-in choice by DISTROs if
we do it at all.  A better idea still is probably to provide a setuid
wrapper which invokes X under controlled conditions and doesn't allow
the user to modify the parameters.

p.




