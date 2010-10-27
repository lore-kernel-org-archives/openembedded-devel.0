Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PBEAA-0008MV-Cr
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 00:08:07 +0200
Received: by fxm3 with SMTP id 3so1292511fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 15:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=aQZqg9mQ2WLJbe3V80TGrkcvI4Txr0EMVGiUYS0W3+4=;
	b=Wy2iJMRBGLfmu7xB3lA4trbSqv5sLREkSXYQClr7izP2/fqB+m6hCI/0vmfoyvVjeP
	/dmQ7PM8K4M87eLCIWPNQNp+lB15NxGMKF0j+OB4gWD3K1zhyDSDKgrUS3+JzHnR/dGO
	UE4XJBT3K5uCXeJwVjIZbHGE1rvSvPXxv/n+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=a9D+DpJ3+tHN3dwApaIZebrmhGx2eNR7T2MDINGClO71dcHTQvaQT7glWYy1q2bD7B
	foxiynnDoykdec0Ku4dvIx2gl7up+Sdnz+UbV+uAkWEgbe4G9DccsODI1NQ4kJ36fbH8
	AVnJSgPpkbzTeEzyuPw5oyjerj68i4WJX7HuQ=
Received: by 10.223.86.194 with SMTP id t2mr2994182fal.40.1288217242499; Wed,
	27 Oct 2010 15:07:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.201 with HTTP; Wed, 27 Oct 2010 15:07:02 -0700 (PDT)
In-Reply-To: <AANLkTinY_pXnaDBEnV6abcmgcjN7LT5vx22UCsPqeRiS@mail.gmail.com>
References: <AANLkTinY_pXnaDBEnV6abcmgcjN7LT5vx22UCsPqeRiS@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 27 Oct 2010 16:07:02 -0600
Message-ID: <AANLkTikDZiP1AveQb7SXSNW4tEgkmo_p14i6wVVwmeLO@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: netpbm fails - "No file to patch"
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
X-List-Received-Date: Wed, 27 Oct 2010 22:08:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

The reason the patch doesn't apply is just a whitespace issue

my quickfix was to edit the .bb to not include the patch and then uncomment
the line that the patch was supposed to uncomment by hand.

bitbake -c configure netpbm
vim ./tmp/work/arm*/netpbm/netpbm*/netpbm.c
# uncomment TRY(jpeg)
bitbake netpbm

AJ ONeal


On Wed, Oct 27, 2010 at 2:30 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> Applying patch ppmtojpeg.patch
> can't find file to patch at input line 5
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |# This patch makes the /usr/bin/ppmtojpeg work on OE.
> |
> |--- netpbm-10.28/netpbm.c.orig 2005-08-04 13:20:15.665273549 -0700
> |+++ netpbm-10.28/netpbm.c      2005-08-04 13:21:09.288647855 -0700
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> Patch ppmtojpeg.patch does not apply (enforce with -f)
> ERROR: Task 1
> (/mnt/local/overo-coolaj86/org.openembedded.dev/recipes/netpbm/
> netpbm_10.28.bb, do_patch) failed
>
>
> AJ ONeal
>
>

