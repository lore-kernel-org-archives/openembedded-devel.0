Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MrF23-0005NF-46
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Sep 2009 19:56:38 +0200
Received: by fxm3 with SMTP id 3so2641215fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2009 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=R3++w1Ki7w5RTf6/p/xJrTjUaF4niVUbKN76d07lRIo=;
	b=eNxln96m8ohRf9sUX4w3iXAnhVsyN0D8KQm6cJ+xR2nJvFs4Fh1Mrl4X+uXuzuWkGn
	d2l1bLNFrchkUHK3r4mLbZBheteA5+nFwUNM3WZk80x+KeEa3zohIp3d1rDElm6M7Wir
	9pmDbKmNa1v+WgogDWrMfknfoyJN0Y93B+fgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=uNCuByacDjSk/bzKkJ2w/4fwh8FnXJe0ZHsvsGC1ywkXcO6Ds3cwKFTuEoCW9JgAwt
	ezdD/EZdfM+U8aV6HOX6+Q/XzS98apE+OAq+CrzMAR2Dbcm3LrvmOSLdB4TMOUiRVlBK
	eRLIjLxku6S7eB+Zx+0EXsBbNoPFmaC0vNGg0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.196 with SMTP id u4mr32244hbu.114.1253901354760; Fri, 
	25 Sep 2009 10:55:54 -0700 (PDT)
In-Reply-To: <1253797865.5877.110.camel@localhost>
References: <1253797865.5877.110.camel@localhost>
Date: Fri, 25 Sep 2009 14:55:54 -0300
X-Google-Sender-Auth: 73dce7690f66b76e
Message-ID: <be7a9f3d0909251055y7eb9f35dr441e571397aff8de@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] remove mdev recipe(already in busybox)
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
X-List-Received-Date: Fri, 25 Sep 2009 17:56:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

+1

Please go ahead and drop it :-)

On Thu, Sep 24, 2009 at 10:11 AM, GNUtoo <GNUtoo@no-log.org> wrote:
> hi, Tom Rin said:
> "To follow up to myself, the 'mdev' package should just go away really.
> This particular bug is because 'mdev' has an empty mdev.conf while
> busybox's mdev does not, and it contains console/null/etc entries."
> in "Re: [oe] [PATCH] mdev: mdev.sh: permit serial console login and
> correct init runlevel"
> ( http://article.gmane.org/gmane.comp.handhelds.openembedded/25296 )
> So should we remove mdev recipe and use busybox's mdev instead...if so
> all the recipe/distro that were using it must be updated.
> for intance the micro-base-image use it:
> IMAGE_DEV_MANAGER = "mdev"
> that should be replaced by:
> IMAGE_DEV_MANAGER = "busybox-mdev"
> A quick grep for IMAGE_DEV_MANAGER in the dev branch shows that only the
> micro-base-image use it...
>
> Does someone have an objection(for the mdev recipe removal)?
>
> By the way i sent that mail because there could have things that I
> didn't thought,people that could depend on .dev but use external
> recipes(I was thinking of thing like MokoMakefiles),or issues with other
> branches,But also because I was told to do so.
>
> Denis.
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


