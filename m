Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NK6c1-0001xW-VF
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 09:49:05 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 5FF841B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 08:42:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2009 09:47:10 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u4w4tyyrmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u4w4tyyrmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <200912140947.10207.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How generate dependence file without native packages
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
X-List-Received-Date: Mon, 14 Dec 2009 08:49:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 14 December 2009 09:07:08 Guo Hongruan wrote:
> Hi guys,

> Is there any way to generate dependence without native packages?

bitbake -h


  -g, --graphviz        emit the dependency trees of the specified packages in
                        the dot syntax
  -I IGNORED_DOT_DEPS, --ignore-deps=IGNORED_DOT_DEPS
                        Stop processing at the given list of dependencies when
                        generating dependency graphs. This can help to make
                        the graph more appealing


(but then again this option might not work anymore... give it a try)



