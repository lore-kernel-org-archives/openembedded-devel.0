Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 439 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Sep 2014 08:38:43 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 311A6712B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 08:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 95D5D180C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:31:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Y3oPFqrGbKye
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:31:21 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id B3C40180B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:31:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9C5821030
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:31:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 90FA1CF0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:31:21 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 8EDA33E048
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:31:21 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Tue, 2 Sep 2014 10:31:21 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 4B3E49C552; 
	Tue,  2 Sep 2014 10:31:21 +0200 (CEST)
Date: Tue, 2 Sep 2014 10:31:21 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20140902083121.GC21392@axis.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
	<2016151778c10b65ff66b9b885b647bed934d640.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <2016151778c10b65ff66b9b885b647bed934d640.1409584344.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 09/13] apache2: add perl to RDEPENDS_apache2
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
X-List-Received-Date: Tue, 02 Sep 2014 08:38:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-09-01 17:18 +0200, Robert Yang wrote:
> Perl:
> apache2/usr/bin/dbmmanage:#!/usr/bin/perl
> apache2/usr/bin/apxs:#!/usr/bin/perl -w
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-httpd/apache2/apache2_2.4.10.bb        |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
> index 0356029..5989a05 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
> @@ -149,4 +149,4 @@ FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
>  
>  FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
>  
> -RDEPENDS_${PN} += "openssl libgcc"
> +RDEPENDS_${PN} += "openssl libgcc perl"

This would probably be nice to separate to a -scripts package if
those two scripts are the only reason they would rdepend on perl.
I think apxs could be included in the -dev package.

Regards,
-- 
olofjn

