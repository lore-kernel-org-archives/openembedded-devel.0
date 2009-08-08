Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MZhDf-0004H6-0E
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 10:24:03 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0085122001AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2009 10:08:06 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4D073220011A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2009 10:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (unknown [78.52.229.184])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2009 10:08:05 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9334A3C324; Sat,  8 Aug 2009 10:08:04 +0200 (CEST)
Date: Sat, 8 Aug 2009 10:08:04 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090808080804.GA22612@rhein.zuhause.netz>
References: <E1MZdIS-0008SG-8x@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1MZdIS-0008SG-8x@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [oe-commits] Khem Raj : wvstreams_4.6.bb: Add new recipe.
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
X-List-Received-Date: Sat, 08 Aug 2009 08:24:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 08, 2009 at 04:12:44AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 6cb210accf55894d2bee00260c2bcc83ab3440c0
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=6cb210accf55894d2bee00260c2bcc83ab3440c0
> 
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Fri Aug  7 21:11:38 2009 -0700
> 
> +do_configure() {
> +        autoreconf
> +        oe_runconf
> +}

Why do you need an extrad do_configure here? Does the autotools.bbclass something wrong here?

Bye Henning


