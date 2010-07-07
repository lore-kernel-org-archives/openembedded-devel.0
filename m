Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWQCp-0006U0-3N
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 10:42:11 +0200
Received: by bwz10 with SMTP id 10so3766974bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KdpB1KrjzU2DSF0zJlfp/m5nQNVamhBDW8QTzg/FtCg=;
	b=J3ELzOoflEMpIkVQ7EIeQqKFKZMCH9fZ6lfx7YrH9B4BfUyxN1vr2loz/QDOk7buBF
	FKaKYusNjdlVb0GoebfKv9vFiG4KzFiIgsUA5apjNYilg5sz18vIfvpoYyFCWKZU+e64
	j7YcSvwaVahOf0pzKVTWbHkFkZ9Nq0AuhftHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=h4mRom7wELrCYrcQ/ozPFysRE9OHTv7UkedfBMVwLNAY9OEnWyQwB9U5Q1AzOrMPCF
	MbQAqmUwk10w6HSnSEt3De78ZJ2//2DO/P9NPcWu+cD+Z0Jb+Tg3uY+TGjM+xwbb7LnT
	oewNMagipiBYjsRZmPyIBwtjteSEdGRAYitjo=
MIME-Version: 1.0
Received: by 10.204.126.161 with SMTP id c33mr4767514bks.108.1278491842217; 
	Wed, 07 Jul 2010 01:37:22 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 01:37:22 -0700 (PDT)
In-Reply-To: <4C3437D7.8050505@gmx.net>
References: <4C3437D7.8050505@gmx.net>
Date: Wed, 7 Jul 2010 10:37:22 +0200
Message-ID: <AANLkTikv_LlSLVq88jiHeVOEltQNINr1pJIgmVDyuR_J@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] GCC 4.3.1 unbuildable due to unapplyable patches - remove it then?
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
X-List-Received-Date: Wed, 07 Jul 2010 08:42:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/7 Robert Schuster <thebohemian@gmx.net>:
> Hi,
> GCC 4.3.1 does not build for an ARM target because a patch does not fit.
> So I assume that no one is really interested in that version of GCC
> anymore and would remove it then if nobody fixes the patch situation:
>
> http://tinderbox.openembedded.net/public/logs/task/6443736.txt
>
> Regards,
> Robert

I suggest discussing the patch with Dmitry Eremin-Solenikov
He committed this patch 2.5 weeks ago
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=65e509aeddd26a6829ee10aa21fa20d6fd3def3e

Frans


