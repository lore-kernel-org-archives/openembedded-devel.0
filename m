Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1QOuEi-0004Lu-Bp
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 18:13:37 +0200
Received: from [62.99.145.23] (port=58816 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1QOtwF-0003on-28
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 17:54:31 +0200
Received: from [83.64.51.210] (port=16066 helo=gateway1.hale)
	by smartmx-21.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1QOtwC-0008Mf-I1 for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 17:54:28 +0200
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id p4OFsHsr001518
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2011 17:54:17 +0200
Received: from [192.168.100.138] ([192.168.100.138]) by hale.at with
	MailEnable ESMTP; Tue, 24 May 2011 17:54:16 +0200
Message-ID: <4DDBD4A8.9070904@hale.at>
Date: Tue, 24 May 2011 17:54:16 +0200
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305841842-2431-1-git-send-email-Bernhard.Guillon@opensimpad.org>
In-Reply-To: <1305841842-2431-1-git-send-email-Bernhard.Guillon@opensimpad.org>
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: p4OFsHsr001518
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1306857258.7896@Q7Q7MEiMJNIs4/wXUSDQAQ
X-Spam-Status: No
Subject: Re: [PATCH] opkg-utils: port arfile.py patch to opkg-utils, bump PR
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
X-List-Received-Date: Tue, 24 May 2011 16:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

please give me an ACK or NACK.

If no one complains I will push this patch this thursday :)

best regards
Bernhard

On 19.05.2011 23:50, Bernhard.Guillon@opensimpad.org wrote:
> From: Bernhard Guillon<Bernhard.Guillon@opensimpad.org>
>
> We need this patch for opkg as well
>
> original commit b3da649ee25374f284d03ebce5843b6326559f73
> original Author: Scott Anderson<o2e@saaworld.com>
> original commit message:
> ipkg-utils: Make arfile.py handle six digit UIDs
>
> Essentially, the problem is that arfile.py is splitting the ar header with
> white-space instead of fixed-width fields, so two fields would get treated
> as a single field.  This makes things better than before as it now honors
> the fixed field widths.
>
> Signed-off-by: Bernhard Guillon<Bernhard.Guillon@opensimpad.org>
> ---
>   .../opkg-utils/arfile_header_split.patch           |   17 +++++++++++++++++
>   recipes/opkg-utils/opkg-utils_svn.bb               |    3 ++-
>   2 files changed, 19 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/opkg-utils/opkg-utils/arfile_header_split.patch
>
> diff --git a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
> new file mode 100644
> index 0000000..4640367
> --- /dev/null
> +++ b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
> @@ -0,0 +1,17 @@
> +--- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
> ++++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
> +@@ -74,7 +74,12 @@
> +             if l == "\n":
> +                 l = self.f.readline()
> +                 if not l: break
> +             l = l.replace('`', '')
> +-            descriptor = l.split()
> ++            # Field lengths from /usr/include/ar.h:
> ++            ar_field_lens = [ 16, 12, 6, 6, 8, 10, 2 ]
> ++            descriptor = []
> ++            for field_len in ar_field_lens:
> ++                descriptor.append(l[:field_len].strip())
> ++                l = l[field_len:]
> + #            print descriptor
> +             size = int(descriptor[5])
> +             memberName = descriptor[0][:-1]
> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
> index 6b8d3ea..a8f2cb7 100644
> --- a/recipes/opkg-utils/opkg-utils_svn.bb
> +++ b/recipes/opkg-utils/opkg-utils_svn.bb
> @@ -6,10 +6,11 @@ RDEPENDS_${PN} = "python"
>   RDEPENDS_${PN}_virtclass-native = ""
>   SRCREV = "4747"
>   PV = "0.1.8+svnr${SRCPV}"
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>              file://index-ignore-filenotfound.patch \
> +           file://arfile_header_split.patch \
>              file://mtime-int.patch"
>
>   S = "${WORKDIR}/opkg-utils"



--
Scanned by MailScanner.



