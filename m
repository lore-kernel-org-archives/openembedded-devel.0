Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4O48-00035K-GM
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 03:17:38 +0200
Received: by pwj1 with SMTP id 1so469717pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 18:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ww4K0sBG39xODOSiDTa8qv5o8QuncsvjaeErFao4Jwo=;
	b=ncHVZ0eNn/cHDeX5Ul5j7PyvdoYbRroinwt10lUHVmluCWUAIXn+qj8dlf1HHuFKKM
	1TPmiA0/I8nWVLZ/rrqAW397wP926CTy2YmZwe5ycYRoJlrxitzDRvEWBIyjJ07edZBv
	nHPxz7KGGsIngPTL6i8USB3YRzOCY0KCphZLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=WlHKGV0wu1WdnyCwKyxuzTT9U+kP7m7HTFYtKce7p3dgl6IhN3dCoT/gZRqMnSBkZv
	AZQZkeM+U+7tW7e3UVYPvtRwh3d3HrqCpdMBdcHdjLTJN710n58L8jQCMHzmZxMV3m20
	dZOqbMO0tXDS9s4Z1rzJRWSk+Cfa4piKtEdKo=
Received: by 10.142.217.18 with SMTP id p18mr2667592wfg.341.1286587032021;
	Fri, 08 Oct 2010 18:17:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.154.19 with HTTP; Fri, 8 Oct 2010 18:16:51 -0700 (PDT)
In-Reply-To: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 8 Oct 2010 18:16:51 -0700
X-Google-Sender-Auth: pRL7lCEuw3LaM2-i7A5InOvenkU
Message-ID: <AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
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
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Sat, 09 Oct 2010 01:17:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 8, 2010 at 6:34 AM, Michael Smith <msmith@cbnco.com> wrote:

> Use shutil.copytree() to copy D ("image") to PKGD ("package"). The
> previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

