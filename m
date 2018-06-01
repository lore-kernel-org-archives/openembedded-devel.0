Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD6171C9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:57:22 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id n10-v6so15650341plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ptVoq6CwzHsXSZPOgjB3whvN167RnEkXD3+6CV9QomY=;
	b=n58RYZ4/TV1rksTqMaDc6IWK33Wo3Nm2S2pQB5YSWah9DPDATi5rwPXn3Iy/tOKmvW
	60Pn0R/qRq9JVAQb7xfEE1weEzp5SlBnvUMS9QMUHVVS8vTa2z3x94GnkaGqbOwQjfPD
	j4sG2eCYqni3x6RoboYBWnpNaxes6+DpQU3PHrmxp8lia8sNGH2Le1aEJMeLsL+veLf+
	wyHyh1+BvxzFng8Pd8Du3OoII2DqgNiPvJzMwSgxVbnjRE22n4FVxgn2AH0CGgzZLIGM
	MmtN2jh2FlMmk5UeLuGE/904GyoyOLA7GtDlQrgZYUHmUAkkgYMsNVqu/XI1UkdmSYcH
	x8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ptVoq6CwzHsXSZPOgjB3whvN167RnEkXD3+6CV9QomY=;
	b=Rv0H/u3MvTIqToPWDnDuoK2ydPn1Nj3GsFNfCbGtKsRhn+yHdMuUpX07LKFl4mfmgy
	GBmWkVyk7qbyLk9X30O3aYqdAxRQrO7JLb26BQt+usoudSl8X6b5zEX1KC3n9nLJHmXf
	T39ZM0pMaDqHP91NHIAvzx1wzwL0OkIsApm/g4lxPdhDxjcAPIgbz6LkC6zZ3T2C4CgJ
	BcXGm8KbCmq3KtRsNVReZv3VdTAsrbqmvf+rLR/AY+QsbXhxXnEMPOLJASbt2acdPg7l
	0cWlX9kH4QAsWUgfYK9hwrImdwltW9Xdqr8iwZxXZbehy6MRMsh/N9cjxbbH6vIItpxH
	NxwQ==
X-Gm-Message-State: ALKqPwdq+nKXrHLrQGKmV32MgZgJBsGxtbb9y4Ghuuqn+VvUSsjZFBlX
	W4uy/azc7uoLK2ngZ2+83LJKDzzO
X-Google-Smtp-Source: ADUXVKK5sHprROsxQIVqYWjy0wH6/bRLsJSuUKEdEE1TzLNbZrYY8FUDnqPW7kCQ3/9+NN1xAHDveA==
X-Received: by 2002:a17:902:2805:: with SMTP id
	e5-v6mr12041013plb.55.1527872243024; 
	Fri, 01 Jun 2018 09:57:23 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:41f8:6b67:40cb:f15c?
	([2601:646:877f:9499:41f8:6b67:40cb:f15c])
	by smtp.gmail.com with ESMTPSA id
	z127-v6sm55228984pgb.31.2018.06.01.09.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 09:57:22 -0700 (PDT)
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
	<1527865814-9027-2-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
	Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
	4evWolFf5cMmp87DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Message-ID: <580ea7fc-f840-465d-eb3c-fa0520381afe@gmail.com>
Date: Fri, 1 Jun 2018 09:57:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1527865814-9027-2-git-send-email-akuster808@gmail.com>
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
X-List-Received-Date: Fri, 01 Jun 2018 16:57:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/1/18 8:10 AM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../nmap-redefine-the-python-library-dir.patch     | 37 +++++++++++++++
>  ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48 +++++++++++++++++++
>  meta-oe/recipes-security/nmap/nmap_7.60.bb         | 54 ++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
>  create mode 100644 meta-oe/recipes-security/nmap/nmap_7.60.bb
> 
> diff --git a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
> new file mode 100644
> index 0000000..356b507
> --- /dev/null
> +++ b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
> @@ -0,0 +1,37 @@
> +[PATCH] redefine the python library install dir
> +
> +Upstream-Status: Pending
> +
> +If install-lib is not defined, it is always /usr/lib/, but it
> +maybe /usr/lib64 for multilib
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 1bb062c..cced2fb 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -311,7 +311,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
> + 
> + install-zenmap: $(ZENMAPDIR)/setup.py
> + 	$(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> +-	cd $(ZENMAPDIR) && $(PYTHON) setup.py --quiet install --prefix "$(prefix)" --force $(if $(DESTDIR),--root "$(DESTDIR)")
> ++	cd $(ZENMAPDIR) && $(PYTHON) setup.py --quiet install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" --force $(if $(DESTDIR),--root "$(DESTDIR)")
> + 	$(INSTALL) -c -m 644 docs/zenmap.1 $(DESTDIR)$(mandir)/man1/
> + # Create a symlink from nmapfe to zenmap if nmapfe doesn't exist or is
> + # already a link.
> +@@ -328,7 +328,7 @@ build-nping: $(NPINGDIR)/Makefile nbase_build nsock_build netutil_build $(NPINGD
> + 	@cd $(NPINGDIR) && $(MAKE)
> + 
> + install-ndiff:
> +-	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
> ++	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
> + 
> + NSE_FILES = scripts/script.db scripts/*.nse
> + NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
> new file mode 100644
> index 0000000..cfe043a
> --- /dev/null
> +++ b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
> @@ -0,0 +1,48 @@
> +[PATCH] replace "./shtool mkdir" with coreutils mkdir command
> +
> +Upstream-Status: Pending
> +
> +"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in today
> +most release has supportted the -p parameter, not need to use shtool, and it
> +can not fix the race if two process are running mkdir to create same dir
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + ncat/Makefile.in        | 4 ++--
> + nmap-update/Makefile.in | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/ncat/Makefile.in b/ncat/Makefile.in
> +index cfd306d..2166e08 100644
> +--- a/ncat/Makefile.in
> ++++ b/ncat/Makefile.in
> +@@ -163,11 +163,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
> + 
> + install: $(TARGET)
> + 	@echo Installing Ncat;
> +-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> ++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> + 	$(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
> + 	$(STRIP) -x $(DESTDIR)$(bindir)/ncat
> + 	if [ -n "$(DATAFILES)" ]; then \
> +-		$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
> ++		mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
> + 		$(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
> + 	fi
> + 	$(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
> +diff --git a/nmap-update/Makefile.in b/nmap-update/Makefile.in
> +index 89ff928..93f48d8 100644
> +--- a/nmap-update/Makefile.in
> ++++ b/nmap-update/Makefile.in
> +@@ -37,7 +37,7 @@ $(NBASELIB):
> + 	cd $(NBASEDIR) && $(MAKE)
> + 
> + install: nmap-update
> +-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> ++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> + 	$(INSTALL) -c -m 755 nmap-update $(DESTDIR)$(bindir)
> + 	$(STRIP) -x $(DESTDIR)$(bindir)/nmap-update
> + 	$(INSTALL) -c -m 644 ../docs/nmap-update.1 $(DESTDIR)$(mandir)/man1/
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-security/nmap/nmap_7.60.bb b/meta-oe/recipes-security/nmap/nmap_7.60.bb
> new file mode 100644
> index 0000000..a6616eb
> --- /dev/null
> +++ b/meta-oe/recipes-security/nmap/nmap_7.60.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "network auditing tool"
> +DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
> +SECTION = "security"
> +LICENSE = "GPL-2.0"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=700c690f4ca6b1754f3f1db8645e42d9"
> +
> +SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
> +           file://nmap-redefine-the-python-library-dir.patch \
> +           file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
> +"
> +
> +SRC_URI[md5sum] = "4e454266559ddf2c4e2109866c62560c"
> +SRC_URI[sha256sum] = "a8796ecc4fa6c38aad6139d9515dc8113023a82e9d787e5a5fb5fa1b05516f21"
> +
> +inherit autotools-brokensep pkgconfig pythonnative distro_features_check
> +
> +PACKAGECONFIG ?= "ncat nping ndiff pcap"
> +PACKAGECONFIG += " ${@bb.utils.contains('IMAGE_FEATURES', 'x11-base', 'zenmap', '', d)}"
> +
> +PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
> +PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpre"
> +PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
> +PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
> +PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
> +
> +#disable/enable packages
> +PACKAGECONFIG[nping] = ",--without-nping,"
> +PACKAGECONFIG[ncat] = ",--without-ncat,"
> +PACKAGECONFIG[ndiff] = ",--without-ndiff,python"
> +PACKAGECONFIG[update] = ",--without-nmap-update,"
> +
> +#Add gui
> +PACKAGECONFIG[zenmap] = "--with-zenmap, --without-zenmap, gtk+ python-core python-codecs python-io python-logging python-unittest python-xml python-netclient python-doctest python-subprocess python-pygtk, python-core python-codecs python-io python-logging python-netclient python-xml python-unittest python-doctest python-subprocess  python-pygtk gtk+"
> +
> +EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
> +
> +export PYTHON_SITEPACKAGES_DIR
> +
> +do_configure() {
> +    # strip hard coded python2#
> +    sed -i -e 's=python2\.*=python=g'  ${S}/configure.ac
> +    sed -i -e 's=python2\.*=python=g'  ${S}/configure

some distros mean python = python3 btw. So question is if replacing
python2 with python may cause it to fail build on such distros. Is this
just needed in runtime python scripts that will execute on target ?

> +    autoconf
> +    oe_runconf
> +}
> +
> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'zenmap', '${PN}-zenmap', '', d)}"

may be there is no need for checking for pkgconfig here.

> +
> +FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
> +FILES_${PN}-zenmap = "${@bb.utils.contains("PACKAGECONFIG", "zenmap", "${bindir}/*zenmap ${bindir}/xnmap ${datadir}/applications/*  ${bindir}/nmapfe ${datadir}/zenmap/* ${PYTHON_SITEPACKAGES_DIR}/radialnet/* ${PYTHON_SITEPACKAGES_DIR}/zenmap*", "", d)}"
> +

could this work without pkgconfig such that when the given packageconfig
is enabled it automatically packages extra files generated into the new
package otherwise leaves it empty

> +RDEPENDS_${PN} = "python"
> +RDEPENDS_${PN}-zenmap = "nmap"
> 


