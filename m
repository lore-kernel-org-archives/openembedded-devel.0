Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1Qvuf7-0005C1-QG
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 19:21:18 +0200
Received: by gyg4 with SMTP id 4so254665gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cX/8OjgHH+3X8wbzrmIbB/y+FYJDGgjU9GR4EDdGKyg=;
	b=e7BE3X4Cm/jy+zbElbvCVJ7lwQ8nhAhCdjuEIfyg3hiT7OxFWdGGQGK+e3RULAY7oz
	HzPdguW9yjjC+KtjA73m5gvUP2fd6QQAAQDrE+JQcWrAqKh/QYoAVw6K/ECaZQr2/osv
	MPxnZ8RkoXfW29r88s9qpAhBslD5PKSalWO74=
MIME-Version: 1.0
Received: by 10.236.180.130 with SMTP id j2mr3673744yhm.88.1314119789493; Tue,
	23 Aug 2011 10:16:29 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Tue, 23 Aug 2011 10:16:29 -0700 (PDT)
In-Reply-To: <4E535B83.9080508@dresearch-fe.de>
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
	<4E5356B2.3060908@dresearch-fe.de> <4E53583A.3030405@gmx.net>
	<4E535B83.9080508@dresearch-fe.de>
Date: Tue, 23 Aug 2011 13:16:29 -0400
Message-ID: <CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Tue, 23 Aug 2011 17:21:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I suspect that the problem is happening earlier, classpath isn't building.
 the javac wrapper eats the return code from a java compile.

On Tue, Aug 23, 2011 at 3:49 AM, Steffen Sledz <sledz@dresearch-fe.de>wrote=
:

> On 23.08.2011 09:35, Robert Schuster wrote:
> > Hi,
> >
> > Am 23.08.2011 09:28, schrieb Steffen Sledz:
> >>>> | Making all in native
> >>>> | make[3]: Entering directory
> `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/a=
rmv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src/native'
> >>>> | Making all in include
> >>>> | make[4]: Entering directory
> `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/a=
rmv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src/native/inclu=
de'
> >>>> |
> /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroot=
s/x86_64-linux/usr/bin/cacaoh-0.99.3/cacaoh
> -bootclasspath
> ../../../src/classes/classes:/home/sledz/work/angstrom-setup-scripts/buil=
d/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/clas=
spath/glibj.zip
> -d . java.lang.Class
> >>>> | java.lang.ClassNotFoundException: java/lang/Object
> > Can you check the mentioned glibj.zip file whether it really contains a
> > java/lang/Object.class file and whether the path is right, etc.?
>
> The path seems to be right, but glibj.zip does not contain the mentioned
> classes. For complete content see attached output of
>
> zipinfo
> /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroot=
s/armv7a-angstrom-linux-gnueabi/usr/share/classpath/glibj.zip
>
> >>> I'm not a java expert, but could this be related to <
> http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D344>?
> > Quickly looking at it I'd say its not related as it is about building
> > cacao as part of icedtea7.
>
> Regards,
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

