Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4937360F86
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 00:16:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r860GapA004784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Sep 2013 17:16:36 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 5 Sep 2013 17:16:36 -0700
Message-ID: <52291EE4.9060306@windriver.com>
Date: Fri, 6 Sep 2013 08:16:36 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1376981857-9687-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1376981857-9687-1-git-send-email-rongqing.li@windriver.com>
Cc: joe.macdonald@windriver.com
Subject: Re: [PATCH meta-networking] atftp: port a patch from OpenSUSE to fix "Sorcerer's Apprentice Syndrome"(SAS)
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
X-List-Received-Date: Fri, 06 Sep 2013 00:16:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping...

Thanks

-Roy


On 08/20/2013 02:57 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta-networking/recipes-daemons/atftp/atftp_git.bb |    1 +
>   .../files/atftp-0.7-sorcerers_apprentice.patch     |   94 ++++++++++++++++++++
>   2 files changed, 95 insertions(+)
>   create mode 100644 meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
>
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> index 4b9ff05..8f9b4e3 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> @@ -13,6 +13,7 @@ SRC_URI = "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=git \
>              file://atftpd-0.7_unprotected_assignments_crash.patch \
>              file://atftpd.init \
>              file://atftpd.service \
> +           file://atftp-0.7-sorcerers_apprentice.patch \
>   "
>   S = "${WORKDIR}/git"
>
> diff --git a/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch b/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
> new file mode 100644
> index 0000000..fc64291
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/atftp/files/atftp-0.7-sorcerers_apprentice.patch
> @@ -0,0 +1,94 @@
> +atftp exhibits the well known "Sorcerer's Apprentice Syndrome"(SAS) problem.
> +According to RFC 1350, the fix to SAS is quite simple: further copies of the
> +acknowledgment for a particular data block would be ignored.
> +
> +Patch originally from OpenSUSE:
> +https://build.opensuse.org/package/view_file?file=atftp-0.7-sorcerers_apprentice.patch&package=atftp.539&project=openSUSE%3A12.1%3AUpdate&rev=84569792975e00573d7df597d2a6e895
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +Index: atftp-0.7/tftp_file.c
> +===================================================================
> +--- atftp-0.7.orig/tftp_file.c	2011-11-22 15:12:53.792744083 +0100
> ++++ atftp-0.7/tftp_file.c	2011-11-22 15:13:51.706421893 +0100
> +@@ -605,6 +605,7 @@
> +      int timeout_state = state; /* what state should we go on when timeout */
> +      int result;
> +      long block_number = 0;
> ++     long last_requested_block = -1;
> +      long last_block = -1;
> +      int data_size;             /* size of data received */
> +      int sockfd = data->sockfd; /* just to simplify calls */
> +@@ -765,6 +766,17 @@
> +                          connected = 1;
> +                     }
> +                     block_number = ntohs(tftphdr->th_block);
> ++
> ++                    if (last_requested_block >= block_number)
> ++                    {
> ++                        if (data->trace)
> ++                            fprintf(stderr, "received duplicated ACK <block: %ld >= %ld>\n",
> ++                                    last_requested_block, block_number);
> ++                        break;
> ++                    }
> ++                    else
> ++                        last_requested_block = block_number;
> ++
> +                     if (data->trace)
> +                          fprintf(stderr, "received ACK <block: %ld>\n",
> +                                  block_number);
> +Index: atftp-0.7/tftpd_file.c
> +===================================================================
> +--- atftp-0.7.orig/tftpd_file.c	2011-11-22 15:12:53.793744112 +0100
> ++++ atftp-0.7/tftpd_file.c	2011-11-22 15:15:04.617534260 +0100
> +@@ -403,6 +403,7 @@
> +      int timeout_state = state;
> +      int result;
> +      long block_number = 0;
> ++     long last_requested_block = -1;
> +      long last_block = -1;
> +      int block_loops = 0;
> +      int data_size;
> +@@ -859,6 +860,32 @@
> +                     {
> +                          logger(LOG_DEBUG, "received ACK <block: %d>", block_number);
> +                     }
> ++
> ++		    /* check whether the block request isn't already fulfilled */
> ++
> ++                    /* multicast, block numbers could contain gaps */
> ++                    if (multicast) {
> ++                        if (last_requested_block >= block_number)
> ++                        {
> ++                            if (data->trace)
> ++                                logger(LOG_DEBUG, "received duplicated ACK <block: %d >= %d>", last_requested_block, block_number);
> ++                            break;
> ++                        }
> ++                        else
> ++                            last_requested_block = block_number;
> ++                    /* unicast, blocks should be requested one after another */
> ++		    } else {
> ++                        if (last_requested_block + 1 != block_number && last_requested_block != -1)
> ++                        {
> ++                            if (data->trace)
> ++                                logger(LOG_DEBUG, "received out of order ACK <block: %d != %d>", last_requested_block + 1, block_number);
> ++                            break;
> ++                        }
> ++                        else
> ++                            last_requested_block = block_number;
> ++                    }
> ++
> ++
> +                     if (ntohs(tftphdr->th_block) == 65535)
> +                     {
> +                          block_loops++;
> +@@ -958,6 +985,8 @@
> +                          /* nedd to send an oack to that client */
> +                          state = S_SEND_OACK;
> +                          fseek(fp, 0, SEEK_SET);
> ++			 /* reset the last block received counter */
> ++			 last_requested_block = -1;
> +                     }
> +                     else
> +                     {
>

-- 
Best Reagrds,
Roy | RongQing Li

