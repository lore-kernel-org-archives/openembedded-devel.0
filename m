Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 74D186BE4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:15:59 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so856120pbc.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=aAFJa1ogx1isRcSOJoc5kD1P7fBhdWIUY/8rrMjHIts=;
	b=IjdiwiMxWryhVi6w2j6CNOgUh1tPu9XB1ETNgfc0ZV0Ye6OuLhuw4EnyyB/BAJgxC8
	PinrUoK8A8rNQZ8/1O1cCa0Upg9tMEROkHnYzVNjzyzM3RjxrJsVoKr00t3ZDg532f48
	3CcfpKESwiFiXh8N9p7AjIaN+G5wRJKdJnEsykDb79IgNoYVn57hCYTpOf0ocB2nKg+a
	T6lCNEfoGH2NchofnlzTHxkIh4PLM8UlNbfvSILoHtG+L/eV0KufEjUjiBcDM6kg7c+f
	tDJLvTHgBNwAVNWFnP7W3CqpKjlG1DF1XJKYHyd1p9mw9OT682VDVPg0VdoCYSEJ8M6g
	Az/Q==
X-Received: by 10.66.171.77 with SMTP id as13mr6056220pac.170.1377803760359;
	Thu, 29 Aug 2013 12:16:00 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id wr9sm39587546pbc.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 12:15:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CADkTA4NWhz3rmAqH=yB_5H4V4f11w4qZdYUTOG73SNLyv6R-=A@mail.gmail.com>
Date: Thu, 29 Aug 2013 23:15:51 +0400
Message-Id: <1CD7EF41-C972-4088-B6CD-21975EEBB93B@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<CADkTA4NWhz3rmAqH=yB_5H4V4f11w4qZdYUTOG73SNLyv6R-=A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [oe-core] QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 19:16:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

HI Bruce,

On Aug 29, 2013, at 10:58 PM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:

> I have a vexpress A15 that works here as well, but I wouldn't mind =
comparing
> configs. If you send it along, I'd have a look.

Does this mean you've got vexpress-a9 and vexpress-a15, but you've never =
intentionally
published or made these qemu configurations available, so that WindRiver =
has a commercial
advantage when it comes to machine emulation for these machine =
architectures?

I can't but help think of the discussions that we had over the meta-zynq =
layer, where
the meta-zynq layer was not maintained, and WindRiver never released any =
of the
updates to meta-zynq because of some "issues".=20

At that time, you were pushing for linux-yocto and LTSI, and fast =
forward 1 year or more
and the meta-zynq layer is still not updated or maintained, and it's =
only recently that
Xilinx themselves added support to their meta-xilinx layer for =
linux-yocto.

I've also observed that you're the only one maintaining linux-yocto!!

So, what I'm trying to get at it, it doesn't really help any one in the =
open source
community if work that's useful for other is withheld for WindRiver =
gaining a commercial
advantage (meta-zynq & xilinx case in point) and (versatile-a9 and =
versatile-a15)
in point, especially when you're the sole maintainer for the linux-yocto =
kernel, which
happened to mentioned qemuarma9 machine support.

I mean either you don't publish anything that Wind River chooses to keep =
proprietary
or support the machine configurations defined in the linux-yocto meta =
branch.

Best regards,

Elvis Dowson



