Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 348D072DE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:07:36 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BDDFED403BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:07:36 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 59D23D40367
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:07:35 +0100 (CET)
Date: Tue, 17 Feb 2015 11:07:30 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150217100723.GD27279@mail.itconsulting-heinold.de>
References: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH v2 0/6] Allow build for multiple ARCH in the same builddir
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
X-List-Received-Date: Tue, 17 Feb 2015 10:07:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2015 at 10:57:10AM +0100, Max Krummenacher wrote:
> v2: Patch 6/6: mark broken recipes with PNBLACKLIST[recipe] rather than
>     documenting them in a README.nonworking
> 
> 
> Building a recipe which provides packages for allarch and ${TUNE_PKGARCH}
> fails if one builds in the same build directory for different TUNE_PKGARCHs.
> 
> An example is rhino which fails as follows when one builds first for
> armv7at2hf-vfp and then for armv7at2hf-vfp-neon.
>     ERROR: The recipe rhino is trying to install files into a
>     shared area when those files already exist. Those files and their
>     manifest location are:
>        /.../ipk/all/librhino-java_1.7r4-r0_all.ipk
>     Matched in manifest-armv7at2hf-vfp-rhino-package_write_ipk
> 
> The change in package arch is done in java-library.bbclass. Most of the
> users of java-library.bbclass don't install any files in the ${TUNE_PKGARCH}
> packages or install shell scripts which may also be deployed in an allarch
> package.
> 
> Most of the recipes including java-library.bbclass no longer build with newer
> layer revisions.
> This patchset first update the recipes to build again, changes java-library
> build all packages in allarch by default and recipes which must have some
> of their packages in ${TUNE_PKGARCH} to have all of their recipes in
> ${TUNE_PKGARCH}.
> Finaly some of the recipes I tried did not build before and after the proposed
> changes. Adding a PNBLACKLIST statement to mark them as I don't have the time
> to work on these and I guess no one has been interested in years.
> 
> Regards
> Max
> 
> Max Krummenacher (6):
>   cleanup whitespace in tasks
>   licence: add missing LIC_FILES_CHKSUM
>   rxtx: use autotools-brokensep
>   java-library: inherit allarch
>   antlr: fix override for native build
>   mark broken recipes with PNBLACKLIST
> 
>  classes/java-library.bbclass                       |  8 ++-
>  recipes-core/antlr/antlr_2.7.7.bb                  | 18 +++---
>  recipes-core/jakarta-commons/commons-cli_1.1.bb    |  1 +
>  recipes-core/jakarta-commons/commons-codec_1.3.bb  |  1 +
>  .../jakarta-commons/commons-configuration_1.5.bb   |  2 +
>  .../jakarta-commons/commons-discovery_0.4.bb       |  1 +
>  recipes-core/jakarta-commons/commons-el_1.0.bb     |  3 +-
>  .../jakarta-commons/commons-fileupload_1.2.1.bb    |  1 +
>  .../jakarta-commons/commons-httpclient_3.1.bb      |  1 +
>  recipes-core/jakarta-commons/commons-io_1.4.bb     |  1 +
>  recipes-core/jakarta-commons/commons-jxpath_1.3.bb |  2 +
>  recipes-core/jakarta-commons/commons-lang_2.4.bb   |  1 +
>  .../jakarta-commons/commons-logging_1.1.1.bb       |  1 -
>  recipes-core/jakarta-commons/commons-pool_1.4.bb   |  1 +
>  recipes-core/jakarta-commons/jakarta-commons.inc   | 68 +++++++++++-----------
>  recipes-core/jakarta-libs/poi_3.0.bb               |  3 +-
>  recipes-core/junit/junit4_4.3.1.bb                 |  3 +-
>  recipes-core/libmatthew/libmatthew.inc             |  1 +
>  recipes-core/servlet-api/jsp2.0_5.5.26.bb          |  3 +-
>  recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  3 +-
>  recipes-core/xml-commons/dom4j_1.6.1.bb            |  2 +
>  recipes-core/xml-commons/jaxen_1.1.1.bb            |  2 +
>  recipes-core/xml-commons/jaxme_0.5.2.bb            | 57 +++++++++++-------
>  recipes-core/xml-commons/jdom_1.1.bb               |  2 +
>  recipes-core/xml-commons/xom_1.1.bb                | 40 ++++++++-----
>  recipes-core/xml-commons/xpp2_2.1.10.bb            | 24 ++++----
>  recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         | 39 +++++++------
>  recipes-extended/hsqldb/hsqldb_1.8.0.10.bb         | 29 ++++-----
>  recipes-extended/rxtx/rxtx_2.2.0.bb                |  3 +-
>  29 files changed, 188 insertions(+), 133 deletions(-)
> 

Whole series looks good to me. Thank you Max.

Bye Henning

