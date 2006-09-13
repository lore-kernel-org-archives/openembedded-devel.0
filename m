Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GNR2r-0005SN-Td
	for openembedded-devel@openembedded.org; Wed, 13 Sep 2006 11:28:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8D9P6jO022686
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 10:25:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22600-02 for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 10:25:04 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8D9P42E022677
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 10:25:04 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
Date: Wed, 13 Sep 2006 10:25:03 +0100
Message-Id: <1158139503.5540.10.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 09:28:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-09-13 at 08:10 +0200, pHilipp Zabel wrote:
> I only recently noticed that udev packages are machine specific now
> due to the machine specific mount.blacklist file. It looks like most
> machines blacklist the same devices, namely:
> 
> /dev/mtdblock*
> /dev/loop*
> /dev/ram*
> 
> Only spitz and slugos differ significantly.
> (/dev/hda* on spitz, hd[a-z], sd[a-z] on slugos)
> 
> I'd like to add /dev/mtdblock to the default mount.blacklist and
> remove the specialization for akita, amsdelta, c7x0, h2200,
> ipaq-pxa270 and tosa.
> 
> Is there any good way to avoid spitz and slugos specific udev packages
> that are only due mount.blacklist? Maybe this could be part of
> base-files or some other package?

Personally, I'd like to see several things happen. Firstly, if these
lists are going to be machine specific, lets move them to something like
base-files and make sure the scripts can survive without them. This
means udev stops being machine specific. Alternatively, we create a new
machine specific package if people don't want the extra file in
base-files.

Secondly, I'd prefer to see this change to a whitelist approach. We also
need to be more intelligent about automounting eg, not mounting /dev/hda
when its partitioned and hda1, hda2 are present etc.

Cheers,

Richard



