Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMo5p-0007SO-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:11:13 +0200
Received: by pwi2 with SMTP id 2so136248pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Bd4vz1P9WeSRmxW4d5ncuqrSS2CnzdRCX3/x/ZUQNUI=;
	b=uTObom5Iw06/QHE+S5YrAUvpHWFmxl/rH9nQ6RTqLFgaHmde5K4ooA5HET2AXjEvBd
	4qhZaciE79+DHuuD4dt6vmYRU91JMkn5rQJGqiIAGY/yrxx3TZy8bkgUBzhPdNjgjr/7
	/UnYVM6fDRzbEOY6ROI7GNxAUVW0HX1/oU7b8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=mFRKa0za49R/2I9vPLI6RBSN2Yl8To20OJXrQfGAiIwkdMS9C8seDFDgiA9tTLvqok
	RGkJhAG8Tvq8IhUawTuQHar0zB9HTIgmD/bAEnX+Hub6Kd8cjvT8PTskoC57IgOjYWfP
	c9ibMBneEK9/Ls79Zf1Zvluq6bDLFEQZ/hxjE=
Received: by 10.143.153.22 with SMTP id f22mr501349wfo.126.1276199932182; Thu, 
	10 Jun 2010 12:58:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.2 with HTTP; Thu, 10 Jun 2010 12:58:32 -0700 (PDT)
In-Reply-To: <1276112911-30633-1-git-send-email-khimov@altell.ru>
References: <1276112911-30633-1-git-send-email-khimov@altell.ru>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Jun 2010 12:58:32 -0700
X-Google-Sender-Auth: wSPv8ozHKjyyeRhWnaX2q_AREJQ
Message-ID: <AANLkTik1hm4CzuYijF3h8qH5WvITuybBmzS9QKkeW3Pz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] shadow: added new package shadow-group. Fix for build with uclibc.
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
X-List-Received-Date: Thu, 10 Jun 2010 20:11:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 9, 2010 at 12:48 PM, Roman I Khimov <khimov@altell.ru> wrote:

> From: Vladimir Sorokin <sorokin@altell.ru>
>
> shadow-group contains utilities (sg, newgrp, gpasswd) for groups
> manipulating,
> useful when you only need things not provided by busybox.
>
> Signed-off-by: Vladimir Sorokin <sorokin@altell.ru>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
>

"for i in newgrp ;" is a bit unnecessary ;) but other than that:

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

