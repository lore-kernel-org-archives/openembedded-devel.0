Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OyEPd-00007O-2Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 03:46:23 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OyEPW-0006Dw-Fx from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 18:46:14 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 21 Sep 2010 18:46:14 -0700
Received: from [172.30.80.208] ([172.30.80.208]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 21 Sep 2010 19:46:13 -0600
Message-ID: <4C995FE3.3060601@mentor.com>
Date: Tue, 21 Sep 2010 18:46:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C995145.8090707@gmail.com>
In-Reply-To: <4C995145.8090707@gmail.com>
X-OriginalArrivalTime: 22 Sep 2010 01:46:13.0423 (UTC)
	FILETIME=[F0572BF0:01CB59F7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] firefox_3.6.8.bb: Mark as	COMPATIBLE_HOST="(powerpc|arm|i.86.*)".
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
X-List-Received-Date: Wed, 22 Sep 2010 01:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  recipes/mozilla/firefox_3.6.8.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/mozilla/firefox_3.6.8.bb b/recipes/mozilla/firefox_3.6.8.bb
> index 825e692..b383de0 100644
> --- a/recipes/mozilla/firefox_3.6.8.bb
> +++ b/recipes/mozilla/firefox_3.6.8.bb
> @@ -1,6 +1,7 @@
>  DEPENDS += "cairo sqlite3 libnotify"
>  PR = "r1"
>  
> +COMPATIBLE_HOST = "(powerpc|arm|i.86).*"
>  # The .pc files below have "3.6" hardcoded, fix that before using them in a newer FF version!
>  SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
>  	file://jsautocfg.h \


To sum up what I said on IRC, I'd really rather just go ahead and fix 
mipsel (and mips and ...) by pulling in the jsautocfg.h file from Debian 
or similar rather than use the more heavy handed COMPATIBLE* stuff for 
things that build in limited places by accident rather than by design. 
I don't know if that's enough for a NAK or not, but I'd like to talk it 
over a bit more :)

-- 
Tom Rini
Mentor Graphics Corporation


