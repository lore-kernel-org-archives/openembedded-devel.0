Received: from [209.85.162.178] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JvOHK-00071D-0g
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 May 2008 05:00:42 +0200
Received: by el-out-1112.google.com with SMTP id n30so387406elf.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2008 19:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:references;
	bh=BNEnWhCzVfRU8Ctx9q/SyTJKO01h8LT0gygDhe6MgdU=;
	b=dHldO8F1pOBazYZUUPhAzeeSoDRfONwUwBdRZbHyhA79owjD7lTn6HeueRQDwVyNlWZsn+fvTntMtOtqisK1t96LuF3iyv8EHtaFZCk0BgTU878sFkbAVn9ZQTO6dgUpFulHPTZDLG6BAowqfjpYeHupjXMs94pfxs/ErS65KSU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:references;
	b=qCNWYdbOmg2MH/1qgP8eaNsoGbZ2i4ATfIi1ZapdAHB/YKKkc0OONR5Br0XoG6nX8hndF7Z2cO4nfC/bdgN7VAo6Ity63bHCTHEG8hYSdxAhbvEVZmKr3fOOwxOLp0wTzpOs8+tZpvt1gFXP+c1A06nRsAUrwklf4/YA2Dgu1tY=
Received: by 10.114.73.1 with SMTP id v1mr7057114waa.166.1210561169536;
	Sun, 11 May 2008 19:59:29 -0700 (PDT)
Received: by 10.114.149.20 with HTTP; Sun, 11 May 2008 19:59:29 -0700 (PDT)
Message-ID: <19c1b8a90805111959kf9f54e5yfbf5e3e113734e81@mail.gmail.com>
Date: Sun, 11 May 2008 19:59:29 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
MIME-Version: 1.0
References: <g049dg$2ks$1@ger.gmane.org>
	<c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
	<g04ftr$krb$1@ger.gmane.org>
	<c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.10b4
Subject: Re: RFC: reverse the name change for org.oe.stable
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
X-List-Received-Date: Mon, 12 May 2008 03:00:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

But we also have sane* files where these versions are defined. So these
revisions will be frozen as well. I dont see a problem in using a given
revision if it is tested and is stable enough.
-Khem

On Sun, May 11, 2008 at 3:46 PM, Leon Woestenberg <
leon.woestenberg@gmail.com> wrote:

> Hello Koen,
>
> On Sat, May 10, 2008 at 5:44 PM, Koen Kooi <k.kooi@student.utwente.nl>
> wrote:
> > Leon Woestenberg wrote:
> > > Maintaining recipes that are _cvs or _svn are not feature freeze.
> > > Stable does not match with the SCM versions and should not be chosen
> > > in any stable distro.
> >
> >  I have trouble parsing that statement. Are you saying "do not use _<scm>
> > recipes in a stable distro" or something else?
> >
>
> Yes, do not use _<scm> recipes in stable stuff, a known checkout of
> the OE stable branch should either build or not for a particular
> machine/distro/... combo.
>
> If I checkout today's stable tree in one year time, it should build.
> Period.
>
> That isn't going to work with _<scm> recipes being active in stable.
>
> (and sorry for the badly formed statement - I don't take enough time
> to write down what I would like to say - maybe I should just shut up).
>
> Leon.
>
>
>
>
>
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

