Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORx6y-0007Lu-6o
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 02:49:41 +0200
Received: by pvg3 with SMTP id 3so1288823pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 17:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NxIiumlSxwJ3NoCTgoAS60eLDW5dfPclw9/0bjGgd00=;
	b=MMHXA9Da3x/6GzfnuryIgHVS2U2+zqmQlnjXscIgXkKBGuxmJnbwi9JLaogF4wPwv/
	zFf3JkD37GnX84DEUJIiSRTOIqsYknQhsYVOcIbCKSdUQSt+jTlpAcK/cQ5CWqeJxd41
	+o1wnnS6c0V6/Hgmppmxvk7yx4oyAzpcLwbEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VbcKfpNhy3PpAzLKqIjxFma3+DkxFOHTKhV6EON7k+ny1yCCXz5y/cW5Ams9YkCkvs
	ebUxl1YBK+hOUu/TgYj9V7kuAW7t14N5gtyVXaP/bULSfe3zg4FVIKCNjq7FpGr8fV2W
	u3yz+aoMbNyJOpQWd/O5R4LF3EYFm08BHLvSs=
Received: by 10.114.186.29 with SMTP id j29mr10585633waf.99.1277426701146;
	Thu, 24 Jun 2010 17:45:01 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n29sm54071880wae.4.2010.06.24.17.45.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 17:45:00 -0700 (PDT)
Date: Thu, 24 Jun 2010 17:46:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Andrew Tverdohlebov <fat031c@gmail.com>
Message-ID: <20100625004612.GB27649@gmail.com>
References: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
	<20100624151848.GD28292@gmail.com>
	<B4EAD150EF8844DDB3676A4A9B08C120@rhonda.vtc.ru>
MIME-Version: 1.0
In-Reply-To: <B4EAD150EF8844DDB3676A4A9B08C120@rhonda.vtc.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How to select specific version of dependant component
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
X-List-Received-Date: Fri, 25 Jun 2010 00:49:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/06/10 11:36), Andrew Tverdohlebov wrote:
> Great thanks !
> It works.
> one small question : what does the '_local' suffix mean ?

its an override. if you want to know what overrides are read the manual.
and in future don't top post its not readable flow.
> 
> ----- Original Message ----- From: "Khem Raj" <raj.khem@gmail.com>
> To: <openembedded-devel@lists.openembedded.org>
> Sent: Friday, June 25, 2010 2:18 AM
> Subject: Re: [oe] How to select specific version of dependant component
> 
> 
> >On (24/06/10 16:51), Andrew Tverdohlebov wrote:
> >>Dear openembedded community,
> >>
> >>Could you give me a hint how to write a recipe that refers to
> >>specific version of a library.
> >
> >you can use PREFERRED_VERSION_libnet_local = "1.0.2" in your local.conf
> >
> >>
> >>For example my package depends on libnet 1.0.2
> >>If I write
> >>DEPENDS += "libnet"
> >>it will take libnet with maximum version number 1.1.2
> >>How can I instruct bitbake to take libnet 1.0.2 ?
> >>
> >>In other recipes I saw something like
> >>DEPENDS += "libnet (= 1.0.2)"
> >>
> >>But it doesn't work in my case for some reason.
> >>
> >>Huge thanks in advance,
> >>Andrew
> >>_______________________________________________
> >>Openembedded-devel mailing list
> >>Openembedded-devel@lists.openembedded.org
> >>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 


