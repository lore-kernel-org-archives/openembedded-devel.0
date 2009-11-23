Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCbTM-0000nT-Up
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 17:09:07 +0100
Received: by bwz19 with SMTP id 19so5191931bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 08:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NONsFbMW4tLFiP1PYeH3fy0aHptRDWfmfaZl8yS1m6c=;
	b=P8Kk3xhHgeeyzJnA6gKd4Nlv9yBmLmzYm6d27e0vpjFPAt5agtwD9s1H+QV9kzpkTu
	u3kwx2ZuzFuKJ+9rRMAftus/p+9kQbz/5awqbW+SF8i84akMcic5Idmn9ZMofi4j3Zpv
	qiR8tSaM55if57wSmwKxiCu/tuaqlfiBF7050=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Y2sr91w/M8D0F9oEHbhm+380f5wWfcwDC12ybO+34SBCczYO+nfwRx2L25ZGlh7Yn1
	f3BADt/620Fj54Z0O3vpVwhdv+C9vj4jMGvY8BIaPlzOzW63rHwddSf+7PMFTsHo5Km3
	cgWeOT/HgnMwlcCuj1evWjTt9c5QmnS5j7uao=
Received: by 10.204.2.133 with SMTP id 5mr880752bkj.5.1258992456194;
	Mon, 23 Nov 2009 08:07:36 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1431545fxm.12.2009.11.23.08.07.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Nov 2009 08:07:34 -0800 (PST)
Date: Mon, 23 Nov 2009 17:07:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091123160737.GA28485@jama>
References: <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<20091122190547.GC3349@jama> <hedfru$gol$1@ger.gmane.org>
	<1258978516.10321.79.camel@dax.rpnet.com>
	<hee2r8$bav$1@ger.gmane.org>
	<1258986598.10321.99.camel@dax.rpnet.com>
	<hee82a$td1$1@ger.gmane.org> <20091123151256.GH3349@jama>
	<heeb33$9kc$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <heeb33$9kc$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 16:09:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2009 at 04:52:03PM +0100, Koen Kooi wrote:
> Because the version might have gone from 1.4 to 1.6?

But this isn't any worse with SRCPV or is it?

Now you need to bump SRCREV *and* PR with every SRCREV change unless PV changed.
And SRCREV *and* PV if PV changed (maybe you also reset PR).

With LOCALCOUNT you bump only LOCALCOUNT with every SRCREV change.

And if PV changed you change it too as before and you don't need to
update LOCALCOUNT.

Its still the same, you need to change at least 2 variables SRCREV +
PR/LOCALCOUNT.

And if PV changed you change it in both cases.

Only advantage of LOCALCOUNT is that it would be easier to maintain it
in the same file as SRCREV (less error-prone to change them together)

> regards,

regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


