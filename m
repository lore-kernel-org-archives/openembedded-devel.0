Received: from mail-fx0-f218.google.com ([209.85.220.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NxoJb-0006wD-DR
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 23:22:08 +0200
Received: by fxm10 with SMTP id 10so1323449fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=1I57qxNdauwrmd38mho2NZZG1pGjfocziPEMbTPi4/8=;
	b=vtsqO4q/OuWlv7YBDb2imm9AkW3Re66Itck3PlnjP8jPoPUdUhJJb5MCOcmxP3poj6
	1luLoL4YYz3Uo6vTw7uCIV4hOWC2sluYoC2V5AxwHIw29NlCkrGN1Loycl3S1M/6Mul2
	ceNOD3GuCCOMoV9AHIgXdMhFYQEfVxw5LsEuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=J//+ZdVR2V0TnvssvEmoiqkT7ZuhQR2AL5WhMedmv5CxTjLxLOQW/W6Qs5TmYJ8HKM
	4DA/szDqDU8yznBSN42r5JRhbWkT/2ULeqePnOCqZY6W75AGPusK4s0eqPFH+Zr6w6tO
	UNq/WUUXz/+9741zsCHB5KmFB6rEMDRBFXmSM=
Received: by 10.223.117.164 with SMTP id r36mr2478909faq.28.1270243129700;
	Fri, 02 Apr 2010 14:18:49 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm6672933fxm.1.2010.04.02.14.18.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 02 Apr 2010 14:18:49 -0700 (PDT)
Date: Fri, 2 Apr 2010 23:18:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100402211847.GK3270@jama>
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.218
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] enna: Move to own recipe folder and update to new Enna hg repository.
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
X-List-Received-Date: Fri, 02 Apr 2010 21:22:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 02, 2010 at 11:28:10AM -0700, Khem Raj wrote:
> On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > 1. Create `enna.inc`.
> > 2. Use `INC_PR`.
> > 3. Move to new repository location.
> > 4. Use `NOTQUITESRCREV` since `SRCREV` seems to get set to the one from the EFL recipes.

You can use SRCREV again after
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=82b394467d9142edf2721176244c3a7eb26ba69a

And maybe you want rev shown in PV or PR
PV = "0.4.0+hg${SRCPV}" or 
PR_append = "+hg${SRCPV}"
is quire common and should work for hg too (haven't checked)

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


