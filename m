Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8htZ-0003UW-Qu
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:16:35 +0200
Received: by wwi17 with SMTP id 17so1577941wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ogAqfftqzNqOjDL58IDWYMn2Wicrh5UNXspT5VbENF4=;
	b=boz+GlZck1lwi1hOnFbBHBjloZX1/baCB/w3p4eBFxsR0bjZYzEqRAlrU7KjiC7mz9
	mCbYhs/Ozc3aVdImmCjWjAeVLEwlOHSjEoiOBPbJhzal7mt8Zm5kNMEcDbAcqidGIwdE
	0LabidVqdaZ3T9P2UhuKmmXgW7F3sAuWL5nXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=RUhKoi4/uQHp6S9tw+h2ihYEtEhXhhW8Ao5mBAH1QfSZ1Jhi3SbFuBgOtj0neFKNV1
	NML5Y8PWPKs15bispA4+TgHEsVtS4NYJ7YkzJ3K4hm/U3H1yidMvCDR8cDlEvGQLpw2M
	Zpb2Tb9K8M1+8x+2uvKLBlvcb+NUh5+MVTe7c=
Received: by 10.216.233.234 with SMTP id p84mr44893weq.38.1287616557901; Wed,
	20 Oct 2010 16:15:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 20 Oct 2010 16:15:37 -0700 (PDT)
In-Reply-To: <AANLkTi=B3qc0KgH_oz0_iLHN0ztbP6g7XD5fP-Jxg--j@mail.gmail.com>
References: <AANLkTi=B3qc0KgH_oz0_iLHN0ztbP6g7XD5fP-Jxg--j@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 20 Oct 2010 16:15:37 -0700
X-Google-Sender-Auth: idDUImVLjvWAyjqD-mxQQUcDxvI
Message-ID: <AANLkTinsFN_ajaOHHeFO_j126HF1GJBpiGqVhq=Yk0yO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: 'require' across different collections
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
X-List-Received-Date: Wed, 20 Oct 2010 23:16:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 20, 2010 at 4:12 PM, Ash Charles <ashcharles@gmail.com> wrote:

> Is it possible to use the 'require' or 'include' keywords across
> different collections without specifying an absolute path?
> Specifically, I have an image recipe which adds a few additional
> packages to console-image.bb; it lives in a separate collection i.e.
> it is not recipes/images/.  I currently get parse errors if I try to
> 'require console-image.bb' yet I had thought there was a way of doing
> this and I can't track it down in the mailing list archives.
>
> Any suggestions on how best to supplement an image with a few extra
> packages?
>

require has never required an absolute path.  If it's relative, it's
searched for in BBPATH (which happens to have hte dir where the including
file is prepended).  Since it looks for it relative to the top of each
element in bbpath, when you do 'require console-image.bb', it ends up trying
to read openembedded/console-image.bb.  Instead, use require recipes/images/
console-image.bb.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

