Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrbG5-0006ai-J8
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:17:21 +0100
Received: by pzk12 with SMTP id 12so207966pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=h80T2T5jgMnycx4AAmyOa0uwyfd2w7cIc3C7NrCFi3M=;
	b=BrikmEDRZ4VhjzK5Qz9AJVeSjy+hTgty+aQb8wqLDjIxwHzyt+83KrWZkYn9sRUzEv
	AMoVS/5ZWom4bk4fAUKDpleW+JFS+NX0qjaMSCCrpdu9empXUlUF4qppGYrzNMa/j3Up
	CPFGegbHt7izO64fLZKrdYzArycymWCpVpb58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=jo2A6WR7ems0ZV7zXJVlG6OjQ4gWchqoqb0NCNKZt0At+M38w9k0xHY3bupUZQsMuL
	B2D8xORzzKZqmQLhL36xIwLOyPrmgWH0fWeLWEUW7wHdzg6Dw/V0/b5ImB2iG1q8pvt8
	l5RoFTB9uIN9ola+CLP7HQcWfTG1zFbCcjN3k=
Received: by 10.142.201.3 with SMTP id y3mr1451348wff.36.1298315762715;
	Mon, 21 Feb 2011 11:16:02 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p40sm8095494wfc.5.2011.02.21.11.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Feb 2011 11:16:01 -0800 (PST)
Date: Mon, 21 Feb 2011 11:15:41 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110221191541.GA10070@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D5E45C1.7010504@opendreambox.org>
	<1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D5EE9A9.10205@mentor.com>
	<1298301152.2178.375.camel@phil-desktop>
	<AANLkTim7XbP9Oe6TFRmOWd42m7iZJu8dGMvoW16zJrxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim7XbP9Oe6TFRmOWd42m7iZJu8dGMvoW16zJrxA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] package_deb.bbclass: armel architecture name for eabi systems.
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
X-List-Received-Date: Mon, 21 Feb 2011 19:17:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (21/02/11 16:41), Leon Woestenberg wrote:
> Hello,
> 
> On Mon, Feb 21, 2011 at 4:12 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Fri, 2011-02-18 at 14:50 -0700, Tom Rini wrote:
> >> I'm a little puzzled. So little endian gnueabi ARM is armel, little
> >> endian OABI ARM is arm.  What about big endian ARM cases?  Thanks!
> >
> > Debian has never had big-endian ARM as an officially supported
> > architecture, so to that extent there's no precedent to follow in this
> > area.
> >
> > The natural name for a big-endian gnueabi port would obviously be
> > "armeb".  That does leave big-endian OABI somewhat out in the cold but,
> > given that OABI has been obsolescent for the best part of a decade, this
> > doesn't seem totally unreasonable.  If anybody did want to use dpkg with
> > such a thing (and wanted to avoid colliding with armeb) then I guess
> > they'd have to name it "armob" or something.
> >
> 
> adding some history here:
> 
> <quoting Lennert Buytenhek>
> 
> > It's not so unusual anymore since intel introduced the IXP series
> > of chips which come with mostly BE oriented reference designs.
> 
> The nslu2 itself comes with an ixp4xx CPU, but the armeb port is also
> used on a number of ixp2000 boards. Having a big-endian arm distro to
> run on the ixp2000 was an important reason for developing this port.
> 
> As to why I chose armeb instead of armbe, partially because of the
> -EB/-EL thing, partially because the arch name also has the endianity
> at the end (armv4b, armv4l, armv5teb, armv5tel), partially because when
> I first started porting a distro to armeb, a number of tools (binutils?
> I can't remember now.) did accept arm*b-*-* as target string but didn't
> accept armbe-*-*.
> 
> The latter might have changed in the meanwhile, but the original
> decision to use armeb instead of armbe was made over two years ago.
> 
> cheers,
> Lennert
> </quoting Lennert Buytenhek>
> 
> 
> Please note that there have been lots of issues with armbe (in
> configure scripts etc), so I would recommend using armeb.

In OE we have EABI as default on ARM and boards from armv4+ therefore
oabi is less of an issue moving forwards. We should be fine using
armeb for BE ARM EABI only as I dont expect any oabi port for armeb in
future

-Khem



