Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PNmz8-0001qn-Fz
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 14:44:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 763DD90B8B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 08:43:17 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23184-06 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  1 Dec 2010 08:43:17 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 49AC96CC51C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 08:43:17 -0500 (EST)
Message-ID: <4CF650F5.6050400@cbnco.com>
Date: Wed, 01 Dec 2010 08:43:17 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF5B37B.9010508@gmail.com>
In-Reply-To: <4CF5B37B.9010508@gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gzip_1.4.bb: Fix do_install for DISTRO=micro.
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
X-List-Received-Date: Wed, 01 Dec 2010 13:44:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> mv: `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/gzip-1.4-r3/image/bin/gunzip' and `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/gzip-1.4-r3/image/bin/gunzip' are the same file
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Michael Smith <msmith@cbnco.com>

> ---
>  recipes/gzip/gzip_1.4.bb |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/gzip/gzip_1.4.bb b/recipes/gzip/gzip_1.4.bb
> index eb89f79..020e31a 100644
> --- a/recipes/gzip/gzip_1.4.bb
> +++ b/recipes/gzip/gzip_1.4.bb
> @@ -19,10 +19,12 @@ alternatives = "gunzip gzip zcat"
>  do_install () {
>      autotools_do_install
>      # Move files into /bin (FHS)
> -    install -d ${D}${base_bindir}
> -    for file in ${D}${bindir}/*; do
> -        mv $file ${D}${base_bindir}/
> -    done
> +    if [ "${base_bindir}" != "${bindir}" ]; then
> +        install -d ${D}${base_bindir}
> +        for file in ${D}${bindir}/*; do
> +            mv $file ${D}${base_bindir}/
> +        done
> +    fi
>  }
>  
>  do_install_append_pn-gzip () {



