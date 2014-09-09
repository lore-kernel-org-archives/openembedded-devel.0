Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADAD62252
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 09:23:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s899NxWi023640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 02:23:59 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 02:23:58 -0700
Message-ID: <540EC72D.20802@windriver.com>
Date: Tue, 9 Sep 2014 17:23:57 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1410247589.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1410247589.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1][meta-oe] talloc: ignore exit status of rmdir
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
X-List-Received-Date: Tue, 09 Sep 2014 09:23:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Recall this patch, it should be fixed from the dependency of swig. I'll 
send out another patches later ...

Sorry for the inconvenience.

// Wenzong


On 09/09/2014 03:30 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * fix do_insall errors:
>    rmdir: failed to remove `.../talloc/2.0.1-r2/image/usr/bin': \
>    No such file or directory
>
> The following changes since commit 46824934fa4ac6a61bebe2c92faa31c0a8e85392:
>
>    meta-networking: Update layer dependency information (2014-09-08 16:34:25 -0400)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/fix-talloc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-talloc
>
> Wenzong Fan (1):
>    talloc: ignore exit status of rmdir
>
>   meta-oe/recipes-support/talloc/talloc_2.0.1.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

