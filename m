Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1PXODJ-0006PT-GR
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 02:18:57 +0100
Received: from [192.168.1.2] (e180137009.adsl.alicedsl.de [85.180.137.9])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id 1BE3D584082
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 02:33:21 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293476385-7289-2-git-send-email-bgamari.foss@gmail.com>
References: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
	<1293476385-7289-2-git-send-email-bgamari.foss@gmail.com>
Organization: Vanille-Media
Date: Tue, 28 Dec 2010 02:18:03 +0100
Message-ID: <1293499083.2173.26.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] python: Initial commit of python 2.7.1
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
X-List-Received-Date: Tue, 28 Dec 2010 01:18:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for the patch which looks good on first glance.
Please also include your generate-manifest-2.7.py in the patch.
Also, add a DEFAULT_PREFERENCE = -1 for both the native and the
non-native version.

Did you check whether task-python-everything still builds with 2.7?
We have quite a lot of software in OE that requires Python,
before bumping to a major version we need confirming from various users.

With regards to python 3.0, I suggest adding it as python3[-native].
Getting it to coexist with python 2.x at build time we can investigate
once it's in OE.

Cheers,

-- 
:M:



