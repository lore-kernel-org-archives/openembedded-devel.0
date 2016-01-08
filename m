Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE74731D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:50:16 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id y8so7718093igw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 00:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IOR7mcExwNM8QmOFd3xWvSdN+RMv8tb7khz2TbF4vJM=;
	b=AtJiR5WGAhXJV1EBDxCjp9bPCusykTcVZ0w+asw6rxqPt3xx6zwVqo4LOcQiqkL078
	sZm+oRboXPgmvh6J0CeAghvH5tzXzEBnEGEpZS/KVbcH8nkR1GL9X3A7Hrh2tQxv5Iac
	JjRZTWWG4+Imkukf1SB9HUjW80h642PjngkZFYf3t3B0vx22rwwHfQ04gqF+NfuIPPZg
	OFXvbEz/F4Fp3oZt4PkzX7ypaXCSRUQAK/kgN8qCqY59i97tJIcJbQ12pDk9+n1Q3dLe
	zzZ6NvCNlhSzrvy/o8Ur51EqYNsrp7jAxy2J8YVKPQHWQWfG8Q0WBKseV3QExwqId7Jy
	aEcQ==
MIME-Version: 1.0
X-Received: by 10.50.30.69 with SMTP id q5mr21087803igh.78.1452243017224; Fri,
	08 Jan 2016 00:50:17 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 8 Jan 2016 00:50:17 -0800 (PST)
In-Reply-To: <1452166825-29098-2-git-send-email-schnitzeltony@googlemail.com>
References: <1452166825-29098-1-git-send-email-schnitzeltony@googlemail.com>
	<1452166825-29098-2-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 8 Jan 2016 09:50:17 +0100
Message-ID: <CALbNGRSd70VyQwhdNa=9ammOpV50w48HQQ7_7zSb2KnKJcAqCA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gvfs: update to 1.24.2 to make access to windows shares work again
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
X-List-Received-Date: Fri, 08 Jan 2016 08:50:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2016 at 12:40 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * Our very old and heavily patched version was broken for windows shares =
by
>   the update of samba to 4.x
> * Update to latest gvfs version (1.26.2 currently) is not possible due to
>   | configure: error: Package requirements (glib-2.0 >=3D 2.45.7 gobject-=
2.0 gmodule-no-export-2.0 gio-unix-2.0 gio-2.0) were not met:
>   |
>   | Requested 'glib-2.0 >=3D 2.45.7' but version of GLib is 2.44.1
> * Licence checksum changed by updating the address of the FSF [1]
> * Backported patches were removed
> * obexftp support was removed in [2]
> * some more PACKAGECONFIGs disabled by default (all set -except 'cdda'- w=
as build tested)
>
> [1] https://git.gnome.org/browse/gvfs/commit/?id=3D1e9c89eafaac6b3a759115=
df9981526fe9083461
> [2] https://git.gnome.org/browse/gvfs/commit/?id=3D606ef241fb8677528bd5d5=
526854658f0f298a2c
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Sorry but this one causes issues I have not seen on my first tests
(mounting USB sticks is broken). Please ignore - a reworked version is
prepared.

Andreas

