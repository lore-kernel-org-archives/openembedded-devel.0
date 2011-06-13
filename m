Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QWCB8-0007nj-0W
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 20:48:02 +0200
Received: by qwh5 with SMTP id 5so2562057qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=mUpQWW5xQkOvfTqCiITMaDh3D1RckKd34GXGbeiGSEU=;
	b=fHPQCmvp8aEXRntmhiYioQ1MW/YLKCmwv01MiDkLiZWY/hsbkr5mLZ6Zpsz/Df9j8R
	HnSLfePXIayr3RqDG8HcITq/9vhxwhyJx3xcIDXezcw3PIhMP8wdhfWPpLs+ebzhRiOX
	t6fTndCmDyb7XOagaPKobt1GZL0luGCZ5ZhkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ES5k2V2svNDQ0QTwyIXZRzyD94IMAmiOWJH32Fw1BVhXf+6IwAZTrdEynJ9w60NRgv
	x+WWf7B/z7qhrkpxQRSaZeAx2CySeeNYmQyFVAGtObkFLAnQ5+S4OKr39llVgt8ebPTQ
	BTY6u+5YWJgOZ3VSsTJYr823KGiEMyDFJVtqQ=
MIME-Version: 1.0
Received: by 10.224.210.138 with SMTP id gk10mr4294394qab.188.1307990674137;
	Mon, 13 Jun 2011 11:44:34 -0700 (PDT)
Received: by 10.229.73.206 with HTTP; Mon, 13 Jun 2011 11:44:34 -0700 (PDT)
In-Reply-To: <1307988638.4081.5.camel@mattotaupa>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
Date: Mon, 13 Jun 2011 20:44:34 +0200
Message-ID: <BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 18:48:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi, thanks for reviewing it ;)

2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>

> Please also paste the important parts of the segfault into the commit
> message.
>

I don't have the segfault right now because I've using buil enjoy with this
patch for few days since now. Basically it seems that emotion is using
autodetect gst pipe element, which in turn is using alsa.

I think it was this file/line in emotion:
emotion_gstreamer_pipeline.c:   sink =
gst_element_factory_make("autoaudiosink", "audiosink");

I'm using SHR distro.

I'll send new patch version now.

-- 
Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

