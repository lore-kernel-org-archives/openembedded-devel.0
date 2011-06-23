Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QZpfR-0005PA-TH
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 21:34:21 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 678CD15E0002; Thu, 23 Jun 2011 21:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-070-150-144.pools.arcor-ip.net
	[88.70.150.144])
	by gravedo.de (Postfix) with ESMTPSA id 0333515E0001;
	Thu, 23 Jun 2011 21:30:45 +0200 (CEST)
Message-ID: <4E039465.4040104@gravedo.de>
Date: Thu, 23 Jun 2011 21:30:45 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1308783016.21159.16.camel@mattotaupa>
In-Reply-To: <1308783016.21159.16.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libshiboken: Do not override `DEPENDS`
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
X-List-Received-Date: Thu, 23 Jun 2011 19:34:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2011 00:50, Paul Menzel wrote:
> Date: Mon, 20 Jun 2011 18:01:13 +0200
> 
> This is a fix up for commit 1b9260e7 [1].
> 
> 	commit 1b9260e7a6c756d6938821f013a41c371065980a
> 	Author: Paul Menzel <paulepanter@users.sourceforge.net>
> 	Date:   Sun Jun 19 11:45:37 2011 +0200
> 
> 		  shiboken: Add `apiextrator-native` to `DEPENDS`
> 
> This commit does not fix the mentioned error, that
> `ApiExtractorConfig.cmake` is not built, since by using `=` instead of `
> +=` the dependencies from the include file `shiboken.inc` are overriden
> in the recipe.
> 
> This patch fixes the error and is built tested using `minimal` for
> `MACHINE = "beagleboard"`.
> 
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1b9260e7a6c756d6938821f013a41c371065980a

Thanks again Paul for spotting this! Feel free to put my

Acked-by: Simon Busch <morphis@gravedo.de>

below the patch and push it!

(don't know why I did the same error twice ... next time I should look a
little longer on my recipes to spot this stupid mistakes :)

regards,
Simon


