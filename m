Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P0qcL-0008WD-H2
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 08:58:18 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 89F9E491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 08:58:07 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 08:58:07 +0200
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 1995F2A1C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 08:58:05 +0200 (CEST)
Message-ID: <4CA2E37C.6080301@dresearch.de>
Date: Wed, 29 Sep 2010 08:58:04 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100714 SUSE/3.0.6 Lightning/1.0b1
	Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285161497-13594-1-git-send-email-eric@eukrea.com>
	<AANLkTimojR-3LyNvVsYtt6njfbN3seEWMiziewW47GJR@mail.gmail.com>
In-Reply-To: <AANLkTimojR-3LyNvVsYtt6njfbN3seEWMiziewW47GJR@mail.gmail.com>
X-OriginalArrivalTime: 29 Sep 2010 06:58:07.0326 (UTC)
	FILETIME=[AB9667E0:01CB5FA3]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] classes/update-rc.d.bbclass: move update-rc after postinst
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
X-List-Received-Date: Wed, 29 Sep 2010 06:58:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/28/2010 06:09 PM, Martin Jansa wrote:
> On Wed, Sep 22, 2010 at 3:18 PM, Eric B=C3=A9nard <eric@eukrea.com> wro=
te:
>> without this, launching a daemon can fail if postinst is supposed, for
>> example, to fix permissions of directories used by the daemon.
>>
>> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>=20
> FYI: this maybe somehow broke syslog-ng postinst:
>=20
> Configuring syslog-ng.
> update-rc.d: /etc/init.d/syslog exists during rc.d purge (continuing)
>  Removing any system startup links for syslog ...
> update-rc.d: /etc/init.d/syslog-ng exists during rc.d purge (use -f to =
force)
> ...

BTW: This would be a good chance to add syslog-ng to the update-alternati=
ves handling for the various syslogs (see <http://thread.gmane.org/gmane.=
comp.handhelds.openembedded/32390>).

Steffen


