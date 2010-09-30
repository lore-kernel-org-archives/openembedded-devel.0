Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1JT9-0006RM-Hs
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 15:46:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 46C6431482F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 15:46:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NPWwgQR7+d8i
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 15:46:21 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 47B033148079
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 15:46:21 +0200 (CEST)
Message-ID: <4CA494AC.50006@opendreambox.org>
Date: Thu, 30 Sep 2010 15:46:20 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
	<1285792594-10032-4-git-send-email-obi@opendreambox.org>
In-Reply-To: <1285792594-10032-4-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 03/18] libmad-0.15.1b: fix compile with gcc-4.4 (mipsel)
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
X-List-Received-Date: Thu, 30 Sep 2010 13:46:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 29.09.2010 22:36, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes/libmad/files/mips-fix-gcc-4.4.0.patch |   38 +++++++++++++++++++++++++
>  recipes/libmad/libmad_0.15.1b.bb              |    3 +-
>  2 files changed, 40 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/libmad/files/mips-fix-gcc-4.4.0.patch

Please disregard this patch. I just noticed that the same issue was
already addressed by another similar patch:

http://patchwork.openembedded.org/patch/921/

This went unnoticed when it was merged into our tree. Somehow the two
patches don't conflict with each other. Sorry.

Best regards,
Andreas


