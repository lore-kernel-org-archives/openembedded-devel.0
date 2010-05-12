Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1OCGm1-000490-1k
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:35:14 +0200
Received: by vws5 with SMTP id 5so359025vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ExJGkkP6D5VNLh2t0BQqbcExBUdfMe2wqMFx4ffsSSc=;
	b=GtK4ifncUwP2lgfpGkAYUN2/nZxhOPgkODgSqKHF6v0RA9ayXBSFEFmFOI73mHVv5m
	hVPpb+0mm1+Xcijq97OUkQ5AJbFS7O0+LWAEx1ZDeEjgwGX+21EI8aABa1own4V4M+Wx
	J7yKK+8Y1mvTS0hQZ9TG+ZHxSoHDS6oP5jbyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Hm2FRFI9/WnpMru5Dr5MPkHbxXQ61TU7sLONwFD+4Kf1ouSyGQU8STgSBH+FUOC6f4
	GyYmbHQyGt+5R+DtT5py6WrsugFxmR4JQoBGyLtkujX72Eqxp8dJPH9al/KAuw0D4AYb
	UpY+XHuV49sOujquKC4Nr66ba0NiTSUGQEOSk=
MIME-Version: 1.0
Received: by 10.229.237.83 with SMTP id kn19mr3464893qcb.8.1273689077728; Wed, 
	12 May 2010 11:31:17 -0700 (PDT)
Received: by 10.229.83.210 with HTTP; Wed, 12 May 2010 11:31:17 -0700 (PDT)
In-Reply-To: <41445.39732.qm@web57908.mail.re3.yahoo.com>
References: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
	<41445.39732.qm@web57908.mail.re3.yahoo.com>
Date: Wed, 12 May 2010 11:31:17 -0700
Message-ID: <AANLkTinPyEXFpcArHS9CAcreilKlCWFeQ97UHWhicaHQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Wed, 12 May 2010 18:35:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2010 at 11:14 AM, hong zhang <henryzhang62@yahoo.com> wrote=
:
> what command like bitbake xxx you used?

I used bitbake eet

Steve



> --- On Wed, 5/12/10, Steve Sakoman <sakoman@gmail.com> wrote:
>
>> From: Steve Sakoman <sakoman@gmail.com>
>> Subject: [oe] eet: CROSS COMPILE Badness on x86_64 build machine
>> To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
>> Date: Wednesday, May 12, 2010, 1:08 PM
>> Building from recent pull of oe.dev
>> (yesterday)
>>
>> Anyone else seeing this?
>>
>> Steve
>>
>>
>> ERROR: function do_compile failed
>> ERROR: log data follows
>> (/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/temp/log.do_compile.29091)
>> | NOTE: make -j 4
>> | make=A0 all-recursive
>> | make[1]: Entering directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet'
>> | Making all in src
>> | make[2]: Entering directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src'
>> | Making all in lib
>> | make[3]: Entering directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src/lib'
>> |=A0=A0=A0CC
>> =A0=A0=A0libeet_la-eet_lib.lo
>> |=A0=A0=A0CC
>> =A0=A0=A0libeet_la-eet_data.lo
>> |=A0=A0=A0CC
>> =A0=A0=A0libeet_la-eet_image.lo
>> |=A0=A0=A0CC
>> =A0=A0=A0libeet_la-eet_cipher.lo
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
>> /usr/include/eina-0
>> | cc1: internal compiler error: in add_path, at
>> c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for
>> instructions.
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
>> /usr/include/eina-0
>> | cc1: internal compiler error: in add_path, at
>> c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for
>> instructions.
>> | make[3]: *** [libeet_la-eet_image.lo] Error 1
>> | make[3]: *** Waiting for unfinished jobs....
>> | make[3]: *** [libeet_la-eet_data.lo] Error 1
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
>> /usr/include/eina-0
>> | cc1: internal compiler error: in add_path, at
>> c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for
>> instructions.
>> | make[3]: *** [libeet_la-eet_lib.lo] Error 1
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
>> /usr/include/eina-0
>> | cc1: internal compiler error: in add_path, at
>> c-incpath.c:425
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>> | See <http://gcc.gnu.org/bugs.html> for
>> instructions.
>> | make[3]: *** [libeet_la-eet_cipher.lo] Error 1
>> | make[3]: Leaving directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src/lib'
>> | make[2]: *** [all-recursive] Error 1
>> | make[2]: Leaving directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet/src'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0=
+svnr48617-r1/eet'
>> | make: *** [all] Error 2
>> | FATAL: oe_runmake failed
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


