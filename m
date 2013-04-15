Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URoRa-0002xK-2z
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 20:47:58 +0200
Received: by mail-pb0-f51.google.com with SMTP id rr4so2648266pbb.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=pH7pIXpxPbNZtFABDo5KK3qNLdl4TvaT8vkf746SEVY=;
	b=LZF/ODA9rNeVSawTC3wUErPS3qj3fmeE1D2iYiTSEOP8h4HgvhX/RKl4JVpp+NfPRh
	Z6HGLc67lIWYdJdNPhcAhq9D99rTj/7MHHkyEvpepSOskyVNwcR4fnJGxmXxUFNO4NPc
	t3dvIldcEq3qET5ERlxbCpH+adMIfFMxt5lGfsO2EQFHwqZYYjs89Go8C8K2MsD/xwDI
	6LIq11bQ7MBq5+EeqDMIGJVIN2kOjYBjZeFFdQkbJMhGFwOskYHV8m/ZDNUO0WWImH5m
	gVsdEc3cgI5k8p0GhnkKYqxXUN6d5Y2Vx6fte9xAGWoFRkLBWexj24RHlszfFmWxRvD8
	N5mw==
X-Received: by 10.66.121.169 with SMTP id ll9mr30864026pab.178.1366050627975; 
	Mon, 15 Apr 2013 11:30:27 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id vv6sm3121863pab.6.2013.04.15.11.30.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 11:30:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130413134648.GE2477@jama>
Date: Mon, 15 Apr 2013 11:30:26 -0700
Message-Id: <09C342D7-E206-4731-905B-C92EB56FFF97@gmail.com>
References: <20130413134648.GE2477@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: Consistent indentation in meta-openembedded metadata
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
X-List-Received-Date: Mon, 15 Apr 2013 18:48:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 13, 2013, at 6:46 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> Hi,
>=20
> maybe you remember my proposal to make whitespace consistent for =
python
> and shell tasks a while back:
>=20
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.ht=
ml
>=20
>    * This change is only aesthetic (unlike indentation in Python
>    * tasks).
>    * Some recipes were using tabs.
>    * Some were using 8 spaces.
>    * Some were using mix or different number of spaces.
>    * Make them consistently use 4 spaces everywhere.
>    * Yocto styleguide advises to use tabs (but the only reason to keep
>      tabs is the need to update a lot of recipes). Lately this advice
>      was also merged into the styleguide on the OE wiki.
>    * Using 4 spaces in both types of tasks is better because it's less
>      error prone when someone is not sure if e.g.
>      do_generate_toolchain_file() is Python or shell task and also =
allows
>      to highlight every tab used in .bb, .inc, .bbappend, .bbclass as
>      potentially bad (shouldn't be used for indenting of multiline
>      variable assignments and cannot be used for Python tasks).
>=20
> I still have some scripts for semi-automatic conversion.
>=20
> Now close to creating dylan branch for meta-openembedded is imho best
> time to do this, not many changes from released dylan will be =
backported
> to danny, because people will start moving to newer release instead of
> backporting more and more stuff to old one (also resolving possible
> whitespace merge conflict it not hard). Causing conflicts for merge =
was
> IIRC most important reason why my proposal was rejected for oe-core.
>=20
> meta-efl, meta-webos(-ports), meta-smartphone layers are already using=20=

> it for some time and meta-openembedded recipes are using spaces in =
shell=20
> tasks in majority of recipes.
>=20
> If nobody objects I'll run my scripts after all pending patches are
> merged.
>=20

I think this is a good idea, so we do not confuse ourselves between =
python and shell and some times
both are mixed in same file. But as long as its in one big swoop it =
should be fine.

Thanks for doing it.


> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



