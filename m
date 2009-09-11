Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Mm1eF-0001TF-69
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 10:38:30 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A140B11001BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 10:38:00 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D6E3A11000AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 10:37:59 +0200 (CEST)
Received: from rhein.familie-heinold.de (unknown [78.52.226.29])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 10:37:59 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id EC7293C08B; Fri, 11 Sep 2009 10:37:58 +0200 (CEST)
Date: Fri, 11 Sep 2009 10:37:58 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090911083758.GA6676@rhein.zuhause.netz>
References: <E1Mlvq3-0005kd-19@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1Mlvq3-0005kd-19@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Khem Raj : console-image.bb: Require console-base-image
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
X-List-Received-Date: Fri, 11 Sep 2009 08:38:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2009 at 02:26:15AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: d3fc551eb32ff334fcea7cfe20a6f76b20c65c21
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=d3fc551eb32ff334fcea7cfe20a6f76b20c65c21
> 
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Tue Sep  8 20:43:46 2009 -0700
> 
> console-image.bb: Require console-base-image
> 
> * Get rid of code duplication.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> ---
> 
>  recipes/images/console-image.bb |   20 +++-----------------
>  1 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/recipes/images/console-image.bb b/recipes/images/console-image.bb
> index 9707881..c3d3f17 100644
> --- a/recipes/images/console-image.bb
> +++ b/recipes/images/console-image.bb
> @@ -1,24 +1,10 @@
>  #Angstrom bootstrap image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

shouldnt we fix the comment as it has nothing to do with distribution?

Bye Henning


