Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4EJY-0007e7-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 16:52:54 +0200
Received: by pvg6 with SMTP id 6so283460pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ZLj10u4w/XYNXTYAd0aPN4SmITusTHuMdaYfrFDL4Vw=;
	b=HMa6z/WGyJMYBZUTLbNAIIkoYcb8Uv9M8kouqAilZgxFxom4RlWMCCZuvVpmA3qjSb
	C7kp/+hgPZvJ7WI2zxbVvDnNhKMGup1fbjYPL1RdS9SNDy4bL7Kg5nmOf1Vjr5nGyuAi
	X1Nm8PyTcIVFEmmskn5wyj7wUp/By671wY4S4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=rDQ4Wj7/hoGXmC0+pfI1eL5LxFHYhMVqT9xOLNltjD/ILyieN2Q6/BxYxI7Ra4nUXM
	OrzhUGEumMFcieqUROJJXflfM3+xMopZGucWVtyqNNvX87G/eApZtLQd3ubbVoEZfzef
	rrMI4Cq/EwqJfSYncd4B6kOp54YybEzMII9Rc=
Received: by 10.142.114.5 with SMTP id m5mr2025482wfc.1.1286549536948; Fri, 08
	Oct 2010 07:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 8 Oct 2010 07:51:56 -0700 (PDT)
In-Reply-To: <20101008110536.GA22660@rhein.zuhause.netz>
References: <1286517101-24724-1-git-send-email-raj.khem@gmail.com>
	<20101008110536.GA22660@rhein.zuhause.netz>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Oct 2010 07:51:56 -0700
Message-ID: <AANLkTikaOjMZy6gTOG2PJfZWGf0fmhctMep35RLY9yDd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/7] binutils_2.20.1.bb: Updates to use libtool 2.4 macros
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
X-List-Received-Date: Fri, 08 Oct 2010 14:52:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 8, 2010 at 4:05 AM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> Hi,
>
> hm why is binutils not copy over this file?
>

because we dont autoreconf it. I tried to autoreconf it but it needs
autoconf 2.65 then I overrode it
but resulting configure would not run. So we have to do manually once
what autoreconf should have done
after .m4 upgrades.

> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


