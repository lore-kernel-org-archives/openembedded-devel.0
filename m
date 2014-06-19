Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A228A6FD1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:11:19 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so1990095wgg.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6YdJtx/X9/tflPskKLAjlTcRqJxsx6lGhzwQh0nqzc8=;
	b=d5K2yWhkCRYZxsD4KfFYif7sY3BF/u6duP7wuNKBHMxA1T7Rclq1nYCfg5FLMtO0dV
	vx+Tocvou6wVbtYAL2A6R9QIlccqWQLCU3he5BRCkp82AmkKQGA5Oa/WBntG+95rjt56
	92orIjyhNvkOInbWWKrGXTCZkQExKgECx0B9rpXJgjKwFJYENC6CcwpDdXCca+bWme8P
	1Lu7EJwSBL14JqJzSQkiLgmkvqe64q+JvjpQvNfZY2DHDfWismhWTjsEc80VXuFETFbk
	GqBStthlQgGgt109Ab9HAjcF1l6XfDM77K2NpbGKh/95Oltm/71Z6LxZWMDcGtXHnix5
	5hdA==
X-Received: by 10.194.58.199 with SMTP id t7mr3749621wjq.14.1403169079972;
	Thu, 19 Jun 2014 02:11:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jv9sm7413923wjc.28.2014.06.19.02.11.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:11:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 11:11:20 +0200
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20140619091120.GN2117@jama>
References: <1403153175-10707-1-git-send-email-rongqing.li@windriver.com>
	<53A29291.1010700@dominion.thruhere.net>
	<53A29E1D.9080307@windriver.com> <20140619084640.GM2117@jama>
	<53A2A49A.8040903@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53A2A49A.8040903@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] dialog: use pkg-config to detect ncurses
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
X-List-Received-Date: Thu, 19 Jun 2014 09:11:21 -0000
X-Groupsio-MsgNum: 50416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/TUrtqMIkCP4YtJm"
Content-Disposition: inline

--/TUrtqMIkCP4YtJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 04:51:38PM +0800, Rongqing Li wrote:
>=20
>=20
> On 06/19/2014 04:46 PM, Martin Jansa wrote:
> > On Thu, Jun 19, 2014 at 04:23:57PM +0800, Rongqing Li wrote:
> >>
> >>
> >> On 06/19/2014 03:34 PM, Koen Kooi wrote:
> >>>> +Subject: [PATCH] use pkg-config for ncurses detection. +
> >>>>> +Upstream-Status: Inappropriate [configuration]
> >>> Why is it inappropriate?
> >>
> >>
> >> I think we should fix the configure.in, but this configure.in can not
> >> work with oe-core, the dialog bb file runs configure directly, and
> >> I do this fix in configure directly, so it is Inappropriate
> >
> > Can you please fix dialog-static as well? It probably doesn't even work=
 with B!=3DS.
> >
>=20
>=20
> Yes, I fixed it in this patch

Ah sorry, I didn't notice, can you please mention brokensep in commit
message?

> -Roy
>=20
> > | DEBUG: Executing shell function do_configure
> > | gnu-configize: 'configure.ac' or 'configure.in' is required
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at /home/je=
nkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueab=
i/dialog-static/1.1-20120706-r0/temp/log.do_configure.20677)
> > NOTE: recipe dialog-static-1.1-20120706-r0: task do_configure: Failed
> >
> > Otherwise it will be PNBLACKLISTED this weekend (together with a lot of=
 other unmaintained recipes)
> >
> >
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/TUrtqMIkCP4YtJm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOiqTgACgkQN1Ujt2V2gBxriQCeIjdfyZW67Sct41I0NPaAtabO
lx4An1iVKghFP5InFv/ZJVGJeKveNc7e
=zrPb
-----END PGP SIGNATURE-----

--/TUrtqMIkCP4YtJm--
