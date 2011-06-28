Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QbUZH-0004GD-B4
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 11:26:51 +0200
Received: by vxa37 with SMTP id 37so4024vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 02:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pJ53po98cC+gvuRoBa2RLuvmsPC/a4gLML3+lq8ZA3s=;
	b=mM1ToXxmDIRk2YzmSx/iBlonrJa6U0HrGT4SjFAUB3TBBHBWA5tiF1ZBdjm1KzUEO8
	v/nF+H9oEitzYHeBPpyo40GMpCt4mdicdYTooN03MdSW3GG4OkAcPtSGby84QqHV05tm
	K8I2Ic5oXXYzPDNDClGy/LQX+I2dyqK+vR5pk=
MIME-Version: 1.0
Received: by 10.52.176.106 with SMTP id ch10mr9760932vdc.155.1309252985769;
	Tue, 28 Jun 2011 02:23:05 -0700 (PDT)
Received: by 10.52.108.33 with HTTP; Tue, 28 Jun 2011 02:23:05 -0700 (PDT)
In-Reply-To: <4E09926B.2000406@nedap.com>
References: <4E09926B.2000406@nedap.com>
Date: Tue, 28 Jun 2011 11:23:05 +0200
Message-ID: <BANLkTikvCycdv2g58Z_m3_14yj=nA9-+xg@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to change system files
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
X-List-Received-Date: Tue, 28 Jun 2011 09:26:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 28, 2011 at 10:35, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> What is the best way to change files like /etc/network/interfaces?
> I have about 5 files or so that already are supplied by (default) packages;
> they are not in 1 package.
> I would like to have them in one package that I own so that I can easily
> update them, but this is not necessary.
> Is overlays the way to go?

I'm handling this by using .bbappend's in a local layer.
This won't give you one package, rather the ability to replace/add files (e.g.
/etc/network/interfaces) in the standard packages.

Regards,
Anders


