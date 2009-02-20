Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LaRpd-0006ku-0h
	for openembedded-devel@openembedded.org; Fri, 20 Feb 2009 10:38:05 +0100
Received: (qmail 27297 invoked by uid 813007); 20 Feb 2009 09:35:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Feb 2009 09:35:38 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2009 10:35:26 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <1235075079.6859.211.camel@alap>
In-Reply-To: <1235075079.6859.211.camel@alap>
MIME-Version: 1.0
Message-Id: <200902201035.30522.openembedded@haerwu.biz>
Subject: Re: [PATCH] add paroli autostart
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
X-List-Received-Date: Fri, 20 Feb 2009 09:38:05 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 19 of February 2009 21:24:39 Angus Ainslie wrote:

>  packages/images/fso-paroli-image.bb |   12 +++++++++---
>  1 files changed, 9 insertions(+), 3 deletions(-)

> -# no extra apps
> -GTK_INSTALL = ""
> +# not many extra apps
> +GTK_INSTALL = " \
> +   vala-terminal \
> +"

Was this block planned to be in this commit too? Looks like got 
committed by mistake.

> +  paroli-autostart \

As this looks like what that commit had to do (at least description says 
it).

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




