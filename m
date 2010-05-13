Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCVqp-0001FN-Qf
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:41:12 +0200
Received: by fxm11 with SMTP id 11so1063040fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+bWVbo5NOzy6YCFVRMUfm15KxWc4MYTGCZBfFPlPQnc=;
	b=BqRGzCqm1lVK1Tw095fY8gOY8s3phofy7vJHjMKeClxJ4nih3/LFyXVQuxUg4QCJ2O
	FncXCcEx8ROdXGLyedUrriL26PQJLWwoeGewpTsfqmOlJPEZeseLYszZGZA4jWiuIl8M
	xFfY4xfzK/9DWpWsOgFkJHr2KvzWRYlMjeKYA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=a60puNfvo5M44KKJaXL/2g/MourGSHv3ovp+U2wIyIqjAsK0z+99YA2kzbFmMip1lv
	j/UGB8HrwKIcHRRpa1Kpnvp6teWryhyHQpTZIDuqykfsECL7bpo1oGsBfH7yYS6K1t2G
	UueqP8U1YfuXtRf466hQEvCmp+FU1I6zJNADw=
Received: by 10.223.46.135 with SMTP id j7mr9829578faf.105.1273747036675;
	Thu, 13 May 2010 03:37:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm5230976fah.21.2010.05.13.03.37.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 03:37:16 -0700 (PDT)
Date: Thu, 13 May 2010 12:37:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513103712.GJ3370@jama>
References: <20100513095725.GH3370@jama>
 <hsgjf7$645$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hsgjf7$645$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: install_linguas using public feed for locale package install?
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
X-List-Received-Date: Thu, 13 May 2010 10:41:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 12:15:02PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 13-05-10 11:57, Martin Jansa wrote:
> > Today I noticed that with every do_rootfs I see few downloads from my
> > webserver (where is DISTRO_FEED_URI pointing).
> > 
> > I guess it's because install_linguas from image.bbclass.
> > 
> > Is there some special reason why it's not used from deploy/ipk directly?
> 
> This code was done in narcissus first, which and then copied to OE. The
> difficulty here is that when this runs, the OE generated opkg.conf is
> already gone. You can make it use the deploy/ipk feeds if you do the
> install_lingua step earlier, or add a -f to point to a different config
> file location.

OK, I'll send patch.

> > it's not problem here, but if public feed is not in sync with deploy/ipk
> > it can be IMHO pretty bad (locale .ipk cannot be found or different version).
> 
> Well, it keeps me honest :) It makes me notice public and private feed
> discrepancies a lot faster. But I agree that requiring internet access
> during do_rootfs is a bad thing.

We sync after every build, but not between ie EFL upgrade and do_rootfs
of image, when EFL upgrade is built as part of image dependencies. So
we're also not so bad :).

> regards,

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


