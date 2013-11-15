Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7D936D77B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 10:06:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAFA6vKi001860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Nov 2013 02:06:57 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 15 Nov 2013 02:06:56 -0800
Message-ID: <5285F23C.7090702@windriver.com>
Date: Fri, 15 Nov 2013 18:06:52 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1384504242.git.hongxu.jia@windriver.com>
	<5f00aadb00bfff80b72a857e190dfd4ccea50310.1384504242.git.hongxu.jia@windriver.com>
In-Reply-To: <5f00aadb00bfff80b72a857e190dfd4ccea50310.1384504242.git.hongxu.jia@windriver.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 1/1] mariadb: fix QA Issue ELF binary has relocations in .text while multilib enabled
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
X-List-Received-Date: Fri, 15 Nov 2013 10:06:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2013 04:33 PM, Hongxu Jia wrote:
> bitbake lib32-mariadb
> ...
> WARNING: QA Issue: ELF binary 'bitbake_build/tmp/work/x86-wrsmllib32-linux/lib32-mariadb/5.1.67-r0/packages-split/lib32-libmysqlclient/usr/lib/plugin/ha_xtradb.so.0.0.0' has relocations in .text
> WARNING: QA Issue: ELF binary 'bitbake_build/tmp/work/x86-wrsmllib32-linux/lib32-mariadb/5.1.67-r0/packages-split/lib32-libmysqlclient/usr/lib/plugin/ha_innodb_plugin.so.0.0.0' has relocations in .text
> ...
> The mariadb used absolute addresses on IA-32, we should forbid this.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...orage-forbids-absolute-addresses-on-IA-32.patch | 44 ++++++++++++++++++++++
>   meta-oe/recipes-support/mysql/mariadb_5.1.67.inc   |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch b/meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
> new file mode 100644
> index 0000000..0530cd9
> --- /dev/null
> +++ b/meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
> @@ -0,0 +1,44 @@
> +storage: forbids absolute addresses on IA-32
> +
> +The shared lib has relocations in .text
> +...
> +WARNING: QA Issue: ELF binary '/usr/lib/plugin/ha_xtradb.so.0.0.0' has relocations in .text
> +WARNING: QA Issue: ELF binary '/usr/lib/plugin/ha_innodb_plugin.so.0.0.0' has relocations in .text
> +...
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + storage/innodb_plugin/plug.in |    2 +-
> + storage/xtradb/plug.in        |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/storage/innodb_plugin/plug.in b/storage/innodb_plugin/plug.in
> +--- a/storage/innodb_plugin/plug.in
> ++++ b/storage/innodb_plugin/plug.in
> +@@ -50,7 +50,7 @@ MYSQL_PLUGIN_ACTIONS(innodb_plugin,  [
> + 		;;
> + 	*86)
> + 		# Use absolute addresses on IA-32
> +-		INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
> ++		# INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"

No need to keep it in comments, just remove it.
I have done the modification in git:

http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mariadb-qa


//Hongxu




> + 		;;
> +   esac
> +   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
> +diff --git a/storage/xtradb/plug.in b/storage/xtradb/plug.in
> +index a33f4dc..4c186fd 100644
> +--- a/storage/xtradb/plug.in
> ++++ b/storage/xtradb/plug.in
> +@@ -51,7 +51,7 @@ MYSQL_PLUGIN_ACTIONS(xtradb,  [
> + 		;;
> + 	*86)
> + 		# Use absolute addresses on IA-32
> +-		INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
> ++		# INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
> + 		;;
> +   esac
> +   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
> index 98d135f..e66f215 100644
> --- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
> @@ -16,6 +16,7 @@ SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x8
>              file://fix-cve-2013-1861-1.patch \
>              file://fix-cve-2013-1861-2.patch \
>              file://zlib-let-libdir-configurable.patch \
> +           file://storage-forbids-absolute-addresses-on-IA-32.patch \
>              file://my.cnf \
>              file://mysqld.sh"
>   


