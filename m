Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Jun 2018 13:18:02 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6BF7898B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:18:01 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id SMaXfGWdTWLW2SMaZfjzew; Mon, 11 Jun 2018 14:10:32 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fJUXI6Se c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=8nJEP1OIZ-IA:10 a=7mUfYlMuFuIA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
	a=aPdgp986AAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=-An2I_7KAAAA:8
	a=_fNvUtQRe2PeQbxIaV0A:9 a=wPNLvfGTeEIA:10 a=OEFYv0PBCf8A:10
	a=9H3Qd4_ONW2Ztcrla5EB:22 a=hjhaEeQbI_L7T3ty1Rvw:22
	a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1fSMaX-000471-PC; Mon, 11 Jun 2018 14:10:25 +0100
Date: Mon, 11 Jun 2018 14:10:25 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180611131025.mcgzbelkqhy4re5h@mcrowe.com>
References: <CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
	<20180508093631.5196-1-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20180508093631.5196-1-mac@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfB99nx3/+sVUV9C2mwmjOinKScfyDkrDcvtR2ircDSrCboFln4oUKwKiTGslmpFhqvWlrKl7FmUZ8FtpA7SOqRprXP+K35uWqQk0uqT5iOUpoZBvlNYg
	ECmiMAa2DEBV5Ah5KjK42AL4ZwIfEYR7SdeSJLPhv6nb3aWyrnnodUUB
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@jci.com>
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
X-List-Received-Date: Mon, 11 Jun 2018 13:18:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The change below doesn't seem to have been merged. Is there anything else
that I need to do?

Thanks.

Mike.

On Tuesday 08 May 2018 at 10:36:31 +0100, Mike Crowe wrote:
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
> -- 
> 2.11.0
> 
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

