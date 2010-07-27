Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OdfwM-00080F-9M
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 10:55:11 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C8EEC110009C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:54:54 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 685931100082
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:54:54 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225073080.adsl.alicedsl.de
	[92.225.73.80]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:54:54 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3AE853C0EF; Tue, 27 Jul 2010 10:54:41 +0200 (CEST)
Date: Tue, 27 Jul 2010 10:54:41 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100727085440.GC3397@rhein.zuhause.netz>
References: <4C4E9C53.7040405@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4C4E9C53.7040405@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] update libftdi recipe
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
X-List-Received-Date: Tue, 27 Jul 2010 08:55:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2010 at 10:44:03AM +0200, Jaap de Jong wrote:
> Hi,
> 
> below an update for building an up-to-date version of libftdi.
> 
> thanks and best regards,
> 
> Jaap
> ---
> +do_stage() {
> +    autotools_stage_all
> +}
> +

Hi,

the lines above arent needed anymore the do_install from inherit autotools is enough.

Bye Henning


