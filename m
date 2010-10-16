Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7CfR-0002Bb-CH
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:43:47 +0200
Received: by iwn2 with SMTP id 2so2285954iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=sbMShZ2BtuwLrgT97hehOeLRBKbco0YtHST7y4SfyU0=;
	b=qIPxZialWa4WhqjN8kila0SwuT09laH1N7Bdm3w46//OC7eURoyqDsddt8QSg5Vl4S
	Gd1ncTHaemhcrF/DkhaCuvaPvRbs4lHD51z60Ig4yLHOvJ7kjhyjHNre2ViN/YgsLeZS
	Gn1RQG2KMVI9hTDDIjJkGo+0D6WyN3nvztCqM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=kkdV5I1KQyn+Grd5KxiNVsJ+7y1R1zwTqh0c7yRcollE5q0Rtfx9wZnSfBB07+R2hw
	YzAB69LpOE1yYBxHQrBj5uJ+radLqifiVJ69+kwMesmFs3VKzWikbkv6FkvNNhfOThJF
	QvLMRWNjKZ4A2O8ZxMJDpEABywYaznz607URU=
MIME-Version: 1.0
Received: by 10.42.76.65 with SMTP id d1mr1833221ick.205.1287256554501; Sat,
	16 Oct 2010 12:15:54 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 12:15:54 -0700 (PDT)
Date: Sat, 16 Oct 2010 21:15:54 +0200
Message-ID: <AANLkTikvPnJupAjwCps+3Zc73jVNyd7Mm-X1PP307a-D@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: LICENSE, LICENSE and LICENSE
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
X-List-Received-Date: Sat, 16 Oct 2010 19:43:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Being bored while waiting for a build to finish, I decided to to a
grep for LICENSE on recipes/*/*

As already reported on an earlier email about 375 recipes have no
LICENSE (according to recipe_sanity).

After a little bit of editing and sorting I came to the list at the
end of this email.
First digit is the number a license occurs, 2nd field is the license itself.

Some concerns:
- GPL seems to be the most widely string used, but this does not say
too much. Is this v1, v2, v3, or maybe v1+, v2+, v3+
- Using ${PN} as license string might seem as a nifty way to save
typing a few letters, but it does not help with scripts that process
recipes
- we seem not too consistent wrt spelling wand writing things (for
example: GPLv2, GPLV2, GPL-2, GPL2)
- some of these use licenses that I have never heard of and for some I
have some doubts (e.g "closed" "various" "as-is" "python-style" ...)

BTW: I've no plans to clean this up. I've been there in another world,
and it is boring like hell (and in that world I was at least paid for
it)
Just want to pass the results.

Frans.

   1931 "GPL"
    604 "GPLv2"
    467 "LGPL"
    246 "MIT"
    181 "BSD"
    138 "Artistic|GPLv1"
    112 "GPLv3"
     37 "MIT BSD"
     35 "LGPLv2"
     32 "LGPLv2.1"
     28 "BSD-X"
     27 "unknown"
     26 "GPL LGPL"
     25 "PD"
     23 "TI"
     20 "MPL"
     18 "LGPLv2.1 GPLv3"
     18 "AL2.0"
     17 "MIT-X"
     16 "GPL QPL"
     14 "PSF"
     13 "${PN}"
     11 "LGPL GPL"
     10 "GPLv2+"
      8 "GPL-2"
      6 "nokia"
      6 "liboil"
      6 "Various"
      6 "LGPLv2.1+"
      5 "zlib"
      5 "Unknown"
      5 "OSL"
      5 "MIT/X11"
      5 "MIT/BSD"
      5 "GPLv2/LGPLv2.1"
      5 "GPLV2"
      5 "GPL/LGPL"
      5 "GPL LGPL FDL"
      5 "Classpath"
      5 "Boost Software License"
      5 "Artistic"
      4 ${CSL_LIC_RLE}
      4 "tcl"
      4 "http://creativecommons.org/licenses/by-sa/2.5/"
      4 "Intel Public Licence"
      4 "EPL"
      4 "Bitstream Vera"
      4 "BSD GPLv2"
      4 "Apache"
      4 "Apache License, Version 2.0"
      3 "wxWindows"
      3 "snes9x"
      3 "libffi"
      3 "Public Domain"
      3 "MPL1.1 GPL LGPL"
      3 "LGPL MPL"
      3 "GPLv3,LGPLv2.1,LGPLv3"
      3 "GPLv3+"
      3 "GPL+LGPL"
      3 "GPL LGPL AFL"
      3 "GPL BSD"
      3 "GPL AFL"
      3 "GPL + library exception"
      3 "GD"
      3 "BSD GPL"
      3 "As is"
      2 "pycrypto"
      2 "public domain"
      2 "povray"
      2 "netperf"
      2 "libgsm"
      2 "jpeg"
      2 "howl"
      2 "closed"
      2 "bzip2"
      2 "ZPL"
      2 "TI-BSD/GPLv2"
      2 "TI BSD"
      2 "QPL"
      2 "Public domain"
      2 "Perl"
      2 "PHP"
      2 "OSGPL"
      2 "MPL LGPL"
      2 "MPL GPL LGPL MIT"
      2 "LGPL-2 FDL-1.1"
      2 "LGPL 2.1/GPL 2/Apache 2.0"
      2 "LGPL / MPL"
      2 "Info-ZIP"
      2 "ISC"
      2 "IBM"
      2 "GPLv3 LGPLv3"
      2 "GPLv3 LGPLv2"
      2 "GPL with Classpath Exception"
      2 "GPL libsamplerate"
      2 "Embedded Widgets Demo License Agreement"
      2 "CPL"
      2 "CC-BY-SA3"
      2 "CC-BY"
      2 "BSD/OPENSSH"
      2 "BSD-like"
      2 "BSD-ADV"
      2 "Apache-2.0"
      2 "Apache License V2.0"
      2 "Apache BSD"
      2 "Adobe"
      2 "AURA"
      2 "AGG License"
      1 OFL"
      1 GPLv2
      1 "zsh"
      1 "zaurus-updater"
      1 "zaurus-installer"
      1 "xrdb"
      1 "xmame"
      1 "xbmc"
      1 "vim"
      1 "tcp-wrappers"
      1 "sudo"
      1 "snmp++"
      1 "sharp-binary-only"
      1 "shareware"
      1 "rtaudio"
      1 "proprietary-binary"
      1 "orc"
      1 "openssl"
      1 "ntp"
      1 "nsd"
      1 "ngrep"
      1 "makedev"
      1 "libpng"
      1 "libmng"
      1 "libdes"
      1 "julius"
      1 "http://www.gnu.org/software/cgicc/doc/cgicc_license.html"
      1 "http://www.cs.wustl.edu/~schmidt/ACE-copying.html"
      1 "gpl"
      1 "gpe-theme-foxbox"
      1 "freetype GPLv2"
      1 "freely distributable"
      1 "flite"
      1 "cron"
      1 "broadcom"
      1 "as-is"
      1 "XFree86"
      1 "X11"
      1 "X-MIT"
      1 "X-BSD"
      1 "VP8"
      1 "University of Washingtons Free-Fork License"
      1 "University of Illinois/NCSA Open Source License"
      1 "Unicode"
      1 "TI TSPA"
      1 "Sun Binary Code License Agreement"
      1 "Stanford"
      1 "Squeak License"
      1 "ST"
      1 "SIL Open Font License"
      1 "RCS"
      1 "Python-style"
      1 "Pine"
      1 "Perl Clarified Artistic License"
      1 "PYRAF"
      1 "PYCODES"
      1 "PSF ZPL"
      1 "PD/GPLv2"
      1 "OpenSSL"
      1 "OpenLDAP"
      1 "Open Market"
      1 "OSS"
      1 "OPL"
      1 "None"
      1 "Neotonic ClearSilver License"
      1 "NVIDIA"
      1 "Modified BSD"
      1 "Modified BSD License, Mesa 3-D License, Khronos License"
      1 "MetaKit"
      1 "MPL GPL LGPL"
      1 "MIT-style"
      1 "MIT GPLv2"
      1 "MIT + GPL"
      1 "Liberation"
      1 "LiPS"
      1 "LGPLv2.1/GFDL"
      1 "LGPLv2+"
      1 "LGPLv2 AFL"
      1 "LGPL2.1"
      1 "LGPL2+"
      1 "LGPL/MPL"
      1 "LGPL-3"
      1 "LGPL GPLv2+linking exception"
      1 "Kermit"
      1 "Intel"
      1 "Intel Software License Agreement"
      1 "IPL"
      1 "ICU"
      1 "HypersonicSQL"
      1 "GPLv3/GPLv2/LGPLv2.1"
      1 "GPLv3 or later"
      1 "GPLv2/LGPLv2"
      1 "GPLv2,BSD"
      1 "GPLv2 LGPLv2.1"
      1 "GPLv2 CUPS"
      1 "GPLv2 BSD"
      1 "GPL2"
      1 "GPL/ARToolkit"
      1 "GPL, MIT, BSD"
      1 "GPL, MIT"
      1 "GPL QPL PD"
      1 "GPL PSF"
      1 "GPL MPL"
      1 "GPL MIT"
      1 "GPL MIT Artistic"
      1 "GPL LGPL X11"
      1 "GPL LGPL W3C Classpath BSD"
      1 "GPL BSD BSD SMAIL"
      1 "GPL Artistic"
      1 "GPL + X11"
      1 "FREEWARE"
      1 "FNORB"
      1 "EGENIX"
      1 "DSSSL"
      1 "Creative Commons BY-NC-SA 3.0 US"
      1 "Creative Commons Attribution-ShareAlike 2.0"
      1 "Copyright file"
      1 "ClarifiedArtistic"
      1 "CPL MPL LGPL"
      1 "CLOSED"
      1 "CCSA"
      1 "CCPD"
      1 "CC-BY-SA"
      1 "CC"
      1 "CC Sampling Plus 1.0"
      1 "Berkeley-style license"
      1 "BSD-4"
      1 "BSD, GPLv2"
      1 "BSD CPL LGPL"
      1 "BSD 3-clause"
      1 "Artistic License 2.0"
      1 "Artistic GPLv1"
      1 "AdobeFlash"
      1 "AS IS"
      1 "APL + others"
      1 "AL2.0 W3C Public Domain"
      1 "AL2.0 LGPL2.1"
      1 "AGPL3"
      1 ""


