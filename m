Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3753C71A60
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 12:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 474F01838E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hwO+ZOZbzbTn
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:12 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 19201180E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:12 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02EFA1E079
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:12 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC2F71E077
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:11 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:11 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id E0689C0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:54:11 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id D0CF79C09F; Tue,  7 Feb 2017 13:54:11 +0100 (CET)
Date: Tue, 7 Feb 2017 13:54:11 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170207125411.GQ31993@axis.com>
References: <1484904671-9257-1-git-send-email-olofjn@axis.com>
MIME-Version: 1.0
In-Reply-To: <1484904671-9257-1-git-send-email-olofjn@axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
Subject: Re: [meta-webserver][krogoth][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Tue, 07 Feb 2017 12:54:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping

On 17-01-20 10:31 +0100, Olof Johansson wrote:
> From: Derek Straka <derek@asterius.io>
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Olof Johansson <olofjn@axis.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> index b227f19..aa26cc7 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> @@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
>  
>  inherit autotools pkgconfig native
>  
> -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>             file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
>            "
>  
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> index 5bea876..9459766 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> @@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
>  
> -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>             file://server-makefile.patch \
>             file://httpd-2.4.1-corelimit.patch \
>             file://httpd-2.4.4-export.patch \
> -- 
> 2.1.4
> 

-- 
olofjn

