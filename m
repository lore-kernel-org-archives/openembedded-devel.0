Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE60A65D5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 07:26:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6G7Q0UF020465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 00:26:01 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 16 Jul 2014 00:26:00 -0700
Message-ID: <53C62907.909@windriver.com>
Date: Wed, 16 Jul 2014 15:25:59 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1405041151.S.13278.19964.H.TlJvYmVydCBZYW5nAFJlOiBSZWdhcmRpbmcgcHB0cGQgcGFja2FnZQ__.RU.rfs303,
	rfs303, 128,
	571.f4-235-160.old.1405314884.14174@webmail.rediffmail.com>
In-Reply-To: <1405041151.S.13278.19964.H.TlJvYmVydCBZYW5nAFJlOiBSZWdhcmRpbmcgcHB0cGQgcGFja2FnZQ__.RU.rfs303,
	rfs303, 128,
	571.f4-235-160.old.1405314884.14174@webmail.rediffmail.com>
Subject: Re: Regarding rp-pppoe.so and pppoe_module.so
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
X-List-Received-Date: Wed, 16 Jul 2014 07:26:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/14/2014 01:14 PM, Himanshu Pandey wrote:
> Hi,
>
> Where can I find rp-pppoe.so and pppoe_module.so in Yocto.
>

The rp-pppoe.so is built from meta/recipes-connectivity/ppp/ppp_2.4.6.bb,
so try to
add this in your local.conf:

IMAGE_INSTALL_append = " ppp-oe"

Note, the space is needed.

Not sure where is the pppoe_module.so, maybe you need look at ppp_2.4.6.bb's
configuration.

// Robert

> Please help.
>
> Regards,
> Himanshu
>
>
>
>
> From: Robert Yang <liezhi.yang@windriver.com>
> Sent: Fri, 11 Jul 2014 06:42:31
> To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
> Cc: "openembedded-devel@lists.openembedded.org"
> <openembedded-devel@lists.openembedded.org>
> Subject: Re: Regarding pptpd package
>
> Seems that we don't have the pptpd recipes, you can search from here:
>
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=pptpd
>
> For the configure error:
>
> sh: util/bindvar.sh <http://bindvar.sh>: No such file or directory
>
> You need check where is the bindvar.sh <http://bindvar.sh>, and why can't find it.
>
> // Robert
>
>
> On 07/10/2014 07:29 PM, Himanshu Pandey wrote:
>  > Hi,
>  >
>  >  From where can I find pptpd in git.
>  >
>  > Please help.
>  >
>  > Regards,
>  > Himanshu
>  >
>  >
>  >
>  >
>  > From: Robert Yang <liezhi.yang@windriver.com>
>  > Sent: Thu, 10 Jul 2014 16:24:38
>  > To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
>  > Cc: "openembedded-devel@lists.openembedded.org"
>  > <openembedded-devel@lists.openembedded.org>
>  > Subject: Re: Regarding dhcp package
>  >
>  > The error is:
>  >
>  > configure: error: source directory already configured; run "make distclean"
>  > there first
>  >
>  > Try a clean build ?
>  >
>  > For example:
>  >
>  > bitbake dhcp -ccleansstate && bitbake dhcp
>  >
>  > If you get the same error again, you may need inherit autotools-brokensep
>  > rather than autotools as a quick workaround.
>  >
>  > // Robert
>  >
>  > On 07/10/2014 05:50 PM, Himanshu Pandey wrote:
>  >  > Hi,
>  >  >
>  >  > As advised by you I have done that but again I am getting an error.
>  >  >
>  >  > Please find the log as attachment.
>  >  >
>  >  > Regards,
>  >  > Himanshu
>  >  >
>  >  > From: Robert Yang <liezhi.yang@windriver.com>
>  >  > Sent: Thu, 10 Jul 2014 14:08:59
>  >  > To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
>  >  > Cc: "openembedded-devel@lists.openembedded.org"
>  >  > <openembedded-devel@lists.openembedded.org>
>  >  > Subject: Re: Regarding dhcp package
>  >  >
>  >  >
>  >  > On 07/10/2014 04:17 PM, Himanshu Pandey wrote:
>  >  >  > Hi Robert,
>  >  >  >
>  >  >  > I am getting an error while compiling my dhcp package. Please find the
> log as
>  >  >  > attachment.
>  >  >  >
>  >  >  > My dhcp bb file is as follows:
>  >  >  >
>  >  >  > SECTION = "base"
>  >  >  > SUMMARY = "Internet Software Consortium DHCP package"
>  >  >  > DESCRIPTION = "DHCP (Dynamic Host Configuration Protocol) is a protocol \
>  >  >  > which allows individual devices on an IP network to get their own \
>  >  >  > network configuration information from a server.  DHCP helps make it \
>  >  >  > easier to administer devices."
>  >  >  >
>  >  >  > HOMEPAGE = "http://www.isc.org/"
>  >  >  >
>  >  >  > LICENSE = "CLOSED"
>  >  >  >
>  >  >  > DEPENDS = "openssl bind"
>  >  >  >
>  >  >  > SRC_URI =
>  >  > "svn://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="
> <http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd=">
>  > <http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd=">
>  >  > <http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd=">
>  >  >  > SRCREV = "${AUTOREV}"
>  >  >  > S= "${WORKDIR}/trunk"
>  >  >  > #inherit autotools
>  >  >  > do_compile() {
>  >  >  >          #cp -f ${WORKDIR}/trunk/include/site.h ${S}/includes
>  >  >  >          cd ../trunk
>  >  >  >          ./configure --prefix=${prefix} --host=${HOST_SYS}
>  >  >  >          make
>  >  >  > }
>  >  >  >
>  >  >
>  >  > I think that these are wrong, you should not disable the "inherit autotools",
>  >  > and should not use "./configure" or "make" directly, try to enable
>  >  > the "inherit autotools", and remove the do_compile section to see what
>  >  > would happen, maybe you need:
>  >  >
>  >  > inherit autotools
>  >  > S = "${WORKDIR}/trunk"
>  >  >
>  >  > // Robert
>  >  >
>  >  >  >
>  >  >  > do_install_append () {
>  >  >  >          install -d ${D}${sysconfdir}/init.d
>  >  >  >          install -d ${D}${sysconfdir}/default
>  >  >  >          install -d ${D}${sysconfdir}/dhcp
>  >  >  >          install -d /etc/dhcp
>  >  >  >          install -d /sbin
>  >  >  >          install -d /var/db
>  >  >  >          install -d /var/lib
>  >  >  >          install -d /usr/local/sbin/
>  >  >  > install -m 0755 ${D}/sbin/dhcrelay
>  >  >  >          install -m 0755 ${D}/sbin/dhcpd
>  >  >  >          install -m 0755 ${D}/sbin/dhclient-script
>  >  >  >          install -m 0755 ${D}/var/db/dhcpd.leases
>  >  >  >          install -m 0755 ${D}/var/lib/dhcpd
>  >  >  >          install -m 0755 ${D}/usr/local/sbin/dhclient
>  >  >  >          sudo touch ${D}/usr/local/bin/dhcpd-pools
>  >  >  >          rm -f ${D}${sysconfdir}/dhclient.conf*
>  >  >  >          rm -f ${D}${sysconfdir}/dhcpd.conf*
>  >  >  >          rm -f /etc/dhcpd.conf*
>  >  >  >          install -m 0644 ${WORKDIR}/dhcpd.conf ${D}/etc/dhcpd.conf
>  >  >  >          install -m 0644 ${WORKDIR}/dhclient.conf
> ${D}/etc/dhcp/dhclient.conf
>  >  >  >
>  >  >  >          install -d ${D}${base_sbindir}/
>  >  >  >          if [ "${sbindir}" != "${base_sbindir}" ]; then
>  >  >  >                  mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
>  >  >  >          fi
>  >  >  >          install -m 0755 ${S}/client/scripts/linux
>  >  >  > ${D}${base_sbindir}/dhclient-script
>  >  >  > }
>  >  >  >
>  >  >  > PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay
>  > dhcp-omshell"
>  >  >  >
>  >  >  > FILES_${PN} = ""
>  >  >  > RDEPENDS_${PN}-dev = ""
>  >  >  > RDEPENDS_${PN}-staticdev = ""
>  >  >  >
>  >  >  > FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
>  >  >  > RRECOMMENDS_dhcp-server = "dhcp-server-config"
>  >  >  >
>  >  >  > FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server
>  >  >  > ${sysconfdir}/dhcp/dhcpd.conf"
>  >  >  >
>  >  >  > FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay
>  >  >  > ${sysconfdir}/default/dhcp-relay"
>  >  >  >
>  >  >  > FILES_dhcp-client = "${base_sbindir}/dhclient
> ${base_sbindir}/dhclient-script
>  >  >  > ${sysconfdir}/dhcp/dhclient.conf"
>  >  >  > RDEPENDS_dhcp-client = "bash"
>  >  >  >
>  >  >  > FILES_dhcp-omshell = "${bindir}/omshell"
>  >  >  >
>  >  >  > pkg_postinst_dhcp-server() {
>  >  >  >      mkdir -p $D/${localstatedir}/lib/dhcp
>  >  >  >      touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
>  >  >  >      touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
>  >  >  > }
>  >  >  >
>  >  >  > pkg_postinst_dhcp-client() {
>  >  >  >      mkdir -p $D/${localstatedir}/lib/dhcp
>  >  >  > }
>  >  >  >
>  >  >  > pkg_postrm_dhcp-server() {
>  >  >  >      rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
>  >  >  >      rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
>  >  >  >
>  >  >  >      if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
>  >  >  >          echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
>  >  >  >      fi
>  >  >  > }
>  >  >  >
>  >  >  > pkg_postrm_dhcp-client() {
>  >  >  >      rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
>  >  >  >      rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
>  >  >  >
>  >  >  >      if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
>  >  >  >          echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
>  >  >  >      fi
>  >  >  > }
>  >  >  >
>  >  >  > Please help.
>  >  >  >
>  >  >  > Regards,
>  >  >  > Himanshu
>  >  >  >
>  >  >  > From: Robert Yang <liezhi.yang@windriver.com>
>  >  >  > Sent: Wed, 02 Jul 2014 15:22:14
>  >  >  > To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
>  >  >  > "openembedded-devel@lists.openembedded.org"
>  >  >  > <openembedded-devel@lists.openembedded.org>
>  >  >  > Subject: Re: [bitbake-devel] Regarding rp-pppoe package
>  >  >  >
>  >  >  >
>  >  >  > On 07/02/2014 05:49 PM, Himanshu Pandey wrote:
>  >  >  >  > Hi,
>  >  >  >  >
>  >  >  >  > I am getting following error when I tried to add and compile rp-pppoe
>  >  > pacakage:
>  >  >  >  >
>  >  >  >
>  >  >  > Please add the full error log, thanks.
>  >  >  >
>  >  >  > Btw, I will go to have dinner now, may reply tomorrow.
>  >  >  >
>  >  >  > // Robert
>  >  >  >
>  >  >  >  > ERROR: oe_runconf failed
>  >  >  >  >
>  >  >  >  > Please help.
>  >  >  >  >
>  >  >  >  > Regards,
>  >  >  >  > Himanshu
>  >  >  >  >
>  >  >  >  >
>  >  >  >  >
>  >  >  >  >
>  >  >  >  > From: Robert Yang <liezhi.yang@windriver.com>
>  >  >  >  > Sent: Wed, 02 Jul 2014 13:16:17
>  >  >  >  > To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
>  >  >  >  > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
>  >  >  >  > Subject: Re: [bitbake-devel] Regarding Net-Snmp package
>  >  >  >  >
>  >  >  >  > I think that this email should go into oe-devel (see the cc) since
>  >  >  >  > the net-snmp is from the meta-networking layer, please see:
>  >  >  >  >
>  >  >  >  > meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
>  >  >  >  >
>  >  >  >  > PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static
>  >  >  > ${PN}-libs \
>  >  >  >  >              ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd
>  >  >  >  > ${PN}-server-snmptrapd"
>  >  >  >  >
>  >  >  >  > There is no net-snmp in the PACKAGES, I think that you need use
>  >  >  >  > net-snmp-client or net-snmp-server.
>  >  >  >  >
>  >  >  >  > // Robert
>  >  >  >  >
>  >  >  >  >
>  >  >  >  >
>  >  >  >  >
>  >  >  >  > On 07/02/2014 03:36 PM, Himanshu Pandey wrote:
>  >  >  >  >  > Hi,
>  >  >  >  >  >
>  >  >  >  >  > I am getting following errors:
>  >  >  >  >  >
>  >  >  >  >  > Error: net-snmp not found in the base feeds (genericx86_64 x86_64
>  >  > noarch any
>  >  >  >  > all).
>  >  >  >  >  >
>  >  >  >  >  > sed: can't read
>  >  >  >  >  >
>  >  >  >  >
>  >  >  >
>  >  >
>  >
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp/5.7.2-r1/image/usr/bin/net-snmp-config:
>  >  >  >  >  > No such file or directory
>  >  >  >  >  >
>  >  >  >  >  > Please help.
>  >  >  >  >  >
>  >  >  >  >  > Regards,
>  >  >  >  >  > Himanshu
>  >  >  >  >  >
>  >  >  >  >  >
>  >  >  >  >  >
>  >  >  >  >
>  >  >  >
>  >  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  >  >  >  >  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with
>  > Company
>  >  >  >  > email.
>  >  >  >  >  >    *Know More >*
>  >  >  >  >  >
>  >  >  >  >
>  >  >  >
>  >  >
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >  >  >  >  >
>  >  >  >  >  >
>  >  >  >  >  >
>  >  >  >  >
>  >  >  >  >
>  >  >  >
>  >  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  >  >  >  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with
> Company
>  >  >  > email.
>  >  >  >  >    *Know More >*
>  >  >  >  >
>  >  >  >
>  >  >
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >  >  >  >
>  >  >  >
>  >  >  >
>  >  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  >  >  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
>  >  > email.
>  >  >  >    *Know More >*
>  >  >  >
>  >  >
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >  >  >
>  >  >
>  >  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  >  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
>  > email.
>  >  >    *Know More >*
>  >  >
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >  >
>  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
> email.
>  >    *Know More >*
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>

