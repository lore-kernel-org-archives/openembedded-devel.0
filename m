Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KrcNN-0007dT-0d
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Oct 2008 19:47:37 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KrcMx-0003WU-9z
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Oct 2008 18:47:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810191847.04533.mickey@vanille-media.de>
References: <gdfm8d$apg$1@ger.gmane.org>
	<200810191847.04533.mickey@vanille-media.de>
Date: Sun, 19 Oct 2008 18:46:55 +0100
Message-Id: <1224438415.4235.266.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Sun, 19 Oct 2008 17:47:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-10-19 at 18:47 +0200, Michael 'Mickey' Lauer wrote:
> Ack. Been bitten my that more than once. We should either leave the versions 
> and just add newer ones or change the preferred-providers to match (if sure 
> it's a minor update of a stable version). 
> 
> (This time it was an error on my side though.)

It's long been my view that we should just add newer ones and leave the
old ones alone.  There's really no reason to delete old recipes and,
even if you check for PREFERRED_VERSIONs in the git tree, there is no
real way to know who else might be relying on the version you are about
to delete. 

Making an explicit distinction between minor and major updates as far as
PREFERRED_VERSION goes is quite an interesting idea though.  I can
certainly imagine that I might, for example, want to pin libglib to
2.14.x but be prepared to accept minor version updates within that
series.  I don't think there's currently any syntax to allow that but it
would be a neat enhancement.

p.




