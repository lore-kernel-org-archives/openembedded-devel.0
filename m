Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OFAnB-0008Jt-4r
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 20:48:31 +0200
Received: by fxm8 with SMTP id 8so151759fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 11:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UK0M/HQwd2GN1Bf5D7I29/wEFy1r/q/oHSCz7Wv2NPQ=;
	b=Oijuwu9ib0X/KoRUfZxaMXLj3aPvBFF1p4/5Tgm0Bc5fDWbVNy+huG5C1FyCvj6SEZ
	scmK5kRjyodT7BSLkdJlSIQOE6uqPUO0ZGwuxIYMnXAGoNCkc77or+JofpW6ptZqtCKQ
	nEqoRYyOFFbCmB9GTAZWrQKJq5l73wd4ZXlmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jcDdRNouRpFO+r4aHO8ESDSWLJnilmuphMGcAqlRfady5C0Jt7GS3KSwNiCq39V+Yz
	ebJBb93Fg5XLHqTeMra+rqt/EnA56zJ5oUfG18QxW4pFyzAUcsQW54SKDJc3r+dP2G7f
	DBvZcpFdQSfSFN17/Z/afUmaPr+wPaumJE4IA=
Received: by 10.223.77.86 with SMTP id f22mr417542fak.49.1274381060747;
	Thu, 20 May 2010 11:44:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm680380faf.3.2010.05.20.11.44.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 May 2010 11:44:18 -0700 (PDT)
Date: Thu, 20 May 2010 20:44:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100520184400.GP3302@jama>
References: <bug-5437-13@http.bugs.openembedded.org/>
	<AANLkTilUYA_uexLXydVxyFGHnKol23h1LYOBfOkU7Wzt@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilUYA_uexLXydVxyFGHnKol23h1LYOBfOkU7Wzt@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] [Bug 5437] New: packaged-staging freezes
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
X-List-Received-Date: Thu, 20 May 2010 18:48:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 20, 2010 at 02:07:34PM +0200, Andrea Adami wrote:
> I had same stall on:
> 
> NOTE: package stagemanager-native-0.0.1-r12: task do_package_write: Succeeded
> 
> There is one patch is shr repo removing one lockfile in
> packaged-staging.bbclass which helped my rebuild.
> 
> http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/1ae868c5f4029f1862555e97a1aba37a8935221c
> 
> I think RP could say something about this lock.

I can reproduce it easier.

After image build I call ie bitbake -k task-shr-minimal (that task is
already built with same PV/PR and rebuilding the same also hangs in
do_setscene).

With Enrico's patch I can rebuild tasks without problems.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


