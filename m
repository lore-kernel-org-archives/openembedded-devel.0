Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1Nkf9m-00007G-Dc
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 15:57:43 +0100
Received: by gwaa20 with SMTP id a20so2105876gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=AQ5pMR6afpiJoqLD6Z02xc5ybiljpXmUTQo3Rkp8Tx0=;
	b=lih8YD3+owuHLgUB89LEk5Pw9JO7v867emjMu9WMvHMpJHyaDgpSMPczgCL+GJn1LV
	ZqfuAwjNUshSSZoxWIslGk8qBf/NyZZ07uQEghKFA/MdlSE35QpQOVL/G1MpC0CnAVOF
	Z/hnndXC5Xqt3TzLkvOyFeass8DPNQfgSHcj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qHQ3LqEh4hv9xwHfxN9Kjnbazp9l3f6MVn/K6t8hZuCZy/Q+rK0WhF2ydhulgaVZ34
	UJGXQI/Kl/7AGldpGFYDag2/2hwLPx4KF/pbjolfp71LbBXRVojvc9Lord/KBvnhWz8E
	VeIOFFioHWEVe0kXtlAEsIaX6oWm52q6Fy+YE=
MIME-Version: 1.0
Received: by 10.90.40.17 with SMTP id n17mr88384agn.3.1267109679137; Thu, 25 
	Feb 2010 06:54:39 -0800 (PST)
Date: Thu, 25 Feb 2010 20:24:38 +0530
Message-ID: <ad82c8891002250654r42248855x6b0a871b6b9acee1@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error while building minimo web browser
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
X-List-Received-Date: Thu, 25 Feb 2010 14:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi.
      I am building minimo web browser for compulab Em-x270 board.
It is giving  following error while building "bitbake minimo"

me/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/include/orbit-2.0
-I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/include/dbus-1.0
-I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include
-I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/include/glib-2.0
-I/home/vivek/development/em-x270/stuff/build/oetmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
*| checking MOZ_GCONF_LIBS...   -lgconf-2 -lglib-2.0
| checking for libgnome-2.0 >= 2.0... configure: error: iconv() not found.
Cannot enable native uconv support.
| *** Fix above errors and then restart with               "make -f
client.mk build"
| make: *** [configure] Error 1
| FATAL: oe_runmake failed*
NOTE: Task failed:
/home/vivek/development/em-x270/stuff/build/oetmp/work/armv5te-angstrom-linux-gnueabi/minimo-1_0.02+cvs20070626-r1/temp/log.do_configure.9520
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
minimo_cvs.bb do_configure failed
ERROR: Task 5
(/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
minimo_cvs.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 1710 tasks of which 1710 didn't need to be
rerun and 1 failed.
ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
minimo_cvs.bb' failed

Please help me in building minimo web browser.

with regards
vivek tambakad

