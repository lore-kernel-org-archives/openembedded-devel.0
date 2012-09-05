Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9E3Z-0004Rr-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:46:05 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T9Drc-0004YG-5C
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:33:44 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 05 Sep 2012 12:33:43 +0100
In-Reply-To: <50473834.3070407@communistcode.co.uk>
References: <50473603.4030708@communistcode.co.uk>
	<50473834.3070407@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346844824.2673.154.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Struggling with creating recipe liblockdev
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
X-List-Received-Date: Wed, 05 Sep 2012 11:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 12:32 +0100, Jack Mitchell wrote:
> | /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
> | /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
> | /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
> | /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
> | /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
> | ../src/lockdev.z: could not read symbols: File in wrong format
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [blib/arch/auto/LockDev/LockDev.so] Error 1

You seem to be trying to use /usr/bin/cc and /usr/bin/ld to generate
target binaries.  Those should almost certainly be ${CC} and ${LD}
respectively.

p.




