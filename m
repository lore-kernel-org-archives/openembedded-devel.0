Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3F55A725F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 06:31:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45316116"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Dec 2014 14:28:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBH6VIRe018688
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 14:31:19 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Dec 2014 14:31:53 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Dec 2014 14:31:34 +0800
Message-ID: <1418797894-22484-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-networking][PATCH] dnssec-conf: Add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 06:31:48 -0000
Content-Type: text/plain

DNSSEC configuration and priming tool. Dnssec-conf includes a commandline
configuration client for Bind and Unbound, known DNSSEC keys, URL's to
official publication pages of keys, and harvested keys, as well a script
to harvest DNSKEY's from DNS.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../dnssec-conf/dnssec-conf/dnskey-pull.1          | 118 ++++++++++++++
 .../dnssec-conf/dnssec-conf/dnssec-configure.8     | 179 +++++++++++++++++++++
 .../dnssec-conf/dnssec-conf_2.02.bb                |  39 +++++
 3 files changed, 336 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnskey-pull.1
 create mode 100644 meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnssec-configure.8
 create mode 100644 meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb

diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnskey-pull.1 b/meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnskey-pull.1
new file mode 100644
index 0000000..554c686
--- /dev/null
+++ b/meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnskey-pull.1
@@ -0,0 +1,118 @@
+'\" t
+.\"     Title: DNSKEY-PULL
+.\"    Author: [see the "AUTHOR" section]
+.\" Generator: DocBook XSL Stylesheets v1.78.1 <http://docbook.sf.net/>
+.\"      Date: 7 November 2008
+.\"    Manual: User\*(Aqs Manual
+.\"    Source: User's Manual
+.\"  Language: English
+.\"
+.TH "DNSKEY\-PULL" "1" "7 November 2008" "User's Manual" "User\*(Aqs Manual"
+.\" -----------------------------------------------------------------
+.\" * Define some portability stuff
+.\" -----------------------------------------------------------------
+.\" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+.\" http://bugs.debian.org/507673
+.\" http://lists.gnu.org/archive/html/groff/2009-02/msg00013.html
+.\" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+.ie \n(.g .ds Aq \(aq
+.el       .ds Aq '
+.\" -----------------------------------------------------------------
+.\" * set default formatting
+.\" -----------------------------------------------------------------
+.\" disable hyphenation
+.nh
+.\" disable justification (adjust text to left margin only)
+.ad l
+.\" -----------------------------------------------------------------
+.\" * MAIN CONTENT STARTS HERE *
+.\" -----------------------------------------------------------------
+.SH "NAME"
+dnskey-pull \- fetch DNSKEY records from a zone, from all sub\-zones or from a webpage
+.SH "SYNOPSIS"
+.HP \w'\fBdnskey\-pull\fR\ 'u
+\fBdnskey\-pull\fR [\-a] [\-t] [\-o\ \fI<output>\fR] [\-s\ \fI<ns>\fR] \fIzone\fR \fI[\&.\&.]\fR
+.HP \w'\fBdnskey\-pull\fR\ 'u
+\fBdnskey\-pull\fR [\-o\ \fI<output>\fR] \fIurl\fR \fI[\&.\&.]\fR
+.SH "DESCRIPTION"
+.PP
+\fBdnskey\-pull\fR
+obtains Key\-Signing\-Key (KSK) DNSKEY records for use as
+\fItrust\-anchor\fR
+with recursing nameserver that are setup to use
+\fBDNSSEC\&.\fR
+.PP
+dnskey\-pull itself performs no DNSSEC validation\&. dnskey\-pull pulls KSK DNSKEY records for a single zone but can also be told, if it has
+\fIzone\-transfer\fR
+(AXFR) permission, to lookup KSK DNSKEY records for all NS records found in a zone\&. This latter feature can be used to find new DNSKEY\*(Aqs in TLD\*(Aqs\&.
+.PP
+The output of this command can be directly included in the configuration files for the
+\fBBind\fR
+and
+\fBUnbound\fR
+recursing nameservers as DNSSEC trust anchor\&.
+.PP
+dnskey\-pull ignores the system\*(Aqs
+/etc/resolv\&.conf
+setting for domain appending, and treats all zone arguments as FQDN\&. It does use the system\*(Aqs resolver settings for recursive lookups\&.
+.SH "OPTIONS"
+.PP
+\fB\-a\fR
+.RS 4
+Use a zone\-transfer (AXFR) to find all NS records in a zone and return any DNSKEY records found for these NS records in
+\fItrusted\-key\fR
+format\&. Note that AXFR is often blocked on nameservers\&.
+.RE
+.PP
+\fB\-s\ \&<\fR\fInameserver>\fR
+.RS 4
+Use the specified nameserver to perform the zone\-transfer (AXFR)\&.
+.RE
+.PP
+\fB\-t\fR
+.RS 4
+Return the resulting DNSKEY\*(Aqs within a
+\fItrusted\-key { };\fR
+statement, compatible for including with a
+\fIbind\fR
+or
+\fIunbound\fR
+nameserver configuration\&.
+.RE
+.SH "EXAMPLES"
+.PP
+Get all DNSKEY records for Top Level Domains (TLD\*(Aqs) in the Root ("\&.") zone, using the F root\-server that allows zone\-transfers:
+.PP
+\fB% dnskey\-pull \-t \-a \-s f\&.root\-servers\&.net \&.\fR
+.PP
+Get a trusted\-key statement for the xelerance\&.com zone:
+.PP
+\fB% dnskey\-pull \-t xelerance\&.com\fR
+.PP
+Get the trusted keys for the TLD\*(Aqs of Sweden, Brasil and Bulgaria:
+.PP
+\fB% dnskey\-pull se\&. br\&. bg\&.\fR
+.PP
+Find all secured
+\fIENUM\fR
+zones:
+.PP
+\fB% dnskey\-pull \-a \-s ns\-pri\&.ripe\&.net\&. e164\&.arpa\&.\fR
+.PP
+Find the keys on the webpage of the Brasil NIC:
+.PP
+\fB% dnskey\-pull https://registro\&.br/ksk/index\&.html\fR
+.SH "EXIT STATUS"
+.PP
+dnskey\-pull returns 0 when it found one or more DNSKEY records, and non\-zero upon finding no DNSKEY records\&.
+.SH "SEE ALSO"
+.PP
+\fBdnssec-configure\fR(1),
+\fBsystem-config-dnssec\fR(1),
+\fBnamed.conf\fR(8),
+\fBunbound.conf\fR(8),
+\fBautotrust\fR(8),
+\fBunbound-host\fR(8)\&.
+.SH "AUTHOR"
+.PP
+Paul Wouters <paul@xelerance\&.com>
diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnssec-configure.8 b/meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnssec-configure.8
new file mode 100644
index 0000000..48291cb
--- /dev/null
+++ b/meta-networking/recipes-support/dnssec-conf/dnssec-conf/dnssec-configure.8
@@ -0,0 +1,179 @@
+'\" t
+.\"     Title: DNSSEC-CONFIGURE
+.\"    Author: [see the "AUTHOR" section]
+.\" Generator: DocBook XSL Stylesheets v1.78.1 <http://docbook.sf.net/>
+.\"      Date: 10 December 2008
+.\"    Manual: User\(aas Manual
+.\"    Source: User\*(Aqs Manual
+.\"  Language: English
+.\"
+.TH "DNSSEC\-CONFIGURE" "8" "10 December 2008" "User\*(Aqs Manual" "User\(aas Manual"
+.\" -----------------------------------------------------------------
+.\" * Define some portability stuff
+.\" -----------------------------------------------------------------
+.\" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+.\" http://bugs.debian.org/507673
+.\" http://lists.gnu.org/archive/html/groff/2009-02/msg00013.html
+.\" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+.ie \n(.g .ds Aq \(aq
+.el       .ds Aq '
+.\" -----------------------------------------------------------------
+.\" * set default formatting
+.\" -----------------------------------------------------------------
+.\" disable hyphenation
+.nh
+.\" disable justification (adjust text to left margin only)
+.ad l
+.\" -----------------------------------------------------------------
+.\" * MAIN CONTENT STARTS HERE *
+.\" -----------------------------------------------------------------
+.SH "NAME"
+dnssec-configure \- update recursive nameserver configuration options and keys for \fIDNSSEC\fR and \fIDLV\fR\&. Currently Bind (named) and Unbound are supported\&.
+.SH "SYNOPSIS"
+.HP \w'\fBdnssec\-configure\fR\ 'u
+\fBdnssec\-configure\fR [\-u] [\-b] \-\-dnssec=\fIon\fR | \fIoff\fR  \-\-dlv=\fIon\fR | \fIoff\fR | \fI<dlvzone>\fR  [\-\-basedir=\fI<dir>\fR] [\-\-norestart] [\-\-nocheck] [\-\-production] [\-\-testing] [\-\-harvest] [\-\-root]
+.HP \w'\fBdnssec\-configure\fR\ 'u
+\fBdnssec\-configure\fR \-\-show [\-u] [\-b]
+.HP \w'\fBdnssec\-configure\fR\ 'u
+\fBdnssec\-configure\fR \-u | \-b  \-\-set=\fIsecion:optname:optval\fR
+.HP \w'\fBdnssec\-configure\fR\ 'u
+\fBdnssec\-configure\fR \-u | \-b  \-\-query=\fIsecion:optname:optval\fR
+.SH "DESCRIPTION"
+.PP
+dnssec\-configure shows or rewrites the configuration files of the
+\fIBind (named)\fR
+and/or the
+\fIUnbound\fR
+nameservers\&. It verifies the configuration before rewriting it, and restarts the nameserver(s) if neccessary\&.
+.SH "OPTIONS"
+.PP
+\fB\-b (\-n)\fR
+.RS 4
+Update the
+\fIBind (named)\fR
+nameserver configuration\&.
+.RE
+.PP
+\fB\-u\fR
+.RS 4
+Update the
+\fIUnbound\fR
+nameserver configuration\&.
+.RE
+.PP
+If neither options are specified,
+\fI\-b \-u\fR
+is assumed\&.
+.PP
+\fB\-\-show\fR
+.RS 4
+Show the current configuration(s) and do not rewrite any configuration files\&. All other options below are ignored\&.
+.RE
+.PP
+\fB\-\-set=\fR<section:optname:optvalue>
+.RS 4
+Set the options optname to value in the specified section of the configuration file\&. This option cannot be used with \-\-dnssec, \-\-dlv, \-\-query or \-\-show\&. This option can be specified multiple times to set more then one option at once\&.
+.RE
+.PP
+\fB\-\-set=\fR<section:optname:optvalue>
+.RS 4
+Query the setting optname in the specified section of the configuration file\&. This option cannot be used with \-\-dnssec, \-\-dlv, \-\-set or \-\-show\&. This option can be specified multiple times to query more then one option at once\&.
+.RE
+.PP
+\fB\-\-dnssec=\fR<on|off>
+.RS 4
+This option will enable or disable all
+\fIDNSSEC\fR
+processing by the nameserver\&. When enabled, detected spoofed or otherwise verifiably false DNS answers will not be returned\&. Instead, a
+\fISERVFAIL\fR
+is returned\&. The application is responsible for further investigation\&. When disabled, classic DNS services run without any advanced protection\&.
+.RE
+.PP
+\fB\-\-dlv=\fR<on|off|\fIdlvzone\fR>
+.RS 4
+This option will enable or disable
+\fIDLV\fR, or "DNSSEC Lookaside Verification" (RFC 5074)\&. This is a method for using DNSSEC in TLD\*(Aqs that themselves do not support DNSSEC\&. It works by offloading DNS queries for all TLD\*(Aqs for which no DNSSEC keys are loaded to a DLV Registry\&. The Trusted Key for the DLV Registry must be available\&. The default DLV Registry (when using the value
+\fIon\fR, is the
+\fBISC DLV\fR
+(http://dlv\&.isc\&.org/)i\&. The ISC DLV Key is pre\-installed with this software\&. You can specify your own DLV Registry, but you must make sure the
+\fIdlvzone\fR\*(Aqs key is installed in
+\fI/etc/pki/dnssec/dlv/dlvzone\&.key\fR\&.
+.RE
+.PP
+\fB\-\-basedir\fR\fI<dir>\fR
+.RS 4
+The basedir for Trusted Key files\&. The default is
+\fI/etc/pki/dnssec\-keys/\fR\&. NOT YET IMPLEMENTED
+.RE
+.PP
+\fB\-\-norestart\fR
+.RS 4
+Do not attempt to restart any running DNS resolving nameservers\&. This is for use within initscripts, where dnssec\-configure is called to update the settings from within a DNS server initscript\&. Otherwise this would cause a loop\&.
+.RE
+.PP
+\fB\-\-nocheck\fR
+.RS 4
+Do not attempt to run unbound\-checkconf or bind\-checkconf\&. This is required for calls within package managers such as RPM where at least for unbound, we are still missing keys/certs and unbound\-checkconf would return an error\&. We cannot generate keys before running unbound\-checkconf, as we might not have enough entropy resulting in a stalled partial install\&.
+.RE
+.PP
+The following options determine which Trusted Keys to preload with the nameserver software\&. Without Trusted Keys, no DNSSEC verification is possible\&. At some point, when the Root is signed, only one key would need to be preloaded\&. This is not yet the case\&.
+.PP
+\fB\-\-production\fR
+.RS 4
+Include Trusted Keys that are in full production\&. These keys have been analysed by people in the DNS community or have been publicly announced by their TLD to be production ready\&. If no Trusted Keys options are specified, only this setting will be enabled\&. These keys can be found in
+\fI/etc/pki/dnssec\-keys/production\&.conf\fR\&.
+.RE
+.PP
+\fB\-\-testing\fR
+.RS 4
+Include Trusted Keys that are in testing mode\&. These keys tend to be reasonably stable, or have been found and verified but not officially announced by its TLD\&. These are not included per default\&. These keys can be found in
+\fI/etc/pki/dnssec\-keys/testing\&.conf\fR\&.
+.RE
+.PP
+\fB\-\-harvest\fR
+.RS 4
+Include Trusted Keys that are harvested and/or added by the local system administrator themselves\&. These keys can be found in
+\fI/etc/pki/dnssec\-keys/harvest\&.conf\fR\&.
+.RE
+.PP
+\fB\-\-root\fR
+.RS 4
+Include the Trusted Keys for the Root Zone\&. Currently the root is not signed, and there is no root key available\&. A test Root key is available from IANA, but this requires using a separate resolver at IANA\*(Aqs\&. Do not use this option\&.
+.RE
+.SH "EXAMPLES"
+.PP
+Enable DNSSEC with production keys and ISC\*(Aqs DLV Registry for all nameserver software found on the machine
+.PP
+\fB# dnssec\-configure \-\-dnssec=on \-\-dlv=on\fR
+.PP
+For the Unbound nameserver, enable DNSSEC with production and testing keys, and use dlv\&.xelerance\&.com as the DLV Registry
+.PP
+\fB# dnssec\-configure \-u \-\-dnssec=on \-\-dlv=dlv\&.xelerance\&.com \-\-production \-\-testing\fR
+.PP
+For the Bind nameserver, disable dnssec
+.PP
+\fB# dnssec\-configure \-b \-\-dnssec=off\fR
+.SH "REQUIREMENTS"
+.PP
+One or both of the known DNSSEC capable nameservers, Bind and Unbound, is required\&. To support
+\fIRFC 5011\fR
+style automatic key updates, the
+\fIautotrust\fR
+software is needed along with a cron daemon\&.
+.SH "TRUSTED KEYS"
+.PP
+The format of the key files is carefully chosen to be compatible with both Bind and Unbound\&. Key files are stored in individual files so that they can be easilly verified and updated by autotrust\&. The keys are grouped in their respective categories production, testing and harvest\&. If you have local DNSSEC keys you wish to preload, you can add these to one of these three directories and re\-run dnssec\-configure to rebuild the production\&.conf, testing\&.conf and harvest\&.conf files based which are based on the contents of the
+\fI/etc/pki/dnssec\-keys/{production,testing,harvest}\fR
+directories\&. If you wish to use another DLV, add the key for the DLV zone to
+\fI/etc/pki/dnssec\-keys/dlv/dlvzone\&.domain\&.key\fR\&.
+.SH "SEE ALSO"
+.PP
+\fIdnskey\-pull\fR(1),
+\fIunbound\-host\fR(1),
+\fIsystem\-config\-dnssec\fR(8),
+\fIautotrust\fR(8),
+\fInamed\&.conf\fR(8),
+\fIunbound\&.conf\fR(8)\&.
+.SH "AUTHOR"
+.PP
+Paul Wouters <paul@xelerance\&.com>
diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
new file mode 100644
index 0000000..d915e08
--- /dev/null
+++ b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -0,0 +1,39 @@
+SUMMARY = "DNSSEC and DLV configuration and priming tool"
+DESCRIPTION = "\
+DNSSEC configuration and priming tool. Keys are required until the root \
+is signed, as well as for local unpublished DNSSEC keys to be preloaded \
+into the recursive nameserver. These DNSSEC configuration files can be \
+directly included in the bind or unbound nameserver configuration files. \
+dnssec-conf includes a commandline configuration client for Bind and \
+Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
+and harvested keys, as well a script to harvest DNSKEY's from DNS. \
+See also: system-config-dnssec"
+HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
+SECTION = "System Environment/Daemons"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "git://github.com/xelerance/dnssec-conf.git \
+           file://dnskey-pull.1 \
+           file://dnssec-configure.8"
+SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+    sed -i '/^\sxmlto man/s=^=#=' Makefile
+}
+do_install () {
+    rm -rf ${D}
+    mv ${WORKDIR}/dnskey-pull.1 ${WORKDIR}/dnssec-configure.8 ${S}
+    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
+    # We no longer ship trust anchors. Most of these are in the DLV Registry now.
+    # and it prevents the problem of shipping outdated trust anchors.
+    # For DLV, we ship the ISC DLV Registry key
+    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
+    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
+    install -d -m 0755 ${D}${sysconfdir}/sysconfig
+    install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
+}
+
+RDEPENDS_${PN} = "python"
-- 
1.8.3.1


