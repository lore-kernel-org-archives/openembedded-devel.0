Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjWWG-0007Tr-QV
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 14:41:12 +0100
Received: by lami14 with SMTP id i14so773299lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=u6bVo8v0ImAz4I0HYsN4rABivX3cSFb5al6SWhi78rg=;
	b=qPBqRQQ6Xnpko06qmir/t9xOqXZJcKB7ZB0/dNLPvIlNudwNuODysgG7zltbfyDaIz
	BLeQzwrZiPptdplXQhXIm/K0dmzGa+nnYQhYNOozxLNbyCh/zEeDwEGzuOg0V32Mmkux
	Wf7X1qmnlS84bwVZ36aLssSgBjMGB5g+xEjZU=
MIME-Version: 1.0
Received: by 10.152.112.42 with SMTP id in10mr3909196lab.21.1325943225416;
	Sat, 07 Jan 2012 05:33:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.48.69 with HTTP; Sat, 7 Jan 2012 05:33:45 -0800 (PST)
In-Reply-To: <CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
	<CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
	<20120107104945.GB3938@jama.jama.net>
	<CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
Date: Sat, 7 Jan 2012 11:33:45 -0200
X-Google-Sender-Auth: Rr8GWpXZkzgzWqeeIooIGfp3Vbk
Message-ID: <CAP9ODKput3-BGhexUY3Y138MGgmS4k098M1TB_R7yHAgyO52Tw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 13:41:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 7, 2012 at 11:22, Andrea Adami <andrea.adami@gmail.com> wrote:

> I try to explain again my intent:
>
> 1) we have at the moment two xserver-nodm-init, one in meta-oe and one
> in oe-core
>

Yes and we ought to sort it out and merge meta-oe improvements on oe-core
one.


> ...

3) as it is now, oe-core expects to use x11-common while in meta-oe
> there is xserver-common
>

This is the real point. Instead of changing xserver-common the right way of
fixing it is porting changes need to x11-common and drop xserver-common
from meta-oe afterwards. This will reduce the delta between oe-core and
meta-oe plus making sane defaults working out of box :-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

