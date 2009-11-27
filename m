Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NDz24-0002MY-1n
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 12:30:39 +0100
Received: by pxi13 with SMTP id 13so1022929pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 03:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=XHR/8/08JMwLVZHsSEcw3ToFtPLj38unBBhJaW5sAAs=;
	b=TzIhEtRLFxlv5UtPLwth11nnEGaY3rTnhsz4PS+AmtyjkcJB9Vs4WNNUl+J8Rgdk0r
	DoXd0My8tVi6Q4J3+ZSOy3EApWKiTxUDmlSpLyCNTQONZ8kPSTrsw/2lzKlCfsXvMxHp
	qPs5O8CYi6duQMTUlYgVmbYJaChJxBa3XPbpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Z3hF8GThw1jPnRsxx2sbgJVkspvcpDtfULI8Q6YS3gO0xonB2mQJUj7V3oRdrWpeAN
	fuRIAa0xqZ+TvXZ2IGLA9kL3Js7ZOOk7msmA3NSYeitQ/iTSF4HwNU34+v/lnZ3r2XQa
	Kx8yQa9YnjYLwP6FNKRCB42G+RU7YkJGEdthU=
MIME-Version: 1.0
Received: by 10.140.202.20 with SMTP id z20mr63359rvf.28.1259321344078; Fri, 
	27 Nov 2009 03:29:04 -0800 (PST)
In-Reply-To: <1259240398.4332.118.camel@mill.internal.reciva.com>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
	<1258973177.23826.231.camel@mill.internal.reciva.com>
	<ec1f3d400911252153n2cdcd3f5vb9bc29d3760bd623@mail.gmail.com>
	<1259240398.4332.118.camel@mill.internal.reciva.com>
Date: Fri, 27 Nov 2009 16:59:04 +0530
Message-ID: <ec1f3d400911270329r3968ccc2t675c84b387204e2e@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Fri, 27 Nov 2009 11:30:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

 I'm not exactly sure what this is all about, but I suspect that this
> should probably be getting applied only for the real gcc-cross, not for
> the -initial version.  You could try building a different version of
> gcc-cross-initial and see if you are then able to compile the CSL
> toolchain as gcc-cross.  Alternatively, adding a strategic "mkdir"
> command in the function above might clear it up as well.
>
>

Thanks. An "mkdir" took me past the problem.

-RK

