Return-Path: <prvs=30255aeaa=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 3145360F8F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1581321842; x=1612857842;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=LbuJGwLeszSWPXX/sAyYDYF/IynOCRopxsasRrBNgU4=;
	b=fHHh+O1iTZ7csxT3l/oH9b7wQhJKJVikiSyJkou12H/OZR1+Ng5dazBF
	zXjQLV8Z1XMAECe2GtYqouzEMInRZCf+hljTWr/qubQ5m1yz63Jz77FnV
	9ayFid6dDdIACkBIsUFPE6XN50OYyqxdMifxjHqbymFxCPEWKJ6CqUsI/
	gX9QDTS/QA6LGvvRCtcz3B4NDEOY6Jjp1ddXQGbQNGGUeXLO6wrn0GvC7
	nlHw1hyijZKokaRFqpdZu7gl9323j5ZawrzffrKULRAvwYKaQcLhSGUvV
	ZHf7Xks1Gl716iZBjk21XZZ5w7XGgXaXyktmCj935QI8nNa0ocxayn9Qj w==;
IronPort-SDR: H5+1HM1WII+YTb86PcPVMUSxWu4EifqfpvKSFWm8OaM6jsZ57cGGM2FLg6mYPqerqZM+zfYQFn
	nLsKFMctazft0lmqUtNprwE1OD2NfaSfgZiaQOAPvubsDepcSwkkyiza6liBz08Kkm2c2gzmMh
	CIIqhMSeO27zsaaemW2Ykqn2acQP/ga9zAesOATBEmqZTmkIkYJPWW+NEakXp9AFr1XH9KcRtF
	EGWTpZbV3xAsWhg8acdFgN/zeWNyqwjLJCjRRejOX/Jtx2QRSLN6oI7/BZDHEOJn63H20J9hCK
	bGg=
X-IronPort-AV: E=Sophos;i="5.70,424,1574118000"; 
   d="scan'208";a="2515026"
Date: Mon, 10 Feb 2020 09:04:00 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200210080400.GA6809@pcleri>
References: <20200208110634.250922-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200208110634.250922-1-jacob.kroon@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][master-next][PATCH] openjdk-8: Don't set TOPDIR bitbake variable
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
X-List-Received-Date: Mon, 10 Feb 2020 08:04:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Sat, Feb 08, 2020 at 12:06:34PM +0100, Jacob Kroon wrote:
> It is used to set the default sstate cache location.
> Just export it to the environment.
> 
> Richard, feel free to squash this or someting similar into the
> openjdk-8 update commit.

I just added in on top of master-next ;-)

> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 0ef4750..d8b30b8 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -12,7 +12,6 @@ FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-8:"
>  
>  # for weird openjdk-common.inc
>  S = "${WORKDIR}/${OPENJDK_HG_U}-${OPENJDK_CHANGESET}"
> -export TOPDIR="${S}"
>  
>  SRC_URI = "\
>      ${OPENJDK_URI} \
> @@ -27,6 +26,10 @@ SRC_URI = "\
>      ${PATCHES_URI} \
>  "
>  
> +do_configure_prepend () {
> +    export TOPDIR=${S}
> +}
> +
>  do_unpack_extract_submodules () {
>      cd "${S}"
>      # tar --transform
> -- 
> 2.24.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

