Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9YC5-0004uk-Bt
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 09:07:13 +0200
Received: by bwz15 with SMTP id 15so1832490bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=G90BKalnzQOUORydbzxMAeazMxMgAYC3hJ+6k9x0bXI=;
	b=Li9dK7PNDH2QxUbVyfR8cwUVasJQ9JXwjq04kTeKWIqZCP8Mao25v+RA/kdneAa8nR
	BxrEpVLm8fZpzS0lfHIP/mOozhuUHDGSTXiEDDEVbSYbBUWfhUUaimM8UtKVI0VyzCG+
	e7DW+ExmrIYr8Bldte2l5t09viqXvdFTp0W6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FwBL3h0/Za3HfEwkujMIUadleJk1MF5vAoPcnuCL9RWT2PIW7ouxVt9V3JfdORisXh
	LpnsTeoU9jeqVjaS38YnWftHoOQ09WfFXCdAMtzHQ4EkmUc2OEDcdWCeQ1rWUZ2pw7K8
	wu+7D503PFj3O6Qfo7OvlbeO6+45GD2MDGR9U=
Received: by 10.204.52.193 with SMTP id j1mr2952301bkg.52.1287817591992;
	Sat, 23 Oct 2010 00:06:31 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t10sm2773670bkj.16.2010.10.23.00.06.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 00:06:31 -0700 (PDT)
Date: Sat, 23 Oct 2010 09:06:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101023070647.GH3527@jama>
References: <y>
 <4cc22978.0311650a.0c4d.ffffaf6c@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cc22978.0311650a.0c4d.ffffaf6c@mx.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 17/17] EFL Python Bindings are using autogen now!
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
X-List-Received-Date: Sat, 23 Oct 2010 07:07:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 10:15:57PM -0200, fidencio@profusion.mobi wrote:
> From: Fabiano Fidencio <fidencio@profusion.mobi>


Why not squash it with PATCH 15 and then there is nothing left? Even
when commit message says something else.

> ---
>  recipes/python/python-elementary_svn.bb |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/python/python-elementary_svn.bb b/recipes/python/python-elementary_svn.bb
> index da5ee68..562f32b 100644
> --- a/recipes/python/python-elementary_svn.bb
> +++ b/recipes/python/python-elementary_svn.bb
> @@ -2,7 +2,3 @@ require python-efl.inc
>  SRCREV = "${EFL_SRCREV}"
>  DEPENDS += "elementary"
>  RDEPENDS_${PN} += "python-evas python-ecore python-edje"
> -
> -do_stage() {
> -        distutils_stage_all
> -}
> -- 
> 1.7.3.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


