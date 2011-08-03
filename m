Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoYek-00059T-UW for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 12:26:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoYaV-0000s3-Nu for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 12:22:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 12:22:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 12:22:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Aug 2011 12:21:51 +0200
Message-ID: <j1b7fv$cac$1@dough.gmane.org>
References: <1312313539-3772-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1312313539-3772-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH] gcc-4.6: Bring in linaro patches upto 07.2011 release
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
X-List-Received-Date: Wed, 03 Aug 2011 10:26:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-08-11 21:32, Khem Raj schreef:
> I have build/run tested this patch on arm/mips/x86 and on ppc the image did not build so could not run the image but that a different issue right now being addressed in oe-core.
> 
> see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007343.html
> 
> Similarily x86-64 built fine but could not do boot testing since it is broken too see.
> 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007439.html
> 
> Otherwise angstrom/console-image booted for all above said arches successfully except ppc x86_64 for the reasons stated earlier. All builds were done from scratch w/o sstate

it doesn't apply for me:

$ contrib/patchwork/pw-am.sh 9083 9090
2011-08-03 12:20:19 URL:http://patches.openembedded.org/patch/9083/mbox/ [248463] -> "pw-am-9083.patch" [1]
Applying: gcc-4.6: Bring in linaro patches upto 07.2011 release
/OE/tentacle/sources/meta-openembedded/.git/rebase-apply/patch:63: trailing whitespace.

/OE/tentacle/sources/meta-openembedded/.git/rebase-apply/patch:142: trailing whitespace.

/OE/tentacle/sources/meta-openembedded/.git/rebase-apply/patch:188: trailing whitespace.

/OE/tentacle/sources/meta-openembedded/.git/rebase-apply/patch:200: space before tab in indent.
 	(const (symbol_ref "((enum attr_tune) arm_tune)")))
/OE/tentacle/sources/meta-openembedded/.git/rebase-apply/patch:211: trailing whitespace.

fatal: corrupt patch at line 5177
Patch failed at 0001 gcc-4.6: Bring in linaro patches upto 07.2011 release
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOOSE/MkyGM64RGpERAqkMAJ96qSnwmi8J84y+lwm8adGKt5zR0QCgs+ME
9RpXMWpHh1PCjoTFBxzhZrY=
=P34V
-----END PGP SIGNATURE-----



