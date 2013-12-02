Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 112566DD15
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 15:04:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2013 07:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,811,1378882800"; d="scan'208";a="445349825"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 07:03:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sebastien MENNETRIER <s.mennetrier@innotis.org>
Date: Mon, 02 Dec 2013 15:03:05 +0000
Message-ID: <1618185.ZWhYWpivda@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABgO3_PQBTfeogsTJjSs6u_04jP5FceqVvqkRjNnpZgiOt+OaQ@mail.gmail.com>
References: <1385993511-14838-1-git-send-email-s.mennetrier@innotis.org>
	<l7i615$91m$1@ger.gmane.org>
	<CABgO3_PQBTfeogsTJjSs6u_04jP5FceqVvqkRjNnpZgiOt+OaQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] Add nginx http webserver
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
X-List-Received-Date: Mon, 02 Dec 2013 15:04:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 02 December 2013 15:56:34 Sebastien MENNETRIER wrote:
> 2013/12/2 Koen Kooi <koen@dominion.thruhere.net>
> > S=E9bastien Mennetrier schreef op 02-12-13 15:11:
> > > +    install -d ${D}${sysconfdir}/init.d +    cat ${WORKDIR}/init=
 | \ +
> > > sed -e 's,/usr/sbin/,${sbindir}/,g' \ +            -e
> > > 's,/etc/,${sysconfdir}/,g' > ${D}/${sysconfdir}/init.d/nginx +   =
 chmod
> > > 755 ${D}/${sysconfdir}/init.d/nginx
> >=20
> > I think using sed -i will be easier to understand, I haven't seen a=
ny pipe
> > based modifications in an OE recipe yet.
> >=20
 > This method is used in apache2 recipe... But I can modify if it's
> necessary.

Right, it's probably not ideal there either (and it was probably me tha=
t wrote=20
that...) When you do change this for the nginx recipe, be sure to sed -=
i the=20
destination file after copying (rather than the source before) so that =
re-
executing do_install will work.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

