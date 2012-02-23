Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0Xxc-0007H1-UD
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:39:49 +0100
Received: by daln34 with SMTP id n34so1060308dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:31:26 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.135.34 as permitted sender) client-ip=10.68.135.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.135.34 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.135.34])
	by 10.68.135.34 with SMTP id pp2mr2195512pbb.106.1330000286211
	(num_hops = 1); Thu, 23 Feb 2012 04:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TgpZ8B+Y/OMHjPUBalvWnIVcMsgwIkxiYFuqIEh1Tt8=;
	b=bbJbdKCK5uDrJPx/N8jUra2TdHEC5lzmRGWa25FzHleHmgtyxA2r/f5Q+FJmvgtxeb
	s9rLsnztKS/vQSa1TMh4mKOVJptzShdIMYw4fZjqhvblQ+ZFDKvlwPjrbPZms58qFOPy
	J2h9ou6nX+cavs9G/XiXLR9Huvtv0RrTVE+jI=
MIME-Version: 1.0
Received: by 10.68.135.34 with SMTP id pp2mr1879991pbb.106.1330000286137; Thu,
	23 Feb 2012 04:31:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 23 Feb 2012 04:31:26 -0800 (PST)
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 23 Feb 2012 10:31:26 -0200
X-Google-Sender-Auth: 1znNLqAR_snPfNqAnBp509g_u5E
Message-ID: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe V3 00/23] systemd rework
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
X-List-Received-Date: Thu, 23 Feb 2012 12:39:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:10, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> V2 -> V3:
> (Hopefully) all suggestions and comments were incorporated =A0/ rebased

This patchset is ready for merging IMO.

Checking remaining recipes that might be change to use
${systemd_unitdir} I found:

meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
meta-oe/recipes-connectivity/cherokee/cherokee.inc
meta-oe/recipes-connectivity/gateone/gateone_git.bb
meta-oe/recipes-core/systemd/systemd-compat-units.bb
meta-oe/recipes-core/systemd/systemd-serialgetty.bb
meta-oe/recipes-core/systemd/systemd_git.bb
meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
meta-oe/recipes-graphics/slim/slim_1.3.2.bb
meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb

I dropped udev ones as I am working on them :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


