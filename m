Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-110.rediffmail.com (unknown [203.199.83.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7749570391
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 16:30:03 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-124.rediffmail.com (Postfix) with SMTP id 197C6308202D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 21:46:06 +0530 (IST)
Received: (qmail 3578 invoked by uid 510); 14 Jul 2014 16:25:24 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=RzztMCSNt3lUgmCOwl2iS8MKLJELCOhLOXr9F9D2w0AgPPff+ayAbsld6BE9wbhnF6Oe1ribBzK9WfHWXRbEnLxfNbOeEBxTemX9yccS5g1eU0OqjCbbAkhGmjwggOc0H0bu/JSoAu199Rx9lUn0EeCqbGIz7fWBIaBvJi9TDAc=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160209.53C4046F.00A0, ss=1, re=-6.500, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 14 Jul 2014 16:25:19 -0000
MIME-Version: 1.0
To: "Robert Yang " <liezhi.yang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Received: from unknown 122.177.78.45 by rediffmail.com via HTTP;
	14 Jul 2014 16:25:19 -0000
Message-ID: <1405041151.S.13278.19964.H.TlJvYmVydCBZYW5nAFJlOiBSZWdhcmRpbmcgcHB0cGQgcGFja2FnZQ__.RU.rfs303,
	rfs303, 128,
	571.f4-235-160.old.replied.1405355119.2594@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Regarding ./configure and Makefile
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
X-List-Received-Date: Mon, 14 Jul 2014 16:30:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Suppose I have a package and to compile and install that package, it is required to run following:

./configure
make 
make install

Then how can I include these in my package receipe.

Please help.

Regards,
Himanshu

&nbsp;

From: Robert Yang &lt;liezhi.yang@windriver.com&gt;
Sent: Fri, 11 Jul 2014 06:42:31 
To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;
Cc: "openembedded-devel@lists.openembedded.org" &lt;openembedded-devel@lists.openembedded.org&gt;
Subject: Re: Regarding pptpd package


Seems that we don't have the pptpd recipes, you can search from here:



http://layers.openembedded.org/layerindex/branch/master/recipes/?q=pptpd



For the configure error:



sh: util/bindvar.sh: No such file or directory



You need check where is the bindvar.sh, and why can't find it.



// Robert





On 07/10/2014 07:29 PM, Himanshu Pandey wrote:

&gt; Hi,

&gt;

&gt; &nbsp;From where can I find pptpd in git.

&gt;

&gt; Please help.

&gt;

&gt; Regards,

&gt; Himanshu

&gt;

&gt;

&gt;

&gt;

&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; Sent: Thu, 10 Jul 2014 16:24:38

&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; Cc: "openembedded-devel@lists.openembedded.org"

&gt; &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; Subject: Re: Regarding dhcp package

&gt;

&gt; The error is:

&gt;

&gt; configure: error: source directory already configured; run "make distclean"

&gt; there first

&gt;

&gt; Try a clean build ?

&gt;

&gt; For example:

&gt;

&gt; bitbake dhcp -ccleansstate &amp;&amp; bitbake dhcp

&gt;

&gt; If you get the same error again, you may need inherit autotools-brokensep

&gt; rather than autotools as a quick workaround.

&gt;

&gt; // Robert

&gt;

&gt; On 07/10/2014 05:50 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; Hi,

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; As advised by you I have done that but again I am getting an error.

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; Please find the log as attachment.

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; &nbsp;&gt; Sent: Thu, 10 Jul 2014 14:08:59

&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; &nbsp;&gt; Cc: "openembedded-devel@lists.openembedded.org"

&gt; &nbsp;&gt; &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; &nbsp;&gt; Subject: Re: Regarding dhcp package

&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; On 07/10/2014 04:17 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; &nbsp;&gt; Hi Robert,

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; I am getting an error while compiling my dhcp package. Please find the log as

&gt; &nbsp;&gt; &nbsp;&gt; attachment.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; My dhcp bb file is as follows:

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; SECTION = "base"

&gt; &nbsp;&gt; &nbsp;&gt; SUMMARY = "Internet Software Consortium DHCP package"

&gt; &nbsp;&gt; &nbsp;&gt; DESCRIPTION = "DHCP (Dynamic Host Configuration Protocol) is a protocol \

&gt; &nbsp;&gt; &nbsp;&gt; which allows individual devices on an IP network to get their own \

&gt; &nbsp;&gt; &nbsp;&gt; network configuration information from a server. &nbsp;DHCP helps make it \

&gt; &nbsp;&gt; &nbsp;&gt; easier to administer devices."

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; HOMEPAGE = "http://www.isc.org/"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; LICENSE = "CLOSED"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; DEPENDS = "openssl bind"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; SRC_URI =

&gt; &nbsp;&gt; "svn://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="

&gt; &lt;http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="&gt;

&gt; &nbsp;&gt; &lt;http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="&gt;

&gt; &nbsp;&gt; &nbsp;&gt; SRCREV = "${AUTOREV}"

&gt; &nbsp;&gt; &nbsp;&gt; S= "${WORKDIR}/trunk"

&gt; &nbsp;&gt; &nbsp;&gt; #inherit autotools

&gt; &nbsp;&gt; &nbsp;&gt; do_compile() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#cp -f ${WORKDIR}/trunk/include/site.h ${S}/includes

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd ../trunk

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;./configure --prefix=${prefix} --host=${HOST_SYS}

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;make

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; I think that these are wrong, you should not disable the "inherit autotools",

&gt; &nbsp;&gt; and should not use "./configure" or "make" directly, try to enable

&gt; &nbsp;&gt; the "inherit autotools", and remove the do_compile section to see what

&gt; &nbsp;&gt; would happen, maybe you need:

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; inherit autotools

&gt; &nbsp;&gt; S = "${WORKDIR}/trunk"

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; // Robert

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; do_install_append () {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/init.d

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/default

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /etc/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /sbin

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /var/db

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /var/lib

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /usr/local/sbin/

&gt; &nbsp;&gt; &nbsp;&gt; install -m 0755 ${D}/sbin/dhcrelay

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/sbin/dhcpd

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/sbin/dhclient-script

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/var/db/dhcpd.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/var/lib/dhcpd

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/usr/local/sbin/dhclient

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sudo touch ${D}/usr/local/bin/dhcpd-pools

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}${sysconfdir}/dhclient.conf*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}${sysconfdir}/dhcpd.conf*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f /etc/dhcpd.conf*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0644 ${WORKDIR}/dhcpd.conf ${D}/etc/dhcpd.conf

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0644 ${WORKDIR}/dhclient.conf ${D}/etc/dhcp/dhclient.conf

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${base_sbindir}/

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ "${sbindir}" != "${base_sbindir}" ]; then

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${S}/client/scripts/linux

&gt; &nbsp;&gt; &nbsp;&gt; ${D}${base_sbindir}/dhclient-script

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay

&gt; dhcp-omshell"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_${PN} = ""

&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_${PN}-dev = ""

&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_${PN}-staticdev = ""

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"

&gt; &nbsp;&gt; &nbsp;&gt; RRECOMMENDS_dhcp-server = "dhcp-server-config"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server

&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/dhcp/dhcpd.conf"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay

&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/default/dhcp-relay"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script

&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/dhcp/dhclient.conf"

&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_dhcp-client = "bash"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-omshell = "${bindir}/omshell"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postinst_dhcp-server() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;mkdir -p $D/${localstatedir}/lib/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;touch $D/${localstatedir}/lib/dhcp/dhcpd.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postinst_dhcp-client() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;mkdir -p $D/${localstatedir}/lib/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postrm_dhcp-server() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;if ! rmdir $D/${localstatedir}/lib/dhcp 2&gt;/dev/null; then

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;fi

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postrm_dhcp-client() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;if ! rmdir $D/${localstatedir}/lib/dhcp 2&gt;/dev/null; then

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;fi

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Please help.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Sent: Wed, 02 Jul 2014 15:22:14

&gt; &nbsp;&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;,

&gt; &nbsp;&gt; &nbsp;&gt; "openembedded-devel@lists.openembedded.org"

&gt; &nbsp;&gt; &nbsp;&gt; &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Subject: Re: [bitbake-devel] Regarding rp-pppoe package

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; On 07/02/2014 05:49 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Hi,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I am getting following error when I tried to add and compile rp-pppoe

&gt; &nbsp;&gt; pacakage:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Please add the full error log, thanks.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Btw, I will go to have dinner now, may reply tomorrow.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; // Robert

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; ERROR: oe_runconf failed

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Please help.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Sent: Wed, 02 Jul 2014 13:16:17

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Cc: openembedded-devel &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Subject: Re: [bitbake-devel] Regarding Net-Snmp package

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I think that this email should go into oe-devel (see the cc) since

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; the net-snmp is from the meta-networking layer, please see:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static

&gt; &nbsp;&gt; &nbsp;&gt; ${PN}-libs \

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; ${PN}-server-snmptrapd"

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; There is no net-snmp in the PACKAGES, I think that you need use

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; net-snmp-client or net-snmp-server.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; // Robert

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; On 07/02/2014 03:36 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Hi,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I am getting following errors:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Error: net-snmp not found in the base feeds (genericx86_64 x86_64

&gt; &nbsp;&gt; noarch any

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; all).

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; sed: can't read

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp/5.7.2-r1/image/usr/bin/net-snmp-config:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; No such file or directory

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Please help.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with

&gt; Company

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; email.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; &nbsp;&gt; &nbsp;&gt; email.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; &nbsp;&gt; email.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; email.

&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt;

&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company email.

&gt; &nbsp;&nbsp;&nbsp;*Know More &gt;*

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt;


