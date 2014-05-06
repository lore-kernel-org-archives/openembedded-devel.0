Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1920865F09
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 18:12:11 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id lf12so1482036vcb.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0Eq+3AR3dxtYsCiV88rzqi5zo+TvqbMGJ3alOKnkKDs=;
	b=YNoLwVtXgWMlWmvzN7zh+aFVdrNXAL6pGv4H+hT7mcgIEnaDdPdm9dhpxZcUc7bL3b
	qJUmOxfg4mDBM5YqbyN49GjfpyXIipwfQ5XoBuUg/1zVlbrbSIdPWI3ih5J3/z5pG1bk
	8ZJJ1N7jmlZ2Dj7qiA6MEdTU6pD+NsC3W31sdY4bGhb+lwUx6KseyA2Iz5AuCsglAXYu
	58cUDzdUgQ3MQAMsysJA8dBYlaoc8YnnOHegTWVVKR1cdU5iRbbz603/hV/UiZY4NBj6
	xC7TUUh3IAwFAisp3NXLZx/+N5qIFK+HL0lNXa7p13rdOjviZ39mwftNhsniBOy8vICD
	gnXg==
MIME-Version: 1.0
X-Received: by 10.58.95.102 with SMTP id dj6mr1667424veb.68.1399399932381;
	Tue, 06 May 2014 11:12:12 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Tue, 6 May 2014 11:12:12 -0700 (PDT)
In-Reply-To: <CAFeBWL642CHs6m0haby1XCmObCqAZdTaKEzyyJWjy9-v=q5dWw@mail.gmail.com>
References: <CAFeBWL52YdcY9KaLW3BuUQBKrSkbkAN4+h=PcxFM9nfXn5Znhg@mail.gmail.com>
	<CABcZANmF+fmDwEU3zMHCRqsF+Mxkysk8Ks62xKhv9EKSHK=ohg@mail.gmail.com>
	<CAOLEWZV8z8qCt+cjd_ZJeoXWtM0yjdF4ZX8dOp46DtOiWy3iZw@mail.gmail.com>
	<CAFeBWL642CHs6m0haby1XCmObCqAZdTaKEzyyJWjy9-v=q5dWw@mail.gmail.com>
Date: Tue, 6 May 2014 11:12:12 -0700
Message-ID: <CAFeBWL6jB=TTvks=LSGZFS=XMBwTmbe=AFScyKQ912K41HO_Qg@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 May 2014 18:12:17 -0000
Content-Type: text/plain; charset=UTF-8

ok scratch what I said an hour ago. I had dhclient along with udhcpc
installed on my system.

I took dhclient out and systemctl enable udhcpc@eth0 works.

Adam

On Tue, May 6, 2014 at 9:52 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> I am really just trying to auto bringup eth0 on boot. Christopher, I
> don't have dhcpcd, so I enabled udhcpc@eth0. No dice.
> Is dhcpcd@eth0 how you guys bring up on boot? I've been using udhcpc
> for my wireless connections and I have no complain.
>
> Thank you,
>
> Adam
>
> On Mon, May 5, 2014 at 5:41 PM, Stephen Arnold
> <stephen.arnold42@gmail.com> wrote:
>> Well, none of my rpi or bbb images use systemd/connman/networkmanager and
>> I'm just fine with that as the baseline.
>>
>> Steve
>>
>>
>> On Mon, May 5, 2014 at 5:37 PM, Christopher Larson <clarson@kergoth.com>wrote:
>>
>>> On Mon, May 5, 2014 at 5:31 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>>>
>>> > I noticed networking.service is masked by default -
>>> >
>>> >
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/systemd/systemd-compat-units.bb?h=master
>>> > .
>>> >
>>> > I guess I can use the Network Manager to bring up eth0 on boot, but I
>>> > rather not.
>>> >
>>> > What's the harm in networking.service?
>>> >
>>>
>>> Is it really needed? Does systemctl enable dhcpcd@eth0 not do the job, or
>>> am I missing something?
>>> --
>>> Christopher Larson
>>> clarson at kergoth dot com
>>> Founder - BitBake, OpenEmbedded, OpenZaurus
>>> Maintainer - Tslib
>>> Senior Software Engineer, Mentor Graphics
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

