Return-Path: <prvs=69472e970=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id EB65271A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 19:46:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,215,1526335200"; 
   d="scan'208";a="1496024"
To: Mike Crowe <mac@mcrowe.com>
References: <CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
	<20180508093631.5196-1-mac@mcrowe.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <dacfcb32-e98f-7a5c-e9a1-40c4277ecdd9@skidata.com>
Date: Tue, 12 Jun 2018 21:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180508093631.5196-1-mac@mcrowe.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCHv3] jdepend: Retrieve source from Git rather than tarball
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
X-List-Received-Date: Tue, 12 Jun 2018 19:46:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 05/08/2018 11:36 AM, Mike Crowe wrote:
> When Bitbake downloads jdepend-2.9.1.zip itself and I download
> https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
> the calculated hashes don't match the ones included in the recipe.
> 
> The hashes were last changed in commit
> dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
> that the file being downloaded was published on 20th January, so I can't
> explain why they are wrong. Ross Burton has provided a plausible reason in
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html
> where he also advocates switching to using Git repositories rather than
> GitHub-generated tarballs.
> 
> It seems that we can't really rely on these tarballs to remain unchanged,
> so let's download the Git hash that corresponds to v2.9.1 instead. This
> should always remain valid.
> 
> Cc: André Draszik <andre.draszik@jci.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  recipes-core/jdepend/jdepend_2.9.1.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
> index 5f09a8b..dfbf493 100644
> --- a/recipes-core/jdepend/jdepend_2.9.1.bb
> +++ b/recipes-core/jdepend/jdepend_2.9.1.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5777d32a7709d558c2877d4a6616230"
>  
>  HOMEPAGE = "https://github.com/clarkware/jdepend"
>  
> -SRC_URI = "https://github.com/clarkware/jdepend/archive/${PV}.zip;downloadfilename=${BP}.zip"
> +SRC_URI = "git://github.com/clarkware/jdepend"
> +SRCREV = "57980590313a5dbde236a3eb2c8958e9e53e6a10"
> +S = "${WORKDIR}/git"
>  
>  inherit java-library
>  
> @@ -18,7 +20,4 @@ do_compile() {
>    fastjar cf ${JARFILENAME} -C build .
>  }
>  
> -SRC_URI[md5sum] = "9b91efe1d770e023893f89f4dde8434e"
> -SRC_URI[sha256sum] = "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f278f72e522e7f7c9"
> -
>  BBCLASSEXTEND = "native"
> 

