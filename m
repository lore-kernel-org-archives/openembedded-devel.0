Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 56AE2751F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 08:04:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,242,1526335200"; d="scan'208";a="10915582"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20180425145949.8524-1-git@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <45c5c7cc-9b48-5928-fb70-f032086f3dd6@skidata.com>
Date: Tue, 19 Jun 2018 10:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180425145949.8524-1-git@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] libecj-bootstrap-native: simplify build
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
X-List-Received-Date: Tue, 19 Jun 2018 08:04:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
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

On 25.04.2018 16:59, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Piping 'find' output into multiple files to re-read
> them seems inelegant and is error prone - just use a
> pipe with appropriate options instead.
> 
> This avoids potential problems with funny file names,
> and now also makes use of BB_NUMBER_THREADS to speed
> up compilation.
> 
> This is a better example to copy from now...
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>   recipes-core/ecj/libecj-bootstrap.inc | 25 +++++++------------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
> index 9350550..04425f4 100644
> --- a/recipes-core/ecj/libecj-bootstrap.inc
> +++ b/recipes-core/ecj/libecj-bootstrap.inc
> @@ -17,13 +17,8 @@ JAR = "ecj-bootstrap-${PV}.jar"
>   
>   do_unpackpost[dirs] = "${B}"
>   do_unpackpost() {
> -  if [ ! -d source ]; then
> -    mkdir source
> -  fi
> -
> -  if [ ! -d build ]; then
> -    mkdir build
> -  fi
> +  mkdir -p source
> +  mkdir -p build
>   
>     # Remove crap.
>     rm -f about.html build.xml
> @@ -44,24 +39,18 @@ do_unpackpost() {
>     cp -R source/org build/
>   
>     # Remove source code and other stuff.
> -  find build -name '*.java' -exec rm -f {} \;
> -  find build -name '*.html' -exec rm -f {} \;
> +  find build -depth \( -name '*.java' -o -name '*.html' \) -delete
>   }
>   
>   addtask unpackpost after do_unpack before do_patch
>   
>   do_compile() {
> -  find source -name '*.java' | LC_ALL=C sort > sourcefiles
> -  split -l 25 sourcefiles ecj-sources.
> -
>     # Compiling in place is done because the sources contain
>     # property files which need to be available at runtime.
> -  for list in `find . -name 'ecj-sources.*'`; do
> -      echo "building files in $list ...";
> -      echo jikes-initial -d build -source 1.4 -sourcepath source `cat $list`;
> -      jikes-initial \
> -				-d build -source 1.4 -sourcepath source `cat $list`;
> -  done
> +  find source -name '*.java' -print0 \
> +    | LC_ALL=C sort -z \
> +    | xargs -0 -n25 -P ${BB_NUMBER_THREADS} \
> +        jikes-initial -d build -source 1.4 -sourcepath source
>   
>     fastjar -c -C build . -f ${JAR}
>   }
> 

