Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ro5MB-0004FG-IM
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 04:41:39 +0100
Received: by lags15 with SMTP id s15so73844lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=YqKOZ3sZ6Ekg+dMsPb01+L7wnV7g1NcUEfJ8dco4TSg=;
	b=fWHWC8hftCE3MOwBi+sT1gUjtL8Ytz/aufw0XKQvLT4g+LGYXvLs8BiOMkl2Afiy4d
	2kqSLcvgqHM/R/fdFgerGhjv5/+oUyHS2V489Yx4LFT5aWyEJDyG3RsX7O7nU69yalD1
	67WlhAbw4EW8LRF/oEZtYh2Xs9iRT5PmjrgVE=
MIME-Version: 1.0
Received: by 10.152.135.105 with SMTP id pr9mr13845864lab.19.1327030439201;
	Thu, 19 Jan 2012 19:33:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.30.135 with HTTP; Thu, 19 Jan 2012 19:33:59 -0800 (PST)
In-Reply-To: <jfa3vv$3ks$1@dough.gmane.org>
References: <cover.1327002701.git.anders@chargestorm.se>
	<ba787e718994267f09ff11b8b4122d536175bffc.1327002701.git.anders@chargestorm.se>
	<jfa3vv$3ks$1@dough.gmane.org>
Date: Fri, 20 Jan 2012 01:33:59 -0200
X-Google-Sender-Auth: rXJTw6exIdJ6CPPri95ga_jQChI
Message-ID: <CAP9ODKoOkSrjWi27BT2Rv9v5oM37fP5fL5oLH8oDB54QJLdczg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v4 2/2] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Fri, 20 Jan 2012 03:41:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 19, 2012 at 20:03, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 19-01-12 20:53, Anders Darander schreef:
> > Let the distro define a keyboard distro feature, to conditionally
> > include kbd*. (Headless distros might not want to RRECOMMENDS kbd*).
>
> DISTRO_FEATURES is the wrong thing for that, so I'm going to NAK it.
>

What would be your suggestion for this then? I see no other alternative
then distro feature.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

