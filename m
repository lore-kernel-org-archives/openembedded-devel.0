Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABA3F7DE8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 18:46:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so21424539wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Dobkn5C57tog6MDlQDVsra50pz+dOuc1tf+cRQyEVgA=;
	b=eIARh3iGYrmaVGBLI+WplxDgk9P1de9LCtdYA0axsCtCtQPg+17cDM/sH0l5b7LJ0O
	R9lG+h9HbCcScrnEF/KlZRKB+SymjcjDgpaYxjGpBJvOiy6oWiWL1+M0F2qAHf6XunGe
	EV3J4TbNBAtfW7SMiD4E8hay88Dqh0kcFZL/AAA/CO6YJ9fTFKtMP8T7C4ICrR8VdDem
	hbPmGW4AO6hOKYeswIEJj/nZIX4iVe+0Pzxzp6dX/itAhhJ4jwqCiWO22GViouyh4VEx
	zymY+X9hU3RgsePviMYaVJxqEh6Cli+KAiXHP3M690WL/g7C5v/t5c3AHE8/kJ7gKAhb
	wnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Dobkn5C57tog6MDlQDVsra50pz+dOuc1tf+cRQyEVgA=;
	b=sjAF4w7//4VX0vBhkuwDb0F67yRVUB4Dau/tiqex+kscR38gYkQMc4JxbWS28Fo6SU
	0RD1PtifFFZL5yHZg6nUO/JsVu2sSVsVxzBt8cHMgLLMK13ejXiCUkdqr43tzFnUMo/b
	FdtFhkb8ETX/s5OyznspDsEZXbuV30g0Aw6C3V29QQqrAXIqSijWpJAEzNlfT86Jq3NG
	lvDlMpNu1JaQ2DYc1sRE0vFItxUFfBSdJPKNHMvIz56fNYFTRbvtggOyLoYp7Al4s2sB
	lEn8GEKL78twgSsNERPyWOhhwVKVvwFwjesqD6oJXVyibdYuP7xd98lDwRZDGqQGhUim
	9z6A==
X-Gm-Message-State: APjAAAW22B75pLOYD9nnIP35apYCp9usFoOpDDc91eKamRGCpXYXslE0
	F+iphP3Ys8q4njghnlcA5AmRvFk6vGU=
X-Google-Smtp-Source: APXvYqyDT/1sIi/0NMOJMKei0046D49ioIr3yoydp4lUGcxpnau6rNYwOx7dKy4++WJjg4ntOxEYhA==
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr12477692wru.117.1559069178896;
	Tue, 28 May 2019 11:46:18 -0700 (PDT)
Received: from [10.100.100.101] (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	h90sm33876701wrh.15.2019.05.28.11.46.17
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 11:46:18 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
	<119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
	<CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
	<20190528180655.GA14708@localhost>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <38a79973-d737-7c53-7705-0a8f09326c28@gherzan.ro>
Date: Tue, 28 May 2019 19:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528180655.GA14708@localhost>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 18:46:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

On 28/05/2019 19.06, Adrian Bunk wrote:
> On Tue, May 28, 2019 at 09:14:17AM -0700, Khem Raj wrote:
>> On Tue, May 28, 2019 at 8:37 AM Andrei Gherzan <andrei@gherzan.ro> wrote:
>>
>>> On 28/05/2019 16.13, Khem Raj wrote:
>>>> Hi Andrei
>>>>
>>>> The musl patches need to be forward ported as well. They dont apply
>>>> cleanly anymore on top of this update.
>>> Seems like. So all the contributions now need to go through local musl
>>> and glibc testing? This sounds a little bit of an overhead and might
>>> discourage people in contributing because usually everyone is working on
>>> one libc variant. Just raising it as a concern. As per this specific
>>> case, I'm going to fix it and push a V2.
>>
>> I understand that and in some cases it’s even narrower where one might just
>> be working on one distribution alone for single architecture for that case
>> failure on architectures they don’t care is
>> also a nuisance
>>
>> It’s wide and far testing we can achieve is good for end user same goes for
>> multiple architectures if someone tests a given architecture and reports
>> build  failures then it’s good to acknowledge that imo
>>
>> It’s not a blocker I expect someone interested in a given regression of
>> this kind to chime and help if possible so don’t see it as an impediment
> Is anyone actually using networkmanager with musl?
>
> There are no obvious usecases where it makes sense, and OE seems to be
> adding security vulnerabilities in the musl build that are not in the 
> glibc build (e.g. -Dsecure_getenv=getenv) so users should better not
> use it in any case.
>
>> If we remain cognizant of the fact that upstream might have wider usecases
>> we will generally be better off cumulatively
I have pushed a V2 which addresses the musl patches as well.
> Upstream ships a copy of systemd code for use as library.
>
> This already implies that trying to support it for musl will be a 
> long-term pain of not upstreamable patches for OE contributors.
That is worrying indeed.

-- 
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640 | t: @agherzan


