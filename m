Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OTrQ5-0000Aq-Sh
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 09:09:18 +0200
Received: by fxm12 with SMTP id 12so182789fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 00:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wMt5gMduqBC6OshSCQtVOMFRwLRoIBcb9n6GpZa4r5g=;
	b=EIo/VDw1rEsw1ZyEvMYJ+sRrE0561od0gnclVG82TGO6bSsFZ6uCrRjTvOXZmKBak1
	83N1aC5S2UcC1GyNY2x6rVoeb86dPCHHaalPbEulpYqD2neEjbzczNJAEeEdla8djNka
	+/zrft2MJkcDof2arRt5xFjrxKJgdgVgGBXvs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Y9cQrl7mCdtb2XVzSsDCQolbPlj/hzZCajebgtGraWjzxXUt2sLN37HqhklrFAQDB/
	itWV7OtlQsbHAwOsYeJNBs8SlxcHoSgBtxiQJzw4qVAGQvZsB9SsO1hx2fMAWLG32VQL
	r/HwnC7fh8tXNuw0soqR5zYZ7bb8vVDpKHJ34=
Received: by 10.223.144.79 with SMTP id y15mr6901181fau.22.1277881474492;
	Wed, 30 Jun 2010 00:04:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e10sm49822233fak.14.2010.06.30.00.04.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jun 2010 00:04:34 -0700 (PDT)
Date: Wed, 30 Jun 2010 09:03:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100630070342.GF12539@jama>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
	<1277858599-27400-3-git-send-email-joaohf@gmail.com>
	<i0epn0$ke6$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i0epn0$ke6$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] replace sdk -> nativesdk
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
X-List-Received-Date: Wed, 30 Jun 2010 07:09:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2010 at 08:54:24AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Martin and I chatted about nativesdk a bit last week and after rereading
> the email thread it seems that 'nativesdk' and 'sdk' should coexist for
> awhile, so have both in BBCLASSEXTENDS?

Just to explain why I kept only nativesdk in ie libx11 is, that old sdk
doesn't support _virtclass-sdk overrides like nativesdk does and lack of
libxcb-sdk forced me to override it for sdk in libx11.inc.

Override for _virtclass-normal would help me too, but that was IIRC also
proposed a while ago.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


