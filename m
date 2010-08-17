Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlRRQ-0000Ih-JE
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:03:24 +0200
Received: by wwb34 with SMTP id 34so6936859wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:02:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.144.4 with SMTP id x4mr6277025wbu.59.1282071767022; Tue,
	17 Aug 2010 12:02:47 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Tue, 17 Aug 2010 12:02:46 -0700 (PDT)
In-Reply-To: <1282053425.2692.1179.camel@mill.internal.reciva.com>
References: <1281993972-8643-1-git-send-email-jkridner@beagleboard.org>
	<1282053425.2692.1179.camel@mill.internal.reciva.com>
Date: Tue, 17 Aug 2010 15:02:46 -0400
Message-ID: <AANLkTim+PyLBVfbeaTf75mh1WimHt6f7cidyz=OneDM+@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bison: add flex dependency
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
X-List-Received-Date: Tue, 17 Aug 2010 19:03:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2010 at 9:57 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2010-08-16 at 16:26 -0500, Jason Kridner wrote:
>> -DEPENDS =3D "virtual/libintl"
>> +DEPENDS =3D "virtual/libintl virtual/flex"
>
> Does this actually work?

No.  Sorry for the bad patch.

> =A0I couldn't immediately spot any obvious
> package which PROVIDES virtual/flex, and that sounds like a strange kind
> of virtual to have since I don't think there are any alternative
> implementations of flex. =A0(But if bison actually depends on lex
> generically, rather than flex specifically, it might make some sense to
> introduce a virtual/lex and have flex PROVIDE it.)
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


