Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCB05-0008Rz-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 14:25:22 +0200
Received: by fxm11 with SMTP id 11so4786319fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JtUx+ddZ3onBx916mW6ouDyCifhl16S7fdaMy3kXH+Q=;
	b=UVsPnFJV0S9dwnyGXC4qckm/1vLRq8bJOufzsiydaiFPQ5yIfyJpYQRLzPw3IeG/hH
	NP44k+p1l0sFHrmfULBXAg++CwpZpMbHt3d4VdPBZ3FiyHw/O0UDc1MfZpDetoNXQFs8
	3bK8wfaVFcnML87Bnee/k11y3HpEYXJ2Eqo5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YccV3ahEeoU9jsWYH95aMVPmG7Z/CtEQQHE80f6/lM/btct4bqTsEX1GJcPURjKaZq
	57D7U9aa2J+95bPaRJXMUazhfTELnyWprKiJoRCx0iyfHiv+EAxEvZpHO2pY7kjJg+Ml
	vXBvsVfqP9XMFhCzUxVnPH8PYYkJ0iMPLyez0=
Received: by 10.223.23.67 with SMTP id q3mr8101909fab.59.1273666887326;
	Wed, 12 May 2010 05:21:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm473817fav.13.2010.05.12.05.21.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 May 2010 05:21:26 -0700 (PDT)
Date: Wed, 12 May 2010 14:21:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100512122138.GJ30963@jama>
References: <20100507145217.GI3204@jama>
	<1273666236-692-1-git-send-email-sledz@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <1273666236-692-1-git-send-email-sledz@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Wed, 12 May 2010 12:25:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 12, 2010 at 02:10:36PM +0200, Steffen Sledz wrote:
> * u-a for init scripts of busybox-syslog, sysklogd, and rsyslog
> * syslog-ng needs to be integrated too!

Thanks, looks better now.

> -inherit autotools update-rc.d
> +
> +inherit autotools

then you probably needs to add:
DEPENDS_append = " update-rc.d update-rc.d-native"
RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"

> diff --git a/recipes/sysklogd/sysklogd.inc b/recipes/sysklogd/sysklogd.inc
> -inherit update-rc.d

The same as above.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


