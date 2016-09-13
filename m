Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB36771EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 12:25:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2016 05:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,328,1470726000"; d="scan'208";a="167630767"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2016 05:25:54 -0700
Date: Tue, 13 Sep 2016 15:26:00 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160913122559.GA23801@mbabyjoh-desk.ger.corp.intel.com>
References: <20160913121749.11771-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160913121749.11771-1-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH 1/2] xpp2: Remove bashism
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
X-List-Received-Date: Tue, 13 Sep 2016 12:25:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

On Tue, Sep 13, 2016 at 02:17:48PM +0200, Ricardo Ribalda Delgado wrote:
> ERROR: xpp2-2.1.10-r0 do_compile: Function failed: do_compile (log file
> 		is located at
> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/log.do_compile.6694)
> ERROR: Logfile of failure stored in:
> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/log.do_compile.6694
> Log data follows:
> | DEBUG: Executing shell function do_compile
> |
> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/run.do_compile.6694:
> 109:
> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/run.do_compile.6694:
> Bad substitution
> | WARNING: exit code 2 from a shell command.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/xml-commons/xpp2_2.1.10.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
> index d3baca436b60..32457ddf899c 100644
> --- a/recipes-core/xml-commons/xpp2_2.1.10.bb
> +++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
> @@ -18,8 +18,7 @@ do_compile() {
>      mkdir -p build-oe
>  
>      sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:src/java/impl/factory:src/java/impl/format:src/java/impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
> -
> -    findpath="${sourcepath//:/ }"
> +    findpath="src/java/drivers/jaxp11 src/java/drivers/sax2 src/java/impl/factory src/java/impl/format src/java/impl/node src/java/impl/pullparser src/java/impl/tag src/java/intf"
>  
>      javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`

Merged a similar fix yesterday.
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=aa3c79568dfaeb9c8747d49d12ac0396eaf6a4ea

Please pull the latest master branch and see if this happens again.

Thanks,
Maxin

