Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JqkaH-00030i-A6
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 09:49:05 +0200
Received: by wa-out-1112.google.com with SMTP id l24so8222950waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=64+jdgowQ3Xt5Gardz5piEY/qhgOxf0wynLJFzLrWMk=;
	b=BmCNofTECeDTuVoaa5TCbdZN4GZQXlFoS36mH6vM0CrOPps5NNN7MdxMSAisA41vY6Ymc9KkkwQ4CrOKahGQugBPr6VDboluwrDi+N8sFPsZQjniQwWnmqAzJE0kwvEe2WczpSK8HEk3iiW8uakvIqEEnBGSndTNAeOjh+A79Ds=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=GvQxBWSUrpKhZx22Mmyj4ljuHOpbG7xjEpqjecid+A2+epmrdHCOBTTQ9vIOPc/7SI2x3gPZB6qqU8dQHuFvsKL25mWRLcniBIZr+tdANs67BvZfwMz097/XHl04tecLeRx+R++NHfqrGgg+uK/5iMfFJHYYUh7UUGgjIWmXjnY=
Received: by 10.114.154.12 with SMTP id b12mr7598168wae.153.1209455317413;
	Tue, 29 Apr 2008 00:48:37 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Tue, 29 Apr 2008 00:48:37 -0700 (PDT)
Message-ID: <19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
Date: Tue, 29 Apr 2008 00:48:37 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
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
X-List-Received-Date: Tue, 29 Apr 2008 07:49:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

uclibc-initial recipe has this

require uclibc_${PV}.bb

That should pull the dependency. but this line

DEPENDS = "linux-libc-headers"

should be changed to

DEPENDS += "linux-libc-headers"

I think.

-Khem

On Mon, Apr 28, 2008 at 10:03 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
>  On Tue, Apr 29, 2008 at 12:19 AM, Leon Woestenberg
>
> <leon.woestenberg@gmail.com> wrote:
>
> >  On Mon, Apr 28, 2008 at 11:49 PM, Holger Freyther <zecke@selfish.org> wrote:
>  >  > On Monday 28 April 2008 21:51:05 Geoffrey Wossum wrote:
>  >
>
> >  The confusion started with commit "3afb4ffc02c1e4bde1031645cfa9f8e5465f2138".
>  >  Could you guys please see into that commit, and follow-up from there?
>  >
>  FWIW, by reading the intention of the patch commit, I checked with the
>  source (Poky), and indeed _NATIVE is used, and uclibc.inc DEPENDS on
>  ncurses-native.
>
>  One question remaining for me (and I think Poky might be broken in
>  that respect?) is that uclibc-initial_0.9.29.bb in Poky does not
>  DEPEND on ncurses-native (and does not re-use the .inc DEPENDS btw).
>
>  I have committed the _NATIVE, on both DEPENDS to the .dev branch.
>
>
>
>  Regards,
>  --
>  Leon
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


