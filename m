Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDDDE77CC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:32:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3CJW34n021880
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:32:03 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 12:32:03 -0700
To: <kai.kang@windriver.com>, <openembedded-devel@lists.openembedded.org>
References: <20170410021815.13689-1-kai.kang@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <ec89de92-7b7e-ee75-e398-35bb5d715b42@windriver.com>
Date: Wed, 12 Apr 2017 14:32:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170410021815.13689-1-kai.kang@windriver.com>
Subject: Re: [meta-networking][PATCH] postfix: do NOT create directory /var/spool/mail
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
X-List-Received-Date: Wed, 12 Apr 2017 19:32:06 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 4/9/17 9:18 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> postfix installs directory /var/spool/mail which conflicts with package
> shadow.
> 
> | Error: Transaction check error:
> |  file /var/spool/mail conflicts between attempted installs of
> |  postfix-3.1.1-r0.ppc64e6500 and shadow-4.2.1-r0.1.ppc64e6500
> 
> Make postfix not create /var/spool/mail that it does NOT create the
> directory on Fedora and Ubuntu either.

I am not sure this is correct.

The two packages have (according to DNF/RPM) different permissions, owner or
group assigned to that particular directory.

I think it's reasonable for both of the packages to create the directory,
however they must match in perms/owner/group.  I would defer to shadow as the
correct source for this information.

It may be necessary though to change shadow's default to something more
reasonable if 'root:root' is not right.

--Mark

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 5bb2491..4c794ff 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -164,8 +164,6 @@ do_install () {
>      install -m 770 -d ${D}${localstatedir}/spool/postfix
>      chown postfix:postfix ${D}${localstatedir}/spool/postfix
>  
> -    install -m 2755 -d ${D}${localstatedir}/spool/mail
> -    chown postfix:nogroup ${D}${localstatedir}/spool/mail
>      install -m 0755 -d ${D}${localstatedir}/lib/postfix
>      chown postfix:nogroup ${D}${localstatedir}/lib/postfix
>      install -m 0755 -d ${D}${localstatedir}/spool/postfix
> 


