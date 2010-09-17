Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Owcln-00066U-0k
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 17:22:40 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Owckx-0006X4-CS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 08:21:43 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 17 Sep 2010 08:21:43 -0700
Received: from [172.30.80.181] ([172.30.80.181]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 17 Sep 2010 09:21:16 -0600
Message-ID: <4C93875A.3080405@mentor.com>
Date: Fri, 17 Sep 2010 08:20:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284728077-32131-1-git-send-email-fahad_usman@mentor.com>
In-Reply-To: <1284728077-32131-1-git-send-email-fahad_usman@mentor.com>
X-OriginalArrivalTime: 17 Sep 2010 15:21:16.0411 (UTC)
	FILETIME=[F8BA34B0:01CB567B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classpath-tools-native.bb: Converted to new style staging
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
X-List-Received-Date: Fri, 17 Sep 2010 15:22:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Fahad Usman wrote:
> * Converted do_stage to do_install.
> * Added NATIVE_INSTALL_WORKS = "1"
> * Added PR = "r1"
> 
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  recipes/classpath/classpath-tools-native.bb |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/classpath/classpath-tools-native.bb b/recipes/classpath/classpath-tools-native.bb
> index 7adf702..52566be 100644
> --- a/recipes/classpath/classpath-tools-native.bb
> +++ b/recipes/classpath/classpath-tools-native.bb
> @@ -5,9 +5,12 @@
>  DESCRIPTION = "Provides working jar, javah etc. from the GNU Classpath project"
>  
>  DEPENDS = "virtual/java-native classpath-native"
> +PR = "r1"
>  
>  inherit native
>  
> -do_stage() {
> -	:
> +do_install() {
> +        :
>  }
> +
> +NATIVE_INSTALL_WORKS = "1"

You've just switched it to staging and installing nothing, that can't be 
right :)

-- 
Tom Rini
Mentor Graphics Corporation


