Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9Qzn-0002vg-Ea
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 22:16:55 +0100
Received: by wf-out-1314.google.com with SMTP id 29so966733wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 13:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GvW/SrZbNiTJjpTwmVoYy0wiMoDt53YczNdMIES8BNk=;
	b=WNc0ZhvzOceVEYwAGb5quoTlOdlStDGUQqgFEQg8C2kkUq2chVPcsb9xs7JRjv95EM
	QAt205Az8aUqZ2kjuPbhBIvrenLGm4byUnbKuNGHpF7uExsG9Wx2ruutL4TMLYCRyH3d
	WBcQEHQyOeEhzwv7DJD6BySG8dgHXBU/tXhw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gb5L265QLVKBeayoKggnMyVtlqayPxNdkk4R95lgfUIMXR1AjRs4fj3nY6zP9H/RYZ
	fIYtCgI2GFYVm4ljm1tguaQUL6QRv85heGp/i8PRVbXDAUvy/soz/n3npDY6mlvprRvb
	mFXXE9ZyMWqRkgdoA5n8WV0+SUbxeYR8e9C10=
Received: by 10.142.172.12 with SMTP id u12mr1119082wfe.248.1228684386074;
	Sun, 07 Dec 2008 13:13:06 -0800 (PST)
Received: from localhost (adsl-71-146-4-209.dsl.pltn13.sbcglobal.net
	[71.146.4.209])
	by mx.google.com with ESMTPS id 22sm7083607wfd.33.2008.12.07.13.13.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Dec 2008 13:13:05 -0800 (PST)
Date: Sun, 7 Dec 2008 13:13:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081207211304.GB4642@gmail.com>
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>
	<20081202174141.GB16628@smtp.west.cox.net>
	<1228250322.5456.70.camel@dax.rpnet.com>
	<20081202212155.GG16628@smtp.west.cox.net>
	<20081206214525.GJ16628@smtp.west.cox.net>
	<20081207193340.GC15204@smtp.west.cox.net>
	<ghha1f$ugd$1@ger.gmane.org>
	<20081207201118.GD15204@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20081207201118.GD15204@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Sun, 07 Dec 2008 21:16:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/12/08 13:11), Tom Rini wrote:
> On Sun, Dec 07, 2008 at 09:00:47PM +0100, Koen Kooi wrote:
> > On 07-12-08 20:33, Tom Rini wrote:
> >
> >> As an aside, gcc-cross-sdk on arm(v6 only?) is blowing up in fortran,
> >> but I've got a git bisect narrowing that down now (30 revs left).
> >
> > gcc-cross-sdk picks the wrong patch (from files/gfortran.patch) instead  
> > of the correct one from gcc-4.2.4/gfortran.patch. gcc-cross *does* pick  
> > the right patch.
> 
> For gcc-4.2.4.inc would it be OK to rename gfortran.patch to
> gfortran-4.2.4.patch and fix this problem?

The patch under files is incorrect in one place and everywhere else its
similar to gcc 4.2.4 patch. I would suggest to replace the one under
files with the one from gcc-4.2.4 folder and delete the gcc-4.2.4 one.
This patch applied to gcc all 4.x so make sure that it applies to all of
them


Thx

-Khem

> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


