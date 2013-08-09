Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id C8A646007B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 09:19:01 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id id13so434353vcb.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 02:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=jS8S/p4igC/n2LIW6Uwi4ThGJSDDJ3YrU0ybcGgTz+o=;
	b=LeKZPnzmNONOG+1c7bAAu/PS0BOQ7RDWYRqO3NrRI6QpJaEglLefDVmCJ1qjqPHqnh
	nRimbtyWO/qvLAL/SlrZsZjn3Bsu5FD+8EvF4//b8zmgy/HBsyrNiF6zhLpezDwSUxsB
	FzKikfi7OtWpmZn4oHdykK4raCAPlw5FK4y5AcrjYRbuvpLVDmOL8R7M5m45fKT8j/a4
	Mzv12bGkF5CRPpCQRPmmsbwTQBU3Ex1T+bKO5dGxLFrsDbXzA06pSCO+oX8zPj2TfE3v
	setmC62aA/pZ30VfYmPZRQeeOxmilYEDZPC6d6r3MGkzZoCIdRacqI5zNXFLhNCi1iJL
	/mlQ==
X-Gm-Message-State: ALoCoQlEK7Wc2cH3xhFu3fMLrTgJ9NwvP4u1fV8tAwixILT/hgK2/NNbmI6+sE7GFyTTLq7u71Jx
X-Received: by 10.58.219.232 with SMTP id pr8mr5324195vec.80.1376039942154;
	Fri, 09 Aug 2013 02:19:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 9 Aug 2013 02:18:41 -0700 (PDT)
In-Reply-To: <1376038471-32202-5-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
	<1376038471-32202-5-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Aug 2013 10:18:41 +0100
Message-ID: <CAJTo0LZg4jsH2HT2joWUXcK=8Ao3xBSGKifRt0w4CMC78fLofA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 05/12] libwnck(3): add PACKAGECONFIG for startup-notification
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2013 09:19:02 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2013 09:54, Martin Jansa <martin.jansa@gmail.com> wrote:
> * it's autodetected from sysroot and couple of packages are failing
>   when pkg-config is trying to use libwnck*.pc without
>   startup-notification in sysroot

Why not enable this by default?  People who have no need for
startup-notification can disable it, but this could be surprisingly
hard to debug if someone tries building e.g. GNOME and wonders why
they don't have any startup notification hints.

Ross

