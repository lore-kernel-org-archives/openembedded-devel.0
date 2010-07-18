Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1OaUiI-0000Zi-Gh
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 16:19:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 5226D1416BB2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 16:24:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cljMInAOsKH6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 16:24:26 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id CC4F01416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 16:24:25 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100716093325.GA1772@excalibur.local>
References: <4C3FA2D7.6020006@gmail.com>
	<20100716093325.GA1772@excalibur.local>
Date: Sun, 18 Jul 2010 16:19:06 +0200
Message-ID: <1279462746.9402.8.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lsof_4.83.bb: Make recipe buildable again.
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
X-List-Received-Date: Sun, 18 Jul 2010 14:19:33 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> Hello.
> 
> On Fri, 2010-07-16 at 09:37, Graham Gower wrote:
> > Breakage introduced by 74e32f114272668dfa4c88805741cf55ef965989.
> > Other recipes which call base_do_unpack directly do not share this issue.
> > 
> > Signed-off-by: Graham Gower <graham.gower@gmail.com>
> 
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
> 
> I just run into the same issue and this fixes it for me. Will check this in.

Does not work here. This change fixes it:

diff --git a/recipes/lsof/lsof_4.83.bb b/recipes/lsof/lsof_4.83.bb
index 0a5d557..8982a2c 100644
--- a/recipes/lsof/lsof_4.83.bb
+++ b/recipes/lsof/lsof_4.83.bb
@@ -3,7 +3,7 @@ Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2;name=lsof483tarbz2"
 SRC_URI[lsof483tarbz2.md5sum] = "8f731a6251b8c0143d585df0d5ca779e"
@@ -16,7 +16,7 @@ S = "${WORKDIR}/lsof_${PV}_src"
 do_unpackpost() {
 	tar x --no-same-owner -f ${LOCALSRC} -C ${WORKDIR}
 }
-addtask do_unpackpost before do_patch after do_unpack
+addtask unpackpost before do_patch after do_unpack
 
 export LSOF_OS = "${TARGET_OS}"
 LSOF_OS_linux-uclibc = "linux"


-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



