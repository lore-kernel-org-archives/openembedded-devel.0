Received: from [216.239.58.187] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JpCUm-0000KV-Ju
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 03:13:00 +0200
Received: by gv-out-0910.google.com with SMTP id l14so598597gvf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2008 18:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=/3Z+fV9V16Jxb9CYUWMnmTQ2bTz0GPjvFYJWj8jA4zE=;
	b=mo5mM2bkTyy3IgpFYq9krroVmB0/dg9iT/tbKBM2ldrUEmM0bem96Sh0QAFkxTGE6scySRAcZWAECcZUNW3hsFi5Fk19rZAk9Wr0ZbLB15LruFRUzlFYNGYgbJ3gdKqNL0xw1iFUtX3z/ZgXc5z4GiC3JcgEYLPgG4XTbh7CZig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=AyAutor7dydQV3fw5zSkhq5W8OFCs7wTBWqWY8DNkvPWUUyaGmR79zTdApMCA2QER0K3pclxIfrlgcAeNeH5KTNIjK5GhmCzH5fXFQREnhjOzgkds2Abu0DjjBlQ1WOKb6cYNBXOW20YTXfCVHlMvT1BwQdU0y3MyL8j95MBwYQ=
Received: by 10.114.149.2 with SMTP id w2mr2611553wad.158.1209085965590;
	Thu, 24 Apr 2008 18:12:45 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 24 Apr 2008 18:12:45 -0700 (PDT)
Message-ID: <f96d234e0804241812le4cf88ekfb805351d61428f4@mail.gmail.com>
Date: Thu, 24 Apr 2008 21:12:45 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0804241807p41a127f7j418ae7f80d7408d3@mail.gmail.com>
MIME-Version: 1.0
References: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
	<1209079836.28694.1.camel@dax.rpnet.com>
	<f96d234e0804241807p41a127f7j418ae7f80d7408d3@mail.gmail.com>
Subject: Re: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 25 Apr 2008 01:13:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 24, 2008 at 9:07 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Thu, Apr 24, 2008 at 7:30 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>  >
>  >  On Thu, 2008-04-24 at 19:13 -0400, Cliff Brake wrote:
>  >  > This issue is that "pkg-config --variable=mapdir fontutil" returns:
>  >  >
>  >  > /usr/lib/X11/fonts/util
>  >  >
>  >  > which is correct if mapdir is used on the target system, but in this
>  >  > case mapdir is used on the host system during the build, so it really
>  >  > needs the path to staging.
>  >  >
>  >  > We can't modify font-util to put the staging path in fontutil.pc or
>  >  > insane.class complains about tmdir's in a *.pc file.
>  >  >
>  >  > What is the correct solution in this case?
>  >  >
>  >  > 1) hardcode EXTRA_OECONF with the MAPFILES_PATH (would require
>  >  > patching font packages -- bad)
>  >
>  >  If you can override from the commandline this may be an option,
>  >  particularly if all font packages accept the same option and we can use
>  >  a .inc file.
>  >
>  >  The alternative is to patch the configure.ac files so it uses something
>  >  like:
>  >
>  >  $PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=mapdir fontutil`

Is the the pkgconfig sysroot-support.patch going upstream, or is that
an OE only thing?

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


