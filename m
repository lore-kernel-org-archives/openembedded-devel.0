Return-Path: <prvs=7309f93ae=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 760D777093
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 07:50:57 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aq0EAE+UKFasEApK/2dsb2JhbABehApvBr97I4JBgm9KAoIGAQEBAQEBgQuELwEBBCNVARALDQsCAgUWCwICCQMCAQIBNRAGDQEHAgWILAixUpMCAQEBAQEFAQEBAR+BIoVVhH6EWjMHF4JSgUUFliqFGYolhngXknWEaHCFPYEGAQEB
X-IPAS-Result: Aq0EAE+UKFasEApK/2dsb2JhbABehApvBr97I4JBgm9KAoIGAQEBAQEBgQuELwEBBCNVARALDQsCAgUWCwICCQMCAQIBNRAGDQEHAgWILAixUpMCAQEBAQEFAQEBAR+BIoVVhH6EWjMHF4JSgUUFliqFGYolhngXknWEaHCFPYEGAQEB
Message-ID: <5628952C.8080706@skidata.com>
Date: Thu, 22 Oct 2015 09:50:04 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <56279AAF.4050704@dresearch-fe.de>
In-Reply-To: <56279AAF.4050704@dresearch-fe.de>
X-Originating-IP: [172.16.60.30]
Subject: Re: cups-filters
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
X-List-Received-Date: Thu, 22 Oct 2015 07:51:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/21/2015 04:01 PM, Steffen Sledz wrote:
> Does anybody know about a recipe providing cups-filters?
> 
> http://layers.openembedded.org was not really helpful here.
> 

Hi,
I have one which works for my purposes but it is not really tested...
It is based on something I found somewhere on the web (I don't remember
the source).
Hope it helps ;-)

best regards,
Richard

cups-filters.inc:
^^^^^^^^^^^^^^^^^
DESCRIPTION = "CUPS backends, filters, and other software"
HOMEPAGE =
"http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters"
LICENSE = "GPLv2 & LGPLv2 & MIT & GPLv2+ & GPLv3"
SECTION = "console/utils"
DEPENDS = "cups lcms2 ijs poppler qpdf"
PR = "r4"

SRC_URI =
"http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz"

inherit autotools

PACKAGES += "\
        ${PN}-data \
        "

#FILES_${PN}-gst = "\
#       ${libdir}/cups/filter/gstopxl \
#       ${libdir}/cups/filter/gstoraster \
#       "
#RCONFLICTS_${PN}-gst = "ghostscript-cups"

#FILES_${PN}-banners = "\
#       /usr/share/cups/banners \
#       "
FILES_${PN}-data = "\
        /usr/share/cups/data \
        "

FILES_${PN}-dbg += "\
        ${libdir}/cups/filter/.debug \
        ${libdir}/cups/backend/.debug \
        "
FILES_${PN} += "\
        ${libdir}/cups/filter/bannertopdf \
        ${libdir}/cups/filter/commandtoescpx \
        ${libdir}/cups/filter/commandtopclx \
        ${libdir}/cups/filter/foomatic-rip \
        ${libdir}/cups/filter/imagetopdf \
        ${libdir}/cups/filter/imagetops \
        ${libdir}/cups/filter/imagetoraster \
        ${libdir}/cups/filter/pdftoijs \
        ${libdir}/cups/filter/pdftoippprinter \
        ${libdir}/cups/filter/pdftoopvp \
        ${libdir}/cups/filter/pdftopdf \
        ${libdir}/cups/filter/pdftops \
        ${libdir}/cups/filter/pdftoraster \
        ${libdir}/cups/filter/pstopdf \
        ${libdir}/cups/filter/rastertoescpx \
        ${libdir}/cups/filter/rastertopclx \
        ${libdir}/cups/filter/textonly \
        ${libdir}/cups/filter/texttopdf \
        ${libdir}/cups/filter/texttops \
        ${libdir}/cups/filter/urftopdf \
        ${libdir}/cups/backend \
        /usr/share/cups/charsets \
        /usr/share/cups/drv \
        /usr/share/cups/mime \
        /usr/share/cups/ppdc \
        /usr/share/ppd/cupsfilters \
        "

do_install_append() {
        # remove banners
        rm -rf ${D}/usr/share/cups/banners

        # remove gst, already provided by ghostscript-cups
        rm -f ${D}${libdir}/cups/filter/gstopxl
        rm -f ${D}${libdir}/cups/filter/gstoraster

        # remove testprint (already provided by cups)
        rm -f ${D}/usr/share/cups/data/testprint
}

#RDEPENDS_${PN} += "libqpdf libpoppler"

