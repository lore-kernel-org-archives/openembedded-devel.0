Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OtdSr-0007YG-RP
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 11:30:46 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 3148F1F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Sep 2010 05:30:01 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 09 Sep 2010 05:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=uZMX/fkOadjgmlWUvl6d5ti25EY=;
	b=fxiWUWOonntn30O0p4/tEHsTYMWvjviu8Uki5XYWT13Fj/wM8M7TMdQKYje5gUuwSINYp3m8UrBx7gQWyT6a0oc81bfV6Cgf3YIXTZyQx+APohUDZNUGGZhK9RWtiq8nIYEWjEuXTwmvqPkV/U49g42GDNnQJ6CXKzCqJiMCAgE=
X-Sasl-enc: RARkyCdPMjgDSZTvoIfVsB4WRn4sx9PHup6z7shtLJoV 1284024600
Received: from [192.168.1.34] (hnvr-4d07b782.pool.mediaWays.net [77.7.183.130])
	by mail.messagingengine.com (Postfix) with ESMTPSA id A15D75E1379
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Sep 2010 05:30:00 -0400 (EDT)
Date: Thu, 9 Sep 2010 11:31:41 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283946231-29039-1-git-send-email-fahad_usman@mentor.com>
Message-ID: <alpine.LNX.2.00.1009091126390.11516@asterix.crazy-teaparty.dyndns.org>
References: <1283946231-29039-1-git-send-email-fahad_usman@mentor.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] glib-1.2: merged native and non-native recipes
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
X-List-Received-Date: Thu, 09 Sep 2010 09:30:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hello Fahad,

On Wed, 8 Sep 2010, Fahad Usman wrote:

> * removed the glib-1.2-native_1.2.10.bb file
> * added NATIVE_INSTALL_WORKS = "1"
> * added BBCLASSEXTEND = "native"
> * converted do_stage of native recipe to do_install_virtclass-native in the combined recipe
> * added DEPENDS_virtclass-native = "" to avoid dependencies loops
> * added gettext in inherit because it was needed by the native recipes
> * bumped PR
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> recipes/glib-1.2/glib-1.2-native_1.2.10.bb |   49 ----------------------------
> recipes/glib-1.2/glib-1.2_1.2.10.bb        |   20 ++++++++++-
> 2 files changed, 18 insertions(+), 51 deletions(-)


> diff --git a/recipes/glib-1.2/glib-1.2_1.2.10.bb b/recipes/glib-1.2/glib-1.2_1.2.10.bb
> index 72ee826..67266d4 100644
> --- a/recipes/glib-1.2/glib-1.2_1.2.10.bb
> +++ b/recipes/glib-1.2/glib-1.2_1.2.10.bb
> @@ -4,7 +4,8 @@ SECTION = "libs"
> PRIORITY = "optional"
> LICENSE = "LGPL"
> DEPENDS = "glib-1.2-native"
> -PR = "r4"
> +DEPENDS_virtclass-native = ""
> +PR = "r5"

I don't know if everyone thinks so but I feel the following line is more 
elegant:

DEPENDS_pn-glib-1.2 += "glib-1.2-native"

You skip the DEPENDS_virtclass-native line and may use the "+=" operator.

Best regards,
    Vitus

PS: taken from my htmldoc recipe in patchwork

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


