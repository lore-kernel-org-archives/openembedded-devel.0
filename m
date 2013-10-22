Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 207356D170
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 08:00:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M80DsL028960
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 01:00:13 -0700 (PDT)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 22 Oct 2013 01:00:12 -0700
Message-ID: <5266307F.3080402@windriver.com>
Date: Tue, 22 Oct 2013 15:59:59 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <Joe.MacDonald@windriver.com>
References: <1382427200-7587-1-git-send-email-liezhi.yang@windriver.com>
In-Reply-To: <1382427200-7587-1-git-send-email-liezhi.yang@windriver.com>
Subject: Re: [PATCH] cifs-utils: fix the installed but not shipped issue
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
X-List-Received-Date: Tue, 22 Oct 2013 08:00:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Please ignore this one, I will send an update one with proper Subject set.

// Robert

On 10/22/2013 03:33 PM, Robert Yang wrote:
> We will get the following ERROR/WARN if we enable the
> installed-vs-shipped check in QA:
>
> ERROR: QA Issue: cifs-utils: Files/directories were installed but not shipped
>    /usr/bin
>
> Remove the empty dir will fix the problem.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   recipes-support/cifs/cifs-utils_git.bb |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-support/cifs/cifs-utils_git.bb b/recipes-support/cifs/cifs-utils_git.bb
> index 89ff265..15bcf2e 100644
> --- a/recipes-support/cifs/cifs-utils_git.bb
> +++ b/recipes-support/cifs/cifs-utils_git.bb
> @@ -21,6 +21,7 @@ do_install_append() {
>       # Remove empty /usr/sbin directories since the mount helper
>       # is installed to /sbin
>       rmdir ${D}${sbindir}
> +    rmdir --ignore-fail-on-non-empty ${D}${bindir}
>   }
>
>   RRECOMMENDS_${PN} = "kernel-module-cifs"
>

