Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF4A26025E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 21:44:07 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id o197-v6so2149387ybg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 14:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=SP8h9JgbTjqznTnzYp4xEkiiGARaRMf4RAoVDM7blbw=;
	b=fJCruAbcWN8YJrFxJ8zB1o+Og9/7y84Wew/iMhLQxGVSQ0zvmiGkiPdV6iE8wlfKz7
	fCTkFiLm9TuidxKsiiX+Q7kS7zC5pFcCN2BDNpY9HNWPFTlK8pw6AD5j1RVRIDuRg4Ng
	+qn0xe9BpQzSloD+uWIhUbl/qt2esDzuj+K+PnlMYIGGwbmJwuM87G7Wdp1Be12qMsNr
	NljsG3xUSXcwfBM++RhfRjIue9ajr5MsDh9YNnmNKnlY7VRsODvHei+GYSMe3j0RMPVv
	BSLkuVlkBCBAMB5ScWZ6725/0MXrmowegLDjKNqnsTmktqLB5UtGWZDKBNo2pK1wogSB
	DCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=SP8h9JgbTjqznTnzYp4xEkiiGARaRMf4RAoVDM7blbw=;
	b=Wj+4MxbCEZ/NpghPQz/OlIii35wAnu39urWHmD0jS5Tl+VONNY1vfh3V9foSjkDCwc
	wRVXicVtNqoS9ANskswPpf2PWZZtpk1O2OY1HiWXUuU0vNGzvKy6Z2zl+Ly5HpwVy6pJ
	o+IViVWvk6AEQ2oUmpTIZEskRb1l7i6UyvWclsSQWtLekWsCRhBqJd8aNZAFBqcl9Vzc
	UvXhRvTR4jPhcnASwMtWDSjyKhSs5xpQ3MRpsFNDMnjAJVTgAw8sP27P8KVYMMeKniPN
	U+2gc5cK7hP5yH6WyXChJbnHB84e82SwdIlNTeCPqJzfKclzqg2WG1Wiw8nfPIzcFwsD
	O3aQ==
X-Gm-Message-State: AElRT7GUoPphH1YDe56fMwlKYkxUDYI5TBLNr7XQ4+kbc7QECZOLQhAG
	9PFIeERA7PSzj/f1EdR7HayG2w8Q/MvXc5jbQw4=
X-Google-Smtp-Source: AG47ELskSGHXW+H98eaDzgnYsVnzUijghpia7igWRk0enrIaU7JmE+YqjSbi1l+j1N4QzcoPTGdbjeQkAh23XvMCaWY=
X-Received: by 2002:a25:31d5:: with SMTP id
	x204-v6mr2874730ybx.145.1521755047229; 
	Thu, 22 Mar 2018 14:44:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 14:44:06
	-0700 (PDT)
In-Reply-To: <20180322213741.29876-1-schnitzeltony@gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Mar 2018 22:44:06 +0100
Message-ID: <CALbNGRTpiqyWxrZqwevg5qpbLOLzyAWmTtWbq26n6o1k0QVEag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 1/4] networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Thu, 22 Mar 2018 21:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2018 at 10:37 PM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> This adresses the comments for recent patch which updated nm to 1.10.6 an=
d is a
> follow-up for [1].
>
> * Make gobject-introspection work by skipping creation of gobject-introsp=
ection
>   specific documentation. This fixes networkmanager-applet regression.
> * Cleanup patches: Remove current musl patches completely and re-use thos=
e
>   found in void-linux because they do look much cleaner and don't touch g=
libc
>   build. One nice side effect: In the future when nm is updated we can st=
eal
>   again and don't need to reenvent here. Usually they are much faster tha=
n we
>   are (and I know one major contibutor personally from the good old Z80 t=
imes..)
> * Fix typo in PACKAGECONFIG
>
> [1] https://patchwork.openembedded.org/patch/149244/
>
Khem: can you give these a musl test? I do not have enough time and
build resources (and am not using musl).

Andreas

