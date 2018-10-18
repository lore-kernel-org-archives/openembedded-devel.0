Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id B96BB79513
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 01:08:29 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id BE086220285
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 14:08:27 +1300 (NZDT)
To: openembedded-devel@lists.openembedded.org
References: <20181009045520.32013-1-douglas.royds@taitradio.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <7c69b683-e925-c5a7-d190-0eb0e240dd47@taitradio.com>
Date: Thu, 18 Oct 2018 14:08:27 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181009045520.32013-1-douglas.royds@taitradio.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] openldap: Reproducibility: Remove user, hostname, pwd from version string
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
X-List-Received-Date: Thu, 18 Oct 2018 01:08:30 -0000
Content-Language: en-GB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch is already on meta-openembedded master:

    http://git.openembedded.org/meta-openembedded/commit/?id=ed5c1c19963546f09201747b11b94b71729b0bcd

For the record, I have just submitted it upstream:

    http://www.openldap.org/its/index.cgi/Incoming?id=8928

Should I submit a new patch, changing the upstream-status to "Submitted"?


On 9/10/18 5:55 PM, Douglas Royds wrote:

> Upstream-Status: Pending
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
> ...
>
> diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
> ...
> +-WHOWHERE="$USER@`uname -n`:`pwd`"
> ++WHOWHERE="${SOURCE_DATE_EPOCH:-$USER@`uname -n`:`pwd`}"



