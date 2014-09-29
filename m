Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD5C65F77
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 07:50:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8T7oimd008856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Sep 2014 00:50:44 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 29 Sep 2014 00:50:43 -0700
Message-ID: <54290F57.6090500@windriver.com>
Date: Mon, 29 Sep 2014 15:50:47 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1409227581-20888-6-git-send-email-pab@pabigot.com>
	<1409247791-29772-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1409247791-29772-1-git-send-email-pab@pabigot.com>
Subject: Re: [meta-networking][PATCH v2] ntp: add deterministic support for KPPS interface
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
X-List-Received-Date: Mon, 29 Sep 2014 07:50:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/29/2014 01:43 AM, Peter A. Bigot wrote:
> ntp checks for presence of sys/timepps.h to determine whether the kernel
> supports the RFC 2783 KPPS interface.  Under Linux the pps-tools package
> installs this header.  Without this feature the ATOM clock driver does
> not work, and other drivers like NMEA have reduced precision.  Remove
> the feature non-determinism and increase ntpd capabilities by adding an
> explicit dependency.
>
> See: http://doc.ntp.org/4.2.6/kernpps.html
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
> V2: replace PACKAGECONFIG with DEPENDS to remove nondeterminism
>
>   meta-networking/recipes-support/ntp/ntp.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
> index 55926e0..f55a39a 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -8,6 +8,8 @@ SECTION = "console/network"
>   LICENSE = "NTP"
>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
>
> +DEPENDS = "pps-tools"

Could we add this dependent by PACKAGECONFIG?

-R


> +
>   INC_PR = "r6"
>
>   SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
>

-- 
Best Reagrds,
Roy | RongQing Li

