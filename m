Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id E9C566D75D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:18:13 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so3159949eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 04:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p7G4Q4oZ9Xms+M8jT46e1BGgvMYUl/smho834V3cuPo=;
	b=H9/NtfGWGXgPpYyOiznmlPLxfteBGFAvPu4UWZLJoFPlI+wQFU8JRhDZkW1HfOOnZO
	NFNdCpW9riHMvvfBQeHalV3J93Dz6v/XQFTNRknKocqdjTXGjLJev6+cf9R/Yi7KTpDB
	MJ408gkWJn/8v//a81hZ48c3bGXMw5lQhBRBJjy/vhmEWCkBVkro5EeXhccO8TDRL5Ux
	PjdDfHmF0vFiR3T29aueazhqHS96dZbpRf02EDNIV015r4Ch/aegErtaL7etzMccPdMF
	0bhm9rVZrCSClYvFE6PQTtv6MIRFqvehZI7p1a9FtZftvHizAK1S1efqGxjRA8hUldf+
	ZtZg==
X-Received: by 10.14.198.132 with SMTP id v4mr23934667een.43.1393244294213;
	Mon, 24 Feb 2014 04:18:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm53200609eef.14.2014.02.24.04.18.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 04:18:12 -0800 (PST)
Date: Mon, 24 Feb 2014 13:18:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140224121811.GC26981@jama>
References: <1393238980-18471-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1393238980-18471-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] vim: add (custom) license file
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
X-List-Received-Date: Mon, 24 Feb 2014 12:18:15 -0000
X-Groupsio-MsgNum: 48301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline

--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 11:49:40AM +0100, Matthieu Crapet wrote:
> This is will delete this message:
> WARNING: vim: No generic license file exists for: vim in any provider

couple of lines seem to be wrapped by your e-mail client, can you resend
it?

>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-oe/licenses/vim | 81=20
> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 meta-oe/licenses/vim
>=20
> diff --git a/meta-oe/licenses/vim b/meta-oe/licenses/vim
> new file mode 100644
> index 0000000..4aa818e
> --- /dev/null
> +++ b/meta-oe/licenses/vim
> @@ -0,0 +1,81 @@
> +VIM LICENSE
> +
> +I)  There are no restrictions on distributing unmodified copies of Vim=
=20
> except
> +    that they must include this license text.  You can also distribute
> +    unmodified parts of Vim, likewise unrestricted except that they must
> +    include this license text.  You are also allowed to include=20
> executables
> +    that you made from the unmodified Vim sources, plus your own usage
> +    examples and Vim scripts.
> +
> +II) It is allowed to distribute a modified (or extended) version of Vim,
> +    including executables and/or source code, when the following four
> +    conditions are met:
> +    1) This license text must be included unmodified.
> +    2) The modified Vim must be distributed in one of the following five=
=20
> ways:
> +       a) If you make changes to Vim yourself, you must clearly describe=
=20
> in
> +	  the distribution how to contact you.  When the maintainer asks you
> +	  (in any way) for a copy of the modified Vim you distributed, you
> +	  must make your changes, including source code, available to the
> +	  maintainer without fee.  The maintainer reserves the right to
> +	  include your changes in the official version of Vim.  What the
> +	  maintainer will do with your changes and under what license they
> +	  will be distributed is negotiable.  If there has been no negotiation
> +	  then this license, or a later version, also applies to your changes.
> +	  The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
> +	  changes it will be announced in appropriate places (most likely
> +	  vim.sf.net, www.vim.org and/or comp.editors).  When it is completely
> +	  impossible to contact the maintainer, the obligation to send him
> +	  your changes ceases.  Once the maintainer has confirmed that he has
> +	  received your changes they will not have to be sent again.
> +       b) If you have received a modified Vim that was distributed as
> +	  mentioned under a) you are allowed to further distribute it
> +	  unmodified, as mentioned at I).  If you make additional changes the
> +	  text under a) applies to those changes.
> +       c) Provide all the changes, including source code, with every cop=
y=20
> of
> +	  the modified Vim you distribute.  This may be done in the form of a
> +	  context diff.  You can choose what license to use for new code you
> +	  add.  The changes and their license must not restrict others from
> +	  making their own changes to the official version of Vim.
> +       d) When you have a modified Vim which includes changes as=20
> mentioned
> +	  under c), you can distribute it without the source code for the
> +	  changes if the following three conditions are met:
> +	  - The license that applies to the changes permits you to distribute
> +	    the changes to the Vim maintainer without fee or restriction, and
> +	    permits the Vim maintainer to include the changes in the official
> +	    version of Vim without fee or restriction.
> +	  - You keep the changes for at least three years after last
> +	    distributing the corresponding modified Vim.  When the maintainer
> +	    or someone who you distributed the modified Vim to asks you (in
> +	    any way) for the changes within this period, you must make them
> +	    available to him.
> +	  - You clearly describe in the distribution how to contact you.  This
> +	    contact information must remain valid for at least three years
> +	    after last distributing the corresponding modified Vim, or as long
> +	    as possible.
> +       e) When the GNU General Public License (GPL) applies to the=20
> changes,
> +	  you can distribute the modified Vim under the GNU GPL version 2 or
> +	  any later version.
> +    3) A message must be added, at least in the output of the ":version"
> +       command and in the intro screen, such that the user of the=20
> modified Vim
> +       is able to see that it was modified.  When distributing as=20
> mentioned
> +       under 2)e) adding the message is only required for as far as this=
=20
> does
> +       not conflict with the license used for the changes.
> +    4) The contact information as required under 2)a) and 2)d) must not=
=20
> be
> +       removed or changed, except that the person himself can make
> +       corrections.
> +
> +III) If you distribute a modified version of Vim, you are encouraged to=
=20
> use
> +     the Vim license for your changes and make them available to the
> +     maintainer, including the source code.  The preferred way to do thi=
s=20
> is
> +     by e-mail or by uploading the files to a server and e-mailing the=
=20
> URL.
> +     If the number of changes is small (e.g., a modified Makefile)=20
> e-mailing a
> +     context diff will do.  The e-mail address to be used is
> +     <maintainer@vim.org>
> +
> +IV)  It is not allowed to remove this license from the distribution of=
=20
> the Vim
> +     sources, parts of it or from a modified version.  You may use this
> +     license for previous Vim releases instead of the license that they=
=20
> came
> +     with, at your option.
> +
> +=3D=3D=3D
> +Read more about this license at=20
> http://vimdoc.sourceforge.net/htmldoc/uganda.html#license
> --=20
> 1.8.5.4
>=20
>=20
>=20
> About Ingenico (Euronext: FR0000125346 ??? ING)
> Ingenico is a leading provider of payment solutions, with over 20 million=
=20
> terminals deployed in more than 125 countries. Its 4,000 employees=20
> worldwide support retailers, banks and service providers to optimize and=
=20
> secure their electronic payments solutions, develop their offer of=20
> services and increase their point of sales revenue. More information on=
=20
> http://www.ingenico.com/ | http://twitter.com/Ingenico.
> This message may contain confidential and/or privileged information. If=
=20
> you are not the addressee or authorized to receive this for the addressee=
,=20
> you must not use, copy, disclose or take any action based on this message=
=20
> or any information herein. If you have received this message in error,=20
> please advise the sender immediately by reply e-mail and delete this=20
> message. Thank you for your cooperation.
> P Please consider the environment before printing this e-mail
>=20
>=20
>=20

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLOIMACgkQN1Ujt2V2gBxI9ACfYCboaEa6w22dfV5lHMkjHwzT
WP4An0E/yUl1gR4hjyEk7TxRENZ6hpXi
=CmOB
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
