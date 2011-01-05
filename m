Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PaUeX-0005cB-JA
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 15:47:53 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEK00MB412WYI90@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Jan 2011 08:47:20 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 31F0AE; Wed, 05 Jan 2011 08:47:13 -0600
Received: from [192.168.1.12] by rkmorris.us with HTTP; Wed,
	05 Jan 2011 08:47:10 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Wed, 05 Jan 2011 08:47:10 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294238830971940500@rkmorris.us>
In-reply-to: <AANLkTimbxOoZQRPQ+MsSNT++aXYnJsta8VmOA_Nbmc-k@mail.gmail.com>
References: <1294198349769396500@rkmorris.us>
	<AANLkTim22AbOed09n1Ez6A2gtJhnjUDm3Ksv+tRDnn=8@mail.gmail.com>
	<AANLkTimbxOoZQRPQ+MsSNT++aXYnJsta8VmOA_Nbmc-k@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Wed, 05 Jan 2011 14:47:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

As I don't know you that well, not sure if you're joking or not - but in a=
ny case my apologies if I seem impatient ... that's not my intention at lea=
st! Just trying to debug here, and keeping folks in the loop as I progress.=
 If the armv4t builds don't really work I'm likely not the only person impa=
cted, so I'd like to help others avoid the issue if possible.

=20

I have applied the patch, and have started the build from scratch. Fingers=
 crossed ... :-).

=20

FYI - I did look in the old TMPDIR, and found that inside gcc-cross-initia=
l (and intermediate), the test directory seemed to call out an armv5te, so =
I'm hopeful that this is the issue.

=20

Thanks for all your help!

=20

... Russell


On Wed, Jan 5, 2011 01:42  AM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
here is updated patch
>=20
>=20
>=20
> On Tue, Jan 4, 2011 at 10:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Jan 4, 2011 at 7:32 PM, Russell Morris <openembedded@rkmorris.=
us> wrote:
> >> Hi,
> >>
> >>
> >>
> >> A bit more info to try and help out here - as I'm fighting with this =
as best I can, but it's still kicking my butt ... :-).
> >>
> >>
> >>
> >> It really does look like the executable that is being created is not =
build for the arm920t (armv4t). I have tried to run the executable on the t=
arget, and also with a modified version of qemu - and neither one works. If=
 I tell qemu that the target is an arm920t the executable will not run, but=
 if I let it be the default qemu-arm it runs just fine.
> >>
> >>
> >>
> >> Has anyone else been able to get an OE build to run on an arm920t (ar=
mv4t) processor?
> >>
> >>
> >
> > OK you seem to be one patient guy :) Here is totally untested patch
> > for gcc. Please apply it on top of your openembedded. Then use
> > DISTRO=3Dminimal
> > or any other distro that uses gcc 4.5 and build OE from scratch again
> > and see if that helps and report back.
> >
> > Thanks
> > -Khem
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From openembedded@rkmorris.us Wed Jan 05 15:49:08 2011
Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PaUfk-0005d1-F0
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 15:49:08 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173011.mailsrvcs.=
net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEK00MDH157YI90@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Jan 2011 08:48:44 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 393506; Wed, 05 Jan 2011 08:48:38 -0600
Received: from [192.168.1.12] by rkmorris.us with HTTP; Wed,
	05 Jan 2011 08:48:36 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Wed, 05 Jan 2011 08:48:36 -0600
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1294238916100625500@rkmorris.us>
In-reply-to: <ig1b7c$j8n$1@dough.gmane.org>
References: <1294198349769396500@rkmorris.us> <ig1b7c$j8n$1@dough.gmane.or=
g>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe] H1940 Boot Issues -> Executable Build Problems?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/open=
embedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject
