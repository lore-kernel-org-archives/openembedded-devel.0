Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C76787507F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 23:11:43 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t12-v6so16123679plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 16:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Gca/1huHDsgxUy5WZMB4+J/68GySRPdm2eu3OJqX284=;
	b=cILbJFqQKpoMv7FFRgfOO4oCzu2V83c3MH/HFnX4Ox65Ltr9s1+tXfe4penZTuzQB0
	dj9FEWHG9g5M5vXSeaP8qOalVRfn1sLotGrK9puuiWWJs0dsw/Bv7NOboBlyCPmh1+2i
	8SQKj8IrjEKZ59OGh6L6kZzYUGAPC7ZDXSJjJNu/45i9CWGjgriG/gvZnBh4uMT0EwJT
	vO0ZaE+dKKZjr3N69rjJH2jUBRAjlxWKPxXgnEbozxWeKeYR12XhKcF+xUFGWkCOfFNK
	ImBSMVI4pZikSKOT2VFR6U+LORfTx5G/E4/ihLq1GtMLdFRpOwFstdoPHYElRBhLBDcZ
	IAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Gca/1huHDsgxUy5WZMB4+J/68GySRPdm2eu3OJqX284=;
	b=aYLNm5hLecI5xkjOsKenx7ovUcjgbR5YYeKRjRj2FLh8vShOPi746NdtD9Aty/oK8r
	kyo7AQg0vhYAR0Y6b5juXeBuEbfim4HRiKhAcZIi9d6/RQXea8AO71gBW3Kl5LXIDH2F
	1ug0G16KxgOord5P70/t/hjP0cv4BbA6SDOL98Q7IB6SFvZu1tLVog8kLANxIjaA382E
	fOWmTCJ3suA7avs6oWl1CuShVquyYz19Pah+savaGOVdTxiC3EIQdQ8HeUAtCJcu6UaR
	G9yWKnGhCcynAFzKTWfDU/TNw4+fyrEu/hEZs6aDHxd1iUb70kSTC4ECvGOaRO8pwS5V
	W4eA==
X-Gm-Message-State: ALKqPwfXhlpfahnN3aclroynzA13S3ww+KSsHikP9zGbqbx6Kl6KVqps
	8oxtbRq46cSaJ6gYSF2hoOc3Og==
X-Google-Smtp-Source: ADUXVKKdFCZHh0S2U9Qq6sHCJFHYCkzPmL/GBdL7IR929jew7c9CRCwtEGkpE7O4JnxjxtuC9ZkeWg==
X-Received: by 2002:a17:902:be0c:: with SMTP id
	r12-v6mr12993724pls.350.1527894704305; 
	Fri, 01 Jun 2018 16:11:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:cd69:7d4:a4bc:31b4?
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	c12-v6sm3843136pfi.177.2018.06.01.16.11.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 16:11:42 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
	<1527865814-9027-2-git-send-email-akuster808@gmail.com>
	<580ea7fc-f840-465d-eb3c-fa0520381afe@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <99b2b2ae-14a7-21b8-59ee-ada340b04c5f@gmail.com>
Date: Fri, 1 Jun 2018 16:11:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <580ea7fc-f840-465d-eb3c-fa0520381afe@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] nmap: move recipe from meta-security to meta-oe
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
X-List-Received-Date: Fri, 01 Jun 2018 23:11:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/01/2018 09:57 AM, Khem Raj wrote:
> On 6/1/18 8:10 AM, Armin Kuster wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../nmap-redefine-the-python-library-dir.patch     | 37 +++++++++++++++
>>  ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48 +++++++++++++++++++
>>  meta-oe/recipes-security/nmap/nmap_7.60.bb         | 54 ++++++++++++++++++++++
>>  3 files changed, 139 insertions(+)
>>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
>>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
>>  create mode 100644 meta-oe/recipes-security/nmap/nmap_7.60.bb
>>
>> diff --git a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
>> new file mode 100644
>> index 0000000..356b507
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
>> @@ -0,0 +1,37 @@
>> +[PATCH] redefine the python library install dir
>> +
>> +Upstream-Status: Pending
>> +
>> +If install-lib is not defined, it is always /usr/lib/, but it
>> +maybe /usr/lib64 for multilib
>> +
>> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> +---
>> + Makefile.in | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile.in b/Makefile.in
>> +index 1bb062c..cced2fb 100644
>> +--- a/Makefile.in
>> ++++ b/Makefile.in
>> +@@ -311,7 +311,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
>> + 
>> + install-zenmap: $(ZENMAPDIR)/setup.py
>> + 	$(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
>> +-	cd $(ZENMAPDIR) && $(PYTHON) setup.py --quiet install --prefix "$(prefix)" --force $(if $(DESTDIR),--root "$(DESTDIR)")
>> ++	cd $(ZENMAPDIR) && $(PYTHON) setup.py --quiet install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" --force $(if $(DESTDIR),--root "$(DESTDIR)")
>> + 	$(INSTALL) -c -m 644 docs/zenmap.1 $(DESTDIR)$(mandir)/man1/
>> + # Create a symlink from nmapfe to zenmap if nmapfe doesn't exist or is
>> + # already a link.
>> +@@ -328,7 +328,7 @@ build-nping: $(NPINGDIR)/Makefile nbase_build nsock_build netutil_build $(NPINGD
>> + 	@cd $(NPINGDIR) && $(MAKE)
>> + 
>> + install-ndiff:
>> +-	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
>> ++	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
>> + 
>> + NSE_FILES = scripts/script.db scripts/*.nse
>> + NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
>> +-- 
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
>> new file mode 100644
>> index 0000000..cfe043a
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
>> @@ -0,0 +1,48 @@
>> +[PATCH] replace "./shtool mkdir" with coreutils mkdir command
>> +
>> +Upstream-Status: Pending
>> +
>> +"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in today
>> +most release has supportted the -p parameter, not need to use shtool, and it
>> +can not fix the race if two process are running mkdir to create same dir
>> +
>> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> +---
>> + ncat/Makefile.in        | 4 ++--
>> + nmap-update/Makefile.in | 2 +-
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/ncat/Makefile.in b/ncat/Makefile.in
>> +index cfd306d..2166e08 100644
>> +--- a/ncat/Makefile.in
>> ++++ b/ncat/Makefile.in
>> +@@ -163,11 +163,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
>> + 
>> + install: $(TARGET)
>> + 	@echo Installing Ncat;
>> +-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
>> ++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
>> + 	$(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
>> + 	$(STRIP) -x $(DESTDIR)$(bindir)/ncat
>> + 	if [ -n "$(DATAFILES)" ]; then \
>> +-		$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
>> ++		mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
>> + 		$(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
>> + 	fi
>> + 	$(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
>> +diff --git a/nmap-update/Makefile.in b/nmap-update/Makefile.in
>> +index 89ff928..93f48d8 100644
>> +--- a/nmap-update/Makefile.in
>> ++++ b/nmap-update/Makefile.in
>> +@@ -37,7 +37,7 @@ $(NBASELIB):
>> + 	cd $(NBASEDIR) && $(MAKE)
>> + 
>> + install: nmap-update
>> +-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
>> ++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
>> + 	$(INSTALL) -c -m 755 nmap-update $(DESTDIR)$(bindir)
>> + 	$(STRIP) -x $(DESTDIR)$(bindir)/nmap-update
>> + 	$(INSTALL) -c -m 644 ../docs/nmap-update.1 $(DESTDIR)$(mandir)/man1/
>> +-- 
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-security/nmap/nmap_7.60.bb b/meta-oe/recipes-security/nmap/nmap_7.60.bb
>> new file mode 100644
>> index 0000000..a6616eb
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/nmap/nmap_7.60.bb
>> @@ -0,0 +1,54 @@
>> +SUMMARY = "network auditing tool"
>> +DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
>> +SECTION = "security"
>> +LICENSE = "GPL-2.0"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=700c690f4ca6b1754f3f1db8645e42d9"
>> +
>> +SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
>> +           file://nmap-redefine-the-python-library-dir.patch \
>> +           file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
>> +"
>> +
>> +SRC_URI[md5sum] = "4e454266559ddf2c4e2109866c62560c"
>> +SRC_URI[sha256sum] = "a8796ecc4fa6c38aad6139d9515dc8113023a82e9d787e5a5fb5fa1b05516f21"
>> +
>> +inherit autotools-brokensep pkgconfig pythonnative distro_features_check
>> +
>> +PACKAGECONFIG ?= "ncat nping ndiff pcap"
>> +PACKAGECONFIG += " ${@bb.utils.contains('IMAGE_FEATURES', 'x11-base', 'zenmap', '', d)}"
>> +
>> +PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
>> +PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpre"
>> +PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
>> +PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
>> +PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
>> +
>> +#disable/enable packages
>> +PACKAGECONFIG[nping] = ",--without-nping,"
>> +PACKAGECONFIG[ncat] = ",--without-ncat,"
>> +PACKAGECONFIG[ndiff] = ",--without-ndiff,python"
>> +PACKAGECONFIG[update] = ",--without-nmap-update,"
>> +
>> +#Add gui
>> +PACKAGECONFIG[zenmap] = "--with-zenmap, --without-zenmap, gtk+ python-core python-codecs python-io python-logging python-unittest python-xml python-netclient python-doctest python-subprocess python-pygtk, python-core python-codecs python-io python-logging python-netclient python-xml python-unittest python-doctest python-subprocess  python-pygtk gtk+"
>> +
>> +EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
>> +
>> +export PYTHON_SITEPACKAGES_DIR
>> +
>> +do_configure() {
>> +    # strip hard coded python2#
>> +    sed -i -e 's=python2\.*=python=g'  ${S}/configure.ac
>> +    sed -i -e 's=python2\.*=python=g'  ${S}/configure
> some distros mean python = python3 btw. So question is if replacing
> python2 with python may cause it to fail build on such distros. Is this
> just needed in runtime python scripts that will execute on target ?
This has been removed. in previous releases nmap would not build without
that change.

>
>> +    autoconf
>> +    oe_runconf
>> +}
>> +
>> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'zenmap', '${PN}-zenmap', '', d)}"
> may be there is no need for checking for pkgconfig here.
zenmap support is being removed. it requires python-pygtk which was
obsoleted in core a while ago.. tells you how many folks use the nmap gui.

v2 out shortly.

thanks for the review.
- armin
>
>> +
>> +FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
>> +FILES_${PN}-zenmap = "${@bb.utils.contains("PACKAGECONFIG", "zenmap", "${bindir}/*zenmap ${bindir}/xnmap ${datadir}/applications/*  ${bindir}/nmapfe ${datadir}/zenmap/* ${PYTHON_SITEPACKAGES_DIR}/radialnet/* ${PYTHON_SITEPACKAGES_DIR}/zenmap*", "", d)}"
>> +
> could this work without pkgconfig such that when the given packageconfig
> is enabled it automatically packages extra files generated into the new
> package otherwise leaves it empty
>
>> +RDEPENDS_${PN} = "python"
>> +RDEPENDS_${PN}-zenmap = "nmap"
>>


