Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 261F56B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 06:18:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2018 22:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,390,1511856000"; d="scan'208";a="12828774"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2018 22:18:34 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 22:18:32 -0800
Message-Id: <2fcc309f17272e9a48658e5269141b92c8b94278.1516515289.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1516515289.git.timothy.t.orling@linux.intel.com>
References: <cover.1516515289.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libdbd-mysql-perl: upgrade 4.036 -> 4.043
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
X-List-Received-Date: Sun, 21 Jan 2018 06:18:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:

2017-06-29 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.043)

YOUR ATTENTION PLEASE, THIS IS A REVERT TO 4.041
This version is the same as 4.041 with all its bugs and
limitations. In version 4.042 there were some changes to Unicode handling
that turned out to be causing issues with existing implementations.
While it is possible to argue that the old behaviour was wrong and buggy,
lots of applications and scripts were depending on this behaviour so it
is NOT a good idea to change this.

There were lots of commits since 4.041, we'll add those back bit by bit
in a future release, excluding the ones which cause problems.

2017-??-?? Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.042_01)
* Use Devel::CheckLib 1.09 or newer, fixes
   https://github.com/perl5-dbi/DBD-mysql/issues/109
* Improve CI testing on AppVeyor: caching, path to cpan, configure deps (pali)
* Specify bigint as test dependency.

2017-03-08 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.042)
* Full release to include development releases 4.041_2 and 4.041_1.

2017-02-28 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.041_2)
* Statement handle now also has mysql_sock attribute, just as database handle.
  (by Pali)
* Fix type conversions for magic types. Issue reported by Dmitriy Yatsenko and
  Giovanni Bechis, fix by Pali.
    https://lists.amavis.org/pipermail/amavis-users/2016-December/004674.html
    https://github.com/perl5-dbi/DBD-mysql/issues/78
* Fix UTF8-encoding of table names, field names, warnings and error messages.
  Reported by Tanabe Yoshinori, fix by Pali.
    https://rt.cpan.org/Public/Bug/Display.html?id=120141
* Fix mysql_auto_reconnect when using mysql_server_prepare (pali). Reported by
  Vladimir Marek.
    https://github.com/perl5-dbi/DBD-mysql/pull/95
* Improve regex for removing database from dsn (pali)
    https://rt.cpan.org/Public/Bug/Display.html?id=118837
* Locate MySQL libs using Devel::CheckLib (pali)
* Support async on Windows (pali)

* Fix test suite on range of older and newer MySQL and MariaDB versions
   (https://github.com/perl5-dbi/DBD-mysql/pull/87)
* Fix compilation on MySQL 4.1 (pali)
* Do not leak dangling pointer to mysql result (pali)
* Fix logic when assigning to variable bind_comment_placeholders (pali)
* mysql_fd() still returned file descriptor after closing connection.
  Reported by Larry Leszczynski, fixed by Pali Rohár.
   (https://rt.cpan.org/Public/Bug/Display.html?id=110983)
* Fix parsing configure libs from mysql_config --libs output in Makefile.PL
  Libraries in mysql_config --libs output can be specified by library name
  with the -l prefix or by absolute path to library name without any prefix.
  Parameters must start with a hyphen, so treat all options without leading
  hyphen in mysql_config --libs output as libraries with full path.
  Partially fixes bug https://rt.cpan.org/Public/Bug/Display.html?id=100898
  Fix by Pali Rohár.
* Fix support for magic scalars (pali)
   (https://github.com/perl5-dbi/DBD-mysql/pull/76)

2016-12-12 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.041_1)
* Unicode fixes: when using mysql_enable_utf8 or mysql_enable_utf8mb4,
  previous versions of DBD::mysql did not properly encode input statements
  to UTF-8 and retrieved columns were always UTF-8 decoded regardless of the
  column charset.
  Fix by Pali Rohár.
  Reported and feedback on fix by Marc Lehmann
  (https://rt.cpan.org/Public/Bug/Display.html?id=87428)
  Also, the UTF-8 flag was not set for decoded data:
  (https://rt.cpan.org/Public/Bug/Display.html?id=53130)
* Return INTs with ZEROFILL as strings. Reported by Knarf, fix by Pali Rohár.
  (https://rt.cpan.org/Public/Bug/Display.html?id=118977)

2016-11-28 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.041)
* Fix use-after-free for repeated fetchrow_arrayref calls when
  mysql_server_prepare=1

  Function dbd_st_fetch() via Renew() can reallocate output buffer for
  mysql_stmt_fetch() call. But it does not update pointer to that buffer in
  imp_sth->stmt structure initialized by mysql_stmt_bind_result() function.
  That leads to use-after-free in any mysql function which access
  imp_sth->stmt structure (e.g. mysql_stmt_fetch()).

  This patch fix this problem and properly updates pointer in imp_sth->stmt
  structure after Renew() call.
  This is a medium level security issue to which the Debian security team
  assigned identifier CVE-2016-1251. Discovered and fixed by Pali Rohár.

* auto_reconnect now also matches  CR_SERVER_LOST, previously this only
  matched CR_SERVER_GONE.
  Fixes http://bugs.mysql.com/bug.php?id=27613
  Fix suggested by Wouter de Jong.
* Fix compilation fixes (Pali Rohár).

2016-11-19 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.040)
* Since 4.038 we had problems compiling on big-endian architectures, such
  as MIPS, s390 and Sparc. Thanks to Salvatore Bonaccorso @ Debian project
  (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=844538)
  and Vladimir Marek (https://rt.cpan.org/Public/Bug/Display.html?id=118835)
  for reporting the issues. Fix by Pali Rohár.

  Fix integer types when server side prepare statements are enabled
  Fixed problems:
  * SQL_BIGINT was incorrectly handled as 32bit MYSQL_TYPE_LONG type instead
    64bit MYSQL_TYPE_LONGLONG which led to integer overflow/underflow
  * 32bit MYSQL_TYPE_LONG was used for perl's IV storage when IV was 64bit
    and 64bit MYSQL_TYPE_LONGLONG was used when IV was 32bit
  * All unsigned types were handled as signed, so all high positive values
    were treated as negative
  * Numeric conversions in perl which led to overflow/underflow was ignored
    even when mysql strict mode was enabled
  * Test t/41int_min_max.t was running only for normal non-prepared statements
  * Test t/40server_prepare.t used incorrect SQL type for big (64bit) integers

2016-11-15 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.039)
* Fix for security issue Out-of-bounds read by DBD::mysql CVE-2016-1249 (pali)

2016-10-30 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.038_01)
* Fix compilation of embedded server (pali)
  (https://github.com/perl5-dbi/DBD-mysql/pull/68)
* Fix compilation against libmariadbclient. First version by
  H.Merijn Brand, improved by Bernt Johnsen @ Oracle.
* For efficiency use newSVpvn() instead newSVpv() where possible (pali)
* Correctly coerce fetched scalar values when mysql_server_prepare is
  not used (pali)
* Add support for fetching columns of BIT type with
  mysql_server_prepare = 1 (pali)
  Fixes https://rt.cpan.org/Public/Bug/Display.html?id=88006
* Use correct format in printf instead of casting variable types (pali)
* Include errno.h for MYSQL_ASYNC because it uses errno variable (pali)
* Travis: also test on perl 5.22 and 5.24.

2016-10-19 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.038)
* Version 4.037_1 had fixes for MySQL 8.0 provided
  Bernt Johnsen @ Oracle that were not in the Changelogs
  (https://github.com/perl5-dbi/DBD-mysql/pull/56)
* Fixes for compiling against newer libmysqlclient on Windows (kmx)
* Fix unit test for 40server_prepare_crash on Windows (pali)
* Perl's IV in scalar can store 64bit integer when perl was compiled
  with 64 bit support (default on 64bit linux with gcc). Use this
  feature and stores MYSQL_TYPE_LONGLONG as integers instead of strings
  when possible. (pali, https://github.com/perl5-dbi/DBD-mysql/pull/57)

2016-10-14 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.037_01)
* Newest versions of libmysqlclient and the MariaDB C connector no longer
  export the __WIN__ macro. If this macro is not present we would not
  compile in the poll.h-based async-support. Changed to use the _WIN32
  macro instead. Thanks to Sergei Golubchik for suggesting the fix.
* Fix from Pali Rohár for use-after-free in prepared statements,
  changes to bind logic, and added test 40server_prepare_crash.

2016-10-03 Patrick Galbraith, Michiel Beijen, DBI/DBD community (4.037)
* Security release to patch possible buffer overflow in unsafe sprintf with
  variable length. Reported and fixed by Pali Rohár. This vulnerability
  is present in all releases at least back to versions 3.0 of the
  driver, which were released in 2005.
  The CVE identifier for this vulnerability is CVE-2016-1246.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/{libdbd-mysql-perl_4.036.bb => libdbd-mysql-perl_4.043.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.036.bb => libdbd-mysql-perl_4.043.bb} (85%)

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
similarity index 85%
rename from meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb
rename to meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
index f5dbef2af..bd8ba780a 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MICHIELB/DBD-mysql-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "fdee1d8dc4ae54bc6cb7cd5a3f3d3342"
-SRC_URI[sha256sum] = "5c48a823f86b8110ccb6504c6176ca248b52f56829dd4548bc39c3509f4154cf"
+SRC_URI[md5sum] = "4a00dd7f1c057931147c65dfc4901c36"
+SRC_URI[sha256sum] = "629f865e8317f52602b2f2efd2b688002903d2e4bbcba5427cb6188b043d6f99"
 
 S = "${WORKDIR}/DBD-mysql-${PV}"
 
-- 
2.13.6


