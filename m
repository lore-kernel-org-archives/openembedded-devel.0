Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OZ3bQ-0006Xj-1V
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 17:10:56 +0200
Received: by gwj22 with SMTP id 22so4388092gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=VgNSsbAWnBzn+BbMmcrF09F7DUeoPqaWQx8W4zvo5fM=;
	b=pvL+VtR6/5FH9bbpIx32LXNh0jw0kettMNmGK9lq1hUoUYXClz5s4nH+sAR8MZxc7p
	HvbUWiUv4N+nF3CjhJiFCApK6Z/WWIszL5JkIPD63xzL9aUnl7aslb5SVwbCmFKEM3zx
	22MLcdiKduTnjsrd/zzt0/iBiJn1B91tMZ6jc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lodp0J1lg0PpDTdruwXKCognXUP42+KNTc1tapFOc0oFGqMM+9cPaNYwSfYk9+8HPr
	LoWDRDbO8jPkLhHO4+qU6cyD5VB9MgiCQM+tOPekbwisaS6EwQ48mE1SfFqang7bOEjs
	NqPJFiQhs9xQrC0MQ5cS5A6W+EpryFvvbDvrE=
MIME-Version: 1.0
Received: by 10.224.86.205 with SMTP id t13mr9745272qal.381.1279120223836; 
	Wed, 14 Jul 2010 08:10:23 -0700 (PDT)
Received: by 10.229.220.205 with HTTP; Wed, 14 Jul 2010 08:10:23 -0700 (PDT)
In-Reply-To: <AANLkTik7rLr7494e76lVSraKV59TKBL8vb6JeqWUPQE-@mail.gmail.com>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
	<AANLkTikVmldXgiiXObLbE5sPWAvFsfEqCuQZZzzmazBw@mail.gmail.com>
	<4C3DBB0A.6070907@balister.org>
	<AANLkTik7rLr7494e76lVSraKV59TKBL8vb6JeqWUPQE-@mail.gmail.com>
Date: Wed, 14 Jul 2010 10:10:23 -0500
Message-ID: <AANLkTinLGzfYLoMxbER9_UiPOcDob7G0DHcdnBTBfhlX@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/3 v2] xilinx-virtex4: new file
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
X-List-Received-Date: Wed, 14 Jul 2010 15:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

I use this to add compact flash (system ace) device nodes where the rootfs
is
stored, some machine conf files does add this and in my case
"device_table_add-xsa.txt"
holds the static dev nodes that are only useful for xilinx platforms.

On Wed, Jul 14, 2010 at 8:31 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/7/14 Philip Balister <philip@balister.org>
>
> > On 07/14/2010 03:15 AM, Frans Meulenbroeks wrote:
> >
> > ....
> >
> >  2010/7/14 Adrian Alonso<aalonso00@gmail.com>
> >>
> >>> +# Device nodes add xsa for (system ace)
> >>> +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
> >>> +                       files/device_table_add-xsa.txt"
> >>>
> >>>
> >> I think these are normally not put in machine files.
> >> (at least I normally put them in my image recipe's not in the machine
> >> file).
> >>
> >
> > Just out of curiousity, what are these files for?
> >
> > Philip
> >
> > They are tables to make a static /dev
> Very useful if you are running a resource contrained (aka embedded :-) )
> setup in a static configuration, as you do not have to run udev or friends
> (ofc you cannot really have hot pluggable devices).
>
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

