Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 92C8B6C190
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:02:16 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 597801C1B29;
	Fri, 23 Nov 2018 11:02:17 +0100 (CET)
To: Otavio Salvador <otavio@ossystems.com.br>,
	Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
References: <20181123093845.22336-1-otavio@ossystems.com.br>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <7b2d9c6f-48d0-d3df-45c5-fe396b43576e@geanix.com>
Date: Fri, 23 Nov 2018 11:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181123093845.22336-1-otavio@ossystems.com.br>
Subject: Re: [PATCH] postgresql: Allow successful run of postgresql-setup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2018 10:02:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit



On 23/11/2018 10.38, Otavio Salvador wrote:
> The postgresql-setup utility log-in on postgres user to create the
> database, however, the shell set to the user is bash and it wasn't
> being installed as runtime dependency.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>   meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> index 3bf71f02e..5fc823898 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -231,6 +231,7 @@ FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
>          if 'pam' == d.getVar('enable_pam') \
>          else ''} \
>   "
> +RDEPENDS_${PN} += "bash"

Is bash needed or would busybox' ash be enough? If so, then changing 
USERADD_PARAM_${PN} to use /bin/sh instead would be leaner.

// Martin

>   
>   FILES_${PN}-client = "${bindir}/clusterdb \
>       ${bindir}/createdb \
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

