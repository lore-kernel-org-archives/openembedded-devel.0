Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qce8c-0005uC-PF
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 15:52:06 +0200
Received: by iym10 with SMTP id 10so3070214iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=exEZC1bWPEZgoxh/J2wPFBFf/UKGURWFXxDvyz7mDAY=;
	b=XCaP7S0YXdx1pwvrf+xRqp9Ik+6Q+IJaZ4d7RWr5oJbteAtL1g2YnMcp6pZEOrAweH
	ywqOUEkN1PpXsy1RbaCE9OzQgldZcAAHv1KZ5CBV8+ktL7M4mKnxct0Iqeecq3dSHrTi
	JI2X8XSUasH76NWInmh92dQysWOaXO20bS0Ps=
Received: by 10.42.158.10 with SMTP id f10mr2242414icx.433.1309528100823;
	Fri, 01 Jul 2011 06:48:20 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e23sm1877194ibe.40.2011.07.01.06.48.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 06:48:19 -0700 (PDT)
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
	<1309513723.2633.32.camel@phil-desktop>
In-Reply-To: <1309513723.2633.32.camel@phil-desktop>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <BDFA7941-3D06-4F4E-8E0A-00F6B4D7E920@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2011 06:48:37 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 13:52:07 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



On Jul 1, 2011, at 2:48 AM, Phil Blundell <philb@gnu.org> wrote:

> On Thu, 2011-06-30 at 22:38 -0700, Khem Raj wrote:
>> ++#ifdef __UCLIBC__
>> ++/* uclibc does not implement mkostemp GNU extention */
>> ++#define mkostemp(x,y) mkstemp(x)
>> ++#endif
> 
> Is that safe?  It would be nice to have some commentary in the patch
> explaining why the flags are not required for systemd to operate
> correctly.  If it genuinely doesn't need to be using mkostemp() then
> perhaps this change should just be made upstream for all libcs.
> 
right
I have to test it eglibc systems 
> p.
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


