Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvuRn-0004zn-1B for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 17:30:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvuOe-0001J7-Tq for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 17:27:28 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 17:27:28 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 17:27:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Mar 2010 17:27:16 +0200
Message-ID: <honsgk$anm$1@dough.gmane.org>
References: <FA726C33-C7BC-48C6-8507-475E87359AF5@dominion.thruhere.net>
	<20100327144204.GJ3458@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <20100327144204.GJ3458@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: QT4 and cmake patches
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
X-List-Received-Date: Sun, 28 Mar 2010 15:30:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-03-10 15:42, Martin Jansa wrote:
> On Sat, Mar 27, 2010 at 12:32:15PM +0100, Koen Kooi wrote:
>> I'm currently fixing outstanding bugs with our qt4 recipes so I can use them in and hostside as well as target side sdk and cmake support  would be helpfull :)
> 
> Have you seen this error? 

I see it now as well (only for qt4-x11 for some reason), and I'm trying
this fix:

- --- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -265,7 +265,7 @@ do_install() {

        # QT abuses $includedir to point to its headers, which breaks
pkgconfig sysroot, so manually fix it up here:
        for pc in ${D}${libdir}/pkgconfig/*.pc ; do
- -               sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename
$pc .pc):includedir}:" \
+               sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename
$pc .pc):prefix}/include:" \

Will push if it works.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLr3VUMkyGM64RGpERAkDFAJ9DsIVx86Z9bRz7Y1f86BTvLDkyNwCfZKR8
KenGmR1WHpR1eBzPVu51ptc=
=S21L
-----END PGP SIGNATURE-----



