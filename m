Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RVKoT-0005Dg-MP
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 11:21:21 +0100
Received: by bkbzs2 with SMTP id zs2so9144807bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 02:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bte9bGxAyePvisooo17hilEGeBH6CRmeLTurJUa4X6o=;
	b=k1aMaf+cWsfgnxhLvPRCn2jkwa8rcBjSGG/U7AnzblXieVSuqT5sBIiE88eNhNk8Ri
	mh3Xo1+o4+mFq5LMY0PlPBMpZtGI/HySzJGs9LbW1Zn9Kxss/GsX+5a4TJMcg9+WJ+EI
	suw+XiSmvb5TWrFv+5o6Hz7xhw6PB65j3j+CQ=
MIME-Version: 1.0
Received: by 10.204.153.195 with SMTP id l3mr14213286bkw.132.1322561681825;
	Tue, 29 Nov 2011 02:14:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Tue, 29 Nov 2011 02:14:41 -0800 (PST)
In-Reply-To: <CACW_hTaLjh10+YEfHkvTDkLC_PNxAjG8kBJkuUVemoO8+NC-Rw@mail.gmail.com>
References: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
	<652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
	<CAMKF1sqdDTL5NshgoiGaN67GwynMZ+rWnwCRvo3+YAy4e3Tepw@mail.gmail.com>
	<CACW_hTaLjh10+YEfHkvTDkLC_PNxAjG8kBJkuUVemoO8+NC-Rw@mail.gmail.com>
Date: Tue, 29 Nov 2011 08:14:41 -0200
X-Google-Sender-Auth: q1SfJ0d0bZ2xkDR368EgsheesX8
Message-ID: <CAP9ODKpOijfCiwjRRWYodndXmYF9Cfs55ftGbtTW2pXBXBM8EA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] digitemp: fix QA issues:
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
X-List-Received-Date: Tue, 29 Nov 2011 10:21:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 29, 2011 at 05:52, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

>  Actually personally I'd say passing CFLAGS and LDFLAGS to TARGET_CC_ARCH
> is a workaround and the real solution is patching the build system to not
> to ignore those flags.


Yes; I am cooking a patch for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

