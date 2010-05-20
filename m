Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OF1j8-0007UB-5o
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 11:07:39 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 876B711000A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 11:03:36 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D4D6C11000A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 11:03:32 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052224017.adsl.alicedsl.de
	[78.52.224.17]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 11:03:32 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 99DBA3C0FC; Thu, 20 May 2010 11:03:26 +0200 (CEST)
Date: Thu, 20 May 2010 11:03:26 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100520090326.GA22643@rhein.zuhause.netz>
References: <1274300664-27902-1-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
	<1274300664-27902-3-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
MIME-Version: 1.0
In-Reply-To: <1274300664-27902-3-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
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
Subject: Re: [PATCH 2/2] libsdl-directfb: new upstream version 1.2.14
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
X-List-Received-Date: Thu, 20 May 2010 09:07:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 19, 2010 at 04:24:24PM -0400, Zygo Blaxell wrote:
> +do_stage() {
> +  autotools_stage_all		
> +  rm ${STAGING_LIBDIR}/libSDL.la
> +}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

do_stage is deprecated please remove it and be cause
sdl-recipes uses autotools do_install takes care of all the staging stuff.


Bye Henning


