Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC56773AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 11:55:11 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c206so133476516wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 03:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=R/4ZAFZAa4XyWWHGbyLNZYjk/bqvacw/WGX7Ewt7+7o=;
	b=TZtIL6x6y4sArecnzY2h+mM+7RraXghjZgDTrfQtGxjRACSamVe36FIVhO3vq1JN8m
	SvkwuM2tq7KMuKgrBhhOdtNUGL3FrIDcYdTtBMJzcF1mB3W5wM50JaegsgkThbxUvMcj
	I5GJGia/b3g2aFPwKAHCZc1sa8ef5oKFWr7hp+ZCVUXSqU+f8dWPX2buiTr1Q/NyX8iI
	n0QYGjJtCpevPXOvzQFyJS0NthXt3FjJIzUqfXyfSDV+BBDIpUCDpYgAwke8nhla2pXO
	psq3m4NEPnKk/HgvXPqIxy0vFNVDTh3fS6QfEm4SK9I+hCLsor7tjgS25CMEA9tINvYq
	dfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=R/4ZAFZAa4XyWWHGbyLNZYjk/bqvacw/WGX7Ewt7+7o=;
	b=ThadLPLJnXfX2Cgm1zwK3NeTf3ba05QCJLcX5v7CX0GBY0erWpgxgxasiUtjL8BF3S
	AzDZ1zYjbRmI31uxl9+mQwgbKd2AavpfSQ2TZNOYHWZphYRyxPv9S5J4e1icHIfZe4jI
	Zi/uRYFMLPyyvBG4p9p99Zw47T4YFKjIj/GBetJ3XpWfvg+cQsxLxZYEb7NE91i5hKuS
	CKJbJpcweROvKU0hoqCxHyZNK7S5T3Qejbej3rJ/44h98VXRV/Q6pJDwYv+p8AdNBUZW
	U4VV1YdX05McnxL9Y61q2mSZjl3fubNpQaUw0AXMATIiQ6W7QauEyBorf3PCzGh9Lfs8
	dWjA==
X-Gm-Message-State: AIkVDXIgjDMVQvkBMZjHKjH6rmH4ceTG0Emhh47gkD1Tps5LX+OtkZKKoZkbSEkrYW3QXg==
X-Received: by 10.223.136.85 with SMTP id e21mr6973342wre.28.1485518111410;
	Fri, 27 Jan 2017 03:55:11 -0800 (PST)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com.
	[74.125.82.54])
	by smtp.gmail.com with ESMTPSA id p7sm7519947wrc.2.2017.01.27.03.55.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 03:55:10 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f54.google.com with SMTP id c206so133475480wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 03:55:10 -0800 (PST)
X-Received: by 10.28.128.150 with SMTP id b144mr2967691wmd.119.1485518110307; 
	Fri, 27 Jan 2017 03:55:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.69.17 with HTTP; Fri, 27 Jan 2017 03:55:09 -0800 (PST)
In-Reply-To: <1485515717.2825.12.camel@gmail.com>
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
	<5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
	<CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
	<20170127102850.dv7ytzoaltcruump@ad.chargestorm.se>
	<1485515717.2825.12.camel@gmail.com>
Date: Fri, 27 Jan 2017 09:55:09 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq0xKnunRytwo0FPLUD+15cXptb3E_BJuOUroXbwcVWhg@mail.gmail.com>
Message-ID: <CAP9ODKq0xKnunRytwo0FPLUD+15cXptb3E_BJuOUroXbwcVWhg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 Jan 2017 11:55:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 27, 2017 at 9:15 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Am Freitag, den 27.01.2017, 11:28 +0100 schrieb Anders Darander:
>> * Otavio Salvador <otavio.salvador@ossystems.com.br> [170127 11:12]:
>>
>> > On Thu, Jan 26, 2017 at 11:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > > what happens if commits are already having a sign-off ?
>>
>> > A new one is added.
>>
>> Then I don't think this change should be made.
>
> I tested it. That depends on who did the sign-off.
>
> You end up with two sign-off lines only if the are not identical, e.g. the committer and submitter
> are different.
>
> I went now through the READMEs of all installed layers and about half of them propose the '-s' while
> the other half does not.
> So I guess we should drop this patch.

I prefer if we adopt it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

