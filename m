Received: from [85.37.16.7] (helo=smtpout09.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1LUe26-0003Pb-Qj
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 10:27:29 +0100
Received: from FBCMFE02B15.fbc.local ([192.168.30.161]) by
	smtpout09.attiva.biz with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 4 Feb 2009 10:26:55 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B15.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 4 Feb 2009 10:26:49 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <49871B9D.3040202@gmail.com>
References: <1233059140.7818.4.camel@ubuntu2> <497F0D92.4040904@gmail.com>
	<1233136141.7444.3.camel@ubuntu2> <49802D8A.6020208@gmail.com>
	<1233227644.6517.5.camel@ubuntu2> <49832BE7.6090801@gmail.com>
	<1233586679.6429.5.camel@ubuntu2>  <49871B9D.3040202@gmail.com>
Date: Wed, 04 Feb 2009 10:27:10 +0100
Message-Id: <1233739630.6176.4.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 04 Feb 2009 09:26:49.0811 (UTC)
	FILETIME=[B5201230:01C986AA]
Subject: Re: Build problems
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
X-List-Received-Date: Wed, 04 Feb 2009 09:28:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry, don't know...

Now the image works !

Then I try to build a gpe-image, but i get an error at the last step.

Thanks in advance,

Paolo



| /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux/4.2=
.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2: ig=
noring invalid character `\001' in script
| /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux/4.2=
.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2: sy=
ntax error in VERSION script
| collect2: ld returned 1 exit status
| make[4]: *** [libgdk_pixbuf-2.0.la] Error 1
| make[4]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/gtk+-2.14.2'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task
failed: /home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
+-2.14.2-r1/temp/log.do_compile.22403
NOTE: package gtk+-2.14.2-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gtk+-2.14.2: failed
ERROR: Build of /home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
+_2.14.2.bb do_compile failed
ERROR: Task 951 (/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
+_2.14.2.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 1003 tasks of which 788 didn't need to be
rerun and 1 failed.
ERROR: '/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk+_2.14.2.bb'
failed
NOTE: build 200902040809: completed






On lun, 2009-02-02 at 17:13 +0100, Marco Cavallini wrote:
> Paolo Cremonese ha scritto:
> > Fine, waiting for GRUB patch. (what is "hrw" ?)
> >=20
> > My target has not hard disk, only CF.
> > To run the image, do I need a RAMFS ?
> > And in this case, I have to add it to the GRUB "menu.lst" ?
>=20
> Paolo,
> hrw is Marcin Juszkiewicz, an OE developer and mantainer.
> GRUB patch was pushed this morning and is ready for use into git mainstre=
am.
>=20
> Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
> --
> Marco Cavallini | KOAN sas | Bergamo - Italia
>  embedded and real-time software engineering
>    Atmel third party certified consultant
> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>       http://www.KoanSoftware.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



