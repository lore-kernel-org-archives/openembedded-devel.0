Return-Path: <vsivanagulu@easyarm.com>
Received: from linux8.hoststud.com (unknown [94.130.9.145])
	by mail.openembedded.org (Postfix) with ESMTP id 75FC560720
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 05:56:47 +0000 (UTC)
Received: from [106.51.36.173] (port=40802 helo=[192.168.1.42])
	by linux8.hoststud.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89)
	(envelope-from <vsivanagulu@easyarm.com>) id 1eJYsr-00080U-OV
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Nov 2017 11:26:41 +0530
To: openembedded-devel@lists.openembedded.org
References: <mailman.13257.1511811425.1653.openembedded-devel@lists.openembedded.org>
From: siva <vsivanagulu@easyarm.com>
Message-ID: <6915f17c-e237-9b6c-6be3-6dc440d88779@easyarm.com>
Date: Tue, 28 Nov 2017 11:26:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <mailman.13257.1511811425.1653.openembedded-devel@lists.openembedded.org>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - linux8.hoststud.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - easyarm.com
X-Get-Message-Sender-Via: linux8.hoststud.com: authenticated_id:
	vsivanagulu@easyarm.com
X-Authenticated-Sender: linux8.hoststud.com: vsivanagulu@easyarm.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: updated madplay support for meta-multimedia. message -5
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
X-List-Received-Date: Tue, 28 Nov 2017 05:56:47 -0000
X-Groupsio-MsgNum: 69779
Content-Type: multipart/mixed; boundary="------------8085B8864E10403B10D258AA"
Content-Language: en-US

--------------8085B8864E10403B10D258AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

  this recipe is updated in meta multimedia.

find the attachment or see below.

DESCRIPTION = "Madplay is a command-line MPEG audio decoder and player"
SECTION = "console/multimedia"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

SRC_URI = "ftp://ftp.mars.org/pub/mpeg/${PN}-0.15.2b.tar.gz "

SRC_URI[md5sum] = "6814b47ceaa99880c754c5195aa1aac1"
SRC_URI[sha256sum] = 
"5a79c7516ff7560dffc6a14399a389432bc619c905b13d3b73da22fa65acede0"

DEPENDS += "libmad libid3tag"
inherit autotools gettext

do_configure_prepend() {

         touch ${S}/NEWS
         touch ${S}/AUTHORS
         touch ${S}/ChangeLog
}

ARM_INSTRUCTION_SET = "arm"

FILES_${PN} = "${bindir}/*"

#  plese add the below line in your conf/local.conf when you have got 
any LICENCE errors of libmad
# LICENSE_FLAGS_WHITELIST += "commercial"



On Tuesday 28 November 2017 01:07 AM, 
openembedded-devel-request@lists.openembedded.org wrote:
> Send Openembedded-devel mailing list submissions to
> 	openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> or, via email, send a message with subject or body 'help' to
> 	openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
> 	openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>     1. [meta-python][PATCH 1/3] python-bitarray: add native to
>        BBCLASSEXTEND (Derek Straka)
>     2. [meta-python][PATCH 2/3] python-django-south: add native to
>        BBCLASSEXTEND (Derek Straka)
>     3. [meta-python][PATCH 3/3] python-django: add native to
>        BBCLASSEXTEND (Derek Straka)
>     4. Re: [meta-networking][PATCH v2 1/6] ddclient: new package
>        (Khem Raj)
>     5. Re: madplay support for meta-oe (Khem Raj)
>     6. Re: [meta-python][PATCH] python-grpcio: only modify the
>        compiler arguments on the target build (Khem Raj)
>     7. Re: [meta-python][PATCH] python-grpcio: only modify the
>        compiler arguments on the target build (Derek Straka)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Mon, 27 Nov 2017 11:04:22 -0500
> From: Derek Straka <derek@asterius.io>
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-python][PATCH 1/3] python-bitarray: add native to
> 	BBCLASSEXTEND
> Message-ID: <1511798664-17286-1-git-send-email-derek@asterius.io>
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta-python/recipes-devtools/python/python-bitarray.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
> index 7b6e0d1..38a22f6 100644
> --- a/meta-python/recipes-devtools/python/python-bitarray.inc
> +++ b/meta-python/recipes-devtools/python/python-bitarray.inc
> @@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd92
>   
>   inherit pypi
>   
> -BBCLASSEXTEND = "nativesdk"
> +BBCLASSEXTEND = "native nativesdk"


--------------8085B8864E10403B10D258AA
Content-Type: text/x-patch;
 name="0001-madplay-support-for-all-yocto-branches.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-madplay-support-for-all-yocto-branches.patch"

From bd501d55f15c2557bdd9091c974f6a5e7db82f30 Mon Sep 17 00:00:00 2001
From: Siva Nageswara rao <siva.v@phytec.in>
Date: Tue, 28 Nov 2017 11:22:12 +0530
Subject: [PATCH] madplay support for all yocto branches

Signed-off-by: Siva Nageswara rao <siva.v@phytec.in>
---
 .../recipes-multimedia/madplay/madplay_0.15.2b.bb  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/madplay/madplay_0.15.2b.bb

diff --git a/meta-multimedia/recipes-multimedia/madplay/madplay_0.15.2b.bb b/meta-multimedia/recipes-multimedia/madplay/madplay_0.15.2b.bb
new file mode 100644
index 0000000..3e2b87f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/madplay/madplay_0.15.2b.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Madplay is a command-line MPEG audio decoder and player"
+SECTION = "console/multimedia"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "ftp://ftp.mars.org/pub/mpeg/${PN}-0.15.2b.tar.gz "
+
+SRC_URI[md5sum] = "6814b47ceaa99880c754c5195aa1aac1"
+SRC_URI[sha256sum] = "5a79c7516ff7560dffc6a14399a389432bc619c905b13d3b73da22fa65acede0"
+
+DEPENDS += "libmad libid3tag"
+inherit autotools gettext 
+
+do_configure_prepend() {
+
+        touch ${S}/NEWS
+        touch ${S}/AUTHORS
+        touch ${S}/ChangeLog
+}
+
+ARM_INSTRUCTION_SET = "arm"
+
+FILES_${PN} = "${bindir}/*"
+
+#  plese add the below line in your conf/local.conf when you have got any LICENCE errors of libmad
+# LICENSE_FLAGS_WHITELIST += "commercial"
+
+
-- 
2.7.4


--------------8085B8864E10403B10D258AA--
