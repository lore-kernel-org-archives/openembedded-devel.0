Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHICe-00039x-IH
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 17:07:42 +0200
Received: by gxk28 with SMTP id 28so2651345gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=AKweGvC241AlHSnFzq7916K6kAo/maZoemPaDbdaLuM=;
	b=dnHBlDGs1n1Obg935v6vXRvG+g4qkoiY34Ebyy31SlCNsjJyEReoh+uvMI0zevnCBX
	EXabZ8gupnnuYewuoZiQFqBvAuAUehXyk9oDNT+F+bq0ARhHOk8oPj/Av87G9x+f+uLf
	hAF+axFH6nTf4w5P6UOhAjD+iedY1QOpMT/Nw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ACxRmAEZvD0zebBl0BdFEY7Fjflbc/GdWdK6/xFtUGANwI6+wu2RQTtqMb+ZyeEivH
	XB9gvP8l3qKlTFGNvsAT9cxlJ9d2nfadf0/RaCCRnb3HNMG4qSPieC55extk1HtXEj6a
	iBzPzbr/II9cPU5i6FQaikBR4sE8XE2KCfgVs=
Received: by 10.229.181.6 with SMTP id bw6mr1887368qcb.164.1274886199661; Wed, 
	26 May 2010 08:03:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.215.15 with HTTP; Wed, 26 May 2010 08:02:58 -0700 (PDT)
In-Reply-To: <1274871893-30846-1-git-send-email-raj.khem@gmail.com>
References: <1274871893-30846-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 26 May 2010 08:02:58 -0700
X-Google-Sender-Auth: iPqlslNWROqyQQq9rED32e3VLas
Message-ID: <AANLkTimvffl_KfMdbYgcaFTrsd5J6h66mLMju6Wdy3a9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] shadow.inc: Append serial devices mentioned in SERIAL_CONSOLE into /etc/securetty
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
X-List-Received-Date: Wed, 26 May 2010 15:07:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 26, 2010 at 4:04 AM, Khem Raj <raj.khem@gmail.com> wrote:

> * Some serial dev nodes are not part of /etc/securetty. So either
>  we can add them manually or deduce from SERIAL_CONSOLE. this does
>  the later. Tested on qemuarm which used ttyAMA0 for console and it
>  not listed in the securetty list. This authorizes root login on
>  the give named console.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Nicely done, that looks quite useful for devices with unusual tty names for
their serial ports.

Acked-by: Chris Larson <clarson@kergoth.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

