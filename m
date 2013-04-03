Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNWKU-000856-PQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 00:38:59 +0200
Received: by mail-pa0-f45.google.com with SMTP id kl13so1147586pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 15:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=uX41i3+TErZztuOk8/gBIETaWd1Qf6pCdCcTyILmL94=;
	b=w+cmfZ1KSlYLl5jmoIFawYTl0Hfg6s7dgpdmJBLD3N7b64rvSz1VoC95e6Qpa4iYvx
	2oCq+uUjdHsebWeJLq5uqjvrcQrbek9LHOjjyX3pXKzdxT5BgPfvz0gDSHZAkkN0nx8E
	3kCJHJa94Xq9gn/tQSBgAlLKLNBG6dCH83qfFwUsr5PxMln3prI/GCHXj7MHpXw86aYk
	OunU3vVSfjGil3Zv/RjaVks/Y2/igUJRzqGqoxVu0G0gIHmdwa/XGmtR3fPxnaxkM8dH
	GjvDDe3DPMQqv2moVQLqn+wfzznOiUuQq9p6dt2XhAplsy6ZNcr3Ak3nebGPuyaHnBQU
	gwLg==
X-Received: by 10.66.227.104 with SMTP id rz8mr6058580pac.85.1365027702255;
	Wed, 03 Apr 2013 15:21:42 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id gn2sm7476809pbb.22.2013.04.03.15.21.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 15:21:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrKkqBQ8BduoazZ+xj8U09yWAnUoGBR=P_bN_dY-q0SbQ@mail.gmail.com>
Date: Wed, 3 Apr 2013 15:21:40 -0700
Message-Id: <1E8177FC-75D6-4877-A3F3-12678E7505BF@gmail.com>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
	<515C8C04.3040904@balister.org>
	<4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
	<515C95F5.3080705@pseudoterminal.org>
	<CAP9ODKrKkqBQ8BduoazZ+xj8U09yWAnUoGBR=P_bN_dY-q0SbQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 22:39:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 3, 2013, at 2:45 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> On Wed, Apr 3, 2013 at 5:49 PM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> Okay, I think I see the problem now. DEFAULTTUNES should not be set =
by the
>> machine config. So, removing it
>> and fixing the README accordingly takes care of that. People who for =
example
>> want hardfp then
>> set DEFAULTTUNE ?=3D "marvellpj4hf" in their local.conf . Is this =
correct?
>=20
> You may provide a machine variant with has this set; so it will build
> a machine with this enabled.=20

I would say no. Weather to choose Hard float or not is more of a =
capability that machine exposes
but distro decided the policy see how its done in angstrom for beagle =
board and beagle bone

>=20
> Koen, would you be happy with it?
>=20
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



