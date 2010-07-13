Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OYoDf-0007wm-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 00:45:09 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OYoDb-0001Kw-RM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 15:44:51 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 13 Jul 2010 15:44:51 -0700
Received: from [172.30.80.29] ([172.30.80.29]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 13 Jul 2010 16:44:50 -0600
Message-ID: <4C3CEC5C.8080506@mentor.com>
Date: Tue, 13 Jul 2010 15:44:44 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1OYmec-0005TF-MX@melo.openembedded.org>
In-Reply-To: <E1OYmec-0005TF-MX@melo.openembedded.org>
X-OriginalArrivalTime: 13 Jul 2010 22:44:50.0829 (UTC)
	FILETIME=[00E49BD0:01CB22DD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Dmitry Eremin-Solenikov : u-boot: add a recipe for fresh release of u-boot. Also make it default for tqm8540 board
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
X-List-Received-Date: Tue, 13 Jul 2010 22:45:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e1a3091c2417994a798b51bc6d6cac1d52799865
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e1a3091c2417994a798b51bc6d6cac1d52799865
> 
> Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Date:   Wed Jul 14 00:01:39 2010 +0400
> 
> u-boot: add a recipe for fresh release of u-boot. Also make it default for tqm8540 board
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> 
> ---
> 
>  recipes/u-boot/u-boot_2010.06.bb |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/u-boot/u-boot_2010.06.bb b/recipes/u-boot/u-boot_2010.06.bb
> new file mode 100644
> index 0000000..73dea39
> --- /dev/null
> +++ b/recipes/u-boot/u-boot_2010.06.bb
> @@ -0,0 +1,20 @@
> +PR = "r1"
> +require u-boot.inc
> +
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_tqm8540 = "1"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +
> +TARGET_LDFLAGS = ""
> +
> +inherit base
> +
> +do_compile () {
> +       oe_runmake ${UBOOT_MACHINE}
> +       oe_runmake all
> +}

I know this isn't new.  Why is the oe_runmake ${UBOOT_MACHINE}, which is 
basically "configure u-boot for this machine" in do_compile and not 
do_configure?

-- 
Tom Rini
Mentor Graphics Corporation


