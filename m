Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UWiQu-0005Qe-J1
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 09:23:39 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1CB4A4B0191;
	Mon, 29 Apr 2013 09:05:38 +0200 (CEST)
Date: Mon, 29 Apr 2013 09:05:36 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: laurentiu.palcu@intel.com
Message-ID: <20130429090536.10741da5@e6520eb>
In-Reply-To: <517E188E.6080309@intel.com>
References: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
	<1364296289-23374-1-git-send-email-laurentiu.palcu@intel.com>
	<517E188E.6080309@intel.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH v2] nss: change shebang line for smime script
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
X-List-Received-Date: Mon, 29 Apr 2013 07:23:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

Le Mon, 29 Apr 2013 09:51:58 +0300,
Laurentiu Palcu <laurentiu.palcu@intel.com> a =C3=A9crit :

> Ping!
>=20
> On 03/26/2013 01:11 PM, Laurentiu Palcu wrote:
> > This patch fixes the shebang line of the smime script and also adds a
> > 'perl' RDEPENDS for the main package since smime needs perl to run.
> >=20
> > Also, this patch fixes some do_rootfs failures when using RPM backend
> > because RPM automatically scans the files and, if perl scripts are
> > found, adds dependency on the file found in the shebang line (i.e.
> > /usr/local/bin/perl).
> >=20
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> > Changes in v2:
> >  * moved the RDEPENDS line at the end to conform with the style guide;
> >=20
pushed to master & dylan.

Thanks,
Eric


