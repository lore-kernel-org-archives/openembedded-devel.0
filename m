Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RTYws-0000qV-NX
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 14:02:43 +0100
Received: by ggnh4 with SMTP id h4so2543652ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 04:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nal3rw84ReZhZsIyGuT/U1T/FtGq5QvnfLOpAkexi1k=;
	b=ZsAjc9vi18RnyOBWPy8TRiwxht7v0ADkGVaYpMOBD0ysRIWntDwKE8ocwO/CBTHQxy
	P2y7iYjfLYlGmgF8qbrxoaZDo9Bq0J7CisC9IQ97Uos4FAns7/m8soKAMTb4FtnrsGe6
	jmP+I2Amy4PRUb+CgNCT0B8lYjhSZt2YOi6RE=
MIME-Version: 1.0
Received: by 10.101.118.20 with SMTP id v20mr210724anm.86.1322139368252; Thu,
	24 Nov 2011 04:56:08 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Thu, 24 Nov 2011 04:56:08 -0800 (PST)
In-Reply-To: <11302548.rhDq0zLurQ@helios>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
	<CAAQYJAv=z6msRfaR3bj7PfWrm=tuv8opBPjfD9nkpSrwAUgRbQ@mail.gmail.com>
	<CAAQYJAvgLfieUK43nQOKL+H6omoXjuASrwPP4GZFc66bL+WMrg@mail.gmail.com>
	<11302548.rhDq0zLurQ@helios>
Date: Thu, 24 Nov 2011 13:56:08 +0100
Message-ID: <CAAQYJAskVdWfKW+g=npyyop73EwSdEFynPFYLXG=-GD6RkUGCQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld 4/6] linux-kexecboot: don't disable DEBUG, PRINTK, BUG with CMDLINE_DEBUG not just loglevel=3
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
X-List-Received-Date: Thu, 24 Nov 2011 13:02:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 1:42 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 24 November 2011 13:38:53 Andrea Adami wrote:
>> On Thu, Nov 24, 2011 at 12:01 PM, Andrea Adami <andrea.adami@gmail.com>
>> wrote:
>> > The weak point is EXTRA_IMAGE_FEATURES =3D "debug-tweaks" , default in
>> > local.conf.
>> Hm.. and what about using =A0"tools-debug" instead?
>
> I realise we've already done it here and elsewhere (e.g. dropbear) but I'=
m not
> hugely keen on configuration of individual recipes being dependent on
> IMAGE_FEATURES - it's not supposed to be allowed AFAIK.
>

Well, in fact you are right and I rememebr your initial perplexity.

Oe-classic had CMDLINE_DEBUG ?=3D '${@base_conditional("DISTRO_TYPE",
"release", "loglevel=3D3", "debug", d)}'
but now DISTRO_TYPE has gone (not in grep results).


Andrea



> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


