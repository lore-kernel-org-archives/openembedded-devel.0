Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RtVI0-0000kx-Gw
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:23:44 +0100
Received: by wgbdt11 with SMTP id dt11so1949930wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pZl15/miMVzSX58kobDAMQ1VEnYLxLKeaJLac5iX6eQ=;
	b=AM4OIEOGL144Cz4425AA0lu5uWkCr/UxXOHkSAzaCoLAht2oWSNNgGCx7n3xKRAOH8
	hWZWXy6Rh175ke7UURVD9adcMU/e6XvrZbYhN95e57YEJhNqMMQUOVzw1LbID9ofOUsH
	VCQUePZ/lNJbEDy18swEq/cBZ+6jC8OZ/HSrM=
MIME-Version: 1.0
Received: by 10.180.96.161 with SMTP id dt1mr782539wib.13.1328321746731; Fri,
	03 Feb 2012 18:15:46 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.51.69 with HTTP; Fri, 3 Feb 2012 18:15:46 -0800 (PST)
In-Reply-To: <CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
	<20120203154742.GM3893@jama.jama.net>
	<CAP9ODKoaqi96Bzktk=TC0dXmz6YV1v-1vAAgaqc+qE02Rpd81Q@mail.gmail.com>
	<CAAQYJAvfYLRcYw7fKVogjkwuST-b4oYMCH4_VZG6P8Xy5QgjgQ@mail.gmail.com>
	<jghu9u$dqo$2@dough.gmane.org>
	<CALbNGRQ+qOr43Nkr5ja6E8V_VVD-e2ZTaFCd1Lga=CYaRVFt-w@mail.gmail.com>
Date: Fri, 3 Feb 2012 20:15:46 -0600
X-Google-Sender-Auth: 4I5DaQIySzWlQfgRp-u0as-GvMo
Message-ID: <CAPOJ94NwJJYeTm5w-W84u2VL3=Qk0O6X864z5irbR-XGA0fvOg@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Sat, 04 Feb 2012 02:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 3, 2012 at 8:00 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>>> Which recipes really depend on systemd during build? I know about
>>> polkit, something else?
>
> udisks [1]

Yeah, but that might be a consequence of udisks depending on polkit.
It was a libsystemd-login reference in a polkit .la file dependency
that made me install that patch so I could get udisks to build.

>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-January/=
037230.html
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


