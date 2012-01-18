Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pirobk@gmail.com>) id 1RnVmv-0002z6-JV
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 14:42:53 +0100
Received: by bkar19 with SMTP id r19so1254999bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 05:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=0OuKoIek/xSZ7Icx80exwFLEJ5L7+gPE1fMPLP610EA=;
	b=TB5Xk2JEHc/plO6Ajbe9dEOYjotHpFb1BYK47DmN3/64cJkC3wfrOdrPIOL6oxEtJN
	k1QLj1xhjWYSbZjArA4RgdQjlYWVIw2YSm/EqwCoso/fDv7iFfS1/RRlxzc47ARmzyHM
	pGCWYdUMASsrov39BMJs1wwCUOdZhFcArOrNI=
Received: by 10.205.127.65 with SMTP id gz1mr8886602bkc.12.1326893715286;
	Wed, 18 Jan 2012 05:35:15 -0800 (PST)
Received: from [192.168.1.155] (pD9F8D1FD.dip.t-dialin.net. [217.248.209.253])
	by mx.google.com with ESMTPS id
	ek9sm24129764bkb.10.2012.01.18.05.35.14 (version=SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 05:35:14 -0800 (PST)
Message-ID: <4F16CA98.70503@gmail.com>
Date: Wed, 18 Jan 2012 14:35:20 +0100
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20120104 Icedove/8.0
MIME-Version: 1.0
To: ML openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Extending meta-toolchain-*
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
X-List-Received-Date: Wed, 18 Jan 2012 13:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I need someone to point me in the right direction.

I'm trying to extend meta-toolchain-qte to generate an external 
toolchain for QTembedded with QWT.

What are the required steps to add any libraries/headers to toolchains?

I tried adding libqwt-dev to the RDEPENDS of the meta package itself or 
the affected task-qte-toolchain-target.bb.

This triggers a build of qwt when bitbaking meta-toolchain-qte, but the 
resulting toolchain tarball doesn't contain anything qwt related.

Any hints?


Thx
Björn


