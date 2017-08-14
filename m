Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id B510560670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 19:43:53 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id e124so93994882oig.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 12:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Bc/nRZHOyLzQzOSdh71IhCHN56l5bDGMJSdIsKh2w0A=;
	b=t/aO5s2/B8bz5i4P40l+vR5lxzdGc9iwvupVa/nDR+O4z2ZA4IP29K9KQHKL6udOUK
	cH0XPqe4e86JdEzHN/AFqj+PUD0QBC5Nhd3VlWEk2MYmMvyV48CgalM3Vb8w3QOeHE0j
	lzhoVWi08ilp62zsmR6hjFA0XmlU8SBPvEd4mRRVnuIWuQZTpVVNjPXgdXIcKaHunjnA
	tPBb+B+Zy+mpdEAUHKCo4JI00vmjkhi+ADqtSAGtkMEGCxbgEXfPKlQpMybbn68kfyzB
	/veOQ53BGTN4bjeQ9A7tiqFoxusPSNAyVnRxWkGURbQZ4n2yXqNRcAVj2Za6Ag2B6pBf
	nJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Bc/nRZHOyLzQzOSdh71IhCHN56l5bDGMJSdIsKh2w0A=;
	b=liK+N7mYi2YopKJWQwyJaWU5dVze32gYs6nzYeSzMVU36Y4r8TF7oEreejATj0N+qG
	J91rJbyzzf1TPpUXHkAl0wmjyukn8nXWq3vIA03UIMjj2GdwJSv8OR9mfLwSNLiHkLZq
	3cbZ30axOQWYWVXX2d7vNsFHENOcrp6mKxM+LG2hCowvdDuZ8C1Z4hKbw/EsPvAtc6SM
	9BfZOaY/DSeXLdgadOnnj+otAuSXOzQctCFf6K6LYONwZssUVjXjd1Sg8cLm9lK4tr3J
	DGz7D4rCci8nwwN4vd9jKblyfPes76tIBw2JqQG0ckjsvXAXh6YidCBh89TvNa/Kr8mL
	hheA==
X-Gm-Message-State: AHYfb5ggNpSBsiZjK2b0Z8tQEYeGRQD+gZn3P/EkAAOEYfj5u5zSEYDo
	LMjUCRR8/TLHYSD5894=
X-Received: by 10.202.79.6 with SMTP id d6mr30226148oib.6.1502739834504;
	Mon, 14 Aug 2017 12:43:54 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	m62sm9433429oib.19.2017.08.14.12.43.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 12:43:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id x3so93842776oia.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 12:43:53 -0700 (PDT)
X-Received: by 10.202.68.2 with SMTP id r2mr27448221oia.225.1502739832881;
	Mon, 14 Aug 2017 12:43:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Mon, 14 Aug 2017 12:43:52 -0700 (PDT)
In-Reply-To: <CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
Date: Mon, 14 Aug 2017 16:43:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
Message-ID: <CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 14 Aug 2017 19:43:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

On Mon, Aug 14, 2017 at 4:38 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Aug 14, 2017 at 4:10 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
>> <jussi.kukkonen@intel.com> wrote:
>>>
>>>
>>> I chatted with rakuco who's done nice work with up to date chromium in
>>> meta-crosswalk, he's got some relevant commits related to this:
>>>
>>> https://github.com/rakuco/meta-crosswalk/commit/5aae1539c3d62b295dba40f=
494397c0797140b0f
>>> https://github.com/rakuco/meta-crosswalk/commit/c56aa2bf047d3a01e14f4f9=
bfe5f88664b333f36
>>>
>>> On a related note, this good work is currently a bit hidden in
>>> meta-crosswalk -- is there a chance we could get this combined with
>>> meta-browser (or whatever place makes sense)? I know next to nothing ab=
out
>>> chromium packaging so CCing Raphael and the meta-browser maintainers fo=
r
>>> comments.
>>>
>> That is interesting. If your suspicion is correct, we are very close
>> to the edge of file working properly or not. With meta-browser
>> c79cf6c7811afd2cd167e8967e3c29b1e797371e (16 commits behind master) I
>> get a proper detected and then split chromium. With meta-browser
>> master head file incorrectly reports that chrome is split already. I
>> did not check the exact size numbers but my file browser reports 4.3G
>> for both cases.
>>
>> Just to gather further information I think about bisecting meta-browser.
>>
> After first bisect build I checked size:: 4299018288 bytes / 2^32 is
> 4294967296 - so no need for further bisecting. Thanks Jussi for the
> hint.
>
> For now I'll choose old version - have not much time to take care.

Indeed it does sound like the proper workaround for now. That said,
I'd love to receive more help from meta-crosswalk people and avoid
duplication of work in packaging Chromium so I am adding Raphael on Cc
here so he can comment about how we can try to work together on this.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

