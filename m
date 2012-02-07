Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RunSO-0007FQ-1T
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:59:48 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 07:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64087255"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 07:39:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 07 Feb 2012 15:39:16 +0000
Message-ID: <2290568.0amlKfqkN1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1328627573-5217-3-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 02/27] initmanager.bbclass: inital add
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
X-List-Received-Date: Tue, 07 Feb 2012 15:59:48 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 07 February 2012 16:12:28 Andreas M=FCller wrote:
> initmanager_packets(d): returns the required initmanager-packets. The=
 result
> is based upon INIT_MANAGER. Currently the values 'systemd' and 'sysvi=
nit'
> are supported for INIT_MANAGER.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/initmanager.bbclass |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/classes/initmanager.bbclass
>=20
> diff --git a/meta-oe/classes/initmanager.bbclass
> b/meta-oe/classes/initmanager.bbclass new file mode 100644
> index 0000000..2f8e2ce
> --- /dev/null
> +++ b/meta-oe/classes/initmanager.bbclass
> @@ -0,0 +1,10 @@
> +# returns the packets initmanager requires in image
> +def initmanager_packets(d):
> +=09init_manager =3D d.getVar('INIT_MANAGER', 0) or ""
> +=09# default: just a suggestion - to be discussed?
> +=09pks_initmanager =3D 'systemd'
> +=09if init_manager =3D=3D 'systemd':
> +=09=09pks_initmanager =3D 'systemd'
> +=09elif init_manager =3D=3D 'sysvinit':
> +=09=09pks_initmanager =3D 'sysvinit sysvinit-pidof'
> +=09return pks_initmanager

Would it be possible to turn this on its head and merge=20
systemd.bbclass/update-rc.d.bbclass into one so that it does the approp=
riate=20
thing for whatever INIT_MANAGER is set to for every recipe that uses it=
?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


