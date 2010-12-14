Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PSUNR-0007YS-L7
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 13:53:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 98537314BAA9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 13:51:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id e7lXqpCoTCfp
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 13:51:30 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 1BACC314BA89
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 13:51:30 +0100 (CET)
Message-ID: <4D076851.1030406@opendreambox.org>
Date: Tue, 14 Dec 2010 13:51:29 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292166229-23112-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1292166229-23112-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rm_work.bbclass: allow a shell var to override rm_work
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
X-List-Received-Date: Tue, 14 Dec 2010 12:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/12/2010 04:03 PM, Frans Meulenbroeks wrote:
> Sometimes one is building with rm_work, but for a specific build you want to
> keep the work even if the build is successful.
> One way to achieve this is to comment the INHERIT += "rm_work" from your
> local.conf file, but this means that all recipes need to be reparsed which takes some time.
> 
> This patch introduces a variable KEEP_WORK
> If this variable is set the work will not be removed.
> Intended use is
> KEEP_WORK=1 bitbake yourrecipe.bb
> Default behaviour is kept the same (in case KEEP_WORK is not set)
> 
> Note that in order for this to work KEEP_WORK needs to be added to the env var BB_ENV_EXTRAWHITE
> e.g. export BB_ENV_EXTRAWHITE="KEEP_WORK"
> 
> We still might want to improve the test so it only keeps the work if KEEP_WORK is > 0
> (or do not execute the task at all if KEEP_WORK is not set).
> Also we might want to add KEEP_WORK to the whitelist of vars that are always ok
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

I'd prefer a variable with a prefix like OE_, but that's probably just a
matter of taste. Are there any guidelines?

This patch motivates me to enable rm_work by default for our distro. It
would be nice if this variable would become documented on the wiki.

Acked-by: Andreas Oberritter <obi@opendreambox.org>



