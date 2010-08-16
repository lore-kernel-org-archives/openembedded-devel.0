Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ol9Ln-000435-ST
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 01:44:21 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ol9LV-00067I-MY from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 16:44:01 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 16 Aug 2010 16:44:01 -0700
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 Aug 2010 17:44:00 -0600
Message-ID: <4C69CD3E.5090007@mentor.com>
Date: Mon, 16 Aug 2010 16:43:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
In-Reply-To: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
X-OriginalArrivalTime: 16 Aug 2010 23:44:00.0663 (UTC)
	FILETIME=[E6CDCA70:01CB3D9C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] flex: disabled packaged staging of native builds
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
X-List-Received-Date: Mon, 16 Aug 2010 23:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jason Kridner wrote:
> ---
>  recipes/flex/flex.inc |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
> index 49b26e8..5d3f076 100644
> --- a/recipes/flex/flex.inc
> +++ b/recipes/flex/flex.inc
> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>  
>  DEPENDS = "gettext"
>  
> -INC_PR = "r5"
> +INC_PR = "r6"
>  
>  S = "${WORKDIR}/flex-${PV}"
>  
> @@ -16,3 +16,5 @@ inherit autotools gettext
>  # static-only library; that might be an error
>  
>  FILES_${PN} += "${libdir}/libfl.a"
> +
> +PSTAGING_DISABLED_virtclass-native = "1"

I assume you've ran into 2.3.35 not being relocation happy?  Have you 
been able to look at this at all?  2.3.31 works so it's something 'bad' 
done upstream.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


