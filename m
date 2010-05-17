Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ODyI2-0007Df-FD
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 13:15:19 +0200
Received: by fxm18 with SMTP id 18so1073272fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7ajzcIqd8iygYeYJv06rpURAESKIvvY4r8ykkn1eBSI=;
	b=JmbWk8gBox7VhT8WdluQ3BTgXBNzXbCrccc7GwGG9XOhA/T/8F9WBPxqH+YxrVWK39
	iglm3+HZCf6eHRqnXL19AQNDFXhgMBPgdo++3qK1VT2+zzPoq6NJpmp2EAGay4vm9ATb
	5qhp3JZvV9rXBtmMZXxrtpFszKi5ERyNpPKvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZuuonexGeua73KLakHlhIP79AQ1N1y2unza71nTzdSRX8IPq+Xd5UpBsVE1J2tXXvn
	wjIRQ1YuSMIJTHHlyVQnsS28W7M9HYKlOD2ujOhMlr71LFG+zsCr/Jl/4ZmAftnub7mj
	RxA8gP38ig+rc6UVA24AE1LpI2YbGV2vaybV0=
Received: by 10.223.63.17 with SMTP id z17mr6091190fah.66.1274094679192;
	Mon, 17 May 2010 04:11:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm25364046far.6.2010.05.17.04.11.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 04:11:18 -0700 (PDT)
Date: Mon, 17 May 2010 13:11:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517111138.GR3370@jama>
References: <20100512122138.GJ30963@jama>
	<1273668604-9810-1-git-send-email-sledz@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <1273668604-9810-1-git-send-email-sledz@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.51
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v4] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Mon, 17 May 2010 11:15:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 12, 2010 at 02:50:04PM +0200, Steffen Sledz wrote:
> * u-a for init scripts of busybox-syslog, sysklogd, and rsyslog
> * syslog-ng needs to be integrated too!
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

This version seems OK to me, tested with busybox-syslog. (Needs INC_PR
increase in busybox.inc to rebase on HEAD).

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


