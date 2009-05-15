Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1M4z9J-0007Qh-Jh
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 17:16:39 +0200
Received: by wf-out-1314.google.com with SMTP id 25so1219232wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 08:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=swKtgOdYc+Z2xZ/CN/zNDig1ermxprtrYTOQoABgGjo=;
	b=Vqh6OCE6KqvPdnkch2Im8tj2qZD2l8zaegQXYBAOdlDn8a5FM8rEoZy1bVAK0p3UsE
	08cwyKsduTh+XMfHbmstMQTDgjDa0LZDFCR2ytR/Jken+CWQy4JRD3O8tQravJuVCEKU
	MldeweYwr4TBUMi8uZsXy5ikZ+4ogjBZchGhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jbqotMXhYep8od9d7mXyZGM1QhK7gHBNJvcJCNqq/IeMvCgMtR5iPDSxtjQnNUTULD
	yPsPF36hnNdFUe/6w+umbHWoX8hFtkrvqZZXWaIaZ/PTFtt9KNOGFfNrU8f/ef+VVOHZ
	1VI0U6+C/Xq631tD7Om3MO8SIEuCaxvy1b1v4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.221.11 with SMTP id t11mr1063708wfg.115.1242400179911; 
	Fri, 15 May 2009 08:09:39 -0700 (PDT)
In-Reply-To: <d1b08f940905150033r570ee6d7ta83eb4948b8e2d5a@mail.gmail.com>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
	<d1b08f940905150033r570ee6d7ta83eb4948b8e2d5a@mail.gmail.com>
Date: Fri, 15 May 2009 08:09:39 -0700
X-Google-Sender-Auth: 9ace225b687c1b16
Message-ID: <b6ebd0a50905150809y36426e69u96ac070414b96029@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by default.
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
X-List-Received-Date: Fri, 15 May 2009 15:16:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, May 15, 2009 at 12:33 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>How do we
>>propose to roll out this change?
>
> What about adding a -u (update) option? This would just give old behaviour.

I don't understand what you'd want -u to do?  This patch doesn't
modify bitbake, so it doesn't mess with commandline arguments at all.
Are you arguing for a variable which could be set to disable this
functionality?  That would seem like a reasonable thing to do, though
I doubt anyone would actually want to disable it, once they get used
to it.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


