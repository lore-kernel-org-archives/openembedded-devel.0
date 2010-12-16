Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PT66H-0000DP-Qv
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 06:09:58 +0100
Received: by pvd12 with SMTP id 12so455398pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 21:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=8BHH1yEz2LcdKsL/UmzBUc3iodrvf50YkjkAOD9kG4A=;
	b=ZUPMrboTLIaF5alJL8Esx5wDDwHo7S3oMdFCOYsvadvTvZIbuhjXKwHQIhstD7+Vfk
	oqPnNNxlSX845l8uK4a1hcvnwoC6eai/7jYajy/uVFekPpdTQEm20liAnbOU3kE5FiHF
	BaNLhuMI89FIXwHgUkaNUcQJtdcGEeHq/9aJs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=BRTabFF0Xrx/5Sr4uDHg/tYUrb+J0HfX7t32XnF73pMvUMAY3sQi45FQ0IqPDoSSvS
	UZN2cNhZU4aZ75/PkRDBBcgWzrEEJOnuswOZKNl9Vu5NuHjqqNQfs9gWOgGQo514mJ4R
	ltHiHk8hFF2o1H1a5eyxVF+teQVgTzC9dInqE=
Received: by 10.142.165.10 with SMTP id n10mr6468426wfe.70.1292476097580;
	Wed, 15 Dec 2010 21:08:17 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w22sm2550431wfd.19.2010.12.15.21.08.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 21:08:16 -0800 (PST)
Date: Wed, 15 Dec 2010 21:08:18 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216050818.GA18068@gmail.com>
References: <loom.20101124T090626-312@post.gmane.org>
	<AANLkTi=gaij=zue+LuXxr-bv7LHfYE_Nqo7xu1+QBzWS@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=gaij=zue+LuXxr-bv7LHfYE_Nqo7xu1+QBzWS@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Source distribution broken?
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
X-List-Received-Date: Thu, 16 Dec 2010 05:09:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (15/12/10 23:35), Michael Poole wrote:
> 2010/11/24 Anders Törnqvist <a.tqvist@gmail.com>:
> > Hi,
> >
> > Is the source distribution functionality broken?
> >
> > This is set in local.conf:
> > SRC_DIST_LOCAL = "copy"
> > INHERIT += "src_distribute_local"
> >
> > New checkout of OE from git.
> > Have tried different builds for MACHINE=beagleboard and images minimal-image and
> > base-image.
> >
> > The only thing that is stored in the TMPDIR/deploy/glibc/sources is a MIT
> > directory with the minimal-image/minimal-image.bb file.

hmm I get it properly populated for console-image, do_build is added in
base.bbclass I think it should be there for all recipes


