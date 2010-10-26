Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PAg11-00070v-UM
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 11:40:24 +0200
Received: by fxm3 with SMTP id 3so4128945fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gNikHKMs1A4DCLBG/uv+odzoCXVl7R/uEv94EB4heks=;
	b=F0xc0CLpQKPg271wgkKEUzKZ9q+AmnvgHJLBVnhna7nlWL0sNkYJhMAHtniVUtsNXb
	JNZHBAbUbAOUebdvMSpDyZj54w6biGw41zr1lF/Ae8EFTRQUFDu6xe68QNtjB13hVqAL
	9EVbGVFXQPM+Zwzjm5dayyXBj8URQCD9hG09A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZN4u/j/pftEmpBp38T1Mp/0Hdf6I3mGK0Qh9OiH6CxejYww43asqrGj/wfTSSFcCrC
	+SwOOigquil6yD75qYBJD8CG5yB3GpKdbb3EHWGaFl0IQgv1atRCxCnQE8sDjwN9YGfC
	6OfWt64vnX5ug/LwNvt7TPBzM+6AWOrq4NNqU=
Received: by 10.103.251.20 with SMTP id d20mr9113592mus.105.1288085981507;
	Tue, 26 Oct 2010 02:39:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k4sm3418621faa.32.2010.10.26.02.39.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 26 Oct 2010 02:39:40 -0700 (PDT)
Date: Tue, 26 Oct 2010 11:39:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101026093926.GC3514@jama>
References: <AANLkTim-_z6a6jX3X9Zh_s-ihE-19SFFmus3U7MXVPfY@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim-_z6a6jX3X9Zh_s-ihE-19SFFmus3U7MXVPfY@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libgee introspection problem
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
X-List-Received-Date: Tue, 26 Oct 2010 09:40:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 26, 2010 at 11:16:46AM +0200, Frans Meulenbroeks wrote:
> Hi,
> 
> With the testing branch I get a problem with libgee native in
> combination with introspection.
> I'm building distro minimal, target neek (but I doubt that the latter matters)
> 
> Anyone an idea?

that should be fixed with
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=df932a2769c2f6f7195363e8eb83994846805398

but that didn't make it to DEPENDS_virtclass-native (as well as
glib-2.0), I'm checking why (reading native.bbclass looks like it 
should be there automatically).

if I don't find bug in native.bbclass I'll append it to
DEPENDS_virtclass-native too

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


