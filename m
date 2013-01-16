Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvPoD-0008AH-BE
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 11:01:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 01:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,478,1355126400"; d="scan'208";a="244542413"
Received: from unknown (HELO helios.localnet) ([10.252.123.117])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2013 01:46:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Date: Wed, 16 Jan 2013 09:46 +0000
Message-ID: <52248718.Pgypod27o8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1358244046-26236-1-git-send-email-ml@communistcode.co.uk>
References: <1358244046-26236-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH v3] hiawatha: update to 8.7
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
X-List-Received-Date: Wed, 16 Jan 2013 10:01:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 January 2013 10:00:46 ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-httpd/hiawatha/files/xslt-fix.patch    | 71
> ---------------------- .../hiawatha/{hiawatha_8.6.bb => hiawatha_8.7.bb}  |
>  9 +--
>  2 files changed, 3 insertions(+), 77 deletions(-)
>  delete mode 100644
> meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch rename
> meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.6.bb => hiawatha_8.7.bb}
> (89%)
> 
> diff --git a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
> b/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch deleted file
> mode 100644
> index 41bf4cc..0000000
> --- a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -Upstream Status: Backport
> -Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ----
> - src/xslt.c | 19 +++++++------------
> - 1 file changed, 7 insertions(+), 12 deletions(-)
> -
> -diff --git a/src/xslt.c b/src/xslt.c
> -index 9d8d31a..58ca52d 100644
> ---- a/src/xslt.c
> -+++ b/src/xslt.c
> -@@ -23,6 +23,7 @@
> - #include <libxslt/transform.h>
> - #include <libxslt/xsltutils.h>
> - #include "libstr.h"
> -+#include "liblist.h"
> - #include "send.h"
> - #include "log.h"
> - #ifdef ENABLE_TOMAHAWK
> -@@ -343,10 +344,10 @@ bool can_transform_with_xslt(t_session *session) {
> - static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
> - 	xmlDocPtr style_xml, result_xml;
> - 	xsltStylesheetPtr xslt;
> --	xmlOutputBufferPtr output;
> -+	xmlChar *raw_xml;
> - 	char value[VALUE_SIZE + 1];
> - 	const char **params;
> --	int result = 200;
> -+	int result = 200, raw_size;
> -
> - 	/* Read XML data
> - 	 */
> -@@ -396,14 +397,8 @@ static int apply_xslt_sheet(t_session *session,
> xmlDocPtr data_xml) { - 		xsltFreeStylesheet(xslt);
> - 		return 500;
> - 	}
> --	if ((output = xmlAllocOutputBuffer(NULL)) == NULL) {
> --		xmlFreeDoc(result_xml);
> --		xsltFreeStylesheet(xslt);
> --		return 500;
> --	}
> --    if (xsltSaveResultTo(output, result_xml, xslt) == -1) {
> -+	if (xsltSaveResultToString(&raw_xml, &raw_size, result_xml, xslt) == -1)
> { - 		log_file_error(session, session->file_on_disk, "transformation
> error"); --		xmlOutputBufferClose(output);
> - 		xmlFreeDoc(result_xml);
> - 		xsltFreeStylesheet(xslt);
> - 		return 500;
> -@@ -414,17 +409,17 @@ static int apply_xslt_sheet(t_session *session,
> xmlDocPtr data_xml) { - 	value[VALUE_SIZE] = '\0';
> - 	if (send_buffer(session, hs_conlen, 16) == -1) {
> - 		result = -1;
> --	} else if (snprintf(value, VALUE_SIZE, "%d\r\n\r\n", output->buffer->use)
> == -1) { -+	} else if (snprintf(value, VALUE_SIZE, "%d\r\n\r\n", raw_size)
> == -1) { - 		result = -1;
> - 	} else if (send_buffer(session, value, strlen(value)) == -1) {
> - 		result = -1;
> --	} else if (send_buffer(session, (char*)output->buffer->content,
> output->buffer->use) == -1) { -+	} else if (send_buffer(session,
> (char*)raw_xml, raw_size) == -1) { - 		result = -1;
> - 	}
> -
> - 	/* Free buffers
> - 	 */
> --	xmlOutputBufferClose(output);
> -+	xmlFree(raw_xml);
> - 	xmlFreeDoc(result_xml);
> - 	xsltFreeStylesheet(xslt);
> -
> ---
> -1.8.0.1
> -
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb similarity index
> 89%
> rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
> index d49bcab..d8a0583 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
> @@ -4,16 +4,13 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>  DEPENDS = "libxml2 libxslt"
> 
> -PR = "r2"
> -
>  SECTION = "net"
> 
>  SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> -           file://hiawatha-init \
> -           file://xslt-fix.patch "
> +           file://hiawatha-init "
> 
> -SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
> -SRC_URI[sha256sum] =
> "1a7fa98ce66beb54fc8490cc787461d719a98cb0e4a81caedfa18ac8b5ba3b3b"
> +SRC_URI[md5sum] = "712b1822ef525153dc4347417252768d"
> +SRC_URI[sha256sum] =
> "c35e1e975962e1105d7914f74901e304ba90681985c94236c113eaca502b5e34"
> 
>  inherit cmake update-rc.d

Merged, thanks. (For some reason I did have to apply the delete of xslt-
fix.patch by hand though.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


