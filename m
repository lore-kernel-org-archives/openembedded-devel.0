Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MH0eG-0007Yo-As
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:18:16 +0200
Received: by gxk2 with SMTP id 2so737434gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 12:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BdB2vumeS1kBWvBXfDHKo7ounG7DtwCYlL8qXlY+eJI=;
	b=GTs3+l5FRhoNwYidbeJp9EU9SmZXY/HszUl1brzsdG/T+2eaG+t7zRbE/VxWEaVMLw
	HC3HO4EEXC71tb2F3TzwUjd88m7w65zR0aO9ogMu0wYKA5naiLLYYNSy/U2FUWuukHei
	a5MWaV68f0gc1QLleyISYlA+eUzhLVmTIV8Ns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cbCjue2UCFxn7imp/kLytiznI+in15aemCKSUL91nGKZHG+iGEQAulDZe/mYagkUft
	eTvt2LwseABqvxLDXPErGw+UAkgypkbGLIxgipIQQ96dNGWyrACLyT0YkA9OzgL0f/uC
	YA2iJDdZoSn7x3jGTN3nFxDVkQ8q+/ccQIdZU=
MIME-Version: 1.0
Received: by 10.231.10.136 with SMTP id p8mr182372ibp.14.1245265666776; Wed, 
	17 Jun 2009 12:07:46 -0700 (PDT)
In-Reply-To: <1245258640-1623-1-git-send-email-clarson@mvista.com>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
Date: Wed, 17 Jun 2009 21:07:46 +0200
Message-ID: <c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 19:18:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Wed, Jun 17, 2009 at 7:10 PM, Chris Larson<clarson@mvista.com> wrote:
> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
>
+1 for the idea, but "something other than the empty string" is a very
bad user interface.


If users see:

IMAGE_KEEPROOTFS = "1"

in most cases they'll do:

IMAGE_KEEPROOTFS = "0"

instead of

#IMAGE_KEEPROOTFS = "1"


Do we have more of these?? It never occured to me before.

Regards
-- 
Leon


