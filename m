Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1My7Cw-00005B-Us
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 19:00:17 +0200
Received: by ey-out-1920.google.com with SMTP id 5so10707eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yMzDWeSBzDNI99sRIBHcrJwjiaFFC0OTcJ8G8qp6lSE=;
	b=mKWwqWPvhBKq9aVaYEzxnsOvkTcdVeh7vbA3AOHCz7on7FlXXw+ao4m/DdqHIPJSrk
	//iTgMpwWeQx6qvke2Fs5t8pzm8jCIkE1hfrHQnoFdxMrCSKEAWJzENDdmNeKnrNS+K4
	gy/MKp82QMbUINlMLBNDd2vfmVGWwQ1xCROIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xv7zpmBKEBCzTMgFVgd1bGZnp0x/mbIcHu89H/ENwfB/lk0bm6OHjFSCJHt4Mdc62L
	UIJUZPSWgOlH17XfN9JQsBCVLyUyABTJb10xQ3mFAwhb6r7FGjTwHHg0PuNllTCdm1Hr
	PRpAoSNebe4bPTsj970jvPgetRnaVt8sUgXCM=
MIME-Version: 1.0
Received: by 10.211.131.12 with SMTP id i12mr7676627ebn.97.1255539561548; Wed, 
	14 Oct 2009 09:59:21 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.0910140020030.5153@linux.fjfi.cvut.cz>
References: <alpine.LRH.2.00.0910140020030.5153@linux.fjfi.cvut.cz>
Date: Wed, 14 Oct 2009 09:59:21 -0700
Message-ID: <19c1b8a90910140959u465e21b1maab21ac630064c2e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glib-2.0_2.22.1 breaks build of mc
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
X-List-Received-Date: Wed, 14 Oct 2009 17:00:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2009 at 7:51 AM, David Kozub <zub@linux.fjfi.cvut.cz> wrote=
:
> Hello,
>
> I bumped into an issue with glib-2.0_2.22.1. (dev branch, MACHINE=3Domapz=
oom2,
> DISTRO=3Dangstrom-2008.1)
>
> The library itself builds ok, but then when building midnight commander,
> do_compile choes, with the error being:
>
> In file included from
> /mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/=
glib-2.0/glib/gasyncqueue.h:34,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from
> /mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/=
glib-2.0/glib.h:34,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from glibcompat.c=
:29:
> /mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/=
glib-2.0/glib/gthread.h:
> In function 'g_once_init_enter':
> /mnt/data/zoom2/OE/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/=
glib-2.0/glib/gthread.h:344:
> error: size of array 'type name' is negative
>
> The error message still leaves me in the dark as for what actually happen=
ed.
> Anyway, the function in question looks like this:
>
> G_INLINE_FUNC gboolean
> g_once_init_enter (volatile gsize *value_location)
> {
> =C2=A0if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) !=3D =
NULL)
> =C2=A0 =C2=A0return FALSE;
> =C2=A0else
> =C2=A0 =C2=A0return g_once_init_enter_impl (value_location);
> }
>
> (line 344 is the g_atomic_pointer_get() call)
>
> Changing the argument of g_atomic_pointer_get into:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(volatile gpointer *)value_location
>
> seems to resolve the issue, but seeing the code for the first time - I
> wonder if it's ok.
>
> Anyway I did some digging arount the glib headers, and I think the typeca=
st
> is ok (as sizeof(gsize)=3D=3Dsizeof(gpointer), and that's hopefully garan=
teed).
>
> The trivial patch is here:
>
> http://linux.fjfi.cvut.cz/~zub/g_once_init_enter.patch

I already applied your patch. Thanks for submitting it.

>
> David
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


