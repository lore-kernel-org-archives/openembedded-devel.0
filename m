Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82C1D701F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 14:39:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8GEda3k006445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 07:39:36 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Sep 2014 07:39:35 -0700
Message-ID: <54184BA6.9020907@windriver.com>
Date: Tue, 16 Sep 2014 22:39:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1410875680-1588-1-git-send-email-liezhi.yang@windriver.com>
	<1569682.xrAECxOGjv@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1569682.xrAECxOGjv@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] mariadb: drop anonymous function
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
X-List-Received-Date: Tue, 16 Sep 2014 14:39:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2014 10:30 PM, Paul Eggleton wrote:
> Hi Robert,
>
> On Tuesday 16 September 2014 06:54:40 Robert Yang wrote:
>> The anonymous function redefined bindir to bindir_noprefix (and others),
>> which broke the sstate between build dirs. After checked the vars in
>> CMakeCache.txt, we can drop it safely, and the builds are OK.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta-oe/recipes-support/mysql/mariadb_5.5.39.inc |   28
>> +++++++--------------- 1 file changed, 8 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
>> b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc index 9cc2cc9..f5c0a1f
>> 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
>> @@ -35,18 +35,6 @@ SYSTEMD_AUTO_ENABLE_mariadb-server = "disable"
>>
>>   EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
>>
>> -python __anonymous() {
>> -    # This is a pain but it's the only way to pass these in since
>> -    # MariaDB's cmake scripts insist on prepending the prefix to the
>> -    # specified values for INSTALL_*
>> -    localdata = d.createCopy()
>> -    localdata.setVar('prefix', '')
>> -    localdata.setVar('exec_prefix', '')
>> -    d.setVar('bindir_noprefix', localdata.getVar('bindir',
>> True).lstrip('/')) -    d.setVar('sbindir_noprefix',
>> localdata.getVar('sbindir', True).lstrip('/')) -
>> d.setVar('datadir_noprefix', localdata.getVar('datadir', True).lstrip('/'))
>> -    d.setVar('libdir_noprefix', localdata.getVar('libdir',
>> True).lstrip('/')) -}
>>
>>   PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam',
>> '', d)}" PACKAGECONFIG_class-native = ""
>> @@ -64,15 +52,15 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>>                    -DNROFF=FALSE \
>>                    -DENABLE_DTRACE=FALSE \
>>                    -DWITH_PIC=ON \
>> -                 -DINSTALL_DOCDIR:PATH=${datadir_noprefix}/doc/${BPN} \
>> -                 -DINSTALL_BINDIR:PATH=${bindir_noprefix} \
>> -                 -DINSTALL_SBINDIR:PATH=${sbindir_noprefix} \
>> -                 -DINSTALL_SCRIPTDIR:PATH=${bindir_noprefix} \
>> -                 -DINSTALL_LIBDIR:PATH=${libdir_noprefix} \
>> -                 -DINSTALL_PLUGINDIR:PATH=${libdir_noprefix}/plugin \
>> +                 -DINSTALL_DOCDIR:PATH=${datadir}/doc/${BPN} \
>> +                 -DINSTALL_BINDIR:PATH=${bindir} \
>> +                 -DINSTALL_SBINDIR:PATH=${sbindir} \
>> +                 -DINSTALL_SCRIPTDIR:PATH=${bindir} \
>> +                 -DINSTALL_LIBDIR:PATH=${libdir} \
>> +                 -DINSTALL_PLUGINDIR:PATH=${libdir}/plugin \
>>                    -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
>> -                 -DINSTALL_MYSQLSHAREDIR:PATH=${datadir_noprefix}/mysql \
>> -
>> -DINSTALL_SUPPORTFILESDIR:PATH=${datadir_noprefix}/mysql-support-files \ +
>>                 -DINSTALL_MYSQLSHAREDIR:PATH=${datadir}/mysql \
>> +
>> -DINSTALL_SUPPORTFILESDIR:PATH=${datadir}/mysql-support-files \
>> -DMYSQL_DATADIR:PATH=/var/mysql \
>>                    -DCAT_EXECUTABLE=`which cat` \
>>                    -DCMAKE_AR:FILEPATH=${AR}"
>
> I'm pretty sure I tested this beforehand; the problem I found is that some of
> the scripts end up with the prefix twice in substituted paths because it is
> expected that the paths supplied at configuration time do not include the
> prefix, but our paths normally include them.
>
> Did you do runtime tests with this change?

Thanks, not yet, I will do and reply later.

// Robert

>
> Cheers,
> Paul
>

