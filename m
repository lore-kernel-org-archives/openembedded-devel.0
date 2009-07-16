Received: from [209.85.212.182] (helo=mail-vw0-f182.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MRXEr-0002mu-FH
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 22:07:33 +0200
Received: by vwj12 with SMTP id 12so384076vwj.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2009 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=QRs+FdUBH1czy1AZ6Cge3CIOI4znyZUpK90zx62UrfE=;
	b=x7YPB0I9E8BAyj3NFgApNBzhtS2oGKHsetvN2MHHS8NQ8xAdAWNLoJLo2+owuaWft8
	M1rVIFFb/NK1vRalSmOd27xb7JsatCCWO90EZNVgigD7eQyJLkSdjwSte3fSct2vXsIV
	Sn6crPJBM7jXQu4ncFD2dgIskb3iStQ+jmLS4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=YRwfLwjTIvzt7yqMl9KPIVdh0DZ17wRFDSYYWoqy2oxfKEENeAu1bKtue8OCpMgHl0
	JG8CkmMopygnxZUV5vm0OJY94XHkc0xa7iQ3Q8ZL5HjciE89GL+C6jGbLsAtNkgv/+hw
	EPSRM3vpoU6jfMDPX3IMmH89HHfV8bXu73fyU=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.220.99.144 with SMTP id u16mr221084vcn.119.1247774039061; Thu, 
	16 Jul 2009 12:53:59 -0700 (PDT)
In-Reply-To: <1247773452-11999-1-git-send-email-clarson@mvista.com>
References: <1247773452-11999-1-git-send-email-clarson@mvista.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 16 Jul 2009 12:53:39 -0700
X-Google-Sender-Auth: 55c925b7a64e1475
Message-ID: <b6ebd0a50907161253n1a07b83foc366807eb26771bd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Let the distro control whether we include hostap or madwifi.
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
X-List-Received-Date: Thu, 16 Jul 2009 20:07:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2009 at 12:44 PM, Chris Larson<clarson@mvista.com> wrote:
> - Add base_ifelse convenience function to base.bbclass.
> - Replace all conditionals in the recipes relating to hostap and madwifi =
to
> =C2=A0look for their name in COMBINED_FEATURES rather than looking for sp=
ecific buses (pci, pcmcia).
> - Change the default COMBINED_FEATURES to enable:
> =C2=A0- madwifi, when:
> =C2=A0 =C2=A0- 'pci', 'wifi', and 'madwifi' are in distro features
> =C2=A0 =C2=A0- 'pci' is in machine features
> =C2=A0- hostap, when:
> =C2=A0 =C2=A0- 'wifi' and 'hostap' are in distro features
> =C2=A0 =C2=A0- either 'pci' or 'pcmcia' are in both distro and machine fe=
atures
>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Erm, ignore the PR changes, I'll kill those.  This is one of the
changes I've made at MontaVista.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


