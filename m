Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OIPgv-000666-Jd
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 19:19:22 +0200
Received: by gwj15 with SMTP id 15so1740727gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 May 2010 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XQGCJjKfiXL3q7GqN6kk3DR4qjOOvH8Z2WQyzKCxaik=;
	b=fzaW0FWVikwXF8cQiC8z5GYceZBpK2Lp1liECu2w/Bj+PXUsRYkMOFAyLkEE3RlP+2
	Vn9T1sGrCDIqKQikw6xKynWLT+PZJD166EZMRZr2DL5Kysu5W1zJuTxv/bW9QJ41NzU7
	L7M7IO+RKqG4blyjnyNAmVNx2ldd4WZMZe2Kw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tBBHsYMUN1UEg3LpOr7N5u2GlpD6ptylgS4bXm7pJYT73cVqBZAS4xn+LcB6BQFMOK
	GRyK8SbjmKubzl+FOaABIpSvjpuql0IsFJ+qnHVOwBScfD2QRtZanVvf2dItrNfPMvT4
	k7ADu+CDndbmrOrr7wxWy+P+ER59P8EUoSugk=
MIME-Version: 1.0
Received: by 10.101.3.14 with SMTP id f14mr2277147ani.38.1275152964173; Sat, 
	29 May 2010 10:09:24 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Sat, 29 May 2010 10:09:24 -0700 (PDT)
In-Reply-To: <AANLkTinixtnuaFRhM9y4ACoa1s8hbDC4EBu5XlFffuXj@mail.gmail.com>
References: <htqn9k$gvu$1@dough.gmane.org>
	<AANLkTinixtnuaFRhM9y4ACoa1s8hbDC4EBu5XlFffuXj@mail.gmail.com>
Date: Sat, 29 May 2010 19:09:24 +0200
Message-ID: <AANLkTilvLmREAqmFx0eh8rfg2bWLVUrtfQWX2nmtmbk4@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Faking sign offs is bad
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
X-List-Received-Date: Sat, 29 May 2010 17:19:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> Apart from that, the commit is bogus, it just adds a
>> 'udev/udev-151/udev-compat-static.patch' file in ${S} (of all places!)
>> instead of actually patching the udev init file.
>
> The hack must be temporarly.
> I though tit's more clean if we overwrite the file than diffing and patching it.
> Perhaps I was wrong.
>
> Andrea
>

Oh, I see now...yes..my bad:

I had locally some more changes, which got lost importing your
modified init. 3 magic lines.

do_configure_prepend() {
        cp ${S}/patches/udev-compat-static.patch ${S}/init
}

Please forget: I'm preparing a proper v2 patch to be sent on the ML.

Sorry again for the noise

Andrea


