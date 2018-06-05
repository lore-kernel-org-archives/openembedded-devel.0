Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 08B787843F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:48:22 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id a5-v6so3607053otf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=AJL3x+0GWO+2LsRPYs6olA8rKVWmtGJo/LbkxEhR6Gw=;
	b=ol9Mise/XIfsxC7LaNqvJkpMkHESxcHNP5bnnE7x1+dtm2VoLXeyAtZE4fq2QHd2DV
	61SkFDQ/Ndo7RFem57L6OZ81+nJJj9wlBxSIBwZfDh2JDx0a5+VVsy0HDiPNnDkg6oYi
	1H7/hvLB7cpdMiv2ttyN+Vx/WNyY/RUY1+NZRB8pqrXanUKE1SOGZb92XlnR4I1LpN/N
	R7LEofEsO1u9JFMn6ybdwVzFr+UNDrtBGO6sOJP4ocGaVznuK7QvexdfwqHRSCSSdQoU
	H7ih+XvrXiJTZe3mVjXckVso5wvbIpN3MEDihwPbWfBiIr9SWxIN8bFH4EeVABzMA0w3
	wp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=AJL3x+0GWO+2LsRPYs6olA8rKVWmtGJo/LbkxEhR6Gw=;
	b=FT0uEbzaSsHL8JfeE3c6xvKONjN/ypNRj8MY0ZqNv2GLT/lgJp9n253SpIqNmsLFb5
	7SV9bt0qwqHuplRPqg5DBMIq9LOYYvTRBSF+Z7mTCCokSrIEDpAHA+Ai2ClQUa4nTShD
	cAaUhaJ11yXzgWxbmZ7Lr1dcSW1H+TZ+6GsQh14pWWk3U2qee85QOC1CIggz59BIIxXz
	i+6KB07FJ/ijW0L7wtppzlUTJ3m3neNEPhqIRWIT04yS8uzHnQfdmAz2TXBthcbTifsq
	L5PGn3UPeGIhWfokOYvkY9X3Sccj1gT2zh7lfMgGVEF9W98galIlPXzd5drjSMm9wFXs
	sPbA==
X-Gm-Message-State: ALKqPwdQ7NY3JwfeozYkOokB0PJmlFkxFciitOHtg0vIA5kiCfDuyRoq
	K9eQ082w7MfeyoO/4Tic6Zwm+mNY
X-Google-Smtp-Source: ADUXVKLU253HrHk11UlQF5Om3blbqMqSEm647dOkjacXUWRiRM8jpO7JZHBjNGRItpXDfiUdmbFe0A==
X-Received: by 2002:a9d:94:: with SMTP id
	w20-v6mr18528702oti.248.1528217303711; 
	Tue, 05 Jun 2018 09:48:23 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	a41-v6sm12866601otj.45.2018.06.05.09.48.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 09:48:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id i205-v6so2722611oib.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 09:48:21 -0700 (PDT)
X-Received: by 2002:aca:c416:: with SMTP id
	u22-v6mr11338799oif.288.1528217301050; 
	Tue, 05 Jun 2018 09:48:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3da5:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 09:48:20 -0700 (PDT)
In-Reply-To: <10630413.xVAl2E7OaH@yow-masselst-lx1>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
Date: Tue, 5 Jun 2018 13:48:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrc36oVL7BWWPyXn5P4oWHAGeeH92K-v-XmWz_=xk2LBg@mail.gmail.com>
Message-ID: <CAP9ODKrc36oVL7BWWPyXn5P4oWHAGeeH92K-v-XmWz_=xk2LBg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java] maintainer status
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
X-List-Received-Date: Tue, 05 Jun 2018 16:48:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 5, 2018 at 12:11 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Several of us have noticed that nothing has been merged to meta-java since
> mid-April (roughly 8 weeks ago). With about a dozen commits sent to the list
> and pending merges I thought I might email you, the maintainers, directly to
> determine if this is expected to continue. Should we be looking to update the
> maintainers list and/or recruiting new people to restore the vitality of this
> repo? Have your roles or positions changed making it no longer viable for you
> to contribute to this repo?
>
> Thanks in advance for your responses.

I've been busy with multiple things and couldn't focus on it for a
while. But Maxin was keeping it up to date. Do you have a bundle of
patches need to take a review / test?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

