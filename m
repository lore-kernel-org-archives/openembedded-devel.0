Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6A1770BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 02:21:59 +0000 (UTC)
Received: by iow1 with SMTP id 1so69480173iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 19:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=o9k9OjnplIyXTthpAFccW4h9Jo6Xcfk7vVPLMK+CafQ=;
	b=ZNA/2exFODle0RZr7pI5hiG/gcQtbKPhmePGCUHU6DJK0jwHN6c7YDjBrhFxmQ1swY
	YFZioNl+hM/Dpk6LzSZcJE+gRM7efyxLtcI4+/iXt84CYm44PWXbp0ynqwVajKZluDn0
	56jI+/u3Cms8gF9/fi5fS9dworkrH0/Hn6NXbIWOB6jc6N7aGi4+bdgKKdF1ynrGJ9yE
	Y3D8CB/zGr6eSwMiq/itzu67Ewcseitt3QvKN43Ywl/FOCBaF74YChB5GDiElJMtWKVM
	OFD7SCic6xC5y/h5uRJMuSoi86pFqAIRAhdUliVT9CbHLTle7cB0Cz1ytdNUBYzG3xIh
	C1Og==
X-Received: by 10.107.34.149 with SMTP id i143mr16346328ioi.195.1443752520073; 
	Thu, 01 Oct 2015 19:22:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 19:21:30 -0700 (PDT)
In-Reply-To: <1443713401-8584-2-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713401-8584-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 19:21:30 -0700
Message-ID: <CAMKF1sq2WJvr7pPmU=4TM+sAarGy57aT=wr5ygc8onCj1EGeXA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 2/4] mplayer2: Blacklist, fails to build with gcc-5
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
X-List-Received-Date: Fri, 02 Oct 2015 02:22:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 8:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index b208144..2f0369a 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -153,3 +153,6 @@ do_install() {
>      install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
>      [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
>  }
> +
> +# | libmpdemux/demux_ogg.o:demux_ogg.c:function demux_ogg_read_packet: error: undefined reference to '_ilog'
> +PNBLACKLIST[mplayer2] ?= "BROKEN, fails to build with gcc-5"
> --

seems same inline problem as other package in this thread.

> 2.6.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

