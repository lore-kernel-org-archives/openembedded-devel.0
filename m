Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhdXf-00076q-TU for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 08:42:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhdWv-0007Sp-Tu for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 08:41:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 08:41:33 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 08:41:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 08:41:20 +0100
Message-ID: <ihlur0$iqp$1@dough.gmane.org>
References: <201101242322.30470.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <201101242322.30470.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
Subject: Re: Question regarding gettext 0.18
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
X-List-Received-Date: Tue, 25 Jan 2011 07:42:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-11 23:22, Andreas Mueller wrote:
> Dear OE folks,
> 
> during working on new recipes for clutter 1.4.2 I face the following issue:
> 
> Compiling fails with the message
> 
>> Making all in po
>> make[2]: Entering directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
>> *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.18
>> make[2]: *** [check-macro-version] Error 1
>> make[2]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
>> make[1]: *** [all-recursive] Error 1
>> make[1]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2'
>> make: *** [all] Error 2
>> FATAL: oe_runmake failed
>> ERROR: Function do_compile failed
> 
> I checked google & git-log for a hint on that - nothing (yet).
> 
> It smells as a simple solution - but I am not able to find it. Can somebody please give me a hint how to solve?

I use this in gstreamer:

# gstreamer uses AG_GST_GETTEXT which autotools.bbclass doesn't grep for
do_configure_prepend() {
    glib-gettextize --force --copy || true
}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPn6gMkyGM64RGpERAn7eAJ9l8042WD/KJQ3oomVfzJqTN4D8mwCguP68
y4VcljOVhLwkpozUXwunYwM=
=oFIC
-----END PGP SIGNATURE-----



