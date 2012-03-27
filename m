Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SCWFc-00070E-26
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 15:15:52 +0200
Received: by bkcjg15 with SMTP id jg15so5343805bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 06:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=uLj4+LTdawDsR/u5Zonp/Rx4bWOdHbcdxy07B2IYE2Y=;
	b=HuFQTVRunH/G4Drd+6USZ5sCYndukQQtnasrq2bT/i3Hul53IQaWcmZU5xysReVHBt
	DDGuj9RRpxbQ+WeimgyhkkX5OnTTh4YOIjy5oWdG9PptxCqJRJ7i8k+sDrCSsKtF+6g4
	ktadusAViB5dw4g37ItX8y0EfzATZgGgQftHhgP+Zp9v1XzHST+Gk3JOhxOwtnzBdC7e
	C8kFsyWt7A9SaSVyhiTyIUoNfHR0PN0WiG6jQafZm1dymmre0tfpFdjkQAZ/zjxg448Z
	LV9D2ZkD0eBwVQri45JxQKAvrVHEi3q92zuv3pmTaDWQYIrHfxHUY61TUYIQxBZIEhaF
	OWYw==
Received: by 10.204.143.151 with SMTP id v23mr10308076bku.63.1332853611121;
	Tue, 27 Mar 2012 06:06:51 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id f6sm39033966bkg.10.2012.03.27.06.06.50
	(version=SSLv3 cipher=OTHER); Tue, 27 Mar 2012 06:06:50 -0700 (PDT)
Message-ID: <4F71BB69.5010202@dresearch-fe.de>
Date: Tue, 27 Mar 2012 15:06:49 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
	<71df8a759f91e821a2daee22f34eaa3a31708775.1332849864.git.sledz@dresearch-fe.de>
	<4F71B620.7020304@opendreambox.org>
	<4F71B7BF.6010707@dresearch-fe.de>
	<4F71B9A5.3080405@opendreambox.org>
In-Reply-To: <4F71B9A5.3080405@opendreambox.org>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQmDQlzeXW4Eb8zpEeFna79+GeWYgND3z1PLkmmmFq0Huwe2Baun8DHPsoLPhs6NRU6Ilanq
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 3/3] python-2.6.6: Fix python-2.6.6 build failure on linux-3.x
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
X-List-Received-Date: Tue, 27 Mar 2012 13:15:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2012 14:59, Andreas Oberritter wrote:
> On 27.03.2012 14:51, Steffen Sledz wrote:
>> On 27.03.2012 14:44, Andreas Oberritter wrote:
>>> On 27.03.2012 14:07, Steffen Sledz wrote:
>>>> From: Ulf Samuelsson <ulf_samuelsson@telia.com>
>>>>
>>>> python-2.6.6 build will crash when host is running linux kernel 3.x.
>>>>
>>>> Fix backported from openembedded-core.
>>>> meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
>>>
>>> This patch has been superseded by a backport from upstream python,
>>> causing linux2 to be used for all kernel versions. See commit
>>> accb2b728ab10cae20be59253a56ac6410b8de10 in oe-core.
>>
>> Is this patch available in oe-classic master?
> 
> I don't know.
> 
>> I'm just trying to keep the 2011.03-maintenance branch usable with a minimum of work. And the one from the pull request is good enough for me at the moment.
> 
> I don't want to block your pull request. I was just trying to make you
> aware of problems that have already been fixed in oe-core. Building
> python on 32-bit vs. 64-bit build systems and on 2.x vs. 3.x kernels
> (running on the build system) produces different results, even with this
> patch applied. Some of these problems have already been fixed in
> oe-core, some are still pending (patches were sent to the oe-core
> mailing list).

Tom, would be nice, if you accept my pull request for the moment.

*If* i have some time later i can try to have a look at oe-core stuff. Or may be someone else.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


