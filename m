Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NuJSj-0004B9-DG
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 06:49:06 +0100
Received: by iwn4 with SMTP id 4so2929514iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 22:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=r+jLPlahFTc/rwLX/zNoAadSBJ7gy+sTWFzPM/IEl6A=;
	b=frnDFFLx9rOI0xPt84nh5NmHJA/4fqgcTABlwivlkPpQtkG3l7sUDgli+R41aWfXX1
	lWDZyz6sZTDmurOC/qLJTFPErp1mUuAFG4xwLNwH8Z8BThmzW+0/NI/TvezruBGAtts7
	FuteQXlY1DJdt8lqKwmdLWoez8U87LEgA0YhA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EFbftPh08zSXRoSkB7OfCIU1phA0DSU6vNfeHIjbTVOX97qi58hr0bsIxCuiYmUKrQ
	g9TVqGd835EbBBcQNZz3lYo/Pl+2W+KEjo5wKVMBUSl70aec9MGwN/E6+kRkkA/Hz/++
	6F6NpvTVtAk6eDFh3UFw2JfXOLpmiZFu1dpWU=
MIME-Version: 1.0
Received: by 10.231.160.195 with SMTP id o3mr1854136ibx.32.1269409555311; Tue, 
	23 Mar 2010 22:45:55 -0700 (PDT)
In-Reply-To: <4BA981A5.5030609@zenlinux.com>
References: <4B99791E.1020102@zenlinux.com> <4BA981A5.5030609@zenlinux.com>
Date: Tue, 23 Mar 2010 22:45:55 -0700
Message-ID: <19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND sdk vs. nativesdk
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
X-List-Received-Date: Wed, 24 Mar 2010 05:49:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 23, 2010 at 8:06 PM, Scott Garman <sgarman@zenlinux.com> wrote:
> Hi all,
>
> I noticed in my attempt to convert zlib to use BBCLASSEXTEND that
> sdk.bbclass has been deprecated, and that the new way is to use
> nativesdk.bbclass. This is confirmed by the fact that the Poky recipe for
> zlib uses:
>
> BBCLASSEXTEND = "native nativesdk"
>
> However, if I use this in the OE recipe, bitbake no longer knows how to
> build zlib-sdk. And zlib-sdk is listed in DEPENDS in a small handful of
> packages.
>
> It seems to me the correct course of action is to use nativesdk in
> BBCLASSEXTEND and rename the dependencies on other recipes, yes?

you should rename the dependencies on zlib-sdk to zlib-nativesdk
wherever they exist.

>
> Thanks,
>
> Scott
>
> --
> Scott Garman
> sgarman at zenlinux dot com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


