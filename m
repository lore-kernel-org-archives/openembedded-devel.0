Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 684C6731D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 19:46:51 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so46245042itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 11:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=5aMPiJ91e4UgVQ6FVRgMDmMVX8yJYnNdjr5PiPzj4g4=;
	b=QBWTCTJ17nSbKiICOQ+1eEpO/FoQY6ZAyplZiam++ITeqIAqh5nvnqKNTmj1QH3iBP
	d2uBI9kAv5rwNckPZpqHIhYl4DBivngMOBkVCTUB3RZvuMTTryAnQr9T+o4dWJINBPGF
	61bpQEdSZ88QyPMtNkd0ABrNkC/tRAZB/hYsSRrxKZKD06bC5eWBWPv+ZprmHEIwi16n
	g3gU0dYUqEsGdOFCEV3LnpjYnAQ2JNeV/mlIJiecM9MTybXkRqmdrS6qHagxNWRheqnT
	UJ87fuACBhYTt2Ur3M0ArK8zIhObLiKaW1dw9N0tYqSYpJ61jVJFx/1sgLj2n3ESnPXb
	w3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=5aMPiJ91e4UgVQ6FVRgMDmMVX8yJYnNdjr5PiPzj4g4=;
	b=L1BSDSYTKm/WwhktcGvwJYNcIBkYBGT/HXN6WfuKGCqY1xBaV1EbNvl6Y95MwiHUoR
	IWCEubGdLunk9dqA6nTdyzjOgJL1/zBmKewiTNEht94K708NVn212qDTyhTdIoaSTpB+
	EknRFNVBU2NR7UE46o8gNIIhlCjzVTY0oSWOz1mEyLEN82XGK8dbgtECf38HutXNDIYy
	aWHfyMxcaRb20C+Lx//Fgxinb2fLs5muN78cF7PQYOj5qIY0KdriGAY8fNuKJPpsdDqG
	xPTPaiJrVyOHXbmeZ0QF2F2BIh4IPHr5jY0Mtm4KVr2V5hqQWG9Rd6HTLqXF7uuYGjdC
	OAag==
X-Gm-Message-State: AMke39mWl3XFPoR+bg6Ht3SKNqgqb2FdHQcKO6Skl+x9uKavO9uRorXOkGIF40HH9tyB1Sl/
X-Received: by 10.107.161.83 with SMTP id k80mr27421385ioe.47.1487101612254;
	Tue, 14 Feb 2017 11:46:52 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E015.dip0.t-ipconnect.de. [93.232.224.21])
	by smtp.gmail.com with ESMTPSA id 16sm740493itu.17.2017.02.14.11.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 11:46:50 -0800 (PST)
Message-ID: <1487101608.13854.367.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 20:46:48 +0100
In-Reply-To: <CA+chaQc+pT3pj-MJFHY=AJBdqgdrhqNmqM+k1KDm8-Nfir02Sw@mail.gmail.com>
References: <20170210082811.GA3021@jama> <1487086509.13854.347.camel@intel.com>
	<1487093290.13854.355.camel@intel.com>
	<CA+chaQc+pT3pj-MJFHY=AJBdqgdrhqNmqM+k1KDm8-Nfir02Sw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: multipath-tools on arm (was: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Tue, 14 Feb 2017 19:46:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 19:08 +0100, Martin Jansa wrote:
> Have you tried to reproduce it in qemuarm build after enabling thumb
> in poky?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213

No, I haven't. I'm not familiar with the exact configuration of these
tests, and from http://errors.yoctoproject.org/Errors/Details/130529/
it's not obvious that one needs anything besides MACHINE=qemuarm to
replicate the problem.

Bug #9213 doesn't say how thumb can be enabled, and the bug #7717 that
it links to isn't very clear about it either. Ross suggested on IRC:

PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
ARM_INSTRUCTION_SET = "${PREFERRED_ARM_INSTRUCTION_SET}"

Is that right? Yes, seems to be - using it I can reproduce the problem.

It seems to be a known problem. valgrind is marked as incompatible with
older ARM, so the solution has to be to disable the use of these
valgrind macros. Should I do that unconditionally?

Doing it conditionally would imply copying the logic from valgrind.bb:

# valgrind supports armv7 and above
COMPATIBLE_HOST_armv4 = 'null'
COMPATIBLE_HOST_armv5 = 'null'
COMPATIBLE_HOST_armv6 = 'null'

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




