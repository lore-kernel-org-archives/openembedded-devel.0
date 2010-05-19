Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OEfqy-0003LT-16
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 11:46:17 +0200
Received: by fxm8 with SMTP id 8so1798245fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=V5KgXIpeZs+TvPlROJDCfZF2Noid3nTXzEqBnONdjjM=;
	b=YQ0gqOJX/qPEcbl4eH5fMDrt6aIaqbmHuhMIczRlt2Qc+zx4UGN3pb/a/doNA9vZUQ
	KFiDiy7kB7Vzj0WJ/NZ96coOshxFzdP5UnUh8W54/F2TgeqDic2z2fj01UQrB/J9gWPx
	f/0Jr5hLiimT0aJzv7PB338rmgGs+qG3A3ttc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nQMf7dCKRlEXbfPD/P96qW2LlBARDvtSqa8664aCH2iF+Rh9bCKNqkdl8nqU73EiMO
	zG3tQTRS2cbkr2uom6XlnHe9NI43dAojd0eHCOvDdA/YxG0p1nr+WoaBIybrr5i1drWX
	NodS2NQt5qas+EE76How132pyjFlq9iRT344A=
Received: by 10.223.26.154 with SMTP id e26mr5213675fac.57.1274262135222;
	Wed, 19 May 2010 02:42:15 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm2600479fah.21.2010.05.19.02.42.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 19 May 2010 02:42:14 -0700 (PDT)
Date: Wed, 19 May 2010 11:42:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100519094209.GH3302@jama>
References: <AANLkTimeUg2WhglfZE-N2rdYNZ4yehKmR6YSvBL5NIPX@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimeUg2WhglfZE-N2rdYNZ4yehKmR6YSvBL5NIPX@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does anybody try the e-image-core
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
X-List-Received-Date: Wed, 19 May 2010 09:46:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 19, 2010 at 05:31:21PM +0800, daniel tian wrote:
> Hi, guys:
>     Now I am working on a project: porting the enlighenment on mips machine.
>     The local.conf is configure as db1200 machine which is a mips32
> little endian arch.
>     I have already built a rootfs and kernel from previous
> openembedded source code.
>     But the startx command is not found, so I don't know how to
> startup the enlightenment desktop, and maybe there have any others
> packages missing in this rootfs.

you can try xserver-nodm-init recipe which provides
/etc/init.d/xserver-nodm (no idea if it's part of e-image-core).

>     So I just wander whethere somebody has already try the
> e-image-core succeeded(ARM platform is Ok.)
> 
>      And there is another problem. Now I update the OE code, and try
> to build the e-image-core again. But there is package not being
> downloaded:
>     /home/daniel/OE/openembedded/recipes/e17/illume-keyboard-default_svn.bb,
> Here is the error message:
> 
> NOTE: fetch http://mirrors.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
> --2010-05-19 17:05:16--
> http://mirrors.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
> Resolving mirrors.openembedded.org... 82.197.159.157
> Connecting to mirrors.openembedded.org|82.197.159.157|:80... NOTE:
> Running task 2440 of 6114 (ID: 3728,
> /home/daniel/OE/openembedded/recipes/glibc/glibc-initial_2.9.bb,
> do_qa_staging)
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2010-05-19 17:05:17 ERROR 404: Not Found.
> 
> NOTE: fetch http://sources.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
> --2010-05-19 17:05:17--
> http://sources.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
> Resolving sources.openembedded.org... 140.211.169.165
> Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2010-05-19 17:05:17 ERROR 404: Not Found.
> 
> Does anybody also meet this problem?

This is not problem, if you have working svn (not blocked by firewall or
so) the sources are checkouted from svn server directly when there is no
tarballed checkout on mirror.
> 
> and can anyone give some advise? thanks very much.
> Any suggestion is appreciated.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


