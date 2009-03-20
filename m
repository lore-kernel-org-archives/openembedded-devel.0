Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aloisio.almeida@openbossa.org>) id 1LkiVh-0007ZJ-Ue
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 18:28:08 +0100
Received: by yw-out-1718.google.com with SMTP id 9so842381ywk.30
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 10:26:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.151.102.21 with SMTP id e21mr6842094ybm.148.1237570013534; 
	Fri, 20 Mar 2009 10:26:53 -0700 (PDT)
In-Reply-To: <gpr569$535$1@ger.gmane.org>
References: <49BFA406.6030802@bolloretelecom.eu>
	<20090317143526.3e79150c@vanille.zapto.org>
	<49BFADB1.3090207@bolloretelecom.eu> <20090317171705.208a7d31@kmfms>
	<49C107E3.30505@bolloretelecom.eu> <gpr569$535$1@ger.gmane.org>
Date: Fri, 20 Mar 2009 14:26:53 -0300
Message-ID: <1d6c95c90903201026g709b2adfja5f5a6f8384cc798@mail.gmail.com>
From: Aloisio Almeida <aloisio.almeida@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Fri, 20 Mar 2009 17:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Yep,

In the same build that you cross-compile qt4-x11-free, you can compile
native qt-tools (qmake/moc/uic/rcc), just using properly 'platform'
and 'xplatform' configure flags and two different specs.

I already created qt4.bbclass that is based on qt4/qt_*.inc and do all
the required work to build qt. The native qt tools binaries and the
specs are being sent to staging and a new qmake.bbclass are using them
to build qmake based applications.

This new approach avoid the use of the qmake-native and uicmoc-native
recipes and give to oe build system a big vantage: Use the same qmake
to build qt and all qt-based applications.

I'm still testing the new bbclasses to build qt-4.5.0. When I finish,
I'll send the patch to this list for comments.

regards
Aloisio

On Wed, Mar 18, 2009 at 12:49 PM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> On 18-03-09 15:40, Jeremy Lain=E9 wrote:
>
>> If someone can help shed some light on this, I'm all ears!
>
> Contact the indt guys, Aloisio wrote a qt4 class from scratch that
> completely removed the needs from qmake*bbclass and qmake*bb.
>
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


