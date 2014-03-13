Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 28B826F7CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:57:06 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so937684qcy.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=I4Xb9ZQy6gqRjW4AwBK+KEMdOo4y7uJWAJVCRd3E35Q=;
	b=jHgytqeK1BLEf8zpbDz0e4uUg5kAxD5f0Rrwr7oRYn6yGvwaN0IcAlqvsMkhrbkwHx
	8RsKA036XDxTgFulicKf1/11/AghDMH0b6Q5bkMnODZQo5/tOqUYmaVtNEcP7c5MoS++
	3UINd0gLZhc64g1ioKOvWtXrkWUZ07TaEhVIbe9PBk7tO/YtKnCFuvYuzfQgJaZGBNeI
	0xskPnsWixiNUQBDlC19dya6VJ+TMnwEm+AyxfPFIY4QQlHFfHmwihfykZJKDoxrvT8s
	seR7g5rwbJbiPkd3B3yhBedzLbW+2DDLq5S8yCJTOWpik+RTsPK1tZqgVI+/vQiAV11Z
	Y0oQ==
X-Received: by 10.229.183.200 with SMTP id ch8mr1715306qcb.17.1394711827345;
	Thu, 13 Mar 2014 04:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.48 with HTTP; Thu, 13 Mar 2014 04:56:47 -0700 (PDT)
In-Reply-To: <532065C9.30300@pseudoterminal.org>
References: <532065C9.30300@pseudoterminal.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 13 Mar 2014 08:56:47 -0300
Message-ID: <CAMCfZKHx9PnjzqfJSXUj-ZOvG2b_PPWnAWdD6jqS+Npx3xsX8A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Using openembedded with externally built kernel
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
X-List-Received-Date: Thu, 13 Mar 2014 11:57:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 10:48 AM, Carlos Rafael Giani <dv@pseudoterminal.or=
g
> wrote:

> I have a platform with a very barebones BSP that builds and patches a 2.6
> kernel using a whole lot of shell scripts and patch files.
> Integrating this build process into a .bb file is too complicated at the
> moment.
>
> Since cross compiling all packages I need is a nightmare to do manually, =
I
> wonder if I can get OE to use the prebuilt kernel along with
> its kernel modules and headers instead of trying to build a new kernel.
> Ideally, I would just tell it where the kernel headers are, where
> the uImage is, and where the modules are. I imagine this as some kind of
> kernel .bb file setting things up to not actually build anything.
>
> My question is: is this possible? All I could find was about external
> toolchains and external kernel modules.
>

I believe that you have to wright your own recipe with custom do_compile,
do_install etc functions.



Abra=E7os,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

