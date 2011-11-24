Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTdQQ-0005W2-8S
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 18:49:30 +0100
Received: by iahk25 with SMTP id k25so3291791iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YQgDPwhRApYuYu9YKG0txjwFEDp/baEfTf3PGLAOnTI=;
	b=k1fy1fi5qvO3yZY4tNH0dHtBqT3swPdC/9cXWYL+A2H0mt0obUtHuJqFCEAxsmvqMg
	tR+h1FpCv+1Lo24Kg+hH7V/r46CBKl5HXep/Cr5azSAiw5eSI0ZXx3/BHTX2xJFZNdmx
	akOyz4Fk5uGCfc+Lim+Lm+Zkr9Q+PVD2ol7Vs=
Received: by 10.42.176.8 with SMTP id bc8mr1978878icb.12.1322156576143;
	Thu, 24 Nov 2011 09:42:56 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm89664300ibv.9.2011.11.24.09.42.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 09:42:54 -0800 (PST)
Date: Thu, 24 Nov 2011 09:49:36 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Mr Dash Four <mr.dash.four@googlemail.com>
Message-ID: <20111124174936.GA28767@sakrah.homelinux.org>
Mail-Followup-To: Mr Dash Four <mr.dash.four@googlemail.com>,
	openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4ECE5422.3070504@googlemail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Thu, 24 Nov 2011 17:49:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/11/11 14:26), Mr Dash Four wrote:
> 
> >Any ideas why OE can't find my ppl_c libs?
> Further to my previous post, the gcc prerequisites are clearly
> stated here -> http://gcc.gnu.org/install/prerequisites.html. Both
> PPL and CLooG are in that list. I have just looked at my OE source
> directory and I could see that neither of these packages have been
> downloaded during the OE build. These are not present in the gcc svn
> tree either.

its detected at configure time if not found then GCC is not built with Graphite
loop optimizations

> 
> Is it possible that the OE build might have missed them and that is
> why it fails? I know that there are two ways to include them for the
> gcc build - either as a subdirectory to the main tree (libppl/ and
> libcloog/) in which case gcc builds them "automatically" or build
> them separately as static libs and then point to these during the
> actual gcc build.
> 
> Am I missing something here or is this a bug?
I think the fact that you have ppl/cloog installed its trying to use it
general distros dont install them by default and hence more often gcc
with OE is build without them.

what we could have done in OE is disable ppl/cloog exlicitly in
configure

-- 
-Khem


