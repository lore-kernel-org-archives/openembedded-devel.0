Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwrX5-000804-JH for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 08:36:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwrTy-0007Se-8i for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 08:32:54 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 08:32:54 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 08:32:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 31 Mar 2010 08:32:39 +0200
Message-ID: <houqa6$sei$1@dough.gmane.org>
References: <18e217241003301757i23125ed4g3bb55a795ff5db02@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <18e217241003301757i23125ed4g3bb55a795ff5db02@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native recipes use legacy staging.
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
X-List-Received-Date: Wed, 31 Mar 2010 06:36:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-03-10 02:57, C Michael Sundius wrote:
> why does the native.bbclass force the use of legacy staging?
> 
> also how can I override this. I tried go use create my own
> 
> do_stage() {
>    :
> }
> 
> function in my recipe, but the one in the class was still used.
> 
> My issue is that my install function does not use make at all, nor autotools
> 
> so the do_stage_native() call [from do_stage() ] fails.

Try:

PR = "031110"

BBCLASSEXTEND = "native nativesdk"

SRC_URI = "file:///home/sundism/src/mkimage-tools"

S = ${WORKDIR}/mkimage-tools

do_compile() {
        :
}


do_install() {
        install  -m 0755 -d ${D}${bindir}
        install  -m 0755 ${S}/bin/imgen ${D}${bindir}/imgen
        install  -m 0755 -d ${D}${datadir}
        install  -m 0755 -d ${D}${datadir}/LxLoad
        install  -m 0644 ${S}/share/LxLoad/LxLoad2_cronus.img \
                ${D}${datadir}/LxLoad/LxLoad2_cronus.img
}

NATIVE_INSTALL_WORKS = "1"

regards,

Koen



> 
> thanks
> 
> see my [smiple] recipe attached:
> 
> 
> 
> PR = "031110"
> 
> BBCLASSEXTEND = "native nativesdk"
> 
> #SRC_URI = "http://sauscupoe01.cisco.com/cisco/mkimage-tools-${PR}.tar.gz"
> SRC_URI = "file:///home/sundism/src/mkimage-tools"
> 
> S = ${WORKDIR}/mkimage-tools
> 
> do_compile() {
>         :
> }
> 
> 
> do_install() {
>         install  -m 0755 -d ${STAGING_BINDIR}
>         install  -m 0755 ${S}/bin/imgen ${bindir}/imgen
>         install  -m 0755 -d ${datadir}
>         install  -m 0755 -d ${datadir}/LxLoad
>         install  -m 0644 ${S}/share/LxLoad/LxLoad2_cronus.img \
>                 ${datadir}/LxLoad/LxLoad2_cronus.img
> }
> 
> do_stage() {
>         :
> }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLsuyGMkyGM64RGpERAio6AJ9PjMeb+iq2Am3tjN+P+19s0ptidACfYTEs
FYAeax4moDD7wBXztg7mpTQ=
=ETCW
-----END PGP SIGNATURE-----



