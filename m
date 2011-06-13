Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aguirre.nicolas@gmail.com>) id 1QWCfv-0000U5-UK
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 21:19:52 +0200
Received: by pvc30 with SMTP id 30so2372543pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=OdZeTJKFyrCUQfSLNodEGMNScwZIPgLZm8II0JBU3k4=;
	b=lZ1L+imGAXrkdVbMEWtOXCSu33m1LT4R5GTW9ZGhgo5IFx/PszvGDfAT1qCLHelA+p
	9ijgGEu9zqRWFFGQz8+hofl/sOZxcNRBGLweN1R1XZzLbJ67VEjSgUb8CC57XSQ3j/Fx
	ri9nqx2HTjAzCva6+hERTkz5bUd9ZtAQmww48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=xJ1+eEiztlMZxjLxCEYkZQgi3Y0qrZQFbhPEizTX/btffh2xh/DsfEnGgHoMbQfhLK
	EaGXYOXf3Xy1OnqV4qjpyrOcuytEYV4luiNEbRhu6rVIPqk/NfHAiv0gsJh1jfNoZcvx
	S4P0To4aeODIZePVLEk0jjFONQVSBFefxZ620=
Received: by 10.68.28.136 with SMTP id b8mr2292096pbh.457.1307992586265; Mon,
	13 Jun 2011 12:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.225 with HTTP; Mon, 13 Jun 2011 12:16:06 -0700 (PDT)
In-Reply-To: <BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Mon, 13 Jun 2011 21:16:06 +0200
Message-ID: <BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 19:19:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/6/13 Pau Espin Pedrol <pespin.shar@gmail.com>:
> Hi, thanks for reviewing it ;)
>
> 2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>
>
>> Please also paste the important parts of the segfault into the commit
>> message.
>>
>
> I don't have the segfault right now because I've using buil enjoy with th=
is
> patch for few days since now. Basically it seems that emotion is using
> autodetect gst pipe element, which in turn is using alsa.
>
> I think it was this file/line in emotion:
> emotion_gstreamer_pipeline.c: =A0 sink =3D
> gst_element_factory_make("autoaudiosink", "audiosink");
>
> I'm using SHR distro.
>
> I'll send new patch version now.
>
> --
> Pau Espin Pedrol
> mail/jabber: pespin.shar@gmail.com
> http://blog.espeweb.net
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

If you think there is a problem in emotion, we could fix it upstream ?

--=20
Nicolas Aguirre
Mail: aguirre.nicolas@gmail.com
Web: http://enna.geexbox.org
Blog: http://dev.enlightenment.fr/~captainigloo/


