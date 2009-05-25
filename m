Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M8WcB-0007Iv-Te
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 11:37:05 +0200
Received: by bwz19 with SMTP id 19so2969853bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=roKxloDXPVjH/7IOrq+5E+kiCQ1JvIA/EeDdsd4N2/A=;
	b=uEIdWFyj9yCzCKZ0K7OUkB/3xH87ZEp7G/URYvlOoUBpUMcXaV3xJ1K1lOBqSbdRC5
	lGE6Cn0ie/9g2XZBxkAoZvHrTc3QotV+d9sbccDfr4ZsthRgT1uf84EZgn5Xx/3sU9+s
	Bih9TA6ef9kzz2F2+PTvM8G6OoP9SPPyR7njM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Lk1fk/6XPo0Lr+yMS8oeNmcCrLscH4iyrI/xvvk/heqPjzTLp/dTF7vSPoYln6itmY
	hc2hUwpta68ViqHCA9zU86ncLWB80+ByeUZ1JEW/gXFPlDQbAmkHu8gg1eyEnkVNcX7O
	O9Jc8j04zSwu5DnpR6O+rYYu1wfqyO5ZFlq7c=
MIME-Version: 1.0
Received: by 10.223.103.194 with SMTP id l2mr3345705fao.55.1243243741944; Mon, 
	25 May 2009 02:29:01 -0700 (PDT)
Date: Mon, 25 May 2009 11:29:01 +0200
Message-ID: <d1b08f940905250229o2482fda0l7ec6e57804542665@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][Zaurus] (Re)move obsolete kernels
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
X-List-Received-Date: Mon, 25 May 2009 09:37:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I was testing a build for some Zaurus models (akita,spitz) and
re-discovered an old issue (oebug 4784):

NOTE: Resolving any missing task queue dependencies
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' but it wasn't found in any
PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['virtual/arm-angstrom-linux-gnueabi-gcc-2.95']

The c7x0 model is already 'fixed' - no error
We know the error is not fatal but still...so, my proposal is to move
the old stuff to 'obsolete' or to patch the recipes as done for c7x0
(see a.m. bug).
This would lead to unbuildability of  'sharprom-compatible'
distro...which noone seems to be using now in 2009.

Other options?

Regards

Andrea


