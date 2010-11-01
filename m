Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matt.czech@gmail.com>) id 1PD3ah-0007nB-Jo
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 00:15:50 +0100
Received: by fxm3 with SMTP id 3so5483224fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 16:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=peRPpKdm3lrGP/7g5cYpONgds4O8p7O+zpjrumRaicM=;
	b=gIT7DkPy1a6xhNVZ9mxgNQKArXUjdcg6jiTg95lytLab5Y2Y7Rb3kKtb5Rb2sB8BIl
	FcKkkLbOYqQ2x5QcHKrKkYwrGVI3yW8Ch2cVGggE0dgoaYTIHeXBjlmIJ3aNL0Mw+8os
	mbulZF+NZCquoqwKtazpCBzDO9qWNv4WN8ymA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=DGFcFhoV9oy6rfYZj66/FSG/bZdumjuhjOl/7g6f7IcBbjaSbfPHim5joqpvhrYyVL
	88nvODD6m9Op4QCEe28LansMoxHRo4SUl4LGFTIBWCNckKYUSCPBlkC0QdnbkNmfMAs5
	+l/oyBH0NKf1qiQt8ZK5+cUlR2jafKz5IsRZA=
MIME-Version: 1.0
Received: by 10.223.70.133 with SMTP id d5mr9113765faj.64.1288653254708; Mon,
	01 Nov 2010 16:14:14 -0700 (PDT)
Received: by 10.223.109.73 with HTTP; Mon, 1 Nov 2010 16:14:14 -0700 (PDT)
Date: Mon, 1 Nov 2010 18:14:14 -0500
Message-ID: <AANLkTinqQ3ZE5JLg_G9tG-O-ztGp0=V=SV97pvfZOOp+@mail.gmail.com>
From: Matt Czech <matt.czech@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: matt.czech@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: problems building libxcb-native
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
X-List-Received-Date: Mon, 01 Nov 2010 23:17:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm trying to build meta-toolchain-qte and am running into problems
trying to compile libxcb-native.

From the do_compile log:

NOTE: make
Making all in src
make[1]: Entering directory
`/armoebuild/oeroot/build-czech/angstrom-dev/work/x86_64-linux/libxcb-native-1.6-r3.1/libxcb-1.6/src'
/armoebuild/oeroot/build-czech/angstrom-dev/sysroots/x86_64-linux/usr/bin/python
./c_client.py -p
/armoebuild/oeroot/build-czech/angstrom-dev/sysroots/x86_64-linux/usr/lib64/python2.6/site-packages
/armoebuild/oeroot/build-czech/angstrom-dev/sysroots/x86_64-linux/usr/share/xcb/xproto.xml

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

Traceback (most recent call last):
  File "./c_client.py", line 1022, in <module>
    from xcbgen.state import Module
ImportError: No module named xcbgen.state
make[1]: *** [xproto.c] Error 1
make[1]: Leaving directory
`/armoebuild/oeroot/build-czech/angstrom-dev/work/x86_64-linux/libxcb-native-1.6-r3.1/libxcb-1.6/src'
make: *** [all-recursive] Error 1
FATAL: oe_runmake failed
ERROR: Function do_compile failed

What package provides the xcbgen python package? xproto-native?

I'm not sure if I'm missing a package or if it's just looking in the
wrong place.

Any help would be appreciated.

Thanks!

Matt


