Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QoyNK-00013H-Ju
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 15:54:14 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 4 Aug 2011 15:49:50 +0200
X-TM-IMSS-Message-ID: <71fcee6b00031633@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 71fcee6b00031633 ;
	Thu, 4 Aug 2011 15:48:45 +0200
Message-ID: <4E3AA37F.4050100@nedap.com>
Date: Thu, 04 Aug 2011 15:49:51 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
In-Reply-To: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
X-OriginalArrivalTime: 04 Aug 2011 13:49:50.0775 (UTC)
	FILETIME=[61A25470:01CC52AD]
Subject: Re: [PATCH] ptpd: added recipe for v1.1.0.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 13:54:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 03:32 PM, Chris Verges wrote:
> Signed-off-by: Chris Verges<kg4ysn@gmail.com>
> ---
>   meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb |   19 +++++++++++++++++++
>   1 files changed, 19 insertions(+), 0 deletions(-)
>   create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb
>
> diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb b/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb
> new file mode 100644
> index 0000000..87e0a69
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
> +HOMEPAGE = "http://sourceforge.net/projects/ptpd"
> +LICENSE = "BSD"
> +SECTION = "network"
> +PR = "r1"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz"
> +
> +S = "${WORKDIR}/ptpd-${PV}/src"
> +
> +do_install() {
> +        install -d ${D}${bindir} ${D}${mandir}/man8
> +        install -m 4555 ptpd ${D}${bindir}
> +        install -m 644 ptpd.8 ${D}${mandir}/man8
> +}
> +
> +SRC_URI[md5sum] = "faa4823576dd49ccc94b741ff32b03f5"
> +SRC_URI[sha256sum] = "a7c6ea83bd53da75ae04a7b7a25fe7c597b4e9ff1f93d46f4502e3fa8a2cb950"
> +


Why not jump to version 2.1.0 right away...


DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 
standard"
HOMEPAGE = "http://sourceforge.net/projects/ptpd"
LICENSE = "BSD"
SECTION = "network"
PR = "r0"

SRC_URI = " \
     http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/${P}.tar.gz \
     "

S = "${WORKDIR}/${P}/src"

CFLAGS += "-Dlinux"
LDFLAGS += "-lm -lrt"

do_install() {
     install -d ${D}${bindir}
     install -m 4555 ptpd2 ${D}${bindir}

     install -d ${D}${mandir}/man8
     install -m 644 ptpd.8 ${D}${mandir}/man8
}

SRC_URI[md5sum] = "9c2ba065476f3377a0b380a56c9dd8c9"
SRC_URI[sha256sum] = 
"80f271a58d2751824c8448a08178053a712aad1cc74d29250c0d6bf23ad12c00"





