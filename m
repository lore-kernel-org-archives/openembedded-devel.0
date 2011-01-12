Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pd1bQ-0005qj-H0
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 15:23:08 +0100
Received: by wwi17 with SMTP id 17so585850wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=IJs4YeFU8SwdjKmCKQRchDa0zCQPJ3mPsAHClBsKk+s=;
	b=KhIhcG6B+k5ZxeCjRKDLMQFlIn9m7qQ9jRgVgpj5ow49O0ZKpXmbrgZrzrTaoItgpD
	TTJGVHmAvhEyUQrJvsKbGGbGQQh6lZ6LwweyAHAkxlChYwUJDIs0l5MVQcP8q/N+GGGO
	zdKSVH5zV7DEqBYj3kM52ffcYn89DDpRE+U08=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=e1rJUIS/evr+R5TDRmoJroc4ZKX+wZKxnR2poq8A63+7MPxC5oJu5/Ja5a+oSEJffx
	nZTYKFKtiAQEmW2rm4giHmsF1+PwgVGFOxLB2Y11upGlRNuxViUh+jbfmoBD+Y0bbIvv
	Xcgh3Q7KDwEAvXPGX/aGbVmWYcCmA5qNCG+zE=
Received: by 10.216.51.130 with SMTP id b2mr867873wec.42.1294842156650; Wed,
	12 Jan 2011 06:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Wed, 12 Jan 2011 06:22:15 -0800 (PST)
In-Reply-To: <4D2D5B93.50409@dresearch.de>
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
	<4D2D5B93.50409@dresearch.de>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 12 Jan 2011 07:22:15 -0700
Message-ID: <AANLkTik_e2KnKRnd0yp=Kk=Sz=CcQCN+2UbTK-X3nH52@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Cc: Chris Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox: move syslog config to /etc/default
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
X-List-Received-Date: Wed, 12 Jan 2011 14:23:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2011 at 12:43 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 12.01.2011 02:43, schrieb Chris Larson:
>> From: Chris Larson <chris_larson@mentor.com>
>>
>> The busybox syslog syslog.conf is parsed by the /etc/init.d script, not =
by the
>> syslog process itself, so it belongs in /etc/default. =C2=A0In addition,=
 the file
>> format is *completely* different from the standard sysklogd configuratio=
n, so
>> while we should resolve the file conflict between busybox-syslog and sys=
klogd,
>> we should not use update-alternatives for it, so this is a cleaner solut=
ion.
>
> Moving the file into /etc/default seems to be OK for me.
>
> But i would suggest to rename the config file itself to busybox-syslog, b=
ecause it does not contain (default) configuration for any syslog incarnati=
on but only for busybox-syslog.

Good point, will do.  Thanks.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


