Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18B9171CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 05:15:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8N5EltH015727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 22:14:58 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 22 Sep 2019 22:14:37 -0700
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190923033020.53555-1-hongzhi.song@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <13d44227-cac5-fb4d-4a60-095f4e01fbcf@windriver.com>
Date: Mon, 23 Sep 2019 01:14:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923033020.53555-1-hongzhi.song@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [meta-oe][PATCH] numactl: fix a error about lib32-numactl
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
X-List-Received-Date: Mon, 23 Sep 2019 05:15:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/22/19 11:30 PM, Hongzhi.Song wrote:
> lib32-numactl has a error:
> root@intel-x86-64:~# numademo -t -e 1M
> Configured Nodes does not match available memory nodes
> 
> That's because (long long int) is assigned to (long int).
> This will cause (long int) overflow on 32bit system.
> 
> Unify variable types and fix it.
> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   ...1-numademo-fix-error-on-32bit-system.patch | 100 ++++++++++++++++++
>   .../recipes-support/numactl/numactl_git.bb    |   1 +
>   2 files changed, 101 insertions(+)
>   create mode 100644 meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
> 
> diff --git a/meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch b/meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
> new file mode 100644
> index 000000000..506101711
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
> @@ -0,0 +1,100 @@
> +From 68485f8516884377e54c623b0deff73f97321d96 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Thu, 19 Sep 2019 04:32:31 -0400
> +Subject: [PATCH] numademo: fix error on 32bit system
> +
> +Error Info on 32bit:
> +root@intel-x86:~# numademo -t -e 1M
> +Configured Nodes does not match available memory nodes
> +
> +That's because sizeof(long)=4Word, but sizeof(long long)=8Word
> +on 32bit. So (long long) assigning to (long) maybe cause overflow.
> +
> +long numa_node_size(int node, long *freep)
> +{
> +    ...
> +    long sz = numa_node_size64_int(node, &f2);
> +    ~^^~
> +    return sz;
> +    ...
> +}
> +long long numa_node_size64(int node, long long *freep)
> +~^^   ^^~
> +{
> +    ...
> +}
> +
> +Unify the return type of above functions.
> +
> +Upstream-Status: Accepted 
Good.
[next version is after 2.0.13 or 2.0.14]
Interesting perhaps but I'm not sure we need that info here.
> +[https://github.com/numactl/numactl/commit/a7c4bc790a191d3e42b63850b409c1a72b75a4e1]
This is what we need so that we can check if we can drop the patch after
an update.

> +                 Submitted [https://github.com/numactl/numactl/pull/79]
> +[The first patch was merged but has a error, then the second fix it.]

Again, I'm not sure this is needed.

I think  that if you decide that additional info is worth including,
it should be in the patch header and/or git long log.

Anyway, thanks for the commit and if Khem wants to merge this as is,
I have no objection.

../Randy

> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + libnuma.c         | 4 ++--
> + numa.h            | 2 +-
> + numademo.c        | 2 +-
> + test/move_pages.c | 2 +-
> + 4 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/libnuma.c b/libnuma.c
> +index cac8851..8b5c6aa 100644
> +--- a/libnuma.c
> ++++ b/libnuma.c
> +@@ -791,10 +791,10 @@ long long numa_node_size64(int node, long long *freep)
> +
> + make_internal_alias(numa_node_size64);
> +
> +-long numa_node_size(int node, long *freep)
> ++long long numa_node_size(int node, long long *freep)
> + {
> + 	long long f2;
> +-	long sz = numa_node_size64_int(node, &f2);
> ++	long long sz = numa_node_size64_int(node, &f2);
> + 	if (freep)
> + 		*freep = f2;
> + 	return sz;
> +diff --git a/numa.h b/numa.h
> +index 3a8c543..268fb1d 100644
> +--- a/numa.h
> ++++ b/numa.h
> +@@ -143,7 +143,7 @@ int numa_preferred(void);
> +
> + /* Return node size and free memory */
> + long long numa_node_size64(int node, long long *freep);
> +-long numa_node_size(int node, long *freep);
> ++long long numa_node_size(int node, long long *freep);
> +
> + int numa_pagesize(void);
> +
> +diff --git a/numademo.c b/numademo.c
> +index a720db0..8c56da8 100644
> +--- a/numademo.c
> ++++ b/numademo.c
> +@@ -301,7 +301,7 @@ int max_node, numnodes;
> + int get_node_list(void)
> + {
> +         int a, got_nodes = 0;
> +-        long free_node_sizes;
> ++        long long free_node_sizes;
> +
> +         numnodes = numa_num_configured_nodes();
> +         node_to_use = (int *)malloc(numnodes * sizeof(int));
> +diff --git a/test/move_pages.c b/test/move_pages.c
> +index d1d8436..f8ff25d 100644
> +--- a/test/move_pages.c
> ++++ b/test/move_pages.c
> +@@ -26,7 +26,7 @@ int *node_to_use;
> + int get_node_list()
> + {
> +         int a, got_nodes = 0, max_node, numnodes;
> +-        long free_node_sizes;
> ++        long long free_node_sizes;
> +
> +         numnodes = numa_num_configured_nodes();
> +         node_to_use = (int *)malloc(numnodes * sizeof(int));
> +--
> +2.23.0
> +
> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
> index f13b1795f..20b7fed86 100644
> --- a/meta-oe/recipes-support/numactl/numactl_git.bb
> +++ b/meta-oe/recipes-support/numactl/numactl_git.bb
> @@ -18,6 +18,7 @@ SRC_URI = "git://github.com/numactl/numactl \
>       file://Makefile \
>       file://run-ptest \
>       file://0001-define-run-test-target.patch \
> +    file://0001-numademo-fix-error-on-32bit-system.patch \
>   "
>   
>   S = "${WORKDIR}/git"
> 


-- 
# Randy MacLeod
# Wind River Linux

