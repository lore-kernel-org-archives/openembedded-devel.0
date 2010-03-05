Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NnasD-0002SR-Ev
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 17:59:38 +0100
Received: from [192.168.1.4] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 94D90584180
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Mar 2010 17:57:03 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <87hbou4x8f.fsf@SSpaeth.de>
Date: Fri, 5 Mar 2010 17:56:43 +0100
Message-Id: <F5DBF875-2CE0-4218-A2FD-45E83EE3AADD@vanille-media.de>
References: <87hbou4x8f.fsf@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Convert vala to new world staging
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
X-List-Received-Date: Fri, 05 Mar 2010 16:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

> All vala recipes currently complain about being lagacy stages. With a
> lot of help from my friends I came up with this patch for
> classes/vala.bbclass.
>=20
> diff --git a/classes/vala.bbclass b/classes/vala.bbclass
> index 2633905..2c23efb 100644
> --- a/classes/vala.bbclass
> +++ b/classes/vala.bbclass
> @@ -9,8 +9,8 @@ VALA_DONT_STAGE_VAPIS ?=3D =
"\(/config.vapi$\)\|\(/config.deps$\)"
>=20
> # .vapi and .deps files are arch independent and need to be present in =
the
> # staging datadir for the native vala compiler
> -do_stage_append() {
> -	install -d ${STAGING_DATADIR_NATIVE}/vala/vapi
> -	for VALAFILE in `find . -name "*.vapi" | grep -v =
"$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} =
${STAGING_DATADIR_NATIVE}/vala/vapi/; done
> -	for VALAFILE in `find . -name "*.deps" | grep -v =
"$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} =
${STAGING_DATADIR_NATIVE}/vala/vapi/; done
> +do_install_append() {
> +	install -d ${D}${datadir}/vala/vapi
> +	for VALAFILE in `find . -name "*.vapi" | grep -v =
"$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} =
${D}${datadir}/vala/vapi/; done
> +	for VALAFILE in `find . -name "*.deps" | grep -v =
"$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} =
${D}${datadir}/vala/vapi/; done
> }

This will only work for vala-native. All non-native packages inheriting =
vala will then fail to install their
.vapi files in STAGING_DATADIR_NATIVE, which is where vala-native =
expects them to be.

:M:



