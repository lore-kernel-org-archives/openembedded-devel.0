Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nmu9A-0002qw-Eg
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 20:22:30 +0100
Received: by fxm20 with SMTP id 20so1766358fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 11:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=656dLcT4MCngb+GZqYWc7XKNPg2HXOSyY8DxZiYinuk=;
	b=xdFYvVVMVZqXSslB8nYVHTqtxQHIHsCgCDnn3PaCo+9mo1GoSxPwHo3GtNDp1Z9CPD
	5EDBjVVNVaZ2732Wsx7IMRobAOr8JndFmp3g9BXhxKyCKow9MUhhB27dmMNeZ2S6C5RQ
	XTKF5Pjf7NOuvera6i83Wt2b1DW6WjDiL4pJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kXSILlHl/+E5/+HxYotEwk+p9RPkDN+TsxWyM35xiHbJALOPvDBIyshxD7YtTTvG0G
	xxL81a8naLcXe/wyZrWPO/zk8EulntEsaI0FahkwfNDohLReaxosZaouJ2TUKj7WoAPF
	nsi8ryvUJlijWfP5aLd9wJiwVHr8qmUVzb2wY=
Received: by 10.87.65.9 with SMTP id s9mr1124599fgk.48.1267643949835;
	Wed, 03 Mar 2010 11:19:09 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3877563fxm.2.2010.03.03.11.19.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Mar 2010 11:19:06 -0800 (PST)
Date: Wed, 3 Mar 2010 20:19:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20100303191937.GQ3206@jama>
References: <1267218939-6086-1-git-send-email-Martin.Jansa@gmail.com>
	<141020e31003030454i59ed2d9fpcc32ac4ec1b65c0c@mail.gmail.com>
	<1267621631.2259.19.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1267621631.2259.19.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] package_ipk.bbclass DON'T PUSH THIS, but PLEASE read it
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
X-List-Received-Date: Wed, 03 Mar 2010 19:22:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2010 at 01:07:11PM +0000, Richard Purdie wrote:
> Its a serious bug I agree but a very hard one to fix. The correct fix is
> to have staging under full control of a packaging system, then when you
> clean packages, all the right bits are actually removed.
> 
> In that sense this is no better or worse than the other 101 ways you can
> break staging.

Fair enough, thanks for reply.

> So in summary, no easy fix, we need to fix the big general problem -
> packaged staging needs to be on by default and used by everything. Only
> then will we nail all these problems.

So I'll continue to use 
find tmp/pkgdata -name ${PN}\* -exec rm -rf {} \;
when I see non-existent lockfile path.

Or maybe try this little patch and watch what will break:
diff --git a/classes/packagedata.bbclass b/classes/packagedata.bbclass
index 86f18a9..e38ff3c 100644
--- a/classes/packagedata.bbclass
+++ b/classes/packagedata.bbclass
@@ -56,7 +56,8 @@ python read_subpackage_metadata () {
        for pkg in bb.data.getVar('PACKAGES', d, 1).split():
                sdata = read_subpkgdata(pkg, d)
                for key in sdata.keys():
-                       bb.data.setVar(key, sdata[key], d)
+                       if bb.data.getVar(key, d, None) == None:
+                               bb.data.setVar(key, sdata[key], d)
 }
 
 



-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


