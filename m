Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Me2P5-0001vj-ND
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 09:49:47 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1522718qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 00:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rICFeBMa+O3Rk2C4vOSHdzr3XPaJ9xKzyjLzpLOje08=;
	b=P8RDXeMY3NSh7gphO82LAX4hxRBB9kpMS7IG87y9ZZEtyuIORSXalODf37uAS8mhzm
	I+sREGKX3CAb69xut4qw9QgNXSRobqvu+u1OFXOTPft1tfSvhWYvPUpwvFZ9+Dib2ctS
	m3oyE3rt5SZt5HQ3b1VNPC9N70kftGqSkp6/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Apmv+yHK8lr9aDqQ5rf9kEWtuSWSo7Fz334uG27qDDv/Y+DICogOAJoVmA64WqAjmB
	nYMP9IK6Kt9JzJHoVNtlommUpjRpQ3bgWKdh5YcgGJGSxBs3Y9ii6S6Ltwb0R13+poOY
	lfq7NLwufVsknvGbGLE1u+6XuOldqNNFZPezM=
MIME-Version: 1.0
Received: by 10.229.19.21 with SMTP id y21mr3093388qca.27.1250753551541; Thu, 
	20 Aug 2009 00:32:31 -0700 (PDT)
In-Reply-To: <200908200749.07494.holger+oe@freyther.de>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<200908200749.07494.holger+oe@freyther.de>
Date: Thu, 20 Aug 2009 17:02:31 +0930
Message-ID: <6ec4247d0908200032s44cd3230s9b3e0d06777116c3@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: Kill CCACHE. Implicit, automatic use 	of things which can fail is bad.
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
X-List-Received-Date: Thu, 20 Aug 2009 07:49:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/8/20 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Thursday 20 August 2009 05:24:37 Chris Larson wrote:
>> To re-enable, set CCACHE = "ccache ".
>>
>> Signed-off-by: Chris Larson <clarson@mvista.com>
>
> Could you elaborate on the need of that? Which platforms do you deal with that
> break due the usage of ccache?

I run Slackware 12.2, whose build of ccache does not seem to be
accepted. I don't recall the exact mechanism of failure, but
shasum-native fails before getting to any other pacakges. Currently I
have to move the ccache binary out of my $PATH or OE tries to use it.

-Graham


