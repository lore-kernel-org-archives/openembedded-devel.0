Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OJbvG-0004z9-88
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 02:35:17 +0200
Received: by iwn9 with SMTP id 9so876992iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 17:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=P/SUm82Ghnnt2zOAkjnoAxCMugbDBej+yxTzfXAiJPk=;
	b=QrmMG18eErFxwr1MMWqpLJu6ebVIp36msKrmAm6Da68u7NmyFFw0TFfJw3f+IiSK4f
	DguHXozVk+fuFjodevNDeyljmqw/YI/kZF4H+Z3n3e6jQqCtox+PgRKj1VkTIXBzqbsl
	Z7iSoAW/reTP9Lz2Fr/zFwAjekfahq0gDBuRc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ratvmaWsVoyfF/0xH42n8PgZshRF5E713bauCQ6UjvqqdDypbd4anaRqRUSWkt7DGD
	AHs3xvUYcR15Jx05HdMBbQjC5LceTm0ePstjfRXerxm0PGMY1nXceF3CBHOn5S41YdaX
	IKFZh7fU6XkQxCcpP+XaEROpZ18jBJD+/fnpI=
MIME-Version: 1.0
Received: by 10.231.173.145 with SMTP id p17mr974032ibz.32.1275438650035; Tue, 
	01 Jun 2010 17:30:50 -0700 (PDT)
Received: by 10.231.152.204 with HTTP; Tue, 1 Jun 2010 17:30:49 -0700 (PDT)
In-Reply-To: <4C052584.2040905@mlbassoc.com>
References: <4C04F6FD.4070804@mlbassoc.com>
	<alpine.DEB.2.00.1006011021440.32142@lynx>
	<201006011647.23770.ml@vdm-design.de>
	<4C052584.2040905@mlbassoc.com>
Date: Wed, 2 Jun 2010 10:00:49 +0930
Message-ID: <AANLkTimsExreeJ4iWCwwaYoo-HJKC1zEuKKsX5gzzn29@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Wed, 02 Jun 2010 00:35:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 June 2010 00:51, Gary Thomas <gary@mlbassoc.com> wrote:
>
> I reran my build and it passed through (no repository changes).
> This particular problem seems to be a multi-threaded build (I run
> with BB_NUMBER_THREADS =3D "4")
>
> Sadly, the final image still does not build:
>
> | log_check: Matched keyword: [Cannot satisfy the following dependencies]
> | Collected errors:
> | =A0* resolve_conffiles: Existing conffile
> /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-imag=
e/etc/device_table
> is different from the conffile in the new package. The new conffile will =
be
> placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b *
> satisfy_dependencies_for: Cannot satisfy the following dependencies for
> angstrom-task-gnome:
> | =A0* =A0 =A0encodings * =A0 =A0 encodings * =A0 =A0 encodings *
> |
> NOTE: package beagleboard-linuxtag2010-demo-image-1.0-r0: task do_rootfs:
> Failed
>
> I don't understand this error well enough (believe me, I've
> spent hours reading the various recipes and trying things)
> to hazard a guess as to what this error means.
>

Not understanding the error is probably because most of this error
message comes from opkg (which is a heap of crap) and part of it has
been truncated.

The first bit:
> |  * resolve_conffiles: Existing conffile
> /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-imag=
e/etc/device_table
> is different from the conffile in the new package. The new conffile will =
be
> placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b

This indicates that multiple packages are trying to provide the
/etc/device_table config file. The message has been truncated at 256
chars - even the '\n' has been stripped so it runs on to the next
error.

I've just bumped this limit to 4096 in upstream opkg, so longer errors
should be more readable.


> satisfy_dependencies_for: Cannot satisfy the following dependencies for
> angstrom-task-gnome:
> |  *    encodings *     encodings *     encodings *

Package "angstrom-task-gnome" depends on Package "encodings", but it
cannot be found in the list of available packages. I have no idea why
its listed three times.


-Graham


