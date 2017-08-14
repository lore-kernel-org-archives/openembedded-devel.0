Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9527260670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:10:25 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id q25so37034623uah.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i+cMWmndpt7nDA9G+SkzciWTpAvGh3LKcEu7NvwhpMg=;
	b=OyE/cMsi3+oYBgmr1B3g8shmQpKiIgRDcy5WLc/Vd02BiQ3ElxKvOfaMoBeTK4AARy
	Qgs8KZ1qDp95yVq2XsIPUIT7vaFHVvGRBkYhOwnWQRI4jv+1wB3ADGIK7YPRZR6HY4fJ
	nyjpNXNmyW+tJNW7JmkabtWjSn4VEsKwC/D5WOakYKX0OUW90hKa5g1MYJuAr0niVNVJ
	PTap4uJTehi4uMPTjgiCeW04SJadFWEmfp/NFuMz8zkw8M3pCrr8WAjjz5HglDc1hSoK
	LXVuNKezTQnL7ScNgwF1HydmQDbSffqCl8H8xywa+GhmYFyz+dZXVSDN1kBRRcVKsv2Z
	03Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i+cMWmndpt7nDA9G+SkzciWTpAvGh3LKcEu7NvwhpMg=;
	b=tdLCN2MsVbSWHyFfcuWAYHc+qpOtTo92YXPMWsNS/VgflU0JJz4XUEhZn66rNmYY/4
	mL3q1FMKWton8FFe40vFgY3WAXo2PcJs3QGtQVzgKvhgwkF3gIk4oqicvkjh/gnWaYMM
	4ef4rBP9xQdS/1pnkeVVQv05bHL5ZE6TJju8s8nhhyOdo3zvkPmeHZ25c/0mcfgRBmLC
	hc8DtW/gXtPAcOAKPz5gbBFM0QYQU6kbCbGmluIbcSByGVZFR9tft++xSSk6CRnQCTfO
	WzvnQq+oiU8H4e2kC1ql4WmQt4fiKFMCpRuiH1tZEMs5abba8A8mKUjcl+b7D+9oHpYk
	0ENA==
X-Gm-Message-State: AHYfb5j0NPHuNP19durpLutGPu7+E4HYiANw1z9w8pL3g0wESso25lLa
	DrttcoxhmdLtXizW4NKaec2F2U4B/A==
X-Received: by 10.176.83.110 with SMTP id y43mr15231237uay.118.1502719826253; 
	Mon, 14 Aug 2017 07:10:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Mon, 14 Aug 2017 07:10:25 -0700 (PDT)
In-Reply-To: <CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 14 Aug 2017 16:10:25 +0200
Message-ID: <CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: denis@eukrea.com, Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Mon, 14 Aug 2017 14:10:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
>
> On 14 August 2017 at 10:04, Jussi Kukkonen <jussi.kukkonen@intel.com> wro=
te:
>>
>> On 13 August 2017 at 02:10, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
>> wrote:
>>>
>>> Hi,
>>>
>>> in current OE environment 'file' says:
>>>
>>> <...>image/usr/bin/chromium/chrome: ELF 32-bit LSB shared object, ARM,
>>> EABI5 version 1 (SYSV), dynamically linked, interpreter
>>> /lib/ld-linux-armhf.so.3, stripped
>>>
>>> This file is 4.3G of size and this does not fir into most of my sdcards=
!
>>>
>>> One note: I have an elder environment: meta-browser
>>> c79cf6c7811afd2cd167e8967e3c29b1e797371e. There chrome binary is
>>> detected as not stripped and properly stripped on do_package.
>>>
>>> Any idea why it is detected as stripped?
>>
>>
>> I have a vague recollection that 'file' and other tools can get very
>> confused when given 32 bit executables that are larger than 4 GB. It may
>> make sense to build a non-debug version to begin with to get around this=
.
>
>
> I chatted with rakuco who's done nice work with up to date chromium in
> meta-crosswalk, he's got some relevant commits related to this:
>
> https://github.com/rakuco/meta-crosswalk/commit/5aae1539c3d62b295dba40f49=
4397c0797140b0f
> https://github.com/rakuco/meta-crosswalk/commit/c56aa2bf047d3a01e14f4f9bf=
e5f88664b333f36
>
> On a related note, this good work is currently a bit hidden in
> meta-crosswalk -- is there a chance we could get this combined with
> meta-browser (or whatever place makes sense)? I know next to nothing abou=
t
> chromium packaging so CCing Raphael and the meta-browser maintainers for
> comments.
>
That is interesting. If your suspicion is correct, we are very close
to the edge of file working properly or not. With meta-browser
c79cf6c7811afd2cd167e8967e3c29b1e797371e (16 commits behind master) I
get a proper detected and then split chromium. With meta-browser
master head file incorrectly reports that chrome is split already. I
did not check the exact size numbers but my file browser reports 4.3G
for both cases.

Just to gather further information I think about bisecting meta-browser.

Thanks

Andreas

