Received: from bsmtp3.bon.at ([213.33.87.17] helo=lbmfmo03.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q0Fia-0001l0-2l for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 17:06:32 +0100
Received: from bsmtp.bon.at (unknown [192.168.181.104])
	by lbmfmo03.bon.at (Postfix) with ESMTP id D3CE6CE6E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 17:04:48 +0100 (CET)
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id B23141300B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 16:54:32 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2011 16:54:31 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<1300360258.2132.14668.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5144@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5144@GSX300A.mxchg.m.corp>
MIME-Version: 1.0
Message-Id: <201103171654.31619.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Thu, 17 Mar 2011 16:06:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, 17. M=E4rz 2011, 13:53:27 schrieb Hauser, Wolfgang (external=
):
> > Mark some files in ${sysconfdir} as configuration files so they are
> not blindly overwritten when upgrading
>=20
> I would suggest a pre-/post processing in the packages, like debian
> does.
> If a config file exists or is changed, the current File will be rotated
> or, if possible, left as it is and the new=20
> file is installed beside the changed one.

The opkg does not touch a present config file, but installs the new file wi=
th the name *-opkg
So if you do a find /etc -name \*-opkg you see the conflicts.

Any sensible conversion from old to new config file should be made by the p=
ackage itself.


