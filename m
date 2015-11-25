Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id CC3EA601B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:11:54 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so50666600lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=Le/ZNmJgLp1P/AjJ1SjYwEBCdBy6RbV6KCVI/z3fPH8=;
	b=Bbro1saPftI8rjWFSlxbOrs3bnWeJisorHtl2PfKjLRJ6OANWxbSAzTDTSofqVD94C
	jqy6VuUBZohSebEjPov+GMDuwObVj7FPRtPUWNZNU//H07sRzIH8t05kQvqpcR24V3CE
	MIS+xLJHKxM0atWHrlfVzNlFkwptne3rAoUPPA79amkFhXASCbDcXr42mRI/UweJ5XYZ
	+QrTII4LJ+hPIK+yzk0f81Q1ZL43w5dAHgZ6lgW4ahbvnkxM+joDISQ3enqZ2he92BWp
	8blXpet92OXoHTADC7DzIUfVw5Oj8iM75Jf8gSmvZE0yc9s8RkLRSju3N3awR0m7UdPe
	mmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=Le/ZNmJgLp1P/AjJ1SjYwEBCdBy6RbV6KCVI/z3fPH8=;
	b=VN4Y1hh1G/PMW8Odop4T/jmYf+JvlvUhy6ilaurcqUcRM3kMTnZUt4cAXEEWjEfE8X
	Jfu1nNrjwkjS9BOsorqSPjUSCd9F3jkuOtyBXjccw9XqkQJX0lLASHeGxoIFVw/d93dI
	t1PAgwB/1K6heuB83b7fxj+wFPiRDSsOoOU3Nc29tqBTyIELDalWOpSP8N83RUNMHvjL
	c3dR/Vzp8J7foimK7UDWqSuCawAw0mvv8dXXiU3lwT0HPwx7MFJZsvJPV8F6k8uHVygr
	YMx/5Js+Fi0vxErBj+lzQ3nIE3AfrK7LNXmRhJJA92ptmcH1DwrLiIQspOgz3gFPnrvE
	lSUg==
X-Gm-Message-State: ALoCoQmWb9aOgPz3U6eXAjE9Bxo9EiYw3m3IGe+QRrpAejBoH+qUHUjpofqwQRotomujCVLRGwV0
X-Received: by 10.112.171.35 with SMTP id ar3mr14925690lbc.90.1448439113626;
	Wed, 25 Nov 2015 00:11:53 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	tp5sm3081679lbb.27.2015.11.25.00.11.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Nov 2015 00:11:52 -0800 (PST)
Date: Wed, 25 Nov 2015 09:11:51 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151125081151.GB10430@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1448298827-9195-1-git-send-email-mark.asselstine@windriver.com>
	<CANx9H-CvQgaxGKO11JOT=cZJiSLh7_1tz-Dh-xS=TOO9FvZBfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-CvQgaxGKO11JOT=cZJiSLh7_1tz-Dh-xS=TOO9FvZBfQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][PATCH] python-cryptography, python-cryptography-vectors: uprev
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
X-List-Received-Date: Wed, 25 Nov 2015 08:11:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Tim Orling <ticotimo@gmail.com> [151124 19:00]:

> We have never carried a license in meta-python, rather we use the
> common-licenses from oe-core (
> http://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses
> ).

Does the Unicode license exist under another name in oe-core? Otherwise,
I'd assume that Mark did the right thing to add it here.

Cheers,
Anders

> Regards,

> --Tim

> On Mon, Nov 23, 2015 at 9:13 AM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

