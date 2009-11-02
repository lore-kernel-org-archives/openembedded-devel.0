Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N4yrQ-0005tF-SA
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 16:30:28 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2FQLUh003662
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 15:26:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WnoFANFnRnVN for <openembedded-devel@openembedded.org>;
	Mon,  2 Nov 2009 15:26:21 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2FQHEK003654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 15:26:19 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <hcmt91$gj0$1@ger.gmane.org>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<hcmqcv$5n4$1@ger.gmane.org> <1257174010.11338.81.camel@dax.rpnet.com>
	<hcmt91$gj0$1@ger.gmane.org>
Date: Mon, 02 Nov 2009 15:25:34 +0000
Message-Id: <1257175534.11338.87.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess?
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
X-List-Received-Date: Mon, 02 Nov 2009 15:30:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-02 at 16:18 +0100, Koen Kooi wrote:
> My biggest fear is these kind of recipes:
> 
> do_install() {
> 	oe_libinstall foo ${D}
> }
> 
> do_stage() }
> 	oe_libinstall foo ${D}
> 	cp foo.h ${STAGING_INC_DIR}
> }
> 
> I guess we could grep for do_stage_{ap,pre}pend to find the worst 
> offenders and gradually fix up remaining offenders.

I'm hoping that with some clever magic, what I create will continue to
use these "legacy" staging functions when they're defined giving us a
transition path. As we go through the recipes fixing them up to use the
fastpath, we'll just have to catch those things. They are by definition
broken anyway so this is a good thing to do.

Cheers,

Richard




