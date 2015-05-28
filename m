Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6F12F7568E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 07:14:36 +0000 (UTC)
Received: by wifw1 with SMTP id w1so49892470wif.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 00:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=mYeqe9HKd2MmOJ7dvFKUp0Jr1gTWgSgOrSuF+htRASc=;
	b=kkTlcuIfIqcqJeSxyuhkRiwFHwVdh4rBfaRDUNKKfm6RK4HpesEyqxHoG7NDB4r8jh
	++rtRyR8B/k3Ko8JAySVGMdujVln2eIjB7Mo64FMd0ECfVmG2AIztaYc/G3gK3MAg4pe
	rYgkQZ1gT6xSipwCWmBiN7XsMBe0CozFa1+fa/W5nxiVYITA3fb6b4XC3vJOhOOjdugD
	RUJIVBzuPorKFylDCGEd3ALghzYYKg723Vl0KqNV4Kcc3kKaAa8pVLg6k0IrV+MthIQF
	QePw3ndwDvY9zAF7AlPTaS1T0SSHlnkBBJLRN35Vdeo28hRzGZBnnNRhJUa9eput+55A
	N+IA==
X-Received: by 10.180.216.40 with SMTP id on8mr13484011wic.55.1432797276975;
	Thu, 28 May 2015 00:14:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l6sm7054900wib.18.2015.05.28.00.14.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 00:14:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 09:14:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150528071458.GA2383@jama>
References: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
	<34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
	<CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser] [PATCH 2/2] chromium, cef: fetch chromium source from git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 May 2015 07:14:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2015 at 09:09:24AM +0200, Zoltan Kuscsik wrote:
> On 28 May 2015 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > +do_fetch_chromium_source_from_git() {
> > > +  cd ${S}
> > > +  export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> > > +
> > > +  # Note: --deps-file needs to set to .DEPS.git for syncing to old
> > > +  # chromium versions
> > > +  gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=3D".DEPS.git"
> > > +
> > > +  # Runhooks is disabled. Running the hooks will trigger the
> > > +  # gyp_chromium command replaced with cef_create_projects.sh by
> > > +  # cef3.
> > > +
> > > +  gclient sync -f --nohooks --revision src@${CHROMIUM_SRC_GIT_COMMIT}
> > > +
> > > +  # We need the lastchange hook to generate the LASTCHANGE revision =
info
> > > +  # file.
> > > +
> > > +  python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
> > > +}
> >
> >
> > small nit. formatting is not correct for this shell function.
> >
>=20
> Z: Could you explain this in more details?

Use 4 spaces for indentation (everywhere).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

