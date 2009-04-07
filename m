Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrJoD-000447-9n
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 00:31:01 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090407222720.BNSA22254.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 18:27:20 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id cmTH1b00A4dMFYL03mTHeP; Tue, 07 Apr 2009 18:27:19 -0400
X-Authority-Analysis: v=1.0 c=1 a=ocDHq2oIfAIA:10 a=4ZlGlGpiBMgA:10
	a=0gcC27t9AAAA:8 a=zNdCgHQRDaVm9P6yzYgA:9
	a=pixeXonhpXiAFPJgpnpCCfdRm1sA:4
	a=LY0hPdMaydYA:10 a=4KgpRpU3nOMA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 15:27:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407222717.GK2195@smtp.west.cox.net>
References: <20090407213412.GF11203@denix.org>
	<1239141735-17127-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1239141735-17127-1-git-send-email-denis@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.40
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: move PACKAGES and FILES_* from the .inc file
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
X-List-Received-Date: Tue, 07 Apr 2009 22:31:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 06:02:15PM -0400, Denys Dmytriyenko wrote:

> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/curl/curl-native_7.18.2.bb |    4 ++--
>  recipes/curl/curl-sdk_7.18.2.bb    |    4 ++--
>  recipes/curl/curl.inc              |   23 -----------------------
>  recipes/curl/curl_7.18.2.bb        |   24 ++++++++++++++++++++++++
>  recipes/curl/curl_7.19.0.bb        |   24 +++++++++++++++++++++++-
>  5 files changed, 51 insertions(+), 28 deletions(-)

I wonder if we should follow the gcc model here and anywhere else this
is now broken and have curl-target.inc and curl-commmon.inc or so, so we
aren't copying the target stuff twice (or more).

-- 
Tom Rini


