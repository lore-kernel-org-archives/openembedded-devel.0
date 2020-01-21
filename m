Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 775787FD6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579589080; x=1611125080;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=hu5FMrDhE9uVXDq2Is5GGBh1bGv7OUixFTNsByny/sA=;
	b=peZYd4g9yAoN+IvBXFzv8Q8TINAMpGgRn5s5cMjbSJuzdXf3sEegUz8N
	HmoubAJEIPSpZLy5vkD+Ss6MwjB+v8q7g12UkLLxsTqOxJAwUZvdfvUb1
	Q9vFY+nYuBQWy9QeXiA0uybY70Mcj2NMxkWGpEQrvpI965Jzd3ZEwys+p
	VsYJ5/j1l34PPX6sD1EiFTgh+OAPWCZXWcZNBao5jck038YySk08D7a/s
	dOdsDrdmMyP8Gk5tKT5u1hgJwjUwabC/SypSVtKVgH5TrsmZLc91MFGlz
	lc7H3bE6WzEZLIPZxmnRA1UbKFBXvwjDV62omLs4zcWqhtNUbmDaDpNuv A==;
IronPort-SDR: pl2fVEemxbGc3qqgf/amE67lSnKACPw206qPkGkjsUqtB+w4MPXjUId6CMP0FzMFfJkE9K6AKx
	Mcs74F8oKcrESsnk88ivQv5/SiFAa2Qq4/RosYc2aTmr/Plm9fg7qTakBEI0Wgxtm6E/Dl8lHz
	jlSCOu9KHb6bzWFHe49ysY848DZN4ZEvLuP6ircgN9+/NJufACWVIZdEYtBp1crK/OxRV1Xrru
	lor996okBVS++p2DKh8qvQLcti0nH82KOvxVqT7yLsoNkzRoeL1s7QCD1y3ySWaloKJdUVh+pe
	eO8=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; 
   d="scan'208";a="2494735"
Date: Tue, 21 Jan 2020 07:44:38 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Message-ID: <20200121064438.GA1567918@pcleri>
References: <20200120202815.58841-1-michael.davis@essvote.com>
MIME-Version: 1.0
In-Reply-To: <20200120202815.58841-1-michael.davis@essvote.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] java.bbclass: oe_makeclasspath does nothing without -s
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
X-List-Received-Date: Tue, 21 Jan 2020 06:44:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On Mon, Jan 20, 2020 at 08:28:31PM +0000, Davis, Michael wrote:
> oe_makeclasspath is supposed to output for the target platform by default and the staging platform with -s.
> However it checks if the file exists even if -s is not defined which is always false.
> Additionaly remove comment around an error that never occurs.
> 
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  classes/java.bbclass | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/classes/java.bbclass b/classes/java.bbclass
> index fc97295..7b9677a 100644
> --- a/classes/java.bbclass
> +++ b/classes/java.bbclass
> @@ -80,8 +80,6 @@ oe_makeclasspath() {
>    # in variable "bootcp".
>    # 
>    # Provide the -s at the beginning otherwise strange things happen.
> -  # If -s is given the function checks whether the requested jar file exists
> -  # and exits with an error message if it cannot be found.
>    #
>    # Note: In order to encourage usage of the DEPENDS variable, the function
>    # can accept recipe names. If a recipe has no corresponding Jar file it
> @@ -91,6 +89,7 @@ oe_makeclasspath() {
>    classpath=
>    delimiter=
>    retval=$1
> +  staging=false
>  
>    shift
>  
> @@ -106,6 +105,7 @@ oe_makeclasspath() {
>                    dir=${STAGING_DATADIR_JAVA}
>                    ;;
>                esac
> +              staging=true
>                ;;
>            -*)
>                bbfatal "oe_makeclasspath: unknown option: $1"
> @@ -113,9 +113,9 @@ oe_makeclasspath() {
>            *)
>                file=$dir/$1.jar
>  
> -              if [ -e $file ]; then
> -                  classpath=$classpath$delimiter$file
> -                  delimiter=":"
> +              if [ $staging == false ] || [ -e $file ]; then
> +                classpath=$classpath$delimiter$file
> +                delimiter=":"
>                fi
>  
>            ;;
> -- 
> 2.24.1
> 

