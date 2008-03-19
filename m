Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JbxyZ-0002qa-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 14:05:10 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id EC8146280DF;
	Wed, 19 Mar 2008 14:05:02 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <frr19p$t15$1@ger.gmane.org>
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
	<1205928049.29700.7.camel@hammer.suse.cz> <frr19p$t15$1@ger.gmane.org>
Date: Wed, 19 Mar 2008 14:06:07 +0100
Message-Id: <1205931967.31039.6.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2008 13:05:14 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Stanislav Brabec schreef:
> | Koen Kooi wrote:
> |
> |> Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and
> |> should die. If we want packaged-staging and rm_work to function we
> |> need to fix them. Since we are all lazy we need some incentive:
> |
> | This policy is applied in OpenSUSE for several years. So if any packa=
ges
> | are broken upstream, you will find a fix in OpenSUSE nearly for sure.
>=20
> Great! Do you have a link to the patch repository?

It is still in TODO of the OpenSUSE team. Now you have two chances:

1) Download the whole source and extract patches:
http://download.opensuse.org/distribution/SL-OSS-factory/inst-source/suse=
/src/

And then unpacking (for RPM non-native platforms you can use alien or
rpm2cpio).

2) With (free) OpenSUSE Build Service account you can access:
https://build.opensuse.org/project/show?project=3DopenSUSE%3AFactory

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



