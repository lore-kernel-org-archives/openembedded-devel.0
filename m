Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWThE-0003sH-Cg for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 14:25:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWTcW-0005JV-GW for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 14:20:56 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 14:20:56 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 14:20:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 07 Jul 2010 14:20:46 +0200
Message-ID: <i11reu$af5$1@dough.gmane.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C15@deimsg40.de.net.world><1278498389.2345.1744.camel@mill.internal.reciva.com>	<i11m2f$o0b$1@dough.gmane.org>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501819C48@deimsg40.de.net.world>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C48@deimsg40.de.net.world>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is there a recipe for building and using busybox with libbusybox out there ?
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
X-List-Received-Date: Wed, 07 Jul 2010 12:25:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-07-10 14:01, Hauser, Wolfgang (external) wrote:
> As I am a little new in OE, where you suggest to add a post process command to remove
> the S98configure ?
> 
> In the image recipe ? In the busybox recipe ?

in the image recipe using something like:

ROOTFS_POSTPROCESS_COMMAND += " ; rm file"

regards,

Koen

> 
> Append to which command ?
> 
> Regards 
> Wolfgang Hauser
>   
> -----Ursprüngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag von Koen Kooi
> Gesendet: Mittwoch, 7. Juli 2010 12:49
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] Is there a recipe for building and using busybox with libbusybox out there ?
> 
> On 07-07-10 12:26, Phil Blundell wrote:
>> On Wed, 2010-07-07 at 11:45 +0200, Hauser, Wolfgang (external) wrote:
>>> I want to use busybox with the applet binaries linked against libbusybox
>>> in our system.
>>> We need a wide range of applets at the same time, so I suppose it will
>>> save overall needed memory space.
> 
>> What's the advantage of this?  I would have thought it would give you a
>> larger memory footprint rather than a smaller one.  I guess I must be
>> missing something.
> 
>>> Also I want to prevent the system from updating alternatives while the
>>> first boot. We have to provide a read only root file system.
> 
>> Yeah, this is a long-standing piece of OE suckage.  We should fix the
>> alternative selection to work at image construction time.
> 
> OE already does that. But what it does after that is flag everything as
> 'unpacked' to have opkg rerun all postinsts at boot *again*. If OE
> didn't run u-a at image time we wouldn't be able to use sysvinit for
> example.
> If you only care about u-a, just add a post process command to remove
> the S98configure from the rootfs and opkg won't run.
> 
> In the long run a way to control this behaviour and optionally hook into
> qemu or even targets over network to run them at image time. Having to
> run a first boot, remove ssl keys and repackage everything is getting a
> bit tedious.
> 
> regards,
> 
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMNHEeMkyGM64RGpERAlb/AJ94spQyrbNfaJRTFlrNT0UG4h9lfgCfWDcZ
/NBxZJl6VUWy+XT34c75Mp8=
=V5gc
-----END PGP SIGNATURE-----



