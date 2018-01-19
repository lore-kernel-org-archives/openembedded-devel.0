Return-Path: <athoik@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 449C26E650
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 22:18:01 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id z17so2436279pgc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=exxAiR+/QcwcGCtSX9jwPtSETREjuA6fbaRn6wU5b0g=;
	b=vJ8XJP3eQizj7aX1PRES0vtN4b9jM03EJP7bTcpuNAhNiHPTl3EeOjqq/nHIkijr0T
	3Q3y1pNhTEirdYrMxsgspNFTMaxC+wVRazPYZL7TNppjSXtEhwu3b62N8EL8l8mPO1Cu
	r3Qf/3BgIq9cwQ2q1KoosmGWoe9oQWzX6oUgltph4Y+J3ay1MeXt9dnKIwwF0NQveKCq
	CISw0M3xR6ncwU1p7QMmq/SRkBhbM1ZuabweboLMt/CSmmHRfRO94piF5Wtp5UPNQYJ8
	CYc8sMSVbUO/djmQpAzQoXSzQ4cFezlH29e+J7PcxyKGfzgNLr80Ix66T6UMnNP+6DxE
	R5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=exxAiR+/QcwcGCtSX9jwPtSETREjuA6fbaRn6wU5b0g=;
	b=o3+VCD4GHBEaO5R13dEDgdRuIDOMKY3h10MlXZvMvJCRsWGGbDft0rJlliJZKF59Q2
	ReP+t4rJOCD5UrF1uIejiyNaHOS3OxFFIyv541WgeLHhs+qu4uZv15YXVEMfnVdXBU/L
	dZAMggr5BUghmltNHHnm1nzjF3Lntmh1IIsxLH57Isr1aU+TzUN7Pq/Y2A+U47NeGt+J
	Z4C0+vyhTKHU45cthEC/DpjNgaZiv2Pk3ag4cpTN+nwNe+XHyxsiA7mCvkgH4Tx2bdak
	mNr7WaMCRb1TJM9HsdTa1LOYnEcDMvkT0QUCqxZFA2qCwBdxiY5DX8YI4mMRrbqHqUv3
	nTpw==
X-Gm-Message-State: AKwxytf3UhpBsOeRzuwv4EB8rD6Mx32u3JvueoZXzVWqolgJPoO59S/H
	txnDw8rJIC7ByEvbvzAzcNFn02R1d1sGoDaHofW3
X-Google-Smtp-Source: ACJfBosGHIoGn4XUKh6ujm+pwyH0KqnBqedIznM6Uad553ni0FPOSlPdtbGH1+Ns18CBM5gCM92lt7s+nKKIhxLhPJM=
X-Received: by 2002:a17:902:6909:: with SMTP id
	j9-v6mr2277522plk.372.1516400283245; 
	Fri, 19 Jan 2018 14:18:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.153.194 with HTTP; Fri, 19 Jan 2018 14:18:02 -0800 (PST)
In-Reply-To: <CANDbA3d=8s+fo78NAacpW31PRsO-UkpEApE8cC6EM=QsRPx16w@mail.gmail.com>
References: <CANDbA3d=8s+fo78NAacpW31PRsO-UkpEApE8cC6EM=QsRPx16w@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Sat, 20 Jan 2018 00:18:02 +0200
Message-ID: <CANDbA3dLUiUed8jNbDhP8UJpk_FsHdQdnFZ4Yn3DA9cR7cWY5w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded] fix getVar/setVar syntax on morty
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
X-List-Received-Date: Fri, 19 Jan 2018 22:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2018-01-17 23:20 GMT+02:00 =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=B9=CE=BF=
=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 <athoik@gmail=
.com>:
> Hi,
>
>
> Is it possible to cherry-pick commit
> d361ef01a9a61cd8a83f7728f7d3e9f118233cb8 nis, opencv: Update
> getVar/setVar syntax on morty branch?
>
> It helps building morty using bitabake 1.34 where deadlock problem
> (commit 3cb0d1c78b4c2e4f251a59b86c8da583828ad08b bitbake-worker:
> Handle cooker/worker IO deadlocking) is resolved. Will 1.34 bitbake
> there are no delays any more on the building process.
>
> Of course if there is a fix for the 1.32 branch of bitbake, that would
> be fine too. It was faster to use 1.34 branch for me.
>
> Finally another small fix required in oe-core,
> meta/classes/binconfig.bbclass but that's another mailing list
> discussion.
>
> Thanks,
> Athanasios

Hi,

Hopefully, I manage to create the proper "format" for cherry-picking
into morty, using info from here:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Sorry for noise.

Regards,
Athanasios

