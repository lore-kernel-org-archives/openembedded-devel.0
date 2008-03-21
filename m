Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JcmC4-0008PS-2r
	for openembedded-devel@openembedded.org; Fri, 21 Mar 2008 19:42:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2LIgKvc024378
	for <openembedded-devel@openembedded.org>; Fri, 21 Mar 2008 18:42:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24348-01 for <openembedded-devel@openembedded.org>;
	Fri, 21 Mar 2008 18:42:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2LIgBsb024362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 21 Mar 2008 18:42:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47E3DBFD.7050609@gmail.com>
References: <47E3C6F7.8030902@gmail.com>
	<200803211646.29107.zecke@selfish.org>  <47E3DBFD.7050609@gmail.com>
Date: Fri, 21 Mar 2008 18:42:09 +0000
Message-Id: <1206124930.4538.7.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RPROVIDES problem for kdepimpi
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
X-List-Received-Date: Fri, 21 Mar 2008 18:42:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-03-21 at 11:02 -0500, Junqian Gordon Xu wrote:
> On 03/21/2008 10:46 AM, Holger Freyther wrote:
> > On Friday 21 March 2008 15:32:23 Junqian Gordon Xu wrote:
> >> Similar to the tzdata problem. kdepimpi recipe does not define a package
> >> ${PN}, and bitbake doesn't like the fact that ${PN} is missing in
> >> RPROVIDES.
> > 
> > Where is the issue? Why should there be a RPROVIDES=kdepimpi?
> 
> bitbake kdepimpi
> 
> ERROR: 
> '['/home/gordon/oe/org.openembedded.dev/packages/kdepimpi/kdepimpi_2.2.7.bb']' 
> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'kdepimpi' 
> but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'kdepimpi' is unbuildable, removing...

It comes from bitbake.conf:

RDEPENDS_${PN}-dev = "${PN} (= ${DEBPV})"
RRECOMMENDS_${PN}-dbg = "${PN} (= ${DEBPV})"

If ${PN} doesn't exist these entries upset bitbake.

The usual solution is to override these with something which makes sense
for the packages. The -dev abd -dbg package should always exist
otherwise the depchain magic for pulling in dev and dbg packages will
break.

Cheers,

Richard




