Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K3Jmx-00056q-VZ
	for openembedded-devel@openembedded.org; Tue, 03 Jun 2008 01:50:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m52Njn3Y001422
	for <openembedded-devel@openembedded.org>;
	Tue, 3 Jun 2008 00:45:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01188-07 for <openembedded-devel@openembedded.org>;
	Tue,  3 Jun 2008 00:45:40 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m52Njami001390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 3 Jun 2008 00:45:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <48446FB3.8000201@vollmann.ch>
References: <g1jlpn$f7f$1@ger.gmane.org> <4843CCD6.8070601@vollmann.ch>
	<1212404836.5008.16.camel@dax.rpnet.com> <48446FB3.8000201@vollmann.ch>
Date: Tue, 03 Jun 2008 00:45:39 +0100
Message-Id: <1212450339.5008.49.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: BB_STAMP_POLICY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 23:50:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-06-03 at 00:09 +0200, Detlef Vollmann wrote:
> The biggest problem I see are silent breaks, because of changes in
> some configuration files that are not tracked by dependency checking.

I not 100% sure what you're getting at here but I'll try and follow this
to its logical conclusion.

If you change something in some recipe, say EXTRA_OECONF you then need
to force a rebuild of the recipe either by bumping PR, using the --force
option etc. to make the change take effect. This means package A would
rebuild and the way BB_STAMP_POLICY full/whitelist works means that
since A rebuilt, anything depending on A will also rebuild. So this case
is covered.

Perhaps you mean that you change some variable in say bitbake.conf and
you then don't know which recipes it may have an effect on. You
therefore don't know which to rebuild?

Bitbake can't know whether a given change in some conf file changes a
given package. What it can in theory tell is whether the some
conf/class/bb/inc file has changed or not since a given package was
built. We already have this cache logic in place but it currently has no
influence on stamp validity decisions. It would be possible to wire that
into the stamp logic so if you touch bitbake.conf anything which could
be influenced by that file (everything) would rebuild. If you touch a
class file like kernel.bbclass, just the kernel would rebuild (and
anything depending on it). Any change to local.conf would rebuild
everything.

For comparison note that your USE variables just cover the EXTRA_OECONF
variable. There are hundreds of other variables which can influence the
build and trying to build a definitive list of them would be difficult.
What makes EXTRA_OECONF special?

Cheers,

Richard



