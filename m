Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PmrOR-0000UX-9f
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 18:30:23 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PmrNQ-0004nS-In from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 09:29:20 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 8 Feb 2011 09:29:20 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 8 Feb 2011 10:29:19 -0700
Message-ID: <4D517D6C.3070604@mentor.com>
Date: Tue, 08 Feb 2011 10:29:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
In-Reply-To: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
X-OriginalArrivalTime: 08 Feb 2011 17:29:19.0529 (UTC)
	FILETIME=[B7B4F990:01CBC7B5]
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in	PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 17:30:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2011 03:13 PM, Filip Zyzniewski wrote:
> This reduces amount of tasks for bootstrap-image from around 3400 to
> around 1600 for jlime.
>
> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>

Can some of the other distro folks chime in here?

> ---
>   recipes/tasks/task-base.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
> index 32d871d..c8d6df7 100644
> --- a/recipes/tasks/task-base.bb
> +++ b/recipes/tasks/task-base.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
> -PR = "r92"
> +PR = "r93"
>
>   inherit task
>
> @@ -31,8 +31,8 @@ PACKAGES = ' \
>               ${@base_contains("MACHINE_FEATURES", "redboot", "task-base-redboot", "",d)} \
>               ${@base_contains("MACHINE_FEATURES", "apex", "task-base-apex", "",d)} \
>               \
> -            task-base-bluetooth \
> -            task-base-wifi \
> +            ${@base_contains("MACHINE_FEATURES", "bluetooth", "task-base-bluetooth", "",d)} \
> +            ${@base_contains("MACHINE_FEATURES", "wifi", "task-base-wifi", "",d)} \
>               \
>               ${@base_contains("DISTRO_FEATURES", "cramfs", "task-base-cramfs", "", d)} \
>               ${@base_contains("DISTRO_FEATURES", "ipsec", "task-base-ipsec", "", d)} \


-- 
Tom Rini
Mentor Graphics Corporation


