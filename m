Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id AA2F96EADE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:23:46 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WD9ZB-00072n-Q4 for openembedded-devel@lists.openembedded.org;
	Tue, 11 Feb 2014 10:23:45 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 10:23:45 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 10:23:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Feb 2014 10:25:17 +0100
Message-ID: <ldcq6a$ko6$1@ger.gmane.org>
References: <1392097295-32258-1-git-send-email-rongqing.li@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1392097295-32258-1-git-send-email-rongqing.li@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-networking][PATCH] proftpd: move the runing created file under /var/run
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
X-List-Received-Date: Tue, 11 Feb 2014 09:23:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rongqing.li@windriver.com schreef op 11-02-14 06:41:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>

Looks good to me:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> --- .../proftpd/files/move-runfile-to-var-run.patch    |   39
> ++++++++++++++++++++ .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |
> 1 + 2 files changed, 40 insertions(+) create mode 100644
> meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
>
>  diff --git
> a/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
> b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
>
> 
new file mode 100644
> index 0000000..1561ed8 --- /dev/null +++
> b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
>
> 
@@ -0,0 +1,39 @@
> +redefine PR_RUN_DIR as ${localstatedir}/run + +Upstream-Status:
> Inappropriate [configuration] + +Signed-off-by: Roy Li
> <rongqing.li@windriver.com> +--- + configure    |    2 +- + configure.in
> |    2 +- + 2 files changed, 2 insertions(+), 2 deletions(-) + +diff
> --git a/configure b/configure +index ebed38e..445d5bc 100755 +---
> a/configure ++++ b/configure +@@ -33579,7 +33579,7 @@ _ACEOF + + + cat
> >>confdefs.h <<_ACEOF +-#define PR_RUN_DIR "`eval echo
> "${localstatedir}"`" ++#define PR_RUN_DIR "`eval echo
> "${localstatedir}"/run/`" + _ACEOF + + cat >>confdefs.h <<_ACEOF +diff
> --git a/configure.in b/configure.in +index c17929c..df9186a 100644 +---
> a/configure.in ++++ b/configure.in +@@ -2788,7 +2788,7 @@
> locale_dir="`eval echo ${localedir}`" + locale_dir="`eval echo
> ${locale_dir}`" + AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo
> "${locale_dir}"`") + +-AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo
> "${localstatedir}"`") ++AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo
> "${localstatedir}/run"`") + AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH,
> "`eval echo "${sysconfdir}/proftpd.conf"`") +
> AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo
> "${localstatedir}/run/proftpd.pid"`") + +-- +1.7.10.4 + diff --git
> a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb index
> eb502d6..cfbadfb 100644 ---
> a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb +++
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb @@ -14,6
> +14,7 @@ SRC_URI =
> "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \ 
> file://default \ file://move-pidfile-to-var-run.patch \ 
> file://close-RequireValidShell-check.patch \ +
> file://move-runfile-to-var-run.patch \ "
> 
> SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS+ex9MkyGM64RGpERAtFhAJ4tLBnVXI5xKc0iYoO3yshkzptqpQCgsttg
h+XRSssUW4vt2C7+O6LKyiI=
=y2I2
-----END PGP SIGNATURE-----


