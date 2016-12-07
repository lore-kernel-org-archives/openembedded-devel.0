Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 67ED9607F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 17:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB91420A48;
	Wed,  7 Dec 2016 17:38:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id j18bhgV39Jzh; Wed,  7 Dec 2016 17:38:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9AA712017D;
	Wed,  7 Dec 2016 17:38:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 053991621C6; Wed,  7 Dec 2016 12:38:43 -0500 (EST)
Date: Wed, 7 Dec 2016 12:38:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161207173842.GB30576@denix.org>
References: <cover.1479482464.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1479482464.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: akuster@mvista.com
Subject: Re: [PATCH 0/3] meta-oe pull request krogoth-next
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
X-List-Received-Date: Wed, 07 Dec 2016 17:38:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping?

On Fri, Nov 18, 2016 at 07:24:34AM -0800, Armin Kuster wrote:
> Please consider these changes for krogoth
> The following changes since commit 851a064b53dca3b14dd33eaaaca9573b1a36bf0e:
> 
>   pypi.bbclass: Allow fetching without requiring the hash (2016-10-05 18:38:31 +0200)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/meta-openembedded-contrib akuster/krogoth-next
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/krogoth-next
> 
> Andre McCurdy (1):
>   syslog-ng: remove unused patches
> 
> Davis, Michael (1):
>   pcsc-lite: Seperate GPLV3 portions from BSD
> 
> Ian Ray (1):
>   syslog-ng: expand service file @variables@ earlier
> 
>  .../recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb  |  24 +-
>  .../files/afsql-afsql_dd_insert_db-refactor.patch  | 494 ---------------------
>  ...init-the-new-config-when-reverting-to-the.patch |  36 --
>  .../files/free-global-LogTemplateOptions.patch     |  30 --
>  .../logwriter-dont-allocate-a-new-buffer.patch     |  26 --
>  .../rewrite-expr-grammar.ym-Free-up-token.patch    |  17 -
>  .../files/still-free-the-unconsumed-item.patch     |  90 ----
>  .../syslog-ng-verify-the-list-before-del.patch     |  38 --
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   9 +-
>  9 files changed, 26 insertions(+), 738 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch
> 
> -- 
> 2.3.5
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

