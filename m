Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2D0771C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 09:42:43 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id z8so9899050ige.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 01:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9zkbQdBaA1YIN0AGKsazNS9Wzq+JUx2LC0cPb5g9Iyw=;
	b=fL1HwrIlauDwI7ONz5/0WEH5/AD91ehHByhbBwomK6Z0qCVpoxGZlrwPw80AiSb9gP
	qLZnaeXbmI5r4ZJGzoIl6wAE95pJT9S3hw9PR0zZFUF04Or18cWfVJ+W/DORNjtJV0sj
	oy3xi3L7rQkhkL69u0mKZYMxv6lOMfMg3/QFEJGIUg09UlDoxSoe4TQ1oz9pXxR3ZD1O
	fSgBIZT2ar8lfSVJo+hUVbTtraO/upAeWenSDYdFh/LzMNZsJ26/Xt6bDMTP/gsULFmf
	ShXavMSj5iVj4i9o/AwdMCpoS7uqak2J4oGVLMqVzoXRMlY9LPPp/biyAbRXpX4BtTVX
	7lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9zkbQdBaA1YIN0AGKsazNS9Wzq+JUx2LC0cPb5g9Iyw=;
	b=AoQb2nVQub8OzlSdl+AQKYH2XZgcxpe4MYvz2k+6odoBaxbWhrJSjIclmCgUPxxGlc
	NKl4Mwx0VGd8iw2ikyxY/6Md6mjWFCkTkqjt3ujj7jSWk9OUJ4PfwneUj5HkDW6Dh7fX
	R+7Qi+DbzVXXnOrT7CawkpdGsspjqHyRbTHH0Scmj0NkksWdUUdAmTUkGH/vzT0UL7q7
	nYYqCNPmEn1+8WOJAO2+ORmzO87L5+hnPw057JBXKxYzLuQfu59TUXY2DIczvmsSUGVw
	i8GCy8mawxpwSatcz7iGKJuqwtPOPwQLwViGclghGi9hHfH5kCmlTAN1TQrOjLjJO/PN
	PkXA==
X-Gm-Message-State: AG10YOTWgman+yDclhYGotgCHm95K59eTni6833IYvxnVJtblG5rzhnOIQ2S4nZu9PV+GkZHv6Ls60NdQDrGUUEg
X-Received: by 10.50.97.71 with SMTP id dy7mr2249810igb.78.1456393364359; Thu,
	25 Feb 2016 01:42:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 25 Feb 2016 01:42:24 -0800 (PST)
In-Reply-To: <1456393133.2298.51.camel@linux.intel.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
	<ccea554cd4fef5dcffc2e9edfb69a8b606907716.1455895912.git.adrian.ratiu@ni.com>
	<1456148220.2298.25.camel@linux.intel.com>
	<CAJTo0LaDXv6D470Za-tVobw5idYc6F4qET4wLcmFCKYV04k-OA@mail.gmail.com>
	<1456393133.2298.51.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 09:42:24 +0000
Message-ID: <CAJTo0LYd0-_VCTJ3qBg4VPmj0OSziY1mN1FX0Wr4EAdiVSMdwQ@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v6 2/4] gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 09:42:46 -0000
Content-Type: text/plain; charset=UTF-8

On 25 February 2016 at 09:38, Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> Not sure I'd trust that either, version comparison logic is painful.
> Something like this might be more resilient to interesting versioning:
>
> dots = versionstring.split('.')
> assert len(dots) >2
> if int(dots[0]) >= 2 and int(dots[1])>= 1:
>
>
> Even this doesn't work as e.g. I have gpg version 2.0.24. But, I agree
> that version comparison is tricky, e.g. "2.10" > "2.2" would return False.
> 2.1 is a nice version number in that sense ;) I don't know if gpg has had
> of will ever have any alphabets in its version number.
>

My assert should have been >=2, but surely it will work as your version
would fail the test, as intended?


> try:
>     return subprocess.check_output((self.gpg_bin, "version")).split()[2]
> except CalledProcessExceptionOrWhateverThisExceptionIsCalled:
>     raise bb.build.FuncFailed("Could not get gpg version (%s). Called %s,
> output %s" % (e, e.cmd, e.output))
>
>
> I guess you mean (with double dash before 'version'):
> return subprocess.check_output((self.gpg_bin, "--version")).split()[2]
>

Yeah, that. :)

Ross

