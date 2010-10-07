Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3r1O-0004pM-21
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 16:00:37 +0200
Received: by bwz7 with SMTP id 7so433192bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MOjdO6A9w0saKwxGTAZemDNz3btpLoJWtiwxHCsWRJg=;
	b=Vew+Jo0eiZh5gzKNCeCCPxoYh5wOhiVs72kVWJVuEUi9Sbf/eFH/+u8gUrDngeYS9U
	86gGaxUCTPIqnoAl8r4PdI7bOoTrVuPYoIVaRDCLooiuTgm0hvxWG4vh1YeFRAHDIlFC
	teFT6wwDGx5skZ4FEUG8idcRaqPbkirsDDyZE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kqbbarfOtjErYNT06Cv18rHZTj9mG0heXP4RsiSPlCFMI3lZzDxCjOsrC25ZYztpVf
	I+JdUvbPpEM1KD/1EmMClr9Fe4ScZYTPwTsfS/dnAW5XGuk/j852ax/suSUhogs93G7p
	bHsZM9LtT0VWJzS7krnIPZ0jxD+CDOkQXgYK8=
Received: by 10.204.126.161 with SMTP id c33mr707159bks.108.1286460008683;
	Thu, 07 Oct 2010 07:00:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x13sm1664624bki.12.2010.10.07.07.00.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 07 Oct 2010 07:00:07 -0700 (PDT)
Date: Thu, 7 Oct 2010 16:00:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101007140016.GC3163@jama>
References: <4CADCF1E.3090602@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CADCF1E.3090602@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Updating libtiff
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
X-List-Received-Date: Thu, 07 Oct 2010 14:00:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 07, 2010 at 06:46:06AM -0700, Tom Rini wrote:
> Hey all,
> 
> I'm looking to update libtiff to cover some security issues in the 
> version we ship, and I noticed something funny about how we do it today. 
>   Currently tiff_3.9.2.bb sets PV to 3.9.2+4.0.0beta5 and grabs and 
> builds 4.0.0beta5.  While it's possible that in the past 3.9.2 was 
> intended to be the last 3.9.x, it wasn't.
> 
> I think we should go with:
> - Add tiff_4.0.0beta6.bb which should be compatible with beta5 and will 
> get upgrades right.
> - Add tiff_3.9.4.bb as well, in case someone wants to stay on the 
> released line.
> 
> Anyone see a problem with that?

Isn't PV="4.0.0" < PV="4.0.0beta5"?

Then it would be better to stay with 3.9.2+4.0.0beta* sheme for easy
upgrade path to 4.0.0 release.

at least that's the reason why I have ie:
KERNEL_RELEASE = "2.6.36-rc7"
OLD_KERNEL_RELEASE = "2.6.35"
PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


