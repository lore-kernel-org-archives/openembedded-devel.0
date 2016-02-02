Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38055772AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:05:53 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id gi1so8644995pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2016 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=NtWNcqAoXVUxyxymHq2Y/+vvWF01M2ROoACNAV7DQWs=;
	b=k/jowJZzRWFj3f1bHSMmcCDuAyE+a1Z6IpY6bgammipPEGV4MYJhpCiUSAwlzY9c/5
	diMMo9YNS8gd5/fEfErXswUNmabECcPeMaQGZZX7JRP1hnTwp4iuOD7WXPNxdFfuUXuI
	AHNkUejh/KLvQuYTwzqwhOjBqsKWN9VmB6YsHh9nn/41XRoXNy8tHfm5gqFQicKVDQRa
	+gI0Go4mwYxCn8CYyIEPDK6vQv+dWgjfNpEtUSh0joI0RbXi4/3poxz+ifCw5pBvc4op
	LSd5e7MztyOJhhIslgF6Yse8z10EWgE29An6NHSKac2QMbuOUR5TkirmdxUFTtTlDoHe
	94oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NtWNcqAoXVUxyxymHq2Y/+vvWF01M2ROoACNAV7DQWs=;
	b=bCAN+zNf5Gh0uX7ylPgAW43rWyDycb8SIe6UplVps4dMMJ9IoJAYU2qevlFyTepgut
	LD26hlNuBDaoqWVZLSNALyjQtYzP9mGlK9Th1G1QCBD5PfBGJlkBx4jVTE8rKVUaDdIo
	P01vQFLI0Lgee7hrSlfl1GSeWTql37P0cTsegb9ryVpYUrePnL630n4y/on+g9F1pOjJ
	Rnf0qJCg/cNCuWjA0zsRRKrwMbGcl4t5dUKGNuCdyQBggF9OicL5RrRks0GVRFAXhgPa
	yOHCi0LdIWNsgTfVsze/GUA5WDtFeVfxc/WFMj8ddYGfwxBUE9LzGV4ReaJpAG/bGy8q
	zOkg==
X-Gm-Message-State: AG10YORW6LTJiB4VXbKt5cpon8WgRDVyy/2BWR3i/1p4t+ZvAEHPw+sTwpSR+PcgT7Cq6A==
X-Received: by 10.66.158.169 with SMTP id wv9mr48450872pab.138.1454432754839; 
	Tue, 02 Feb 2016 09:05:54 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:cd4a:4063:c7f1:4a4?
	([2601:202:4000:1239:cd4a:4063:c7f1:4a4])
	by smtp.googlemail.com with ESMTPSA id
	d8sm3944173pas.14.2016.02.02.09.05.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Feb 2016 09:05:53 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <cover.1454356312.git.akuster808@gmail.com>
	<CA+chaQcekCM8pEoA1v9EARQjuc1JUJ_i0GwnawRKVra=Rgcz6g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56B0E1EC.4060801@gmail.com>
Date: Tue, 2 Feb 2016 09:05:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcekCM8pEoA1v9EARQjuc1JUJ_i0GwnawRKVra=Rgcz6g@mail.gmail.com>
Subject: Re: [PATCH 00/29][jethro] Pull request Jethro-next
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
X-List-Received-Date: Tue, 02 Feb 2016 17:05:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 02/01/2016 12:12 PM, Martin Jansa wrote:
>   waf-samba.bbclass: add cross-answers option and files
> 
> This one isn't in master yet.

k. So I will pull that out.

> 
>   mariadb: -native also needs gold workaround
I will look for this one.

> 
> This one breaks build for older host systems like Ubuntu 12.04, I'm not
> sure if it's worth taking to release branch (people who need this fix and
> have new enough host systems can apply the change in their setup only).

k. thanks,

will clean up and resubmit.

- armin

> 
> Regards,
> 
> On Mon, Feb 1, 2016 at 8:59 PM, Armin Kuster <akuster808@gmail.com> wrote:
> 
>> Please consider these for the meta-openembedded jethro-next
>>
>> The following changes since commit
>> 7bc138a365e20653ddfb9229561e3e9e50b89ee8:
>>
>>   cifs-utils: add PACKAGECONFIG for cifsidmap (2016-01-14 11:22:38 +0100)
>>
>> are available in the git repository at:
>>
>>   git://github.com/akuster/meta-openembedded akuster/jethro-next
>>   https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next
>>
>> Andreas Müller (1):
>>   thunar: remove udisks from RRECOMMENDS
>>
>> Armin Kuster (5):
>>   networkmanager: fix QA warning
>>   qwt:  Fix host-user-contaminated
>>   php: Security fix CVE-2015-7803
>>   php: Security fix CVE-2015-7804
>>   php: Security fix CVE-2016-1903
>>
>> Christopher Larson (1):
>>   lowpan-tools: add missing flex/bison deps
>>
>> Hongxu Jia (1):
>>   postfix: fix clean broken issue
>>
>> Jackie Huang (4):
>>   iscsitarget: split the kernel module into separate package
>>   iscsitarget: skip the arch test for kernel modules
>>   ncftp: fix build failures with ccdv
>>   waf-samba.bbclass: add cross-answers option and files
>>
>> Jens Rehsack (1):
>>   waf-samba: enable parallel builds
>>
>> Joe Slater (1):
>>   geoip: add ptest functionality
>>
>> Kai Kang (1):
>>   xl2tpd: fix warnings with gcc 5
>>
>> Koen Kooi (1):
>>   mariadb: -native also needs gold workaround
>>
>> Maciej Borzecki (1):
>>   mozjs: fix linking issues on i586
>>
>> Mark Asselstine (1):
>>   ctdb: Fix rootfs creation errors
>>
>> Martin Jansa (2):
>>   ctdb: add dependency on libldb
>>   terminus-font: update perl-native-runtime dependency
>>
>> Qi.Chen@windriver.com (1):
>>   quagga: fix segment fault when stopping ospf6d
>>
>> Robert Yang (4):
>>   nbd: use BPN in Files
>>   cim-schema-exper: fix host-user-contaminated
>>   ctdb: add PACKAGECONFIG for libtdb
>>   netkit-ftp: fixed invalid symlink
>>
>> Ruslan Bilovol (1):
>>   wireshark: update SRC_URI link to sources
>>
>> Wenzong Fan (1):
>>   samba: add PACKAGECONFIG for valgrind
>>
>> Yi Zhao (2):
>>   logwatch: fix host-user-contaminated
>>   orrery: fix host-user-contaminated
>>
>>  .../21-add-config-option-without-valgrind.patch    |  63 ++++++++++
>>  .../recipes-connectivity/samba/samba_4.1.12.bb     |   2 +
>>  .../ncftp-configure-use-BUILD_CC-for-ccdv.patch    |  32 +++++
>>  .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |   7 +-
>>  .../recipes-daemons/postfix/postfix.inc            |   2 +
>>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  13 +-
>>  .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |   2 +-
>>  ...heck-ospf6-before-using-it-in-ospf6_clean.patch |  28 +++++
>>  .../recipes-protocols/quagga/quagga_0.99.24.1.bb   |   1 +
>>  .../recipes-protocols/xl2tpd/xl2tpd.inc            |   4 +-
>>  .../fix-inline-functions-errors-with-gcc-5.x.patch | 134
>> +++++++++++++++++++++
>>  .../cim-schema/cim-schema-exper_2.39.0.bb          |   1 +
>>  .../cim-schema/cim-schema-final_2.40.0.bb          |   1 +
>>  ...rvice-ensure-the-PID-directory-is-created.patch |  25 ++++
>>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  11 +-
>>  .../recipes-support/geoip/files/run-ptest          |  11 ++
>>  .../recipes-support/geoip/geoip_1.6.6.bb           |  38 ++++++
>>  .../lowpan-tools/lowpan-tools_git.bb               |   2 +-
>>  meta-networking/recipes-support/nbd/nbd_3.11.bb    |   6 +-
>>  .../recipes-support/wireshark/wireshark_1.12.8.bb  |   2 +-
>>  meta-oe/classes/waf-samba.bbclass                  |  47 +++++++-
>>  meta-oe/conf/layer.conf                            |   1 +
>>  meta-oe/files/waf-cross-answers/README             |   3 +
>>  .../waf-cross-answers/cross-answers-aarch64.txt    |  38 ++++++
>>  .../files/waf-cross-answers/cross-answers-arm.txt  |  39 ++++++
>>  .../files/waf-cross-answers/cross-answers-i586.txt |  39 ++++++
>>  .../files/waf-cross-answers/cross-answers-i686.txt |  39 ++++++
>>  .../files/waf-cross-answers/cross-answers-mips.txt |  39 ++++++
>>  .../waf-cross-answers/cross-answers-mips64.txt     |  38 ++++++
>>  .../waf-cross-answers/cross-answers-powerpc.txt    |  39 ++++++
>>  .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 ++++++
>>  .../waf-cross-answers/cross-answers-x86_64.txt     |  38 ++++++
>>  .../networkmanager/networkmanager_1.0.4.bb         |   1 +
>>  .../php/php-5.6.12/CVE-2015-7803.patch             |  85 +++++++++++++
>>  .../php/php-5.6.12/CVE-2015-7804.patch             |  64 ++++++++++
>>  .../php/php-5.6.12/CVE-2016-1903.patch             |  55 +++++++++
>>  meta-oe/recipes-devtools/php/php_5.6.12.bb         |   6 +-
>>  .../recipes-extended/logwatch/logwatch_7.4.1.bb    |   1 +
>>  ...010-fix-cross-compilation-on-i586-targets.patch |  46 +++++++
>>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   1 +
>>  .../terminus-font/terminus-font_4.38.bb            |   2 +-
>>  meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   1 +
>>  meta-oe/recipes-qt/qwt/qwt.inc                     |   1 +
>>  meta-oe/recipes-support/mysql/mariadb.inc          |   3 +
>>  meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |   2 +-
>>  45 files changed, 1029 insertions(+), 23 deletions(-)
>>  create mode 100644
>> meta-networking/recipes-connectivity/samba/samba-4.1.12/21-add-config-option-without-valgrind.patch
>>  create mode 100644
>> meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch
>>  create mode 100644
>> meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
>>  create mode 100644
>> meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
>>  create mode 100644
>> meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
>>  create mode 100644 meta-networking/recipes-support/geoip/files/run-ptest
>>  create mode 100644 meta-oe/files/waf-cross-answers/README
>>  create mode 100644
>> meta-oe/files/waf-cross-answers/cross-answers-aarch64.txt
>>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-arm.txt
>>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i586.txt
>>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i686.txt
>>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips.txt
>>  create mode 100644
>> meta-oe/files/waf-cross-answers/cross-answers-mips64.txt
>>  create mode 100644
>> meta-oe/files/waf-cross-answers/cross-answers-powerpc.txt
>>  create mode 100644
>> meta-oe/files/waf-cross-answers/cross-answers-powerpc64.txt
>>  create mode 100644
>> meta-oe/files/waf-cross-answers/cross-answers-x86_64.txt
>>  create mode 100644
>> meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7803.patch
>>  create mode 100644
>> meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7804.patch
>>  create mode 100644
>> meta-oe/recipes-devtools/php/php-5.6.12/CVE-2016-1903.patch
>>  create mode 100644
>> meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-compilation-on-i586-targets.patch
>>
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

