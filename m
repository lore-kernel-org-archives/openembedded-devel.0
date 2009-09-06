Received: from [203.97.37.64] (helo=smtp4.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MlDMj-0006j0-PH
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 04:57:05 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp4.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KPK00FJ9M538710@smtp4.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Sep 2009 10:22:17 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id 5912A5CE25B	for
	<openembedded-devel@lists.openembedded.org>; Mon,
	07 Sep 2009 10:22:15 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id CN5eIYz6V-yo	for
	<openembedded-devel@lists.openembedded.org>; Mon,
	07 Sep 2009 10:22:10 +1200 (NZST)
Received: from [192.168.1.130] (unknown [192.168.1.130])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 8996C5CE220	for
	<openembedded-devel@lists.openembedded.org>; Mon,
	07 Sep 2009 10:22:10 +1200 (NZST)
Date: Mon, 07 Sep 2009 10:22:10 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <4AA3EE5E.70409@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <4AA43612.8070808@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
References: <4AA3ABA8.304@eukrea.com>
	<200909061703.48206.holger+oe@freyther.de> <4AA3EE5E.70409@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-SA-Exim-Connect-IP: 203.97.37.64
X-SA-Exim-Mail-From: matthew@4d-electronics.co.nz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Wed, 09 Sep 2009 02:57:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On 07/09/09 05:16, Eric B=E9nard wrote:
> Holger Hans Peter Freyther a =E9crit :
>> On Sunday 06 September 2009 14:31:36 Eric B=E9nard wrote:
>>> Without this, tslib loads properly the module_raw (input in my ca=
se)=20
>>> but
>>> none of the module (pthres, linear & co) defined in ts.conf (desp=
ite=20
>>> the
>>> fact ts_test & co are running fine).
>>
>> Please google for the QWS_MOUSE_PROTO environement variable... tsl=
ib=20
>> support is built as a plugin and Qt needs to be instructed to load=
 it.
>>
> of course, without this variable it's not loaded at all.
> But even with this variable, it doesn't work for me with=20
> -plugin-mouse-tslib but works with -qt-mouse-tslib.
> I tried :
> tslib:/dev/input/event0 & tslib:/dev/input/touchscreen0
>
> In fact, the module_raw (input) is properly loaded (which means QT =
was=20
> instructed by QWS_MOUSE_PROTO to use tslib and TSLIB_PLUGINDIR is=
=20
> properly set) but the other modules (pthres, linear & co) are not=
=20
> properly loaded (from what I saw with strace they are found, opened=
,=20
> and closed). If I comment out all the modules (not module_raw) from=
=20
> ts.conf everything is properly loaded but of course tslib gives raw=
=20
> values to QT so touchscreen is unusable.
>
> Eric

Actually, the problem is that tslib is linked incorrectly.
The pthres, linear, etc. modules are not linked to libts so theyre=
=20
missing symbols when an attempt is made to load them.
To confirm, do

LD_PRELOAD=3D/usr/lib/libts-1.0.so.0 <args>

tslib modules will resolve symbols properly so tslib will work.

A quick patch to tslib to link those modules against libts is below.
A little dirty linking against the static libs, but it works!

Add to tslib_1.0.bb SRC_URI.

~Matt


--- tslib.orig/plugins/Makefile.am
+++ tslib/plugins/Makefile.am
@@ -107,15 +107,19 @@ pluginexec_LTLIBRARIES =3D \

  variance_la_SOURCES    =3D variance.c
  variance_la_LDFLAGS    =3D -module $(LTVSN)
+variance_la_LIBADD     =3D $(top_builddir)/src/libts.la

  dejitter_la_SOURCES    =3D dejitter.c
  dejitter_la_LDFLAGS    =3D -module $(LTVSN)
+dejitter_la_LIBADD     =3D $(top_builddir)/src/libts.la

  linear_la_SOURCES      =3D linear.c
  linear_la_LDFLAGS      =3D -module $(LTVSN)
+linear_la_LIBADD       =3D $(top_builddir)/src/libts.la

  pthres_la_SOURCES      =3D pthres.c
  pthres_la_LDFLAGS      =3D -module $(LTVSN)
+pthres_la_LIBADD       =3D $(top_builddir)/src/libts.la

  # hw access
  corgi_la_SOURCES       =3D corgi-raw.c



