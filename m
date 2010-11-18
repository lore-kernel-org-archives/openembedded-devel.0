Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PItqL-0000Lx-8J
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 03:04:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5B6E58F345F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 21:02:07 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16783-05 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 17 Nov 2010 21:02:07 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 3201F6E9EF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 21:02:07 -0500 (EST)
Date: Wed, 17 Nov 2010 21:02:07 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1290041800-30146-1-git-send-email-tom_rini@mentor.com>
Message-ID: <Pine.LNX.4.64.1011172054070.5082@juice.ott.cti.com>
References: <1290041800-30146-1-git-send-email-tom_rini@mentor.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] help2man: Add native recipe, drop check for being provided.
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
X-List-Received-Date: Thu, 18 Nov 2010 02:04:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 17 Nov 2010, Tom Rini wrote:

> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> -	deps += 'autoconf-native automake-native '
> +	deps += 'autoconf-native automake-native help2man-native'

Need a space before that closing quote.

> --- /dev/null
> +++ b/recipes/help2man/help2man_1.37.1.bb
> @@ -0,0 +1,21 @@
> +SRC_URI = "${GNU_MIRROR}/help4man/help2man-${PV}.tar.gz"

s/4/2/ :)

> +do_configure() {
> +	oe_runconf
> +}

Is this necessary? The old 1.36 recipe has it, too. Is it because auto* 
may not be built yet? Could you add a comment explaining why it's there?

I haven't tested from a clean build with help2man not installed, but I 
like the idea - help2man can be hard to track down for older systems 
sometimes.

Acked-by: Michael Smith <msmith@cbnco.com>

Mike


