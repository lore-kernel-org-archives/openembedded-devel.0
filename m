Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD366FF91
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 22:00:21 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id t15so13316678igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 14:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sqSixuP89R8hD0KUVNQG5IopdMs7O+ZSQ5g6mdSk9rU=;
	b=BI+abTv8oTxjWUdW66GPpTGt3BMebN1JOSNfp54YiAuJg3Y2dOYHZKVSRQZVbDknuQ
	hipI4LQNs/qDMkDnfgvySQYYsPBBY6p9ILz7mqsekhn8T/UIyTamTAtkRmhM6K6799qE
	rEhtBmNZOJhvmMOHtIwEAzpdHykfQMOswXxMLr4PniaRqXVyRBTu63/8+zNiirKSQTJK
	0O7XpxjwDkBmO3Jeo4cfEqDs9ac8If9Ug2S0bxIgcd+ua0LRU29oHUdmfYzv8JP6pGHz
	Odk+T5CwkYPrHIjMujV80W/UiwV81ZyrwXtJX/A6QuM1z80wKW8OYO8XxNIWb/V/LtCY
	3d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=sqSixuP89R8hD0KUVNQG5IopdMs7O+ZSQ5g6mdSk9rU=;
	b=NfTvTcXSsHDyqln/R1eXj7NKIftLAeX+n3w2Zy5Ey6TjQQG9j93bq9F8R5WiXymuYy
	sHCE8rXYjvpl592HkpoPVynAqa1zHTVGuBBd+sX2dCydU1zE28clNAqImbyrggXDMyRv
	7XN4aM0v75z2Zwh85xE8pgikLHnAX/pUd9V8JKEo6+pSiAjsmxCzKfTcGU0PZny3c8TC
	cAkNPyrsUa9vGP0YjalZT8HsbAPVoC0OqEFLEo4vKW1czODQxhZAUuuzkwkPPdn1tSq8
	coRn7UK09+3kxOJyMfWnHusjEX87YCT2/sQCWu8DeBgPL2QYgsxjUh7qT3Lw+Yr1Cohu
	+Rkw==
X-Gm-Message-State: AG10YORiKT2iyGHQ1ZZHS1aWwK/t4xSl64ICkjP+KGF78dXXKXPe8/746fJg11eVSTkp5r1EOphnPNQh+17syg==
X-Received: by 10.50.171.200 with SMTP id aw8mr10824502igc.77.1453586422247;
	Sat, 23 Jan 2016 14:00:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sat, 23 Jan 2016 13:59:52 -0800 (PST)
In-Reply-To: <CAF3KAoQSrGP2fbG8ebcPVMbxoRNmgOxxf6MKnckvZTYqS9Cjgw@mail.gmail.com>
References: <1453584691-8550-1-git-send-email-BrunoVern.a@gmail.com>
	<CAF3KAoQSrGP2fbG8ebcPVMbxoRNmgOxxf6MKnckvZTYqS9Cjgw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jan 2016 13:59:52 -0800
Message-ID: <CAMKF1so46=_iCC184_KOghcT0zN4FAbz6+XcQuLaxHUv-OwTxg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] OpenLDAP modules
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
X-List-Received-Date: Sat, 23 Jan 2016 22:00:27 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 23, 2016 at 1:46 PM, Bruno Vernay <brunovern.a@gmail.com> wrote:
> By the way, I wonder if there is a way to write test that would launch
> OpenLDAP in Qemu and check that OpenLDAP can answer a request for example,
> and not just build and fail at runtime ...

sure. look into ptest framework.
https://wiki.yoctoproject.org/wiki/Ptest

> Also would it be a good idea to write a readme to show some example on how
> to use the recipe, or would it be better in the recipe comment header ?
> Because I struggled a bit to find out and a simple example could have save
> me time.
> Thanks
> Bruno
>
> On Sat, Jan 23, 2016 at 10:31 PM BrunoVernay <brunovern.a@gmail.com> wrote:
>
>> ---
>>  .../recipes-support/openldap/openldap_2.4.42.bb    | 28
>> +++++++++++++++++++++-
>>  1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
>> b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
>> index 49fcb56..23586b7 100644
>> --- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
>> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
>> @@ -148,6 +148,8 @@ PACKAGES += "${PN}-overlay-proxycache"
>>  # it was disabled for cross-compiling.
>>  CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
>>
>> +LDFLAGS += "-pthread"
>> +
>>  do_configure() {
>>      cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
>>      rm -f ${S}/libtool
>> @@ -166,7 +168,7 @@ LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
>>  PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
>>
>>  # Package contents - shift most standard contents to -bin
>> -FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
>> ${localstatedir}/openldap-data"
>> +FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
>> ${localstatedir}/${BPN}/data"
>>  FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir}
>> ${localstatedir}/run ${localstatedir}/volatile/run \
>>      ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
>>      ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
>> @@ -195,6 +197,18 @@ do_install_append() {
>>      install -d ${D}${systemd_unitdir}/system/
>>      install -m 0644 ${WORKDIR}/slapd.service
>> ${D}${systemd_unitdir}/system/
>>      sed -i -e 's,@SBINDIR@,${sbindir},g'
>> ${D}${systemd_unitdir}/system/*.service
>> +
>> +    # Uses mdm as the database
>> +    #  and localstatedir as data directory ...
>> +    sed -e 's/# modulepath/modulepath/' \
>> +        -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
>> +        -e 's/database\s*bdb/database        mdb/' \
>> +        -e 's%^directory\s*.*%directory   ${localstatedir}/${BPN}/data/%'
>> \
>> +        -i ${D}${sysconfdir}/openldap/slapd.conf
>> +
>> +    mkdir -p ${D}${localstatedir}/${BPN}/data
>> +
>> +
>>  }
>>
>>  INITSCRIPT_PACKAGES = "${PN}-slapd"
>> @@ -206,8 +220,20 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?= "disable"
>>
>>  PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
>>
>> +# The modules require their .so to be dynamicaly loaded
>> +INSANE_SKIP_${PN}-backend-dnssrv  += "dev-so"
>> +INSANE_SKIP_${PN}-backend-ldap    += "dev-so"
>> +INSANE_SKIP_${PN}-backend-meta    += "dev-so"
>> +INSANE_SKIP_${PN}-backend-mdb     += "dev-so"
>> +INSANE_SKIP_${PN}-backend-monitor += "dev-so"
>> +INSANE_SKIP_${PN}-backend-null    += "dev-so"
>> +INSANE_SKIP_${PN}-backend-passwd  += "dev-so"
>> +INSANE_SKIP_${PN}-backend-shell   += "dev-so"
>> +
>> +
>>  python populate_packages_prepend () {
>>      backend_dir    = d.expand('${libexecdir}/openldap')
>> +    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$',
>> 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True,
>> extra_depends='', allow_links=True)
>>      do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$',
>> 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='',
>> allow_links=True)
>>
>>      metapkg = "${PN}-backends"
>> --
>> 2.5.0
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

