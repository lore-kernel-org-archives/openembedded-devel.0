Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90ED5601A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 19:38:53 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id f9so40509919uaf.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 12:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jTlPO63tE+a1A+sMq+JRUs2TlZKhr2IdRYtUanmsJSI=;
	b=Vjop1g7SPaHKRnWN3fQE0Yumv/9j29nl/gFY+zsm3QPNo4KVAoYJ4l0X8KPWSOfFON
	r8MeSpPZAkpGAnioziCH6KRSkuuUZV6J0mH+YdC75MiDWlmnI4L9GEigRvtSHeBG6LNO
	oolcsuFhCLd8PWmk92yF/KyNDU4/M5XppTvSE5RHGvXLbfSdkCqfdcK0ZHHEQL/Oj3uT
	tpEghkp2xCEOYTbh/T4K+qaC2K5bczw4YyDzYbmWzD9GMEWxK+Gj2Ql65FqhyMeu5cMe
	YaZ+F/he6sWuc/yX1vO7TKU2MYAgTa0f/dbqg3pxE+ZrTmtHjHBuL3hNt799PPIbTxmn
	8hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jTlPO63tE+a1A+sMq+JRUs2TlZKhr2IdRYtUanmsJSI=;
	b=ObzQX9xNR+OfAQZGSnh3ShIvhJCqgELowlPPzpw1CGNAMfTZdq2hV0rNSsiQ7Ph/C5
	uAB0sgPIT/ISfR2BOTbEUWFJZSjQE+lR04tZVLjRkaa7gKPVBTWpXA4lSGOiunahLSE/
	Mkzlsm10QoFuSHcij8JK+CNHPkAvMkEwDcaPErOUaMF1fe3n8k+b7y7LlvO3SzQZDGNy
	ACbyHjag8n0LFCqPrvr9lzOZy/clBOeF8APXLBGQb9/BnntMwiHCZxFOZrh0C74PrK25
	NWPTwL0/Gf9moq/dcQChaUetimvgJX+CPPKPAF32VmPLczr0ZS7BxV37VBvqNckRkr+W
	/8Kw==
X-Gm-Message-State: AHYfb5gJ47ukrakD3vYgMSbLM5adFmFYWgAgGEMcT9cPeEtwqVTi/YmL
	vM67Ny/Ky39udjk1uhlKGm+L87PthA==
X-Received: by 10.176.90.193 with SMTP id x1mr15506469uae.129.1502739534327;
	Mon, 14 Aug 2017 12:38:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Mon, 14 Aug 2017 12:38:53 -0700 (PDT)
In-Reply-To: <CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 14 Aug 2017 21:38:53 +0200
Message-ID: <CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Mon, 14 Aug 2017 19:38:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 4:10 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>>
>>
>> I chatted with rakuco who's done nice work with up to date chromium in
>> meta-crosswalk, he's got some relevant commits related to this:
>>
>> https://github.com/rakuco/meta-crosswalk/commit/5aae1539c3d62b295dba40f4=
94397c0797140b0f
>> https://github.com/rakuco/meta-crosswalk/commit/c56aa2bf047d3a01e14f4f9b=
fe5f88664b333f36
>>
>> On a related note, this good work is currently a bit hidden in
>> meta-crosswalk -- is there a chance we could get this combined with
>> meta-browser (or whatever place makes sense)? I know next to nothing abo=
ut
>> chromium packaging so CCing Raphael and the meta-browser maintainers for
>> comments.
>>
> That is interesting. If your suspicion is correct, we are very close
> to the edge of file working properly or not. With meta-browser
> c79cf6c7811afd2cd167e8967e3c29b1e797371e (16 commits behind master) I
> get a proper detected and then split chromium. With meta-browser
> master head file incorrectly reports that chrome is split already. I
> did not check the exact size numbers but my file browser reports 4.3G
> for both cases.
>
> Just to gather further information I think about bisecting meta-browser.
>
After first bisect build I checked size:: 4299018288 bytes / 2^32 is
4294967296 - so no need for further bisecting. Thanks Jussi for the
hint.

For now I'll choose old version - have not much time to take care.

Andreas

