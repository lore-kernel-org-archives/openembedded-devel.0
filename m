Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OD3B2-0007ZR-8y
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 00:16:17 +0200
Received: by fxm9 with SMTP id 9so35252fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=fnlnsEryeb0Xsy5uLzTc1wpHCa84MWZhKMRJPFbo7lM=;
	b=AVla+oLdLuiErSIjz+xZMIp0njcDvVjUjq5FCpU++p3fBYJXGol2qJ+9FpmasmJSAc
	3sOwg2Y8xZM5Or3v4c4gnd/KKKxzDMGGfR2gEuXXZtIFc336OVjPGJsdVtAYMEvYZ1XZ
	79QQWw17gGn5qxAnNx9e2wTcgycWadbEiHYDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bd+B20coLrVPQMTPZRcyByYC1LISmITGTcP8p2lv5qX/QA3c4czjmcMexDxvR7ip/M
	TRvK9KIgIw13oxMoRGUdnkOBgTfx/fmnCbSN44Y0lE01RQg18zj/olrDBpz2bESOS0hp
	rgP6R8rl3x58I4j/nZrn+weXJn8osKg7sxdLg=
MIME-Version: 1.0
Received: by 10.102.14.5 with SMTP id 5mr1302362mun.33.1273875139704; Fri, 14 
	May 2010 15:12:19 -0700 (PDT)
Received: by 10.102.247.5 with HTTP; Fri, 14 May 2010 15:12:19 -0700 (PDT)
In-Reply-To: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
Date: Sat, 15 May 2010 00:12:19 +0200
Message-ID: <AANLkTimEJeVa73Mb_nRSDNwfi7JbqNACWU3ERrm1cCv2@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Fri, 14 May 2010 22:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Fri, May 14, 2010 at 7:47 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> I repeated the build of console-image and gtk+-native always fails
> using 4 threads.
> Anyone can confirm?
>
I can confirm this happens, but not always for me.

Tthus probably racy.

Regards,
-- 
Leon


