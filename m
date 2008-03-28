Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfCn5-0006K8-Nb
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 12:30:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2SBUaK9016112;
	Fri, 28 Mar 2008 11:30:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16019-03; Fri, 28 Mar 2008 11:30:31 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2SBUTax016104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 28 Mar 2008 11:30:29 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Stanislav Brabec <utx@penguin.cz>
In-Reply-To: <1206702966.3790.22.camel@hammer.suse.cz>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
	<1206700621.5029.50.camel@dax.rpnet.com>
	<1206702966.3790.22.camel@hammer.suse.cz>
Date: Fri, 28 Mar 2008 11:30:28 +0000
Message-Id: <1206703828.5029.60.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m2SBUaK9016112
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Fri, 28 Mar 2008 11:30:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-03-28 at 12:16 +0100, Stanislav Brabec wrote:
> Richard Purdie wrote:
> > I've had a quick look and the problem is from cups which doesn't have
> > a .pc file. The two solutions that spring to mind are:
> >=20
> > 1. Add a .pc file to cups and have libgnomecups use it
> > 2. Add some sed to the libgnomecups recipe to fix the bad paths after
> > the compile completes.
>=20
> =EF=BB=BFWe have many foo-config files embedded to other fooo-config or=
 .pc.
> System wide solution would be nicer.

Before we start discussing invasive system wide solutions, can you
define "many"? How big is this problem?

A quick glance at my local build shows 217 .pc files and 14 binconfig
ones. Of the 14 binconfigs I can spot several that also have .pc files.
binconfig is being replaced by pkgconfig so this number will only shrink
with time.

Secondly if we wrap gcc that doesn't solve the underlying problem of
bad .pc files. The neat thing now is that we can move the .pc files
in/out of a sysroot, onto the target system or into different staging
directories since there are no hardcoded path problems in them anymore.
yes we have hardcoded paths in .la files and in the binconfig ones but
that issue is more manageable than having to hack .pc files as well.=20

Cheers,

Richard




