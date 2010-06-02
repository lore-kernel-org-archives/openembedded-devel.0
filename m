Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJqzo-0000Uh-PZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 18:40:49 +0200
Received: by wyb32 with SMTP id 32so212349wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YSzgrwIP4gDakcr6SF4Ig5i2QIenZMN9hva9lrXhAWI=;
	b=QHvaHYvFaATa6pkueUS1MAUDzvSpiEW4+N0IeA9ZACqn0dP35uZRi/F8Z1QpQaXNa+
	NUAxsOgVGwlpHvYQveM+E6jq0Sc97N7impJvX18jtsAHg17SvSU416EuYRYAjoxnNklO
	dXMUc4a4NlQOk5J9/NNO91Y7+XSTh+75zogVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BN/6ycXsTirzqWIdJBB9F3vLUjWjTPLMdq08cgvcbgU8mGlN0Iho0XqWAxEegVfihZ
	yn5F0vsGcP8kLuJYbfZtGPoIETl+dCILdMbjAFT0qiGBK5uew08oji6+VzvGETjdiwSG
	UI+gtNet2+WmbeTWdDmk2haOosJyCIlM8yBf0=
MIME-Version: 1.0
Received: by 10.216.88.203 with SMTP id a53mr270859wef.25.1275496593480; Wed, 
	02 Jun 2010 09:36:33 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Wed, 2 Jun 2010 09:36:33 -0700 (PDT)
In-Reply-To: <AANLkTim75oyfx6Gt5W84j5G7x_zXAiEmK5vISeoTQSfZ@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
	<AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
	<AANLkTinUqQ16GPijhEAJof0uwAfrokQroib56xX2IutT@mail.gmail.com>
	<hu2a9n$bb5$1@dough.gmane.org>
	<AANLkTim75oyfx6Gt5W84j5G7x_zXAiEmK5vISeoTQSfZ@mail.gmail.com>
Date: Wed, 2 Jun 2010 12:36:33 -0400
Message-ID: <AANLkTimPv-7u55qWP5du8HZIbYOGWA1s9yyNO1FSzVnC@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Wed, 02 Jun 2010 16:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_install: Started
> NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_install: Succeede=
d
> FATAL: Unable to start to 'None' UI due to exception: 23868.

Some bitbake fixes that fix the above error:

http://cgit.bec-systems.com/cgit.cgi/bitbake/log/?h=3Dcbrake/1.10-srctree-f=
ixes

The first patch is just for logging.  The second patch fixes an issue
where we are deleting an empty dictionary.  I'm not sure if this is a
valid fix, but perhaps someone who understands bitbake task handling
can review.

Working on the following error now.

> ERROR: Logfile of failure stored in:
> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-l=
inux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/temp/log.staging_packager.253=
37
> Log data follows:
> | *** Error: CONTROL/control is missing field Source
> | The Source field contain the URL's or filenames of the source code
> and any patches
> | used to build this package. =A0Either gnu-style tarballs or Debian
> source packages
> | are acceptable. =A0Relative filenames may be used if they are
> distributed in the same
> | directory as the .ipk file.
> |
> | ipkg-build: Please fix the above errors and try again.
> | ERROR: Function staging_packager failed

Cliff


