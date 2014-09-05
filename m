Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id E6B6A71422
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 10:10:31 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id id10so12024007vcb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Sep 2014 03:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=BId3UQsQmrYlHjGCyxsXe/wGfkn+Fy9lXWG46HPZjf8=;
	b=EFmlAewc+BPknNWOSKo/K9OwfgTsu9y9Mhd/uqiqTX/eqgTsIvQgFs1CUMr6iKUhA1
	0bizMwG5zeh0k/YtaO/MaBZX8lTRiQzftJIECpr80pa8Z/1PSynYrE+hgpFu0P0ei/Da
	Sz70JKJW6UeLz7RJS9vA8qO7t/f58hWk5ti4wQ9iDrvQ9GbKQKRZbpvkSpVbhblHUAub
	3OBYy5pVxiotMrRHY+ZPHot+ZyJsclhu0LEZpOgnzBkprg3Ez0tkD+mdvFq9rYI4Szoz
	UxEVc+OWnmRytd10xjMgp0VIVE/NWaeKmmNYh1D+EODLoyB+1yiBJEI5gMNDecIJsyn1
	gzwg==
X-Gm-Message-State: ALoCoQl7rjSK5HGWjQBb3Ho8ZP3L9BxCd44SIbGW4anM9jkCseQe3XDVpOal7ZYwiUvLEWJhbBoL24eUfLtygMsx2Gvu69Cd9wLoJQ9KTbnGx/ImcpKgqPhh86yYHz1/G4vuEB8wx3uHv0wjoXFmqyTXaWU1dWGfKQ==
MIME-Version: 1.0
X-Received: by 10.52.129.200 with SMTP id ny8mr7842203vdb.27.1409911832264;
	Fri, 05 Sep 2014 03:10:32 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Fri, 5 Sep 2014 03:10:32 -0700 (PDT)
In-Reply-To: <CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
Date: Fri, 5 Sep 2014 15:40:32 +0530
Message-ID: <CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Fri, 05 Sep 2014 10:10:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,
   Thanks for your reply.
I have applied the patch, now it is fetching qtwayland_git.bb but it is
giving error as shown log file in below link.

http://pastebin.com/mzqsp6Nh


On Fri, Sep 5, 2014 at 12:06 AM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> On Thu, Sep 4, 2014 at 4:10 AM, Switesh Fulpagare
> <switesh.fulpagare@mindastoneridge.com> wrote:
> > Can you please look at this post? I think it is problem with 'git://
> > qt.gitorious.org/qt/qtwayland.git
>
> I just sent a patch fixing it; please try it.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

