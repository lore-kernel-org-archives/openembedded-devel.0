Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41A3C6F1DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:22:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1R3MMhA018582
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Feb 2014 19:22:22 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 26 Feb 2014 19:22:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2014 11:22:06 +0800
Message-ID: <cover.1393470790.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH V2 0/4][meta-webserver] Apache / PHP upgrades
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
X-List-Received-Date: Thu, 27 Feb 2014 03:22:30 -0000
Content-Type: text/plain

Change in V2:
    apache2-2.4.7: added support for TLS Next Protocol Negotiation

    The previous npn support patch (httpd-2.4.4-r1332643.patch) worked on
    apache2-2.4.6 and conflicted with apache2-2.4.7, 4/4 patch fixed the
    confliction with 2.4.7.
//Hongxu

The following changes since commit 8089aa451827cb791c7d795b9899dc152d1ceb66:

  vlc: Fix build with flac-1.3.0 (2014-02-24 10:10:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-apache2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-apache2

Hongxu Jia (1):
  apache2-2.4.7: added support for TLS Next Protocol Negotiation

Paul Eggleton (3):
  apache2: update to 2.4.7
  modphp: upgrade to 5.5.8
  phpmyadmin: update to 4.1.4

 ...he2-native_2.4.6.bb => apache2-native_2.4.7.bb} |   6 +-
 .../apache-configure_perlbin.patch                 |   0
 .../apache-ssl-ltmain-rpath.patch                  |   0
 .../fix-libtool-name.patch                         |   0
 .../httpd-2.4.1-corelimit.patch                    |   0
 .../httpd-2.4.1-selinux.patch                      |   0
 .../httpd-2.4.4-export.patch                       |   0
 .../npn-patch-2.4.7.patch}                         | 111 +++++++++++++--------
 .../replace-lynx-to-curl-in-apachectl-script.patch |   0
 .../server-makefile.patch                          |   0
 .../apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} |   8 +-
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb  |   7 --
 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb  |   7 ++
 .../{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb}   |   4 +-
 14 files changed, 86 insertions(+), 57 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.6.bb => apache2-native_2.4.7.bb} (84%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.4-export.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6/httpd-2.4.4-r1332643.patch => apache2/npn-patch-2.4.7.patch} (80%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} (95%)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.0.5.bb => phpmyadmin_4.1.4.bb} (87%)

-- 
1.8.1.2


