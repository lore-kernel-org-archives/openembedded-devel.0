Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B20578071
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:07:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T17SOU016538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Aug 2017 18:07:28 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 Aug 2017 18:07:28 -0700
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	<openembedded-devel@lists.openembedded.org>
References: <20170828181315.8179-1-fabio.berton@ossystems.com.br>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c51a31ee-0d0a-f2ba-8791-c6ac04e0d80f@windriver.com>
Date: Mon, 28 Aug 2017 20:07:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170828181315.8179-1-fabio.berton@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] iproute2: Move append to meta-networking layer
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
X-List-Received-Date: Tue, 29 Aug 2017 01:07:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/28/17 1:13 PM, Fabio Berton wrote:
> meta-openembedded commit eb8994f44a080d9c7fd2c87b6b6935ad0a55eb27 added
> iproute2 append to enable tipc PACKAGECONFIG that install libmnl
> package. libmnl recipe is in meta-networking layer and this layer
> needs to be added to bblayers.conf file to build libmnl. Move
> iproute2 append to meta-networking to allow build iproute2 without add
> meta-networking layer to bblayers.conf.

At first I thought this was the right answer.. but the more I look at this, the
more issues I find.

The iproute2 bbappend modifies the PACKAGECONFIG.  The modification of the
PACKAGECONFIG (other then adding new options) should not be done in a bbappend,
otherwise it 'changes' the settings for that recipe.

I'm thinking the right fix is actually to remove iproute2 bbappend.  And any
distributions or users who need tipc should enable it themselves within their
distribution configuration files (and also include the meta-networking layer) as
necessary.

--Mark

> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../recipes-connectivity/iproute2/iproute2_%.bbappend                     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe => meta-networking}/recipes-connectivity/iproute2/iproute2_%.bbappend (100%)
> 
> diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
> similarity index 100%
> rename from meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
> rename to meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
> 


