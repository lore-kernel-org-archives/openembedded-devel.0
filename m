Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nmohv-0007N2-Bv
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:33:51 +0100
Received: by fxm20 with SMTP id 20so1408941fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 05:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=CKNt+ZIVAulwZcfrB5P6F8ahZehY/e/tovl4ZB7Gy0E=;
	b=DKiE6ssd0ELJ8r+hHcidnRDHeASOV8c0Lxhwct7jpdVm3UvWqsXtwCreYwrGy9B/YX
	h5E9WpZ5n9FrMDF473FSO1adV7pHIbg38RnPnGO4aQE9DzK24XrToPrrH+Z8qVmrQ4LT
	tksSAg5tm4zr1Mk8Wb9FOaRez3onbahFh2VNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Lj4d7KNZaV6bKi1LtPeWUuULBaWzo2OkC3Muf6TPkIVE2o4aNkgaghTxI1JpULiwRm
	toQNgKASsfQatKxOVb7Wf13rDBOEyyYnsKCDcftvPFIHJplI4jLKspREitUIAnWv6J+Z
	AzO70IIqnD5XVtI6BgQlBtZi/y3Z/o6/yEM6c=
Received: by 10.87.74.5 with SMTP id b5mr49291fgl.62.1267623056037;
	Wed, 03 Mar 2010 05:30:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm3621312fxm.8.2010.03.03.05.30.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Mar 2010 05:30:52 -0800 (PST)
Date: Wed, 3 Mar 2010 14:31:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100303133122.GN3206@jama>
References: <1267622195-13602-1-git-send-email-ospite@studenti.unina.it>
	<ac9c93b11003030520k1ba50c5fp6879caa5acb36e5c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11003030520k1ba50c5fp6879caa5acb36e5c@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Fix a typo in required_utilities.
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
X-List-Received-Date: Wed, 03 Mar 2010 13:33:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 03, 2010 at 02:20:52PM +0100, Frans Meulenbroeks wrote:
> 2010/3/3 Antonio Ospite <ospite@studenti.unina.it>:
> > A missing space in required_utilities makes OE ask to install md5sumsqemu.
> > Prepend the needed whitespace when appending to required_utilities.
> >
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > ---
> >  classes/sanity.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> > index a78e8ed..ad5389e 100644
> > --- a/classes/sanity.bbclass
> > +++ b/classes/sanity.bbclass
> > @@ -95,7 +95,7 @@ def check_sanity(e):
> >                                missing = missing + "gcc-3.x (needed for qemu-native),"
> >
> >                if "qemu-native" in assume_provided:
> > -                       required_utilities += "qemu"
> > +                       required_utilities += " qemu"
> >
> >                try:
> >                        if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> > --
> > 1.7.0
> >
> >
> 
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

What about that qemu-arm -> qemu change?
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04276.html

Should I build unused qemu to make it with ASSUME_PROVIDED happy?

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


