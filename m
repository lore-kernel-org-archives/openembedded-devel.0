Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 603B4772D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:01:53 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so9937837wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mzd7E4KAG2wQvkOaJDFbyFJJmad/63b1t0ineiUTQpc=;
	b=Ck077oANco8lFnxf2mn4wlYg/7MTDVlEL2NW/CooBIKY3mz0TAGxMGAEiE9R1QVxhb
	OHJfFuGFIGNVga+65UPGblqSbp3GamLCxmcwwCsR0KBSpdrG5uDB4X0n2DzJ+ImjEbY6
	0Vl85+MbSMq07SwaSCNzCsgNdQuZR7zuJIkUcRSRDMu5evgeqoJOh1MNzyBec193tlPv
	xPRwtfl+X5Pt0Y/Nacv8WVg0UgFSnUTb7blVHzVkFQz+peIfVe1sQzK0vZybobnMtcC1
	l8gL6Ru8G5EIYHa7Obvld8tGUsLIGbXN3PWmQSrueO399RJINhmkmnhmwjejI0g5cGDK
	FapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mzd7E4KAG2wQvkOaJDFbyFJJmad/63b1t0ineiUTQpc=;
	b=CpdXipjxBJr3n1Vv9sx9bLU9ZsB/Hcrbv6tOpvyAg+zgrtFUQBPpdMJPhdq/0MY6Om
	V/TODNxEYTpcjMh7VMMtCeZraIBW/QvNtpWeEzpX4092/3dp+Z3n5wu18ZSU3nWrp3h0
	6IxNqOdnMXUASnAelLu1msDtsm6NOc7AXn3+SvYpZIjapsMVllC9R4MauwxofOuA6T9u
	+0GnCFRSdq46NbV55UNtR/BDb7QkMy4GcCmYiaDrs3yXmey8/V1ynGrrkYLVmMP+6H8R
	qcgKsvM51op68VWRn54iUiGzOVYWQ8RYT7glVucbSSFEIwHfTNRCGlDDEeuSRGXbIDuJ
	SxEw==
X-Gm-Message-State: AKaTC03YN6SFhCckIhSuktHAqqMr/CirHSD+QjgYAey14xy7mbz2wvYNN1RUYujl33giscrYmKqKuJvNm16aTQ==
X-Received: by 10.194.112.170 with SMTP id ir10mr1552028wjb.190.1481810513984; 
	Thu, 15 Dec 2016 06:01:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Thu, 15 Dec 2016 06:01:53 -0800 (PST)
In-Reply-To: <CAP9ODKpCc_SKsLwpw2EnmG9eadCKRzoGKEbvvMDTMVv9r5rEEg@mail.gmail.com>
References: <1481807926-8204-1-git-send-email-armccurdy@gmail.com>
	<CAP9ODKpCc_SKsLwpw2EnmG9eadCKRzoGKEbvvMDTMVv9r5rEEg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Dec 2016 06:01:53 -0800
Message-ID: <CAJ86T=V61N6Qj9bT_TLnahgG2ddeKdxnVXobBO0Hap9B4mVfyg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest, gmock: update 1.7.0 -> 1.8.0
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
X-List-Received-Date: Thu, 15 Dec 2016 14:01:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 15, 2016 at 5:41 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Dec 15, 2016 at 11:18 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Add install command for libraries and headers
>
> There seem to be a missing patch which installs the headers and
> libraries. Did you check if it has merged upstream?

Yes, install support has been merged upstream, for both gtest and gmock.

  https://github.com/google/googletest/commit/98d988deac06637364f6cd41c45c3db4a8a0b6bc
  https://github.com/google/googletest/commit/7c8ac4886a7ad513430d132c446a93c6d395345a

> The commit log needs to be extended to mention what happened to those
> patches as well as that it now provides gmock.

Thanks for the comments. I'll send a v2.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --

