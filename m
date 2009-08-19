Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Mdk78-00041x-Ek
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 14:18:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9602853FC2F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 08:00:51 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18380-05 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 19 Aug 2009 08:00:51 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 3F99753CA12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 08:00:51 -0400 (EDT)
Date: Wed, 19 Aug 2009 08:00:51 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6978a1740908190155n44f55df1k40ce20162caa73ae@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0908190757250.3621@juice.ott.cti.com>
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
	<4A8AB6C4.8040805@xora.org.uk>
	<6978a1740908190155n44f55df1k40ce20162caa73ae@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
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
X-List-Received-Date: Wed, 19 Aug 2009 12:18:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 19 Aug 2009, s hakkesteegt wrote:

> pkg_postinst_${PN}  () {
>   if [ test x"$D" != "x" ]; then
>     chmod 700 ${D}/home/root/.ssh
>   fi
> }

> pkg_postinst_${PN}  () {
>     chmod 700 ${D}/home/root/.ssh
> }
> 
> But that didn't change the permissions in the rootfs either.

Well, that's odd. I'd think one of those would do the trick. But:

> By the way: I rechecked the result in the workdir and there the result in
> the image/ dir has the correct 700 permissions, but the result in the
> install/${PN}/ has the 'wrong' 775 permissions already.

It's a buglet in the populate_packages process: permissions of 
non-empty directories are not preserved. You can work around it in your 
recipe with the hack I posted to the thread yesterday. It's how I create 
my ssh key package for deb (not tested with ipk).

Mike


