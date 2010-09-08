Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OtDfu-0006q4-EX
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 07:58:27 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OtDfE-0000Rg-Nz from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 22:57:44 -0700
Received: from 137.202.157.210 ([137.202.157.210]) by eu2-mail.mgc.mentorg.com
	([137.202.76.30]) via Exchange Front-End Server
	webmail.mentor.com ([192.94.38.218]) with Microsoft Exchange
	Server HTTP-DAV ; Wed,  8 Sep 2010 05:57:43 +0000
Received: from pkl-fusman-ubuntu by webmail.mentor.com;
	08 Sep 2010 10:57:47 +0500
From: Fahad <Fahad_Usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
References: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
Organization: Mentor Graphics
Date: Wed, 08 Sep 2010 10:57:47 +0500
Message-ID: <1283925467.17152.1.camel@pkl-fusman-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] java-library.bbclass: do_stage is not needed anymore
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
X-List-Received-Date: Wed, 08 Sep 2010 05:58:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-09-07 at 00:02 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/java-library.bbclass |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>=20
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
> index 904b4f1..5ce0537 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -65,7 +65,3 @@ do_install() {
>  java_stage() {
>    oe_jarinstall -s ${JARFILENAME} ${ALTJARFILENAMES}
>  }
Shouldn't you remove this java_stage function as well, as it won't be
called anymore.
> -
> -do_stage() {
> -  java_stage
> -}



