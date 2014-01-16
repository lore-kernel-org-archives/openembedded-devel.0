Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09DA26E20F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 14:31:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0GEVUdJ029285
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jan 2014 06:31:30 -0800 (PST)
Received: from [128.224.146.203] (128.224.146.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 16 Jan 2014 06:31:28 -0800
Message-ID: <52D7ED40.3080505@windriver.com>
Date: Thu, 16 Jan 2014 09:31:28 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
X-Originating-IP: [128.224.146.203]
Subject: Re: [meta-webserver][PATCH 0/3] Apache / PHP upgrades
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
X-List-Received-Date: Thu, 16 Jan 2014 14:31:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-13 05:38 AM, Paul Eggleton wrote:
> The following changes since commit a1b6699ad26e1035f5c29918e059b8b57fde57ff:
>
>    add libcrypt-openssl-rsa-perl (2014-01-13 09:59:45 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib paule/webserver-upgrades
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/webserver-upgrades
>
> Paul Eggleton (3):
>    apache2: update to 2.4.7
>    modphp: upgrade to 5.5.8
>    phpmyadmin: update to 4.1.4
>
>   .../apache2-2.4.6/httpd-2.4.4-r1332643.patch       | 260 ---------------------

Hi Paul,

You asked me about dropping this patch and I've done a bit of digging.

My conclusion is that the  patch is not integrated into 2.4.7 and
it would be "nice to have" since we've supported it so far.
It seems that apache2-2.6.x will include the patch.

The intended use is primarily to support SPDY as described here:
    https://technotes.googlecode.com/git/nextprotoneg.html
and I skimmed though this:
 
http://googledevelopers.blogspot.ca/2012/04/add-spdy-support-to-your-apache-server.html


As for generating a new patch, the STATUS file in 2.4.7 says:
...
    * mod_ssl: Add support for Next Protocol Negotiation.
      Trunk patch:
        http://svn.apache.org/viewvc?view=revision&revision=1332643
      2.4.x patch:
        Trunk patch works.
      +1: ben
      sf says: Needs r1345599, too.
           And wrowe's comment about the 2.2 patch is also valid for 2.4:
           http://svn.apache.org/viewvc?view=revision&revision=1354823


Does that help? Do you want someone @WR to work on the patch, the 
mod_spdy module and testing? A few more comments and links given
below.

../Randy

---

This patch has:
    Upstream-Status: Backport
and I do see the _reworked_ feature and our patch upstream
in the git-svn repo:
    https://github.com/apache/httpd.git
specifically, the re-worked commit here:
 
https://github.com/apache/httpd/commit/afa9bc99edf96a8ff3a81786cc4ef52a9f3cf310

and a commit with identical content to our patch here:
 
https://github.com/apache/httpd/commit/79d4d4d3ce586bf526178ed6d05e1b0dca7051c4

but they are both on the trunk branch (aka 2.5) so
they are not include in 2.4.7.

The original defect is:
    https://issues.apache.org/bugzilla/show_bug.cgi?id=52210

    OpenSSL 1.0.1 added support for TLS Next Protocol Negotiation (NPN)
    [1], a feature which allows client and server to negotiate what
    protocol should be used over the secure connection.  I propose
    adding hooks into mod_ssl to allow other modules to access
    this feature.

---

>   ...he2-native_2.4.6.bb => apache2-native_2.4.7.bb} |   6 +-
>   .../apache-configure_perlbin.patch                 |   0
>   .../apache-ssl-ltmain-rpath.patch                  |   0
>   .../fix-libtool-name.patch                         |   0
>   .../httpd-2.4.1-corelimit.patch                    |   0
>   .../httpd-2.4.1-selinux.patch                      |   0
>   .../httpd-2.4.4-export.patch                       |   0
>   .../replace-lynx-to-curl-in-apachectl-script.patch |   0
>   .../server-makefile.patch                          |   0
>   .../apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} |   7 +-
>   meta-webserver/recipes-php/modphp/modphp_5.5.2.bb  |   7 -
>   meta-webserver/recipes-php/modphp/modphp_5.5.8.bb  |   7 +
>   .../{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb}   |   4 +-
>   14 files changed, 15 insertions(+), 276 deletions(-)
>   delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.6.bb => apache2-native_2.4.7.bb} (84%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-configure_perlbin.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-ssl-ltmain-rpath.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/fix-libtool-name.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-corelimit.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-selinux.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.4-export.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/server-makefile.patch (100%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} (95%)
>   delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
>   create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
>   rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb} (87%)
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

