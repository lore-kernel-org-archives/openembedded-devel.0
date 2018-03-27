Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 82E71608B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 06:50:47 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id o197-v6so5944817ybg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 23:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=poGuunduWXV5KPaVowcMjeu794Mwy9zNtBLG80ENylQ=;
	b=V14+ugU8W0OraiDinM9D7pg2/TrYO52NMwGG4cVvc2Hfsdg/14xPdlUjI6euRaVF2s
	00pcSPlofOdAj7M3ptEVd+o5BNIJwEhnUnqfeiCCJA5garz9TCewal4smolg3wUXtiC/
	64v3K8sxqr/4QxAjpl4qmMwBb6JNRrEcatEAQgZ84CK1cJMmLBRwdDcxdUHX1RcWl1qa
	YtVFjiKMZCtyUHYujxUYdVsIpXGrCq+XGabIsj+rqS3/amuSHl5Zt74XIY2u8RN/AU2n
	kRqKL+w8noiWl5LVwYBR8GuGrsISgUJROAAsPy53Z8U19pVVMv4+T2OtFZM+2cSIzaux
	/WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=poGuunduWXV5KPaVowcMjeu794Mwy9zNtBLG80ENylQ=;
	b=gO5x5BfQpP0u4i6l/82O/EfxLAM8538Qp04jaqWp70TCPnQpg4+IH/AIQvhEtYSQFu
	uuO7PbDHmvHnf8eFrSGfeeeRnGAxkWsdhaA7Bqgg9K9nDClds+N1/J0jyBSbb2ZEYwig
	JoumTYDFjaqQCzQypmMSV5yWSUsRGh3Gg1yUQ7X9mYLSJEe+9e0r8R1YTmooXEpajuGC
	JLhYlgZGBeedNTj/Wcf15yNEX/CMSri9ctmL6mKL5dbDX7Cvui16qPecV8T0KfaMboqk
	hR/2nY8zinO/iaHJMgajDxj7aMeA76yDXlGSO+loJVkj0nrQxjAh9JwupT/spsY53OWS
	PnXA==
X-Gm-Message-State: AElRT7EnFFfq+F3ZCmKXlq7NUoIfXm3VScPvtMegfvCxUSu6lCLBKt6C
	EMrkPvIxuTVW7V4nLY2kaEqbKWVri9R+0CbilmRoqg==
X-Google-Smtp-Source: AG47ELs1luRkZJMGhj7vG4svZm8bN1LeChNc72XnG+YPLSbM7lvmVNXfvJG2Ppud6wDsRIyh2JAe4bud+YTLLrej7EU=
X-Received: by 2002:a25:d0c6:: with SMTP id
	h189-v6mr23912917ybg.185.1522133449011; 
	Mon, 26 Mar 2018 23:50:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 23:50:48
	-0700 (PDT)
In-Reply-To: <1522121018-192702-1-git-send-email-hongxu.jia@windriver.com>
References: <1522121018-192702-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 27 Mar 2018 08:50:48 +0200
Message-ID: <CALbNGRRWpiVmjMLDsTht1UcjHMOBfQ78PdUNmQ6AV5=b8sKR+w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] libgnome-keyring: fix dependency of glib-gettextize
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
X-List-Received-Date: Tue, 27 Mar 2018 06:50:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 27, 2018 at 5:23 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> libgnome-keyring uses glib-gettextize so explicitly depend on
> glib-2.0-native.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Thanks but I think it's obsolete - see [1]

[1] https://patchwork.openembedded.org/patch/149554/

Andreas

