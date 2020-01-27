Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3A67FD98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580119422; x=1611655422;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=EzdnsQboxhDHQjA1Wyw5X/reyFMpl5Q53TvVxdMvgPk=;
	b=ig2Zuerp2rurv4lqK3c8iUts6w98PqDRp0eEjebsbt+zoM/ACoPKiGY2
	IayrG4eNWyZFjczO+azSyrHRGgCqTSyS3TTjGqdpUmQqzUSZLZFc+7GGt
	wljOw6YFcF4+atux9h5a9P496Q1vsZG0GMWeuctsRIFsya9yB1xdUfOzD
	5nEkizAGcREBOJBNAeWHCkCxX28IonVu5uiENl7RSffTbfNhtXlStIQ4k
	THzHkS57UwBSHp8pUlLOpkKnvvYgnJKqmfSTOK2qsWDbZ1s56XWJ1QAK1
	vO9bSZkdw2zRQAoUF306djOxsb63OBcT17dO/FYdFMeR20GK0bVzE562f w==;
IronPort-SDR: e85x5cJwi5V3cuAsQMxaQpcQEZTwiHhCb7RgwePZqalbk2uLo3KC3WkvydzIhHCWXR3W8vtPGt
	0JlOEKdlqqLnM6nBc8A2dssO+XGo8fRXi6xjZ6YsM2HGgM4KCmjYz/e+azvZQdSSft2AQTVXkO
	MZlnE/givF80r+WPLvkP3HVRWtdwc/WN2t6wOyDJH9PyY8v5AIqzzVMDpACxmbNW29AFk891Pm
	5gXoymoWkh421g7CV1CRVXgnDRMwcSys9RRQhTRHMjx56AkkXYDCajOetqcq0UlJ4FkcZdIH5l
	MxI=
X-IronPort-AV: E=Sophos;i="5.70,369,1574118000"; 
   d="scan'208";a="2501159"
Date: Mon, 27 Jan 2020 11:03:42 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Kraag Gorim <kraaggorim@gmail.com>
Message-ID: <20200127100342.GD2982185@pcleri>
References: <CACc3Zv6GF8UTJK4=v22np2vZoSgkBtWr-1VSG22LDkhnky65xA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACc3Zv6GF8UTJK4=v22np2vZoSgkBtWr-1VSG22LDkhnky65xA@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] [meta-java] icedtea7-native: inherit python native
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
X-List-Received-Date: Mon, 27 Jan 2020 10:03:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

Please note that this patch wasn't formatted correctly as some extra
linebreaks were inserted.
To avoid this in the future please fix your mail program or use
git-send-email. Thanks!

regards;rl

On Fri, Jan 24, 2020 at 05:22:18PM +0100, Kraag Gorim wrote:
> icedtea7-native relys on python to enable building it. Therefor it
> should inherit python instead of assuming python being part of
> HOSTTOOLS.
> 
> Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc
> b/recipes-core/icedtea/icedtea7-native.inc
> index b578cb2..41da925 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -30,6 +30,7 @@ CFLAGS_append = " -Wno-error=stringop-overflow
> -Wno-error=return-type"
> 
>  inherit native java autotools pkgconfig
>  inherit openjdk-build-helper
> +inherit python3native
> 
>  JAVA_HOME[unexport] = "1"
> 
> -- 
> 2.24.0
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

