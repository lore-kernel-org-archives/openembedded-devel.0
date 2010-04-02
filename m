Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nxofo-0004xY-Au
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 23:45:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o32LflpA006409
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Apr 2010 22:41:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05515-10 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Apr 2010 22:41:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o32LfcwA006403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Apr 2010 22:41:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hp4vat$f2l$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hp4s4q$40a$1@dough.gmane.org>
	<hp4vat$f2l$1@dough.gmane.org>
Date: Fri, 02 Apr 2010 22:41:37 +0100
Message-ID: <1270244497.4993.185.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Fri, 02 Apr 2010 21:45:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-04-02 at 16:35 +0200, Koen Kooi wrote:
> And lots of:
> 
> : QA Issue with staging: libssp_nonshared.la failed sanity test
> (installed) in path
> /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib

This one I can guess the reason for, we're missing the lamangler
function helper for cross packages. At the bottom of cross.bbclass, try
changing:

mv ${SYSROOT_DESTDIR}${target_base_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/ || true
mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true

to become

rm -rf ${SYSROOT_DESTDIR}${target_base_libdir}/
rm -rf ${SYSROOT_DESTDIR}${target_libdir}/
sysroot_stage_libdir ${D}${target_base_libdir} ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}
sysroot_stage_libdir ${D}${target_libdir} ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}

which should mean the mangling happens correctly. Sorry I can't
test/push this right at the moment.

Cheers,

Richard



