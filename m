Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BD24F72273
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:23:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43943083"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2014 17:20:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAP9NE0t032223;
	Tue, 25 Nov 2014 17:23:14 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 25 Nov 2014 17:23:36 +0800
Date: Tue, 25 Nov 2014 17:23:29 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141125172329.21e1caea@Fedora>
In-Reply-To: <20141121141904.GK2163@jama>
References: <20141119154912.GP3315@jama>
	<1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416556558-15428-2-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141121140616.GB20204@mentor.com> <20141121141904.GK2163@jama>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] UMIP: add new recipe
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
X-List-Received-Date: Tue, 25 Nov 2014 09:23:45 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 21 Nov 2014 15:19:04 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

 
> It's failing to build in my world builds, so please wait a bit more.
> 
> Also a lot of patches from last week were modified when I was
> cherry-picking them to master-next, please make sure you're using right
> version.

Hi Jansa:
  Could you show me the error message when you compile the umip? It is OK
in my system and I can not reproduce the bug. I use poky 1.7 and following
is my step:
    1) copy umip and indent to poky/meta/recipes-myrecipe/
    2) source oe-init-build-env build-arm
    3) modify the MACHINE in build-arm/conf/local.conf to "qemuarm"
    4) bitbake umip
Is there something wrong?

  In addition, what's the correct workflow for developers/maintainers? I
meaning if I want to send patches to community, what extra tests should I
do to make them more reliable and containing less error, such as compiling
error, dependence error or something else, although the patches are OK in
our build environment.
  And as you, the maintainer, how to test a new patch and what's the standard
for patches which could be merge into some branch? I need more detail info to
improve my patches' quality.

Thanks.

-- 
Qian Lei

