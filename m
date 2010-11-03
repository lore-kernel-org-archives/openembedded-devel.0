Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PDmyD-0004zC-2N
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:42:23 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PDmxM-0001gD-BR from Tom_Rini@mentor.com ;
	Wed, 03 Nov 2010 16:41:28 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 3 Nov 2010 16:41:28 -0700
Received: from [172.30.80.185] ([172.30.80.185]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Nov 2010 17:41:27 -0600
Message-ID: <4CD1F324.9090704@mentor.com>
Date: Wed, 03 Nov 2010 16:41:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288826934-8339-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1288826934-8339-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 03 Nov 2010 23:41:27.0593 (UTC)
	FILETIME=[A2336990:01CB7BB0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH] own-mirrors.bbclass: allow mirroring of scm fetched packages
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
X-List-Received-Date: Wed, 03 Nov 2010 23:42:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> this way, it's possible to setup a local webserver (for example
> using busybox httpd -p "8081" -h backuped_download_dir) serving
> a presiously fetched download directory and to build wihout the
> need for an internet access
> 
> this can also be used when connected to know to know which packages
> are missing from the local mirror's directory (and thus are fetched
> from internet as a fallback), it's possible to run the server this way :
> busybox httpd -p "8081" -h backuped_download_dir -vv -f | grep -B 1  response:404
> to get the name of the missing packages.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  classes/own-mirrors.bbclass |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/own-mirrors.bbclass b/classes/own-mirrors.bbclass
> index e8a0f48..720ce42 100644
> --- a/classes/own-mirrors.bbclass
> +++ b/classes/own-mirrors.bbclass
> @@ -1,4 +1,9 @@
>  PREMIRRORS() {
> -https?://.*/.* ${SOURCE_MIRROR_URL}
> +cvs://.*/.* ${SOURCE_MIRROR_URL}
> +svn://.*/.* ${SOURCE_MIRROR_URL}
> +git://.*/.* ${SOURCE_MIRROR_URL}
> +hg://.*/.* ${SOURCE_MIRROR_URL}
> +bzr://.*/.* ${SOURCE_MIRROR_URL}
> +https?$://.*/.* ${SOURCE_MIRROR_URL}
>  ftp://.*/.*  ${SOURCE_MIRROR_URL}
>  }


-- 
Tom Rini
Mentor Graphics Corporation


