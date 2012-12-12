Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TikPv-0007uy-Ky
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 12:24:04 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 12 Dec 2012 03:09:24 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so2465398iea.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=OqlFxrtxzIRQReKwdnTF5LOwWwFgSTnLx6AMaN4uqbM=;
	b=TdkAc/jLFGIix6rMF8s+2E3HLRvZALjOXsfnGdADUaUGvoPZsrTU3gVLGwWcQqldu3
	TYQEcZmViWfAhHHW9gjc975LITIT0eBqvfwh84tlE9/n1c7zs9CBcv7u9V28JpZFiOS4
	ZBqGQ120nd1xzubgnG4WmQLTRK5Exq0cbtftKXhpKFRXoBs+1LrJvFJMdGpjP+VQMWiL
	RBUN79BnfE6Y+yXC3x+MXsumbLbOWZyEJQ/BAPJGOTKrikX0Jh5hTif7C0yHBf+Ms293
	Rdd4TKn1TOFBzCVHlDOOVfRvlTax+65wTw0M46pMZ/Wu0QlqzDpjc2i2JZ4w5ddOkUlR
	LMzQ==
Received: by 10.182.89.103 with SMTP id bn7mr290366obb.35.1355310563431;
	Wed, 12 Dec 2012 03:09:23 -0800 (PST)
Received: by 10.182.89.103 with SMTP id bn7mr290364obb.35.1355310563341; Wed,
	12 Dec 2012 03:09:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 12 Dec 2012 03:09:03 -0800 (PST)
In-Reply-To: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
References: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Dec 2012 11:09:03 +0000
Message-ID: <CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQniGFzhgcSkup/f30/ulbcKPgw8quXI1wVAmIKlwywfe4BoFOvNtPZ0SB8M9k7xS4Qcw/+3ADVeJLHaj0WLPUvqGxRW7+BQ3/C7p+xxC4eePjkGbfCiiYbYEOGiyeVYJbINdsUwpUJ/1x2bqXTilvhoaAkEasa0OOcu8GYau3scdVfatxCwh7BivJ8xVcMjp3aq5bLP
Subject: Re: udev (master and danny)
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
X-List-Received-Date: Wed, 12 Dec 2012 11:24:04 -0000
Content-Type: text/plain; charset=UTF-8

On 7 December 2012 18:01, Otavio Salvador <otavio@ossystems.com.br> wrote:
> For master:
>
>  * OE-Core has 182 version of udev;
>  * meta-oe has 173, 175 and 182 versions of udev;
>
> Everything works but we have udev recipes at master of meta-oe unused. I
> plan to send a patch to remove udev (173, 175 and 182) from master.

Ping?  It *doesn't* work: oe-core master and meta-oe master results in
meta-oe's udev 182 being used, which fails to boot on atom-pc from a
hddimg, hanging at "waiting for removable media" (nothing is ever
mounted).

Ross


