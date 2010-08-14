Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OkMNO-0001iJ-MB
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 21:26:44 +0200
Received: from [192.168.1.2] (e180146069.adsl.alicedsl.de [85.180.146.69])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 5BBF758415C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 21:29:26 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100813215226.GB19855@excalibur.local>
References: <1281468568-8990-1-git-send-email-morphis@gravedo.de>
	<20100813215226.GB19855@excalibur.local>
Organization: Vanille-Media
Date: Sat, 14 Aug 2010 21:26:07 +0200
Message-ID: <1281813967.2127.1.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ecore: remove fix-ecore-fb-initialization.patch
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
X-List-Received-Date: Sat, 14 Aug 2010 19:26:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 13.08.2010, 23:52 +0200 schrieb Stefan Schmidt:
> Hello.
> 
> On Tue, 2010-08-10 at 21:29, Simon Busch wrote:
> > Removing the fix-ecore-fb-initialization patch as it let ecore open the supplied
> > touchscreen device twice which results in an error on platforms where the touchscreen
> > device node can be opened only once. Furthermore I doubt that it is necessary to open the
> > touchscreen device node more than one time.
> 
> Sounds good, but I want to hear Mickey on this before pushing it as it is his
> patch.

NACK. Last time I checked, this patch was still necessary to fix
touchscreen access using Ecore on pure framebuffer. There may be
better approaches to it, but removing it now will break ecore on fb.

Regards,
-- 
:M:



