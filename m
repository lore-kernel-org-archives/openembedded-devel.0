Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IhVn7-0006Xa-Ce
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 21:39:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FJXTAM001643
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 20:33:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01601-01 for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 20:33:26 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FJXORn001637
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 20:33:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30710150735i2ff97bedwbbde3901a78cd6f5@mail.gmail.com>
References: <200710151419.07302.openembedded@haerwu.biz>
	<74d0deb30710150735i2ff97bedwbbde3901a78cd6f5@mail.gmail.com>
Date: Mon, 15 Oct 2007 20:33:22 +0100
Message-Id: <1192476802.25543.95.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Handling of virtual/* namespace in packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2007 19:39:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-15 at 16:35 +0200, pHilipp Zabel wrote:
> You propose to add mangle
> "Depends: virtual/u-a" into "Depends: u-a-cworth"
> in the package control file in package.bbclass if there is
> PREFERRED_PROVIDER_virtual/u-a = "u-a-cworth" set?
> 
> I don't think that's such a good idea, generally, as suddenly a package that
> should work with any virtual/u-a can only be installed with u-a-cworth.

We have a problem already here with ipkg and friends as I don't know how
you tell them to prefer one provider over another when you have multiple
providers. At the very least we don't currently do this and we should if
its possible. Having "virtual/u-a" in the Depends will break since the
virtual/ namespace is supposed to be for DEPENDS only, not RDEPENDS as
RDEPENDS can't cope with the choice :-( (or the '/' character in
debian's case).

There is also a bug in ipkg since it will error out if you have a arm5te
package which provides update-alternatives and depends perl, an armv4t
package which also provides it but doesn't depend on perl and no perl
armv4t package exists (armv5te isn't listed as a valid arch).

> Maybe this mangling could be done for distro specific task packages only?

PREFERRED_PROVIDER is usually distro specific config so the choices
would be elected by the distro.

Cheers,

Richard



