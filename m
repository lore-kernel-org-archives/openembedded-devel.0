Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.10572.1615823158803993191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 08:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nSCVWsF4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FFjrTl005101;
	Mon, 15 Mar 2021 10:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615823153;
	bh=h8o1ed7A3eubBu0W8+Ee196qbXwaDt3JJ5QDTQpSNT4=;
	h=Subject:CC:References:To:From:Date:In-Reply-To;
	b=nSCVWsF4fq0kV2b4diriNQF7QpeMB+CSxVfC8kV9noPGO+XQlmr6Gi2eaGSKTKKYX
	 B6JtXThDgI8MJV6dq4ftkel6dQxuAvTAwirnOFqIHRsV5YZsBdoUKqCr7gFBGNS9Eh
	 +bvELejb4NGQfH0kQixU6MxlZLrO+GOAOIk3Dyow=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FFjrqd005068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 10:45:53 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 10:45:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 10:45:42 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FFjgNk035542;
	Mon, 15 Mar 2021 10:45:42 -0500
Subject: Re: [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
CC: Changqing Li <changqing.li@windriver.com>, Khem Raj <raj.khem@gmail.com>,
        <openembedded-devel@lists.openembedded.org>,
        Denys Dmytriyenko
	<denis@denix.org>
References: <20210315011408.6604-1-praneeth@ti.com>
To: <raj.khem@gmail.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <938d2927-7eb0-c273-d4a2-6adacb09ecb8@ti.com>
Date: Mon, 15 Mar 2021 10:45:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315011408.6604-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/14/2021 8:14 PM, praneeth@ti.com wrote:
> From: Changqing Li <changqing.li@windriver.com>

Have observed build errors like the below

DEBUG: Mirror fetch failure for url 
git://github.com/jthornber/thin-provisioning-tools;protocol=https 
(original url: git://github.com/jthornber/thin-provisioning-tools)
DEBUG: Fetcher failure: Unable to find revision 
5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4 in branch master even from upstream
ERROR: Fetcher failure: Unable to find revision 
5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4 in branch master even from upstream
ERROR: Fetcher failure for URL: 
'git://github.com/jthornber/thin-provisioning-tools'. Unable to fetch 
URL from any source.

and looked like the switching branch to main was missing on dunfell branch.

Please advise if this is the right fix.


> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> [cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> index 9f89bac22..3f82734ac 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> @@ -7,7 +7,7 @@ SECTION = "devel"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   S = "${WORKDIR}/git"
>   
> -SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
> +SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
>              file://0001-do-not-strip-pdata_tools-at-do_install.patch \
>              file://use-sh-on-path.patch \
>   "
> 
