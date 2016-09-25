Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB1060290
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 09:37:39 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id b71so7137706lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=C2lab0NprCn2ZL/VHCy7f8cunQO65IXO7YTfu17p0jY=;
	b=vabhfU2xNQWTpJtQEy8PO8Hns/lvJkBTshs/vFZiFybbsehlxu76x2/XVwh0HOyWeT
	xcYmy71N0ah9oRjla6KoHAPEPjhspUh9mvmfIq4+zhs78lR/sgk+kOhlbaEVIMPALnsD
	eUJmwJYHsxMZbWEsGAJryv4zCSYs56iGchDuPxnPe7O6VU0QxRujXC0eWK4JI+Zb9CyS
	tIKFVa99FIHY6NeDsNhqTRu0UVLE/Gr/QtRMuPnoV4pDv8kicLUyWW5YgZou2MZ4Lygs
	odtvwham937krcHxJjw+v6ftNbMpVAUNd2/f8dLiASTC4c7VvOwcJd70RJVGOfNnqLyx
	u+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=C2lab0NprCn2ZL/VHCy7f8cunQO65IXO7YTfu17p0jY=;
	b=hhN7681gtOP6hOYnw5OyMGW2qnZbt96R+BCDjUDgxc5JxkFNP/pW6YQGHING/6YYtO
	b1Yp9EE7AgJVjpk7CZf7Lmrk82QtQ/qrYgoAmjqim89M0BY/JWLqB2lEdFajagMuXQ7E
	B+E439D1ScR97vMs1WpGXixD3tZYmi9Ilub8oeqlkXVflp9u/xWG0izvlUyLQ8Dwq7gM
	Ql0KPJ5de2QFXptptosqysFwG+AUsA/WH0DVExE80F5nXiIcNrOEVQhu58fmR7wR9Lm0
	ddHtkLXJG/dFJh2JMMw1EsRzaBTOtteoaLRkk1hEFx4Zruk4GXuYDHdbOVD3m95XMtuW
	0kbw==
X-Gm-Message-State: AE9vXwPgeBFKWnQzaklSp9GEhZ0KSvCVs+StFyCh57ZsNjiBOAIwVE4PmhyBRr51nh/dWQ==
X-Received: by 10.25.74.194 with SMTP id x185mr5513449lfa.146.1474796259667;
	Sun, 25 Sep 2016 02:37:39 -0700 (PDT)
Received: from ?IPv6:2001:14ba:80fe:4000:4597:d2d:f32b:c0a7?
	(dtd-fyycgw8hw785n4cxt-3.rev.dnainternet.fi.
	[2001:14ba:80fe:4000:4597:d2d:f32b:c0a7])
	by smtp.googlemail.com with ESMTPSA id
	o84sm2710526lfi.34.2016.09.25.02.37.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Sep 2016 02:37:38 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1474790089-17176-1-git-send-email-dachaac@gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <8b791747-fcdb-93e4-2941-f020722f03ef@gmail.com>
Date: Sun, 25 Sep 2016 12:37:37 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474790089-17176-1-git-send-email-dachaac@gmail.com>
Subject: Re: [meta-qt5][krogoth][PATCH] qtwayland: Fix building of QWaylandIntegration if some Qt5 features are disabled.
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
X-List-Received-Date: Sun, 25 Sep 2016 09:37:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/09/2016 10.54, Vesa Jääskeläinen wrote:
> QPlatformIntegration's interface methods are disabled based on QT_NO_OPENGL,
> QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
> QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
> QtWayland.
>
> Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
> ---
>   recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
>   ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156 +++++++++++++++++++++
>   recipes-qt/qt5/qtwayland_git.bb                    |   1 +
>   3 files changed, 158 insertions(+)
>   create mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
>
FYI: I have sent upstream PR but no response within a week:
https://github.com/qt/qtwayland/pull/1



