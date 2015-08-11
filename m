Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4F776932
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:24:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B5ODBW024859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 22:24:13 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 10 Aug 2015 22:24:12 -0700
Message-ID: <55C986FA.9050404@windriver.com>
Date: Tue, 11 Aug 2015 13:24:10 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] ypbind-yocto.init: add status command
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Aug 2015 05:24:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年07月06日 16:29, rongqing.li@windriver.com wrote:
> From: Zhu Yanjun <yanjun.zhu@windriver.com>
>
> Add the "status" command to check the status of ypbind.
>
> Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
> ---
>   meta-networking/recipes-support/nis/files/ypbind-yocto.init | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta-networking/recipes-support/nis/files/ypbind-yocto.init b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
> index 5f50a53..da533a1 100644
> --- a/meta-networking/recipes-support/nis/files/ypbind-yocto.init
> +++ b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
> @@ -21,6 +21,9 @@
>   #	the NIS binding information.
>   ### END INIT INFO
>
> +# Need to use status function
> +. /etc/init.d/functions
> +
>   YPBIND_BIN=/usr/sbin/ypbind
>   pidfile=/var/run/ypbind.pid
>
> @@ -92,6 +95,10 @@ case "$1" in
>   	echo -n "Reload service ypbind"
>   	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
>   	;;
> +    status)
> +	echo -n "Checking for ypbind: "
> +	status $YPBIND_BIN
> +	;;
>       *)
>   	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"
>   	exit 1
>

-- 
Best Reagrds,
Roy | RongQing Li

