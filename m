Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1A96B593
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 18:04:56 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to:references:mime-version:content-type;
	b=Wc332j9rMOveGNizA8bSUR/JI8aopmaFKqGq5XPkn5b/gN/kHtAwz1KjKsbqz1dRMlix1Q9+eLqt
	qCjEzHk69vSfHLT+uH85dpzxzBTQdfbYnl4Kt7vB3MdJXPvQ7yIa  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1396029894291338.47695786418547;
	Fri, 28 Mar 2014 11:04:54 -0700 (PDT)
From: Diego <diego.ml@zoho.com>
To: Philip Balister <philip@balister.org>
Date: Fri, 28 Mar 2014 19:04:50 +0100
Message-ID: <1487041.bBRm1EH4qA@localhost.localdomain>
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <5335B790.1010107@balister.org>
References: <45034856.Fj98ikVczS@localhost.localdomain>
	<5335B790.1010107@balister.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ntpd fails to start if libcap not installed
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
X-List-Received-Date: Fri, 28 Mar 2014 18:04:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

In data venerd=EC 28 marzo 2014 10:55:28, Philip Balister ha scritto:
> On 03/28/2014 06:40 AM, Diego wrote:
> > Hi openembedders!
> >=20
> > I've noticed that if ntp is built without libcap, ntpd fails to sta=
rt from
> > the initscript:
> > /etc/init.d/ntpd
> >=20
> > giving the error:
> > Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disable=
d --
> > built without --enable-clockctl or --enable-linuxcaps
> > ntpd - NTP daemon program - Ver. 4.2.6p5
> > USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=3D| }<val>] ]...
> >=20
> > That is caused by the line:
> > start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p
> > /var/run/ntp.pid "$@"
> >=20
> > and in particular by the option "-u ntp:ntp" which is not supported=
 which
> > is not supported if ntp is build without --enable-clockctl.
> >=20
> > Is anybody else experiencing this problem?
>=20
> Oddly enough, I was about to report the symptom today also :)
>=20
> Any ntp experts know what the proper solution is? I'd be glad to prop=
ose
> a patch.
>=20

Hi Philip,

I'd like to rephrase better my statement, as I put two errors in it:
The problem is caused by the option "-u ntp:ntp" which is not supported=
 if ntp=20
is build without "--enable-linuxcaps".

As far as the manual goes, the "--enable-clockctl" is a build option fo=
r=20
NetBSD:
http://www.eecis.udel.edu/~mills/ntp/html/ntpd.html

Removing the "-u ntp:ntp" makes the initscript work, but I don't know i=
f=20
shipping different ntpd initscripts based on pkgconfig is the correct t=
hing to=20
do. Any expert opinion?

Bests,
Diego



