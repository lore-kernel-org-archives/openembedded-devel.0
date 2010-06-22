Received: from ausc60ps301.us.dell.com ([143.166.148.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OR595-0000Lx-S3
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 17:12:16 +0200
X-Loopcount0: from 10.166.62.177
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Jun 2010 10:06:27 -0500
Thread-Topic: Re: [oe] [PATCH] Add a waf bitbake class. (Koen Kooi)
Thread-Index: AcsSHHzVVAdly0SJRVKtQhwD4bcO8Q==
Message-ID: <113134CF306E8E4CACC27BE5937261B209313293D8@AUSX7MCPS303.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Jun 2010 15:06:29.0124 (UTC)
	FILETIME=[7DECB440:01CB121C]
X-SA-Exim-Connect-IP: 143.166.148.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add a waf bitbake class. (Koen Kooi)
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
X-List-Received-Date: Tue, 22 Jun 2010 15:12:17 -0000
X-Groupsio-MsgNum: 20358
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_113134CF306E8E4CACC27BE5937261B209313293D8AUSX7MCPS303A_"

--_002_113134CF306E8E4CACC27BE5937261B209313293D8AUSX7MCPS303A_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Tom Rini wrote:
> > Sean_Hudson at Dell.com wrote:
> >> On 18-06-10 21:58, Koen Kooi <k.kooi at student.utwente.nl> wrote:
> >> ------------------------------
> >>> On 18-06-10 21:58, Sean_Hudson at Dell.com wrote:
> >>>> Hi All,
> >>>>
> >>>>   We are using waf for some of our modules and decided to add a
> >>>> class to make it easier to write recipes.
> >>> Why is there still a staging method in there? Those have been depreca=
ted
> >>> for months now.
> >>
> >> Thanks for taking the time to reply.  To answer your question, the waf
> >> class was cloned from the autotools.bbclass, so the staging stuff came
> >> from there.  Is there a better way to handle the staging?
> >>
> >> It's a fairly trivial class, but I'm interested to hear if anyone had
> >> any additional thoughts on ways to improve the class?
> >
> > Koen's point is that for a long time now do_stage has been set as legac=
y
> > and 'do_install' should instead set things up such that a package can
> > then be installed into the sysroots/ directory and reused.  Like
> > autotools.bbclass does today :)
>
> And to be more clear, see is_legacy_staging in staging.bbclass

Thanks for clearing that up.  I've attached an updated version that drops t=
he staging function.

--_002_113134CF306E8E4CACC27BE5937261B209313293D8AUSX7MCPS303A_
Content-Type: application/octet-stream; name="waf.bbclass"
Content-Description: waf.bbclass
Content-Disposition: attachment; filename="waf.bbclass"; size=516;
	creation-date="Tue, 22 Jun 2010 10:05:12 GMT";
	modification-date="Mon, 21 Jun 2010 17:37:35 GMT"
Content-Transfer-Encoding: base64

IyBXQUYgcHJvamVjdCBjbGFzcy4KCkRFUEVORFMgKz0gcHl0aG9uCgojIENvbmRpdGlvbmFsbHkg
c2V0IHRoZSB2ZXJib3NlIG9wdGlvbi4KIyBXQUZfVkVSQk9TRT0iLXYiCgp3YWZfZG9fY29tcGls
ZSgpIHsKCS4vd2FmICR7V0FGX1ZFUkJPU0V9IGJ1aWxkIAp9Cgp3YWZfZG9fY2xlYW4oKSB7Cgku
L3dhZiAke1dBRl9WRVJCT1NFfSBjbGVhbgp9Cgp3YWZfZG9fY29uZmlndXJlKCkgewoJaWYgWyAt
eCAke1N9L3dhZiBdOyB0aGVuCgkJJHtTfS93YWYgJHtXQUZfVkVSQk9TRX0gY29uZmlndXJlIC0t
cHJlZml4PSR7cHJlZml4fSAke0VYVFJBX09FQ09ORn0gIiRAIgoJZWxzZQoJCW9lZmF0YWwgImV4
ZWN1dGFibGUgd2FmIHNjcmlwdCBub3QgZm91bmQiCglmaQp9Cgp3YWZfZG9faW5zdGFsbCgpIHsK
CS4vd2FmICR7V0FGX1ZFUkJPU0V9IGluc3RhbGwgLS1kZXN0ZGlyPSIke0R9IiAiJEAiCn0KCkVY
UE9SVF9GVU5DVElPTlMgZG9fY29tcGlsZSBkb19jbGVhbiBkb19jb25maWd1cmUgZG9faW5zdGFs
bCAK

--_002_113134CF306E8E4CACC27BE5937261B209313293D8AUSX7MCPS303A_--
