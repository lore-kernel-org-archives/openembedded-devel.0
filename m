Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1D61773F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:40:23 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 75so25494807pgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=VkpX1VxrZ9siD2JttRUTyEmHOLR1YjOtJrYRK+MLNko=;
	b=P5/sYp4BvwG3cxAKGt0napmapYTlSsolfNyXGibrvt+gW551gANXcOPysxJPAzYp7J
	+YtEz8Lh7+6OEBbU37mQkW3VsQlSR/KHPMVZ5+aXXhriT+xm4yBIRvwsg+GReOwqjPmx
	+Lmsmx3EZyq5ija9NzD02ea6Z4DKcy/11LqBjw1JzppGfBifyCjZN3fZbPMFp15M+OfD
	qg79PMccC8jUJx1JvrgVhlo9I1BesqvtwCW28WLCC45+NIKT3FbPjb3G/dRSzLW3fyTF
	BRZHi+2ib3OiUcn42xXMdAVg/3A079b4leZ4Bl3M4B6GSKp5MdKw8TD2O4jB23LAluFF
	b7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VkpX1VxrZ9siD2JttRUTyEmHOLR1YjOtJrYRK+MLNko=;
	b=KR7HfqMJqsDPxvBDjvG64Rh7a+1HED1GdcNQvW2W/PEq2LsHDgkU8H40zBLrcbmck5
	Aw7speEGLqDEDl79wV7VAXrUhi/Orw/DSmRjgWUMDR9uiqjpW7cOSSg3h1wBC8e+LRIq
	aq0cQEPl6+C+KmENF/02pVZxwqwmJMtdVjqHlUPufY3iOBpKjiazk0iBt5bXml6Je6+j
	KraodIyYDZwRfrbbUcPfGJ5Rn2mUaJmcVaXa57yatrnuej6BRTTXC5PDIuzOFLgSFUmi
	qm7uJY4nW0Hg9vicFrTXWcrSnX+beHUuFMMzL/V805pfZMYRpa4A7na4MhFlrDKhV3KS
	9V1Q==
X-Gm-Message-State: AIkVDXLNai9erZrpA+BIrKmyd4VXpzY51gjsNVVHPMNK4SBi5sj45T9BZzHJI3q5clOBNQ==
X-Received: by 10.99.55.26 with SMTP id e26mr10920702pga.15.1485538823737;
	Fri, 27 Jan 2017 09:40:23 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6d8d:a1ec:12d:52de])
	by smtp.gmail.com with ESMTPSA id
	s136sm12832977pgc.38.2017.01.27.09.40.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 09:40:23 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
	<5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
	<CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
	<20170127102850.dv7ytzoaltcruump@ad.chargestorm.se>
	<1485515717.2825.12.camel@gmail.com>
	<CAP9ODKq0xKnunRytwo0FPLUD+15cXptb3E_BJuOUroXbwcVWhg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <fbf81f90-a08e-ece8-96ef-6108b4668a22@gmail.com>
Date: Fri, 27 Jan 2017 09:40:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq0xKnunRytwo0FPLUD+15cXptb3E_BJuOUroXbwcVWhg@mail.gmail.com>
Subject: Re: [meta-browser][PATCH 2/2] README: add -s to git send-email example
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
X-List-Received-Date: Fri, 27 Jan 2017 17:40:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/27/17 3:55 AM, Otavio Salvador wrote:
> On Fri, Jan 27, 2017 at 9:15 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> Am Freitag, den 27.01.2017, 11:28 +0100 schrieb Anders Darander:
>>> * Otavio Salvador <otavio.salvador@ossystems.com.br> [170127 11:12]:
>>>
>>>> On Thu, Jan 26, 2017 at 11:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> what happens if commits are already having a sign-off ?
>>>
>>>> A new one is added.
>>>
>>> Then I don't think this change should be made.
>>
>> I tested it. That depends on who did the sign-off.
>>
>> You end up with two sign-off lines only if the are not identical, e.g. the committer and submitter
>> are different.
>>
>> I went now through the READMEs of all installed layers and about half of them propose the '-s' while
>> the other half does not.
>> So I guess we should drop this patch.
> 
> I prefer if we adopt it.
> 

I think, its better to suggest to do git commit with -s instead.

