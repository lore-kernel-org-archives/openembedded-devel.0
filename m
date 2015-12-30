Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id BCB096FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 16:53:55 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id mw1so53726131igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=IOP/2jwh1gICxlyA6dQnJo7/YcwhX1MRXvMiKoePwJU=;
	b=J/Xrt7W6/9LG2v6xZwQFHQh2uDwuMCWA9nuO4mRdM9SwOVt5vQPgbqRgXrh2SjAEme
	7Fd8zP8XbSUSTwdNjidqnkQ/3YhO3CsyUr+QKl1ctNa7caHEujfSIrmo81+JH9nJbAs7
	6H/e+3V8ClOT6zN99urC/c4vj1YJQfC9Fi8VdPHJMhNTZgKsaS2TVN1/SrNNTd3z8XYD
	oAZcYmWm7w+0KlUM9bmY5QJRerJpmA6IcspK7z1uBcIa6X8TJnuEUaWWFG+Z4l4dSo50
	np4a5E2wLuyYzA6ZLRPwSIT+dxCwlwyMPzS2o48fWDXorYUnMvgLOPLt61qa8oaMqQqU
	7GVA==
X-Received: by 10.50.78.70 with SMTP id z6mr16704755igw.92.1451494436097;
	Wed, 30 Dec 2015 08:53:56 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f74sm27175541ioe.6.2015.12.30.08.53.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 08:53:55 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <56837748.6020903@gmail.com> <20151230165246.GE2263@jama>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56840C1D.7080800@gmail.com>
Date: Wed, 30 Dec 2015 11:53:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20151230165246.GE2263@jama>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Wed, 30 Dec 2015 16:53:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 12/30/15 11:52, Martin Jansa wrote:
> On Wed, Dec 30, 2015 at 01:18:48AM -0500, Trevor Woerner wrote:
>> I noticed the recent gcc update from 5.2 to 5.3 in openembedded-core
>> seems to cause meta-browser's chromium build to fail with more warnings
>> being treated as errors. My MACHINE is intel-corei7-64, but I'm guessing
>> this probably happens on other architectures too.
>>
>> Is anyone looking at this?
>>
>> Is there any talk about this upstream?
> It was fixed for gcc-5.2 with this patch:
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-November/104327.html
>
> I'm surprised that it doesn't work with 5.3, but I can confirm the same
> failures in latest "bitbake world" builds.

I agree, I was surprised too. That's why I CC'ed Max on my email since I
figured he'd be best positioned to comment on this :-)

