Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E7D66731D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 13:36:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Sep 2016 06:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,328,1470726000"; d="scan'208";a="1055330046"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2016 06:36:34 -0700
Date: Tue, 13 Sep 2016 16:36:42 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160913133641.GA8604@mbabyjoh-desk.ger.corp.intel.com>
References: <20160913123757.15798-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160913123757.15798-1-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: chris_larson@mentor.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH v2] xpp3: Fix bashism
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
X-List-Received-Date: Tue, 13 Sep 2016 13:36:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

On Tue, Sep 13, 2016 at 02:37:57PM +0200, Ricardo Ribalda Delgado wrote:
> findpath var must also be fixed on its second occurrence.
>

Good catch, Thanks! 

It seems that the test builder failed to catch this xpp3 specific error (mostly
related to build environment configuration).

> Without this patch:
> 
> ERROR: xpp3-1.1.3.4.O-r0 do_compile: Function failed: do_compile (log
> 		file is located at
> 		/home/ricardo/curro/qt5022/build-qt5022-open/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.14262)
> ERROR: Logfile of failure stored in:
> /home/ricardo/curro/qt5022/build-qt5022-open/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.14262
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | ----------
> | 1. WARNING in src/java/api/org/xmlpull/v1/XmlPullParserException.java
> (at line 11)
> | 	public class XmlPullParserException extends Exception {
> | 	             ^^^^^^^^^^^^^^^^^^^^^^
> | The serializable class XmlPullParserException does not declare a static final serialVersionUID field of type long
> 
> /home/ricardo/curro/qt5022/build-qt5022-open/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/run.do_compile.14262:
> Bad substitution
> | WARNING: exit code 2 from a shell command.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/xml-commons/xpp3_1.1.3.4.O.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> index f264022ffe60..808a9372338f 100644
> --- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> +++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> @@ -33,7 +33,7 @@ do_compile() {
>      mkdir -p build-xpath
>  
>      sourcepath="src/java/xpath"
> -    findpath="${sourcepath//:/ }"
> +    findpath=${sourcepath}
>      javac -sourcepath $sourcepath -cp build-oe -d build-xpath `find $findpath -name "*.java"`
>  
>      fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .
> -- 
> 2.9.3

Best Regards,
Maxin

