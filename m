Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1M55so-0004tj-V4
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 00:28:03 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1161931rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kkPSD8uv8Cps/vD3whSVmvtAHH/RmsNuUAbI/9FADZs=;
	b=giLfFMAV+PhmLAvaiMkFunhUsPjc+uYj1IGQnexLrfbCwNLWTpFGMTszCB87uz7nsG
	JZD2QeTjawMFaMmUMZ1SwEp8jPYUlqkGv1uAHrNXeviSCNQdqEbTQ/f8rDQr9+JYRfHg
	mSjdgq2DEbKwmBxW835AXLyq0NYAdQsQl2Org=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=UxjRpv8+bJ8IP5TkksR0kgIe2JkSXGQTIS3vVzgaqp2RNeakwChi6TPFvoJagnhc+M
	w/fBCzv8HfvQXmeD7YaO/0x5pUt/5qjFa3HL1/JOtKDA0AxFkoI/sN40Zuv38wlwtcJq
	gD2Y+MDi9jfS2VYNW5gzBCURdpE0N19dqYNd0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.40.5 with SMTP id s5mr1354005wfj.19.1242426063503; Fri, 15 
	May 2009 15:21:03 -0700 (PDT)
In-Reply-To: <4A033076.1080604@cbnco.com>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
	<20090506223838.GA15339@denix.org>
	<1241678721.23982.71.camel@lenovo.internal.reciva.com>
	<4A033076.1080604@cbnco.com>
Date: Fri, 15 May 2009 15:21:03 -0700
X-Google-Sender-Auth: 8cee30ba91ba8503
Message-ID: <b6ebd0a50905151521v725c075dxabc2e2f20c51a327@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be overridden using GRUB_CONFIG_PACKAGE.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2009 22:28:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, May 7, 2009 at 12:03 PM, Michael Smith <msmith@cbnco.com> wrote:
[snip]
> My grub_0.97.bb could reference file://some.patch in its SRC_URI and bitbake
> could look in the next COLLECTION after failing to find it in the local one.
> In fact, I wouldn't even really need a bbfile in the overlay; just having
> files/menu.lst in the overlay could be enough to replace it. I guess this
> might just require some fudging to how FILESPATH is set up in base.bbclass.

This piece is covered relatively easily by manipulating FILESPATHBASE.

> Second, if a recipe could include a recipe of the same name and let bitbake
> search for it in the next COLLECTION, overlay packages could get a lot
> smaller. Say I need to add a private patch to grub -- my overlay
> grub_0.97.bb, if I had one, could just look like this:

This piece I believe I have a solution for.  I just wrote a 15 line
.inc file that when loaded in a .conf, automatically searches any
recipe's FILESPATH for an amend.inc, and if it exists, parses that in
after the recipe itself is parsed, so you can amend the recipe with
tweaks and things at the end of the parse.  So this coupled with the
aforementioned FILESPATHBASE alterations and you should be able to
supply overlay specific changes to a recipe without having to copy the
recipe itself into the overlay.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


