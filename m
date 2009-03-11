Received: from [63.245.244.68] (helo=mail.emacinc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1LhX6a-0007nH-Tt
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 23:40:53 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1LhX6E-0003iK-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 17:40:36 -0500
From: Travis Stratman <tstratman@emacinc.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236790606.14496.4.camel@northpole>
References: <1236790606.14496.4.camel@northpole>
Date: Wed, 11 Mar 2009 17:39:55 -0500
Message-Id: <1236811195.29394.181.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.67
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-Spam-Checker-Version: SpamAssassin 3.1.4 (2006-07-26) on mail.emacinc.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	GREYLIST_ISWHITE autolearn=ham version=3.1.4
Subject: Re: tinylogin not found
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
X-List-Received-Date: Wed, 11 Mar 2009 22:40:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-03-11 at 13:56 -0300, Jader wrote:
> Hello.
> I'm trying to compile minimal-image but I've got a tinylogin error.
> It seems tinylogin is deprecated, http://tinylogin.busybox.net/
> redirects to http://bugs.busybox.net/
> 
> How can I disable it from build?

You'll want to use the apps from busybox instead. You can do this by
defining IMAGE_LOGIN_MANAGER = "busybox" in one of your .conf files and
then making sure that the defconfig that you use for busybox turns on
the appropriate apps.

TAS



