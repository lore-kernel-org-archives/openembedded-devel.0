Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MdQ0w-00084t-5R
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:50:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 6BEDB541005
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:33:13 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26913-08 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 18 Aug 2009 10:33:13 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A82AD2987CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:33:12 -0400 (EDT)
Message-ID: <4A8ABBA8.8030504@cbnco.com>
Date: Tue, 18 Aug 2009 10:33:12 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
In-Reply-To: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Aug 2009 14:50:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

s hakkesteegt wrote:

> For a recipe I want to use locally to enable public key authentication on my
> images, I'm trying to create the .ssh dir with 700 permissions. But this
> doesn't seem to work. It ends up in the rootfs and in the ipk with 775
> permissions, although in the work dir it has the correct 700 permissions.

Hi Siebren,

Try adding something like this to your recipe:

python populate_packages_append () {
         # Non-empty directory permissions don't get preserved by the
         # normal populate process.
         def dirperm_hack(d):
                 pkgdest = bb.data.getVar('PKGDEST', d, 1)
                 pn = bb.data.getVar('PN', d, 1)
                 os.chmod(os.path.join(pkgdest, pn, '/home/root/.ssh'), 
0700)

         dirperm_hack(d)
}

I made a failed attempt at fixing this in package_deb.bbclass, but it 
caused other problems; in the end I figured it was easier to work around 
it in the one recipe where I needed a non-empty directory with 0700 perms.

Mike


