Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pnxcn-0007JN-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 19:21:45 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pnxbj-0006b4-9K from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 10:20:39 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 10:20:36 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Feb 2011 11:20:36 -0700
Message-ID: <4D557DED.5070606@mentor.com>
Date: Fri, 11 Feb 2011 11:20:29 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
	<1297447579-5311-1-git-send-email-filip.zyzniewski@gmail.com>
In-Reply-To: <1297447579-5311-1-git-send-email-filip.zyzniewski@gmail.com>
X-OriginalArrivalTime: 11 Feb 2011 18:20:36.0753 (UTC)
	FILETIME=[611D5810:01CBCA18]
Subject: Re: [PATCH] initscripts: handle busybox version of makedevs properly.
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
X-List-Received-Date: Fri, 11 Feb 2011 18:21:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2011 11:06 AM, Filip Zyzniewski wrote:
> Makedevs from busybox has a different command line syntax.
>
> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
> ---
>   recipes/initscripts/initscripts-1.0/devices |    8 +++++++-
>   1 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/initscripts/initscripts-1.0/devices b/recipes/initscripts/initscripts-1.0/devices
> index 67a2ec8..4059628 100755
> --- a/recipes/initscripts/initscripts-1.0/devices
> +++ b/recipes/initscripts/initscripts-1.0/devices
> @@ -56,7 +56,13 @@ else
>   	done
>   	ln -sf /proc/self/fd /dev/fd
>   	ln -sf /proc/kcore /dev/core
> -	/sbin/makedevs -r / -D /etc/device_table
> +
> +	if test `readlink -f "/sbin/makedevs"` = "/bin/busybox"; then
> +		MAKEDEV_ARGS="-d /etc/device_table /"
> +	else
> +		MAKEDEV_ARGS="-r / -D /etc/device_table"
> +	fi
> +	/sbin/makedevs $MAKEDEV_ARGS
>   	if test $? -ne 0; then
>   		if test "$VERBOSE" != "no"; then echo "failed"; fi
>   	else

Is there a syntax that works for both?

-- 
Tom Rini
Mentor Graphics Corporation


