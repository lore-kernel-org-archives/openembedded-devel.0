Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PPHEZ-0006Xu-LP
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 17:14:44 +0100
Received: (qmail 25201 invoked by uid 503); 5 Dec 2010 16:46:55 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 5 Dec 2010 16:46:55 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Dec 2010 18:13:19 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 5 Dec 2010 18:13:17 +0200
Message-ID: <4CFBBA1C.4080103@eukrea.com>
Date: Sun, 05 Dec 2010 17:13:16 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291564968-3502-1-git-send-email-matthewbot@gmail.com>
In-Reply-To: <1291564968-3502-1-git-send-email-matthewbot@gmail.com>
X-Ovh-Tracer-Id: 13410875266409016649
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] wxwidgets: added libxinerama to DEPENDS
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
X-List-Received-Date: Sun, 05 Dec 2010 16:14:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2010 17:02, Matt Thompson wrote:
> Signed-off-by: Matt Thompson<matthewbot@gmail.com>
> ---
>   recipes/wxwidgets/wxwidgets.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/wxwidgets/wxwidgets.inc b/recipes/wxwidgets/wxwidgets.inc
> index 2fb2bef..4c4f77f 100644
> --- a/recipes/wxwidgets/wxwidgets.inc
> +++ b/recipes/wxwidgets/wxwidgets.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "wxWidgets is a cross platform application framework utilizing nat
>   HOMEPAGE = "http://www.wxwidgets.org"
>   SECTION = "x11/libs"
>   LICENSE = "wxWindows"
> -DEPENDS = "gtk+ jpeg tiff libpng zlib expat"
> +DEPENDS = "gtk+ jpeg tiff libpng zlib expat libxinerama"
>
maybe this is obvious for wxwidgets'users but can you please add a comment 
detailing why this is needed ?

Thanks,
Eric


