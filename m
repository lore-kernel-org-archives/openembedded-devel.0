Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9597C66A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 11:12:55 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id l15so6618292iti.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/PpnS/mikXcdmzoNTC9vlX0tt2InJihACP7o/UN84GM=;
	b=zxeOE4KMcwoveyiegRp9XWmbfb7AaZQYSXcyxOpy7nUqqcB9szMDqcqX7VdcVa2KQ0
	Gv7Enx0O3GVKhEeJZzH9oVrTol6kzepsapkQXFLi0fPx1vv6ftpFAREBpyBTl9ZPrkbL
	uI8lzGBsHSz5LrOH0qFZzNX2GUEdAbh776kvJRBAShP0/2qfOzbx+BREPZfEuBHNtL+H
	W/nnUbVP9oMO6Er0csshdzQ/oXYUzUxr3cplazCNTFE3ZpYF1yOmyMKLoFsKZdcz/ybv
	UaYJAQ64zbjaR/eUfAbOsV2l1D36Ska9bTME2T5YkTN3EU0qDEsYLB38Vwc/dyehWsLF
	B+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/PpnS/mikXcdmzoNTC9vlX0tt2InJihACP7o/UN84GM=;
	b=B9jz2FOnFt/XJg8LzU0pp7Vtk9ipgSh/sKcDqHEcZiGHrEgETHceABvU2kPwBcZCYb
	w5b0bfjMvt3Ub7WfwOhaMTBrRHsW8mtCdI2xBupDutHNhM9wY4IjgQ/JICx3uKzErkNG
	MdJfNT7eJfYvVdKwVBzvcmGjWW6waM+tR8D7eny3kc5RhEtA41ohsEEPQWoPCJ0jsPLM
	L0Frx2ckwUc5pfiPuyggTXv04KbOKNhVXT5IHuxu5AReNPqq3NH+IuiJY6E8mXoBhKUL
	D6X8tpW/Qi6a3dnjacEjDza4tnTyKb0DKG9+27O7dgLz1iZTbv9Thjm7floO+TiWNX1e
	XNGw==
X-Gm-Message-State: APjAAAXrOhhtAf64mI1sd0l8cVbfkAWtr/bc1nPDUZif9bCKUkX4kc+L
	EgOiNsjjMStvdqnw7tOPj3Aclt1ndk1In/QmYfhM1g1v
X-Google-Smtp-Source: APXvYqyArBD4+sHAdaoCesfgr3u/m+l6JIXOhcMVp0EE2jb4V5Pxc6mLnNs0CTsFPLRw81yVvRAB6kt+z9sxXxwKTYc=
X-Received: by 2002:a24:7294:: with SMTP id x142mr6017702itc.26.1552302776200; 
	Mon, 11 Mar 2019 04:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <1552092251-25129-1-git-send-email-bassem.boubaker@actia.fr>
In-Reply-To: <1552092251-25129-1-git-send-email-bassem.boubaker@actia.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2019 11:12:45 +0000
Message-ID: <CAJTo0Lb3JJeBfD=OLBSUFmka33Fcx+KXUNR-e1tP+zt9gQxz2w@mail.gmail.com>
To: BOUBAKER Bassem <bassem.boubaker@actia.fr>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Mon, 11 Mar 2019 11:12:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Mar 2019 at 10:55, BOUBAKER Bassem via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
> +inherit autotools

Upstream isn't autotools, so don't inherit autotools.

Ross

