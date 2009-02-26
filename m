Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LciMu-0001HM-JX
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 16:41:48 +0100
Received: by fg-out-1718.google.com with SMTP id 13so448010fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=o4FtFCAC7V6AfXnnlOnBZ5tqF9P1661LUe8bI82Zm4E=;
	b=x1BBbQZvPh+EuhkOcZ7aXaI6rbgLtetuKCZ1xQkxvSLT0Ka+im8LNbbAqSrC+Z/2Zu
	esa7DaYKXScJC3xGubwrQnkCIV5+EHDgcTKtwzOjtpfzstzbDOMUT01cbzG4K+TxHW17
	NcctxC8uEVswo1kSLTJAbuWQOmBt3cBSlunu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=ZX9MTykMmrTCFf++KS2Tsy7Mr9gcTMBA8B0N50GFcNiPVgnwTWZoIgNrpjnaNJpywC
	EL2PyKvlNDT7jGpB1nNS1/J359JH3/aZoxhNNOI8FDqdKMZ7+Zl2zIDYn+RLR2qnXcrQ
	DbaDwFErVQMEDhKHy7vj7FzsuJr5R4+iHrvjY=
Received: by 10.86.70.3 with SMTP id s3mr1376307fga.78.1235662709176;
	Thu, 26 Feb 2009 07:38:29 -0800 (PST)
Received: from is.home (93-81-1-160.broadband.corbina.ru [93.81.1.160])
	by mx.google.com with ESMTPS id l12sm6057432fgb.41.2009.02.26.07.38.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Feb 2009 07:38:28 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Feb 2009 18:38:20 +0300
User-Agent: KMail/1.9.10
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
	<49A69217.3070705@opensimpad.org>
In-Reply-To: <49A69217.3070705@opensimpad.org>
MIME-Version: 1.0
Message-Id: <200902261838.20657.jay4mail@gmail.com>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 15:41:49 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 26 =D1=84=D0=B5=D0=B2=D1=80=D0=
=B0=D0=BB=D1=8F 2009 Bernhard Guillon =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BB(a):
> Marcin Juszkiewicz wrote:
> > On Wednesday 25 of February 2009 21:21:32 Koen Kooi wrote:
> >> Proposal:
> >>
> >> mv packages recipes ; git commit .
> >
> > +1 from me
> >
> > My addition to this:
> >
> > mkdir recipes-broken
> > git add  recipes-broken
> > git mv recipes/obsolete recipes-broken/obsolete
> > git mv recipes/nonworking recipes-broken/nonworking
>
> I like this idea. But we should add a description file to the recipe on
> which arch it is broken or why it is obsolete.
> A package tested and working for arch x can break on arch y easily. E.g.
> if it uses netlib floating points.

Here is other example from FreeBSD project - MOVED file:
http://www.freebsd.org/cgi/cvsweb.cgi/ports/MOVED?rev=3D1.1803;content-type=
=3Dtext%2Fplain

It contains information about package movement/removal in ports tree.

Just as example :)

=2D-=20
Yuri Bushmelev


