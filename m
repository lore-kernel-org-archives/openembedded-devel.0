Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHe6x-0006wk-5o
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 16:31:04 +0200
Received: by qyk33 with SMTP id 33so45239qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=0FyDiiVekEpIXzryOIJ49Rrb1b9TMasMEZs4ZMg6CAU=;
	b=i4FBoiAIsHDPwSUpU2QBVxdhq+6KULBy0JuOiAF1AKkelazSB6RnFg/qTGVy0Afwuy
	bR5aC1tyExDoXRP2s+fIVKZ3O3yfyUMLokhE/SObMF5umCXYxc6sCYPABdDFYZ0zvYjB
	UF2/XQdf6YxNNOhBZpG8x5ypg6fhYC0rmBnTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=oenqt+GVJkmDxokfh3jCXgg923IClSOe8gBMBuXgK3q00EWOuB4pGpcYlqd4BU8H65
	04jraVJfFfk0ojWiJU8Yv/5t4/JhUV69qJQ7DdgdFjy4HeOJQRDc6lW8vidv+MY1JKqk
	oaK0RRhTsiJH/O+R2euPOuY5acjqtVWPSjcCQ=
Received: by 10.224.101.75 with SMTP id b11mr5658486qao.38.1274970408898; Thu, 
	27 May 2010 07:26:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Thu, 27 May 2010 07:26:27 -0700 (PDT)
In-Reply-To: <5632cd85522c89e5cf788422f28191cbc04bfe96.1274963939.git.enrico.scholz@sigma-chemnitz.de>
References: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
	<5632cd85522c89e5cf788422f28191cbc04bfe96.1274963939.git.enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 May 2010 07:26:27 -0700
X-Google-Sender-Auth: 22QBPxfwIXImaWuuM1rACdv3bEE
Message-ID: <AANLkTimqPdtn4bL4j8ToqL-DlK4sD8CH24scoBOP7T6L@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 2/3] base.bbclass: fixed 'apply=no' behavior
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
X-List-Received-Date: Thu, 27 May 2010 14:31:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 27, 2010 at 5:41 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> After the recent change to autodetect patchfiles in SRC_URI's, files
> with 'apply=no' were not copied to workdir anymore.  This broke e.g.
> dropbear which marks a patch as 'apply=no' and applies it manually.
>
> This patch evaluates content of 'apply' parameter and copies files to
> workdir when it is not a patch or the parameter is false.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Acked-by: Chris Larson <clarson@kergoth.com>

Thanks for the fix, and sorry about that :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

