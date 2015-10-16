Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAE5B77129
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 05:02:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G52qrk025326
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 22:02:52 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 15 Oct 2015 22:02:52 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1444965782-22372-1-git-send-email-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <562084FA.3080905@windriver.com>
Date: Fri, 16 Oct 2015 13:02:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1444965782-22372-1-git-send-email-kai.kang@windriver.com>
Subject: [meta-multimedia][PATCH] vorbis-tools: fix CVE-2015-6749
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
X-List-Received-Date: Fri, 16 Oct 2015 05:02:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月16日 11:23, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patch to fix CVE-2015-6749 from:
>
> https://trac.xiph.org/ticket/2212

Forgot layer info. Add it to title.

--Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...oggenc-Fix-large-alloca-on-bad-AIFF-input.patch | 49 ++++++++++++++++++++++
>   .../vorbis-tools/vorbis-tools_1.4.0.bb             |  4 +-
>   2 files changed, 52 insertions(+), 1 deletion(-)
>   create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
> new file mode 100644
> index 0000000..b623dbf
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
> @@ -0,0 +1,49 @@
> +Upstream-Status: Backport
> +
> +Backport patch to fix CVE-2015-6749 from:
> +
> +https://trac.xiph.org/ticket/2212
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +From 04815d3e1bfae3a6cdfb2c25358a5a72b61299f7 Mon Sep 17 00:00:00 2001
> +From: Mark Harris <mark.hsj@gmail.com>
> +Date: Sun, 30 Aug 2015 05:54:46 -0700
> +Subject: [PATCH] oggenc: Fix large alloca on bad AIFF input
> +
> +Fixes #2212
> +---
> + oggenc/audio.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/oggenc/audio.c b/oggenc/audio.c
> +index 477da8c..4921fb9 100644
> +--- a/oggenc/audio.c
> ++++ b/oggenc/audio.c
> +@@ -245,8 +245,8 @@ static int aiff_permute_matrix[6][6] =
> + int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
> + {
> +     int aifc; /* AIFC or AIFF? */
> +-    unsigned int len;
> +-    unsigned char *buffer;
> ++    unsigned int len, readlen;
> ++    unsigned char buffer[22];
> +     unsigned char buf2[8];
> +     aiff_fmt format;
> +     aifffile *aiff = malloc(sizeof(aifffile));
> +@@ -269,9 +269,9 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
> +         return 0; /* Weird common chunk */
> +     }
> +
> +-    buffer = alloca(len);
> +-
> +-    if(fread(buffer,1,len,in) < len)
> ++    readlen = len < sizeof(buffer) ? len : sizeof(buffer);
> ++    if(fread(buffer,1,readlen,in) < readlen ||
> ++       (len > readlen && !seek_forward(in, len-readlen)))
> +     {
> +         fprintf(stderr, _("Warning: Unexpected EOF in reading AIFF header\n"));
> +         return 0;
> +--
> +2.5.0
> +
> diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
> index a35dee6..2683555 100644
> --- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
> +++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
> @@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   
>   DEPENDS = "libogg libvorbis curl libao"
>   
> -SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz"
> +SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
> +           file://0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch \
> +          "
>   
>   SRC_URI[md5sum] = "567e0fb8d321b2cd7124f8208b8b90e6"
>   SRC_URI[sha256sum] = "a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc"


-- 
Regards,
Neil | Kai Kang


