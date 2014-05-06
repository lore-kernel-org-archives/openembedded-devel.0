Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C1AEE60167
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 16:52:32 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lc6so1346174vcb.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gPL7gLCtpnCn+tniLUmz2qqjOh+onFljW9j1RQjHmmI=;
	b=qWWVgnK2kweb53XcGwV70gsR6nNqKXlY0NTb/thCLMd/0m2KdnU5U0YNdtUWHALZS/
	Wz0A8iZcquvHQUR/T3DjMln9JDFf5jVSGPmVrFlMF2BxFTV4dt8k6UeZSrukBp79XJ7r
	m8gwzkFeP0krLZDYooLSF+LEfD+KeendV5O6iOnNF/+vSBh64ae1/NKCFF9LRQdii70M
	Kh8E0nNSlr3R4kN5yBH1cGQJYu2EOqtxH76RCi/cWK8tb7oEsrwa+yXCxcDbqSyJdOQE
	2LajhIV2KISX6gvGyWfmuj3dHMM4J1Dij+SGt6eqg4Zy7KTwyoYqAV3SiCfezUMwIfzV
	XpHQ==
MIME-Version: 1.0
X-Received: by 10.58.187.9 with SMTP id fo9mr33590699vec.4.1399395152806; Tue,
	06 May 2014 09:52:32 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Tue, 6 May 2014 09:52:32 -0700 (PDT)
In-Reply-To: <CAOLEWZV8z8qCt+cjd_ZJeoXWtM0yjdF4ZX8dOp46DtOiWy3iZw@mail.gmail.com>
References: <CAFeBWL52YdcY9KaLW3BuUQBKrSkbkAN4+h=PcxFM9nfXn5Znhg@mail.gmail.com>
	<CABcZANmF+fmDwEU3zMHCRqsF+Mxkysk8Ks62xKhv9EKSHK=ohg@mail.gmail.com>
	<CAOLEWZV8z8qCt+cjd_ZJeoXWtM0yjdF4ZX8dOp46DtOiWy3iZw@mail.gmail.com>
Date: Tue, 6 May 2014 09:52:32 -0700
Message-ID: <CAFeBWL642CHs6m0haby1XCmObCqAZdTaKEzyyJWjy9-v=q5dWw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: systemd networking.service masked?
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
X-List-Received-Date: Tue, 06 May 2014 16:52:33 -0000
Content-Type: text/plain; charset=UTF-8

I am really just trying to auto bringup eth0 on boot. Christopher, I
don't have dhcpcd, so I enabled udhcpc@eth0. No dice.
Is dhcpcd@eth0 how you guys bring up on boot? I've been using udhcpc
for my wireless connections and I have no complain.

Thank you,

Adam

On Mon, May 5, 2014 at 5:41 PM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> Well, none of my rpi or bbb images use systemd/connman/networkmanager and
> I'm just fine with that as the baseline.
>
> Steve
>
>
> On Mon, May 5, 2014 at 5:37 PM, Christopher Larson <clarson@kergoth.com>wrote:
>
>> On Mon, May 5, 2014 at 5:31 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>>
>> > I noticed networking.service is masked by default -
>> >
>> >
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/systemd/systemd-compat-units.bb?h=master
>> > .
>> >
>> > I guess I can use the Network Manager to bring up eth0 on boot, but I
>> > rather not.
>> >
>> > What's the harm in networking.service?
>> >
>>
>> Is it really needed? Does systemctl enable dhcpcd@eth0 not do the job, or
>> am I missing something?
>> --
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

