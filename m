Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 68C0D76E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:21:39 +0000 (UTC)
Received: by iody8 with SMTP id y8so8061658iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=NLTPxo65RidOwzbia0Hq3KYxrTkRBKyFzUW9dkjAGDk=;
	b=sWY1llVI0PCJPwMY0zwCjroueBj2mJoUcnD7ML8DmCd6tEobfJE6Y1+ORvMbTG2RfY
	tphnRP8vI04Mpp0W9DjpBhp59/qqusc1mQgcapnyBPiX+A+G0MwqvgNo+oNtNb7wb8H1
	mV97HTyRgwpV+MFBDRfisN9TYSGgekAPrwNhcCyiiGT9aVXGS6wGREaaerc5fMUs+26N
	rOdb6IuZzqot2bmqPL4yXe5hU/ywywqmyENCS4fQRlnlHJA7y3WIUxnG7WtYY89wChlX
	7/KrHFQSlVbwNWxtRb6vY0yraOSArXUW8vOAHlcX+GB4oUV7gdtwhewALn/83AySfx2r
	A4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=NLTPxo65RidOwzbia0Hq3KYxrTkRBKyFzUW9dkjAGDk=;
	b=j67Dybl/iURJPjnTvipXXkJKsMWu05pqhIUhv1Op3OfBW+/PxNMt91rKcIcquNC2ei
	d6qRvPomPb7m5VkSbGfeL+E7vE+bqCyBMzayQ/rIChtSXOrEeszM9m2Pg/uslKhrdbDO
	hdRjkqoPdv/kDnrFwfn04hkyazMN//MYYpG7y45R3+5wd2t1aISOd8qplryzYp+SlrZu
	xSCbi8NCevpRB4X2Q8eGIuuSoJebrecL6mdSSR4x3RgEQPcnE8+HgKO/Jo55n/rPkkWF
	+KeWZypLCvjG24TV7D/cmimxyGLKedHVk3nzY6uKQvUJq/SDQdSXB3aceJHOn0HP6Xfr
	GZqg==
X-Gm-Message-State: ALoCoQlqyrXi9FESCtxaFP78i14i0Lm33aa3QmCG+Fi66hLLGwNyjpqcEcqCAj3cFumDPhH7zlW7
X-Received: by 10.107.15.166 with SMTP id 38mr46399173iop.66.1446034899417;
	Wed, 28 Oct 2015 05:21:39 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181]) by smtp.gmail.com with ESMTPSA id
	b80sm6421449ioe.33.2015.10.28.05.21.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 05:21:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbhv6 with SMTP id hv6so5540807igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:21:37 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr2762794igt.5.1446034897463; Wed,
	28 Oct 2015 05:21:37 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 28 Oct 2015 05:21:37 -0700 (PDT)
In-Reply-To: <5630BD21.3030706@skidata.com>
References: <1446034039-1169-1-git-send-email-richard.leitner@skidata.com>
	<CAP9ODKrfx4_LaXuKeALknjz8Te-AXfER+7OQTLe_U5J2GJi-7Q@mail.gmail.com>
	<5630BD21.3030706@skidata.com>
Date: Wed, 28 Oct 2015 10:21:37 -0200
Message-ID: <CAP9ODKqOWXQ1jd36G3SCUALjnkb-GvpWTVDJWuMp+EAXSyk+Yw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH v2] openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 12:21:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 28, 2015 at 10:18 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 10/28/2015 01:15 PM, Otavio Salvador wrote:
>> On Wed, Oct 28, 2015 at 10:07 AM, Richard Leitner
>> <richard.leitner@skidata.com> wrote:
>>> IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
>>> updates. For more details see:
>>> http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/
>>>
>>> Furthermore the patches directory for OpenJDK-7 was renamed to avoid the version number.
>>> This makes it easier for upgrades and to see diff's between patches.
>>>
>>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> While on that, would you mind to remove the preferred version from
>> README? As we just offer one now, it seems not required.
>>
>
> That's fine for me.
> Should I add it to this patch or the previous one?
> Or should I create a separate patch for it?

New one; I merged both.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

