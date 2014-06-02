Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C5F2365E0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 14:26:01 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id x19so4576348ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=++xXkzSXE8SIyRjJScWt6rae8Nxm1Xxfe5GgVp1DgRQ=;
	b=huh2ndBgDPyIfts2j3Z/UEGVKzzFjSuXA+WuG/u3SKuRXRBgOiKs9VSdCe00Dli2xV
	uAhRziPip5g2pAzASpgwGiKR5y3kNMTOV2oWziMhQSRskS2/0vjgRWjFVNeJlJLOI10k
	M07CjrZv0a5WENhxqggUAxhqEmEHMLc7hSrfvTUpJIu/JnePqer7psEMgRWmcTMIfcNg
	dEHYSYWJEheS9NEOdR0+of6fBkTkblNjVaPJicfgvdMB+o7hoIc7QbHPJAh3IDr+KeU2
	9s+CjPxEQ2qvm/7w7ORFdbgA8lhMnx/LFFRdy3n3TapAoKwqrUlTVPPrpLeI6/GRMc45
	UCAg==
X-Received: by 10.50.32.70 with SMTP id g6mr19875028igi.0.1401719162307; Mon,
	02 Jun 2014 07:26:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Mon, 2 Jun 2014 07:25:42 -0700 (PDT)
In-Reply-To: <CAP9ODKo5SPZ29J-Ory1TpjCa6b8WKie6orekG2G1TqJkEazPFw@mail.gmail.com>
References: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
	<CAP9ODKqH3W5VKVWmriVeCTn1Yw5tZCWSSeLoHQJReDEDW2d=BA@mail.gmail.com>
	<CAAPegz1EzASRh14ZpY017v+v_G-Eo5RFXk6NXm2mGqqLnyvdnw@mail.gmail.com>
	<CAP9ODKo5SPZ29J-Ory1TpjCa6b8WKie6orekG2G1TqJkEazPFw@mail.gmail.com>
From: Chris Morgan <chmorgan@gmail.com>
Date: Mon, 2 Jun 2014 10:25:42 -0400
Message-ID: <CAAPegz22-ONiyUAChr5mDEGjaeUBgh4hMUF1vfxtY-OJ66zufg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dfu-util 0.7 recipe, remove old 0.1 recipe
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
X-List-Received-Date: Mon, 02 Jun 2014 14:26:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 2, 2014 at 10:11 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Jun 2, 2014 at 10:37 AM, Chris Morgan <chmorgan@gmail.com> wrote:
>> On Mon, Jun 2, 2014 at 9:28 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> On Sun, Jun 1, 2014 at 2:42 PM, Chris Morgan <chmorgan@gmail.com> wrote:
>>>> dfu-util 0.7 is the latest release of dfu-util
>>>>
>>>> Remove old dfu-util 0.1 recipe
>>>>
>>>> Signed-off-by: Chris Morgan <chmorgan@gmail.com>
>>>
>>> From the previous discussion it seems there is not reason to keep 0.4
>>> around. So maybe it'd be good to remove it as well here?
>>
>> If it has to happen to get this change in then I can look at doing
>> that today. If not then I'd prefer this went in and then I'd be back
>> in sync with meta-oe and could remove 0.4 in the next patch. I'm
>> always weary of stacking up too many changes together or having too
>> many pending at once since I'm really new to the project.
>
> Great.
>
>

So is this commit ok to go in or need to also address issues around
removing 0.4? ;-)

Chris

