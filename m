Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B09FB75CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:46:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAB3kkAR017394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Nov 2015 19:46:46 -0800 (PST)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 Nov 2015 19:46:45 -0800
To: <openembedded-devel@lists.openembedded.org>, <Martin.Jansa@gmail.com>
References: <1446346332-19991-1-git-send-email-Randy.MacLeod@windriver.com>
	<56358109.7070208@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5642BA24.80008@windriver.com>
Date: Tue, 10 Nov 2015 22:46:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56358109.7070208@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [meta-oe][PATCH] mariadb: update to 5.5.46
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
X-List-Received-Date: Wed, 11 Nov 2015 03:46:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-10-31 11:03 PM, Randy MacLeod wrote:
>
>
> I'd like to update both master and jethro to mariadb-5.5.46.

Martin,

I see that you have pulled into master, thanks.

It's quite a bit of work to cherry-picking 10+ of CVE fixes,
any chance of pulling  mariadb-5.5.46 into jethro?
I also understand that you have to draw the line and keep
the release branches stable but I think mariadb-5.5.46 does
that as I've explained below.

Thanks,
../Randy
>
> mariadb-5.5.46 is a bug fix only update based on my analysis
> and the projects release notes (both below)
>
> This update would fix these 11 CVEs:
> CVE-2015-4802
> CVE-2015-4807
> CVE-2015-4815
> CVE-2015-4826
> CVE-2015-4830
> CVE-2015-4836
> CVE-2015-4858
> CVE-2015-4861
> CVE-2015-4870
> CVE-2015-4913
> CVE-2015-4792
>
> The CVE list is from:
> https://mariadb.com/kb/en/mariadb/mariadb-5546-release-notes/
>
> Full changelog:
> https://mariadb.com/kb/en/mariadb/mariadb-5546-changelog/
>
>
> Using the updated recipe, I've built:
>
> $ for i in \
> qemux86 qemux86-64 qemuarm qemuarm64 qemumips qemumips64; \
> do \
> MACHINE=$i bitbake mariadb; \
> done
>
>
> As I mentioned above, mariadb-5.5.46 is claimed to be a bug fix
> only update. In reviewing all commits, I've noticed:
>   - one config file change that appears to be backwards compatible.
>   - a few other commits that were not clearly marked as internal
>     bug fixes but appear to be sensible for a production release
>     and are shown below.
>
>
> Using the git repo, there are 68 commits in this release:
>
> $ git log --oneline mariadb-5.5.46 ^mariadb-5.5.45 | wc -l
> 68
>
> diffstat bottom line:
>   112 files changed, 2263 insertions(+), 488 deletions(-)
>
> Here are the commits that seemed to warrent a closer look:
>
> $ git show b976852 == Updated yassl to yassl-2.3.8
> +yaSSL Release notes, version 2.3.8 (9/17/2015)
> + This release of yaSSL fixes a high security vulnerability. \
> All users
> + SHOULD update.
>
> $ git show 8fe0708
> commit 8fe0708808ddba0d85798d0cd9100b3173064081
> Merge: 608efca 557a57f
> Author: Mithun C Y <mithun.c.y@oracle.com>
> Date: Mon Aug 17 15:26:01 2015 +0530
>
> Merge branch 'mysql-5.1' into mysql-5.5
>
> $ git show 8fe0708 | diffstat
> 0 files changed
>
>
> $ git show 5cc149f == The compiler warnings fixed.
> - if (null_value=arg->null_value)
> + if ((null_value=arg->null_value))
> ...
> - if (null_value= arg->null_value)
> + if ((null_value= arg->null_value))
>
>
> $ git show 75f43c5
> == Small change to default config for Docker-speci
> commit 75f43c5f6a5332894cf2d90ab2c04cc62c5ad18b
> Author: Lars Tangvald <lars.tangvald@oracle.com>
> Date: Wed Aug 19 14:17:50 2015 +0200
>
> Small change to default config for Docker-specific rpm package
> Syncs "official" and our own Docker images
>
> diff --git a/packaging/rpm-docker/my.cnf b/packaging/rpm-docker/my.cnf
> ...
> +skip-host-cache
> +skip-name-resolve
>
>
> --------------------
> $ git log --oneline mariadb-5.5.46 ^mariadb-5.5.45 |cut -c -55
> 16c4b3c fixes for buildbot:
> f41a41f Merge branch 'merge-xtradb-5.5' into 5.5
> db79f4c 5.5.45-37.4
> 82e9f6d Merge remote-tracking branch 'mysql/5.5' into 5
> c8d5112 MDEV-8796 Delete with sub query with informatio
> 504802f MDEV-7846: postreview fix
> 54b9981 MDEV-7846: Server crashes in Item_subselect::fi
> 0ab93fd MDEV-7445:Server crash with Signal 6 MDEV-7565:
> 2e3e818 MDEV-7445: Server crash with Signal 6
> 7ccde2c MDEV-7565: Server crash with Signal 6 (part 2)
> 006acf7 Bug #68148: drop index on a foreign key column
> a95711e MDEV-8855: innodb.innodb-fk-warnings fails on W
> 02a38fd MDEV-8624: MariaDB hangs on query with many log
> f804b74 MDEV-8154 rpl.show_status_stop_slave_race-7126
> ce7d8c5 MDEV-7330 plugins.feedback_plugin_send fails sp
> bdcf370 MDEV-7933 plugins.feedback_plugin_send depends
> 2563609 Increased the version number
> 86ed494 MDEV-8849 rpl.rpl_innodb_bug30888 sporadically
> dca4ab9 MDEV-8841 innodb_zip.innodb-create-options fail
> 5cc149f The compiler warnings fixed.
> b976852 Updated yassl to yassl-2.3.8
> 0243a2d Bug #21025377 CAN'T CONNECT TO SSL ENABLED SERV
> 29ac245 MDEV-8473: mysqlbinlog -v does not properly dec
> 102a85f MDEV-8663: IF Statement returns multiple values
> b1895fb Bug#21527467 - RPM SCRIPTS FAIL WITH MULTIPLE D
> e414cbf BUG#20449914: HANDLE_FATAL_SIGNAL (SIG=11) IN
> f4ff086 Bug#20198490 : LOWER_CASE_TABLE_NAMES=0 ON WIND
> 75f43c5 Small change to default config for Docker-speci
> ee02650 Bug #16171518 - LOAD XML DOES NOT HANDLE EMPTY
> 93ac0eb BUG#11754258: INCORRECT ERROR MESSAGE WHEN CREA
> 8fe0708 Merge branch 'mysql-5.1' into mysql-5.5
> 557a57f Bug #21350175: SUBQUERIES IN PROCEDURE CLAUSE O
> 608efca Bug #21025880 DUPLICATE UK VALUES IN READ-COMMI
> f59d68e BUG#21102971 data corruption on arm64
> 552b1c8 Merge branch 'mysql-5.1' into mysql-5.5
> f3dce25 Bug #20760261 mysqld crashed in materialized_cu
> 1d31744 Follow-up fix : Bug #18145121 - DEPRECATED PERL
> 67be190 Follow up Fix: Bug #18145121 - DEPRECATED PERL
> c20911d Merge branch 'mysql-5.1' into mysql-5.5
> c28626d Bug #21096444: MYSQL IS TRYING TO PERFORM A CON
> 91a427b Merge branch 'mysql-5.1' into mysql-5.5
> 9372c9e Bug #20909518: HANDLE_FATAL_SIGNAL (SIG=11) IN
> b2df544 Merge branch 'mysql-5.1' into mysql-5.5
> 8006ad8 Bug #20909518: HANDLE_FATAL_SIGNAL (SIG=11) IN
> 18b2c77 Merge branch 'mysql-5.1' into mysql-5.5
> 641ab6f Bug #20796566 ERROR: INSERT BUFFER INSERT FAI
> 9cbd6d7 Merge branch 'mysql-5.5.45-release' into mysql-
> b5380e0 BUG#19886430: VIEW CREATION WITH NAMED COLUMNS,
> 888fabd Bug #21143080: UPDATE ON VARCHAR AND TEXT COLUM
> e57e1b2
> 067ae38 Bug #20168526 YASSL: CORRUPT SSL-KEY CRASHES CL
> 6fb2cdb Bug #20777016: DELETE CHECKS PRIVILEGES ON THE
> 49667f0 Bug#21374104 SETUP_TIMERS INITIALIZATION ASSUME
> c773b32 Merge branch 'mysql-5.1' into mysql-5.5
> 33a2e5a Bug #20238729: ILLEGALLY CRAFTED UTF8 SELECT PR
> 7255ae6 Bug #20774956: THREAD_POOL.THREAD_POOL_CONNECT
> e7ff204 Bug #21025377 CAN'T CONNECT TO SSL ENABLED SERV
> c9685a7 Bug #20168526 YASSL: CORRUPT SSL-KEY CRASHES CL
> bf681d6 Bug #20802751 - SEGMENTATION FAILURE WHEN RUNNI
> 359f102 BUG#16613004 PARTITIONING DDL, CRASH IN FIELD_V
> 2ac01ca Bug#18487951 - QUERY_CACHE_MIN_RES_UNIT SET TO
> 7ce304d Bug#18487951 - QUERY_CACHE_MIN_RES_UNIT SET TO
> 7c5d18e Bug #20772273 : MYSQLIMPORT --USE-THREADS DOESN
> 9068238 Bug# 20376760: STACK-BUFFER-OVERFLOW WITH LONG
> 0eadada BUG#20310212 PARTITION DDL- CRASH AFTER THD::NO
> 1b1161a Empty version change upmerge
> 8f87d6c Raise version number after tagging 5.1.76
> da0089a Raise version number after cloning 5.5.45
>
>
>
> ../Randy
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

