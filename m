Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 84865605F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 08:42:11 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YJeUM-00053V-J7 for openembedded-devel@lists.openembedded.org;
	Fri, 06 Feb 2015 09:42:10 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 09:42:10 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 09:42:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 Feb 2015 09:41:49 +0100
Message-ID: <mb1uod$cqu$1@ger.gmane.org>
References: <1423202386-4040-1-git-send-email-rongqing.li@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
In-Reply-To: <1423202386-4040-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] mariadb: make it be able to work with SELinux
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
X-List-Received-Date: Fri, 06 Feb 2015 08:42:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rongqing.li@windriver.com schreef op 06-02-15 om 06:59:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 1. change the datadir from /var/mysql to /var/lib/mysql 2. after creating
> datedir, restorecon on it, make SELinux be able to work 3. Add the
> PIDFile for systemd unit file, otherwise systemctl can not stop mysqld

Shouldn't those all use the ${localstatedir} variable instead of hardcoding?


> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com> --- 
> meta-oe/recipes-support/mysql/mariadb.inc            | 1 + 
> meta-oe/recipes-support/mysql/mariadb/my.cnf         | 2 +- 
> meta-oe/recipes-support/mysql/mariadb/mysqld.service | 1 + 3 files
> changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
> b/meta-oe/recipes-support/mysql/mariadb.inc index 8068862..f385bfc
> 100644 --- a/meta-oe/recipes-support/mysql/mariadb.inc +++
> b/meta-oe/recipes-support/mysql/mariadb.inc @@ -128,6 +128,7 @@
> pkg_postinst_${PN}-server () {
> 
> mysql_install_db --basedir=${prefix} --user=mysql
> 
> +    [ -x /sbin/restorecon ] && /sbin/restorecon -RF /var/lib/mysql }
> 
> PACKAGES = "${PN}-dbg ${PN} \ diff --git
> a/meta-oe/recipes-support/mysql/mariadb/my.cnf
> b/meta-oe/recipes-support/mysql/mariadb/my.cnf index 876ce36..28d3899
> 100644 --- a/meta-oe/recipes-support/mysql/mariadb/my.cnf +++
> b/meta-oe/recipes-support/mysql/mariadb/my.cnf @@ -13,7 +13,7 @@ socket
> = /var/lib/mysql/mysql.sock pid-file 					= /var/lib/mysql/mysqld.pid 
> log-error 					= /var/log/mysqld.err basedir 					= /usr -datadir 					=
> /var/mysql +datadir 					= /var/lib/mysql skip-external-locking 
> skip-networking ignore-builtin-innodb diff --git
> a/meta-oe/recipes-support/mysql/mariadb/mysqld.service
> b/meta-oe/recipes-support/mysql/mariadb/mysqld.service index
> 18ad8d5..757d038 100644 ---
> a/meta-oe/recipes-support/mysql/mariadb/mysqld.service +++
> b/meta-oe/recipes-support/mysql/mariadb/mysqld.service @@ -4,6 +4,7 @@
> After=syslog.target After=network.target
> 
> [Service] +PIDFile=/var/lib/mysql/mysqld.pid Type=simple User=mysql 
> Group=mysql
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU1H5NMkyGM64RGpERAiEDAJ9sJEaiGqhauXo0DJD2+cgMPshg8wCgsfHO
DBiU69t3NR66pAvdQyNlh/Y=
=KiCJ
-----END PGP SIGNATURE-----


