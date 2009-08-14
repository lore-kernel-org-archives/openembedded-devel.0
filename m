Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Mc4HE-0002Pr-VE
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 23:25:34 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Mc40u-00036o-DI
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 22:08:42 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A85C292.9030605@atmel.com>
References: <4A8516BF.9080405@atmel.com> <h63h7v$8pk$1@ger.gmane.org>
	<4A8581D9.9010205@atmel.com>
	<1250264545.12282.1271.camel@mill.internal.reciva.com>
	<4A85C292.9030605@atmel.com>
Date: Fri, 14 Aug 2009 22:08:25 +0100
Message-Id: <1250284105.4215.144.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Fri, 14 Aug 2009 21:25:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-08-14 at 22:01 +0200, Ulf Samuelsson wrote:
> The full command line is:
> exec Xorg -br -pn  -dpi 100 -rgba bgr -screen 240x320 :0 -noreset
> 
> It complains about an unrecognized option "-rgba"

Yeah, that looks like the startup scripts are trying to pass kdrive
options to Xorg.  I guess you need to either install kdrive, or patch
the scripts to do the right thing for Xorg.

p.




