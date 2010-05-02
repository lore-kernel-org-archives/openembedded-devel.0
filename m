Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1O8bq2-0003eu-4Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 18:16:14 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3281711000A1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 May 2010 18:12:31 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5421A1100085
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 May 2010 18:12:30 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225006195.adsl.alicedsl.de
	[92.225.6.195]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 May 2010 18:12:30 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3CBCD3C0F3; Sun,  2 May 2010 18:12:29 +0200 (CEST)
Date: Sun, 2 May 2010 18:12:29 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100502161228.GA11793@rhein.zuhause.netz>
References: <1272790986-26842-1-git-send-email-eric@eukrea.com>
	<1272795698-23606-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1272795698-23606-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] zlib: Add version 1.2.5
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
X-List-Received-Date: Sun, 02 May 2010 16:16:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 02, 2010 at 12:21:38PM +0200, Eric Benard wrote:
> - update autotool patch for this version
> - tested on x86
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
> +do_stage() {
> +	autotools_stage_all
> +}
> +

do_stage is deprecated and shouldn't be used for new recipes. Furthermore zlib is a Candidate for
BBCLASSEXTEND to get native and sdk packages with one recipe.

Bye Henning


