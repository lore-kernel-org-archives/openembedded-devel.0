Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtHWn-0004Zg-3M
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:46:38 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so328689pad.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WqRFU72v6vNoHqwp08VVTXKgcntFJq8ofmsiE1rKc/c=;
	b=i1U5nDv3fOTBlFi7/SIn9MgyUy/zKLuuqKAFdoSUdt5ngtzOFfrWSJrRfcB2o43tw9
	KuBYahhXsKvcZ9lFxD4Zp6VdWcOzWvQmZx0KAhoHUPwZZAQjCsGloXV1o6aJcuvB+npH
	flPjHzT0FBxkoGL02It9ig9jkEhkQuiyp8v+yIMA/Ew5lqR671uXAJ8lsTD2gWEHqGl1
	9qPG/CqCVhT8Yj3YYbOv+lqBq7bwSHRTh2Fc7ghvXvFa+1dNK90M41xGpLsR+psIj0v+
	qVSodEBOWjZLf5oA0fLVEo0DhnndgfyQJMCtQhxiUXnAI2PoHWJt1S6oYE7rktWEo2ab
	+8yA==
X-Received: by 10.68.209.170 with SMTP id mn10mr219347730pbc.11.1357821083047; 
	Thu, 10 Jan 2013 04:31:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d9sm967004paw.33.2013.01.10.04.31.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 04:31:22 -0800 (PST)
Date: Thu, 10 Jan 2013 13:31:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110123127.GE3722@jama.palm1.palmone.com>
References: <1357814691-1724-1-git-send-email-noor_ahsan@mentor.com>
	<CALbNGRTY2_cAeE8GPKsLxiQE8iJaAVsOfe_9rpBRP0NcQ7LpXA@mail.gmail.com>
	<CALbNGRQYhMrEFDhbBPAcPyEejp9GkhuLwo4uStJCLP64Ap_Bpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQYhMrEFDhbBPAcPyEejp9GkhuLwo4uStJCLP64Ap_Bpg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: Remove systemd related things.
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
X-List-Received-Date: Thu, 10 Jan 2013 12:46:39 -0000
X-Groupsio-MsgNum: 42638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wwSkEpePV3aFlXly"
Content-Disposition: inline

--wwSkEpePV3aFlXly
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:58:06PM +0100, Andreas M=FCller wrote:
> On Thu, Jan 10, 2013 at 12:53 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Thu, Jan 10, 2013 at 11:44 AM, Noor, Ahsan <noor_ahsan@mentor.com> w=
rote:
> >> From: Noor Ahsan <noor_ahsan@mentor.com>
> >>
> >> * Autofs was being inherited from systemd. This class is only
> >> present in meta-systemd. So bitbake was giving parse error
> >> about systemd class. So removed systemd from inherit and
> >> removed SYSTEMD_PACKAGES and SYSTEMD_SERVICE.
> > Is this still true after auto BBMASKing?
> I misread the patch so please forget previous mail. But it would be
> nice to have an systemd append.

I'll forget also this mail, because it has systemd bbappend (Noor sent
it in separate patch). :)


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wwSkEpePV3aFlXly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDutJ8ACgkQN1Ujt2V2gBxhvQCff4xt5izZGtCHdfVOULyst5cs
yKAAoKuPVpd0u3Izl+aWhg1TDDWTHIUU
=eq2s
-----END PGP SIGNATURE-----

--wwSkEpePV3aFlXly--
