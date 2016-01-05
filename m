Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 23AEB731D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 22:04:12 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id to4so25062107igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 14:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=33CgRh/+UxuG6hVYjGiSQHuxQX5VWR+wNRrc3vJ40Sk=;
	b=B/dvatdZQoZx97SSwEn8IQWG8czhnwIJyuysDh0AC7Z72sxkBLhVFEBqmc+RYW+3fI
	rrbtp9RZG1SX6HfF6SHbmDeUcue1e7qduamPVPNa3p2+fPY5y2yl/lTrXdXR/D/RkmyF
	zZ27cRs+SN9xOTXtu0r1vv86iIazQu/tzJpet+SoaGcwWONQs+1MjlKQcCzEreMsU4d7
	Bpnb5VDtZeb4jI+5MVnuTTboIz0rGYrH6e33a+kZxoPu1AcZwD/D4CeTB2MDx36osBEo
	RlTrlAuM8Sazf1Ba0FneRua2r6JjcetbZh44znww2l3I8IWQclyp7LdNaMs+vEI2CHf0
	jkag==
X-Received: by 10.50.111.111 with SMTP id ih15mr3914258igb.78.1452031453712;
	Tue, 05 Jan 2016 14:04:13 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g67sm26796844ioe.34.2016.01.05.14.04.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 14:04:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
	<CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E4E724@OLAWPA-EXMB03.ad.garmin.com>
	<9EE300C1-F57A-461C-8B5C-011C6750DF64@gmail.com>
	<CAOLEWZWrT7xz1de_tf-XvjQ342L_Tu1Wrm0VjJd4rXsF60gksg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568C3DD8.9020604@gmail.com>
Date: Tue, 5 Jan 2016 17:04:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAOLEWZWrT7xz1de_tf-XvjQ342L_Tu1Wrm0VjJd4rXsF60gksg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 05 Jan 2016 22:04:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 01/05/16 16:55, Stephen Arnold wrote:
> My vote would be whatever is the most stable/reliable should be in
> the core layers rather than an "extra" layer people need to add to
> bblayers manually.

But there's always "bitbake-layers add-layer" and "bitbake-layers
layerindex-fetch" to help :-)

