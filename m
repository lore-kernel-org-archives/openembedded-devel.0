Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHCjf-0001I7-2j
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 11:17:12 +0200
Received: by iwn2 with SMTP id 2so4540493iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 02:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=fLCUyEq1q6xYznThZbPPRxhzny3w3fohELqYGsQ8nAo=;
	b=gJ9hCqfXyXHg/WUbrQwCbsgfrgflOA4ykzq/Ojya867aNAxXGvm5OWqg+ttrm+qodg
	7yL4Evbe+YxBz4dy/Drqk21UIAh6PDR6+71Nw6hmQtvm+A2mAr36k0J34Qw8g1vR+VFc
	SQxvVrZc+hnmCBd5lkn0WTcswFmWYZYF2pHM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QDog331W90eBYgV42KtFVtzx7bDu8O4koK9wvwGrWCBPvrObgNoTmno+lUWkMo71No
	F5Xy0LeZOtzOJ4j/wWap3VYVrU68kMP86wQjG5jT2WNcWJ3iMHUsUAAUzaWJ6g/WyPdl
	7HL4f7em0J45DfhbeTe7a2w70WAcHtDH8BxGE=
Received: by 10.231.184.137 with SMTP id ck9mr6785925ibb.68.1274865184591; 
	Wed, 26 May 2010 02:13:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.30.67 with HTTP; Wed, 26 May 2010 02:12:43 -0700 (PDT)
In-Reply-To: <1274863471.6452.54.camel@lenovo.internal.reciva.com>
References: <1274859584-8442-1-git-send-email-raj.khem@gmail.com> 
	<1274863471.6452.54.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 May 2010 02:12:43 -0700
Message-ID: <AANLkTilPhweXZYpmrBRRlW5uHJazro_WcZ5k1C10KqXN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Barf if TMPDIR has trailing forward slash
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
X-List-Received-Date: Wed, 26 May 2010 09:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2010 at 1:44 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2010-05-26 at 00:39 -0700, Khem Raj wrote:
>> * Unknowingly many developers run into this issue and
>> =A0 painful part it that the problems start happening almost
>> =A0 when build it complete and the errors are unrelated to cause
>> =A0 see http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/=
msg02922.html
>
> Can we not fix the actual bug rather than disallowing trailing slashes?
> It seems a bit sad to introduce further weird limitations just to work
> around some or other piece of brokenness.

Yes I thought about it but did not know where to start.
I guess that would be bitbake which has to quickly remove the trailing
space just after parsing
in TMPDIR before it gets expanded into other parts of metadata. would
it be OK for bitbake to treat TMPDIR special ? or may be bitbake
should just get rid of more than one slashes in dir paths as a whole.
when concatenating two paths it should merge the slashes may be.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


