Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q4uXA-0007IH-SN
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 14:30:01 +0200
Received: by iwn10 with SMTP id 10so1318290iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=YhLiR/tHXxa2ulHTW4QIb9lgeL0SDVcIDFPBeW2o5xA=;
	b=NcXFokUt2DXydzx8DMsrfHRd8yoVShiqaAofCTnL+8VV0LhHUY2Nf+UQOhuMM+c0gw
	aHYLUBOA80dvDWlJfeLYLVfJeus4LIs6fK8gDImWwHK+K8hcJ0A7AxeH3+lt+f0wgXYt
	kJs0AdZeWMEMBdDfJZkWzn2rMMNBgo+MSCeEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=t4/dBM4VadSgHl5sXwXLQHVPO3pLbtpuEkB43DhIOQ+5xDq0yZMmgASwrT+1dHHu1q
	XPXsJRLnKC367KR6alybej8GJIFXWhitqih9/raDp+0aZK56RlAsz1dJwz+wUpmjGEPM
	pV7gThl9AV5fpB1PhfpezbZno98HijBRJftNc=
MIME-Version: 1.0
Received: by 10.43.44.137 with SMTP id ug9mr1235098icb.175.1301488075427; Wed,
	30 Mar 2011 05:27:55 -0700 (PDT)
Received: by 10.43.131.199 with HTTP; Wed, 30 Mar 2011 05:27:55 -0700 (PDT)
In-Reply-To: <1301483378.10697.16.camel@mattotaupa>
References: <1301483378.10697.16.camel@mattotaupa>
Date: Wed, 30 Mar 2011 15:27:55 +0300
Message-ID: <AANLkTiknPy8RSwscER2KDdPvNCTqCvKTiY+LPHWhia-y@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e-image-core: task rootfs fails because dependency `evas-engine-gl-x11` is not satisfied
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
X-List-Received-Date: Wed, 30 Mar 2011 12:30:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 30/03/2011, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> task rootfs of `bitbake e-image-core` with `minimal` for `MACHINE =3D
> "beagleboard"` fails with the following error message.
>
>         [=85]
>         Configuring eglibc-localedata-i18n.
>         Configuring xf86-input-mouse.
>         Configuring udev.
>         Configuring tinylogin.
>         Configuring xf86-input-evdev.
>         Configuring sysvinit.
>         Collected errors:
>          * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for task-e-x11-core:
>          *      evas-engine-gl-x11 *
>          * opkg_install_cmd: Cannot install package task-e-x11-core.
>          * resolve_conffiles: Existing conffile
> /oe/build-minimal-eglibc/minimal-dev/rootfs/e-image-core/etc/device_table=
 is
> different from the conffile in the new package. The new conffile will be
> placed at
> /oe/build-minimal-eglibc/minimal-dev/rootfs/e-image-core/etc/device_table=
-opkg.

Seen exactly the same issue with omap4430-panda aka pandaboard as MACHINE

> How can this dependency be satisfied?
>
> `recipes/tasks/task-e-x11.bb` runtime depends on `expedite` which in
> return runtime depends on `evas-engine-gl-x11`. Where is the problem?

I suspected something wrong with the evas build, but in the evas.inc
there is this as extra OE_CONF --enable-gl-x11 so I would expect the
package to be built.

Somehow it doesn't. I guess the problem lies there... Have not found
the solution though.

Cheers,

Philippe


