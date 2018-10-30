Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 645A8744F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 23:08:44 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k19-v6so12003274oic.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f/Sj7In/QN8VqJ6Ep0o4lWwmE+3Z1RbkTuAGfEsiqeI=;
	b=GKmLUG+sVWxWWJXkDuWztWc1+cszhcBbFt7iGgFMMFuysBJEArcCrQIspYBKROcDjj
	03ve9+wII9J56GscP03OR0kTpKR6aiTCgYUP2QGQ466asquUGKZL85omgdvUAabWKViy
	Am9qWJwPOOK/d/iASsHhfgJ88t8nx5ppqj2JApeeOpR/yypU0fVo0FpSSImMHxilkB7A
	of5mMQXCDH8/fv3+uCY1pIKRtrjkB9xEswxZpRHQGHZtDMQUwBrabpDka2wYLHAE56VN
	pNlPGF4mNbOUYcFSLNhgh9oO2AzTA2wx8z3syDXdxAIPeuk/QXOPdjwl+9VVwi/XlvR8
	L2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f/Sj7In/QN8VqJ6Ep0o4lWwmE+3Z1RbkTuAGfEsiqeI=;
	b=ZyqFyKrHSJTYo4jSASab+ZP6SaPYidZJOqIFaW6Ha0brcggQw8nUhJdtOCeCTLiyk7
	fN/NZnHfjq/IkDIq6fVB2R3S6Mu1i7svCMbnrXI1/EDS9eqaRe/hu1VuVUYvYFU/XFqG
	fTNGfeg9G2S0Mbuc3JvUAgLvKwNS59kPK9DCdDW6PEt9+DhaU1496kNyE/2ST5lQQwlJ
	YPnu3wBuCG722e0XWuRoz/yQtPD3NferHAe+6/uWWzsUudd4mDmCopqBbsTfJcE+9Bnp
	CTIcu0ZU1ExhoZBs9A7xFz+PUYTST6cA/4r8MXQwLckTP3+AA+cAMzQ0QSWg4W1HzMaG
	myQg==
X-Gm-Message-State: AGRZ1gITxErgpnpsPq/N+ihQyte/ZUFMwIweTvyVU1I6hnlMOWtW7lij
	L50mVag6brlraTi63hAY84Ok9bNcMjJwR6mLizQ=
X-Google-Smtp-Source: AJdET5cSg+UAWVXsUL/W/sXs8jHQfqIvFI6ikSI0fVB/IIPRV/QD63yC0RAvY3ZAq8g9C3rkHdOBdpf3bkSXgYX4G5E=
X-Received: by 2002:aca:3015:: with SMTP id
	w21-v6mr431939oiw.342.1540940925310; 
	Tue, 30 Oct 2018 16:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
	<CAJTo0LbH3UCYYHCp6E1gA33fjk2xSr+ZkZjZmn-MDvabT7_EfQ@mail.gmail.com>
	<CAKPa3c2XXz1JNFzu-voxa-O029gh-7eSf1hWAD4U=BAjMfLx9w@mail.gmail.com>
In-Reply-To: <CAKPa3c2XXz1JNFzu-voxa-O029gh-7eSf1hWAD4U=BAjMfLx9w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 31 Oct 2018 00:08:32 +0100
Message-ID: <CALbNGRTw_P=QJ0+ybGyXNZUxAMpHYHVLOxHj4ZF1=Ps2ADzGDg@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Tue, 30 Oct 2018 23:08:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 30, 2018 at 4:04 PM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> Sounds good, I hadn't seen that. Should the existing lcms recipe be renamed to lcms2? Most distros seem to package it as such and it'd also simplify the recipe a bit (the PN would align with the tarball and source directory name).
>
If you want ro rename don't forget to set PROVIDES / RRPROVIDES /
RREPLACES / RCONFLICTS - otherwise you break recipes depending on lcms
(there are many) or package feeds. I wouldn't do that.

Andreas

