Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PCsjq-0005N0-Ut
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 12:40:05 +0100
Received: by fxm3 with SMTP id 3so4875088fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=p6OJUa/ABxVTQl1wiqxh/qcu+Pl9aET7azEPAwGaQMU=;
	b=nUUsKiGoVg08YahOVQlmPs03obHO8b66zKLTHC5ljhz6nQAKWCSYNCQNHkbzh60D4v
	Qw7lmtKiIS3yGmQZtEoAIL5chlcbdEPG3eTT1dW92YG21uaUalNRJ4ub/KAeA3Ca0hPg
	FxcXqeuM1+kndHg4PmDuByuaGsFlK4hFI4EqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Mz6RBsAOEc83exbe6G7d3J9qIclJBo935kFC4vLFsOQ2hlHAFVtqBGjaPkpk3r/EvN
	UpTCL1FaQbZvU0QRrrt0VA20nX+9L89yxW5bPBnGP3AJJWcDP4p1tnxB155HMmtnvQyu
	ohMUC9UgtWC7B/JBnf8mUfu5/c0L6C61J+FF4=
Received: by 10.223.78.199 with SMTP id m7mr9072686fak.11.1288611538440;
	Mon, 01 Nov 2010 04:38:58 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k4sm2360669faa.32.2010.11.01.04.38.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 04:38:57 -0700 (PDT)
Date: Mon, 1 Nov 2010 12:38:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101113853.GB3440@jama>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
	<20101101081956.GA3440@jama>
	<AANLkTikwumwg4Pmw49AzaT0j-QhjCbPF+kcAWcSJZbJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikwumwg4Pmw49AzaT0j-QhjCbPF+kcAWcSJZbJQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 11:40:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2010 at 11:37:25AM +0100, Frans Meulenbroeks wrote:
> 2010/11/1 Martin Jansa <martin.jansa@gmail.com>:
> You might want to extend your grep to DEPENDS lines.
> Then again this is not trivial if DEPENDS is split over multiple lines
> and the package same is something that occurs lots of times outside
> the depends var.

Yes this was really just stupid test to find those, before using it in
docs it should be improved or someone has much better way to detect
those..

> In the case where you encounter a depends issue, I hope you also fix
> DEPENDS (but actually I'm pretty sure you will :-) )

Well this DEPENDS depends :) on what is expected from distribution, IE
python DEPENDS have
${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}
because not all distributions should be forced to build python with tk
support, but there isn't IIRC
EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'tk', '--enable-tk', '--disable-tk', d)}"

so even if your distro doesn't have tk in DISTRO_FEATURES then it gets
autodetected as available if you build tk laterbecause of some other 
recipe depending on it unconditionaly.

In the end every feature which is autodetected in configure should be
forced enabled or disabled in recipe to correspond with DEPENDS.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


