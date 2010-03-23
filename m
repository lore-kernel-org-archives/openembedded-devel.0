Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nu0lp-0000mi-CT
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 10:51:38 +0100
Received: by ewy25 with SMTP id 25so1804915ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Yzs1Nqsut2wh4MOEEYm5AYBz3efOCTCUmavDue+078s=;
	b=HBRJnH4zcs/iA+PLpGCFw1P5l4hoSW5mbUrCdHTCHpJYPJQf+AY1hxpApSjVZPEk7G
	mFM/s9KENN2hyUCiXzgT/iQK/WVffceFISHbWCyqqAaMxSvtkJgnjN56IDiuYFpFptdz
	Wpwd2RpDG6nkXjAMsMHPW13AhaiqKtA4yN594=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=J3M+QVuPQvv9fPDTkgFDT8Mf2k8008YZvcgYb72VdFBeG4SiE+pTateQcVFC3HQLh5
	j8dXD2pxso/ZqW8sHMDrvwpjpDt8mTRgiITRutn1xYEfluxLmATCFTtFGFva1oaKcE9y
	3aBCfrn6Emj0eXCbqhVKCQ8m5OdwhoIspPy14=
Received: by 10.102.13.15 with SMTP id 15mr3891157mum.55.1269337704643;
	Tue, 23 Mar 2010 02:48:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j9sm3252955mue.47.2010.03.23.02.48.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Mar 2010 02:48:23 -0700 (PDT)
Date: Tue, 23 Mar 2010 10:47:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323094757.GE21210@jama>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 09:51:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2010 at 03:26:53PM -0700, Chris Larson wrote:
> Greetings all,
> 
> Thoughts? Questions? Concerns?  I've been wondering if this is really
> worthwhile, but I think it is.  I think there is value in keeping old
> versions around, but this allows us to avoid cluttering up the repository as
> much, and makes it so that one change to a recipe can affect all the
> versions in that range by default, or all versions, rather than just the one
> version you tested.  Of course, ideally you'd test all versions, but that's
> the case today too, its just that now our recipes get bitrotted instead.
>  Personally, I'd rather see the old version content continue to be brought
> forward by default, and if it fails to build with that, we fix it, but it's
> easier to fix a build than to unclutter the repository.
> 
> I'm hoping to get some input on this :)

For me it seems easier to read shared stuff in .inc and then multiple
files with just include on .inc and checksums. Sometimes with additional
patch or some fix only for particular version, instead of one a bit
longer file with OVERRIDES.

But maybe it's just lack of imagination on my side.

Also as I stated in some other thread, I think it's usefull to have one version
of each major version which was in OE (probably latest from each range
you have in nano.bb example), because to test 5 version at least if
patches apply cleanly and it builds ok, is much faster than 42 version
from example.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


