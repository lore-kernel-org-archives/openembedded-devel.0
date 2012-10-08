Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TL8E5-0005lv-7v
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 09:58:09 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so1732634bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2012 00:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=hatvxOnYZ1CUX+zx/JVO236nAuJBt7vzwN88XJCQ1XQ=;
	b=fCpJUC33GSlQqZZ7mCfGD6BlP6btiyjKBd9LQRkfVA0yoOwCVQYNLoihWEdyjWMIDQ
	W1A29PTeyNoif72eS573TyXnSBBHIqguOmTpQxqEjgsGDTeYSGZPgZupHX69/ztcQS9S
	KhpfkTxtElAuwtsdzXBmsvH0svtyYQ7mzjiJgqdiw+IWMxUVuskFi2U9e4bZydP1IQl5
	LHVRIWfYlyN59vABXlIHNrJoeEAEyR6lhQoLiJI4uc7TlyLXtgxRNB1pGDfPlGTnuQgN
	uwgPlDrG/G2VdCeHgsB46nZuIEJYpTu8uOkq5yXIGS1rjUyIFROhoX6WmsPOwK2SY0zs
	5Cuw==
Received: by 10.204.152.136 with SMTP id g8mr4796666bkw.44.1349682303118;
	Mon, 08 Oct 2012 00:45:03 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id fm5sm5642665bkc.5.2012.10.08.00.45.01
	(version=SSLv3 cipher=OTHER); Mon, 08 Oct 2012 00:45:02 -0700 (PDT)
Message-ID: <5072847C.7@dresearch-fe.de>
Date: Mon, 08 Oct 2012 09:45:00 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQlidMwOQN3POWh9KPPePi0qxkSGZH4V96DkK32YBUlmYZG/9FxRgWGxkB66y6lqlGNKTWoh
Subject: pango-native build problem (and solution idea)
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
X-List-Received-Date: Mon, 08 Oct 2012 07:58:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After upgrading my build host to openSUSE 12.2 i hit a build problem with pango-native (from oe-classic).

-------------> snip <-------------
...
| x86_64-linux-libtool: link: gcc -isystem/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/include -O2 -g -Wall -Wl,-rpath-link -Wl,/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o .libs/pango-view viewer-render.o viewer-main.o pango-view.o viewer-x.o viewer-pangox.o viewer-pangoft2.o viewer-cairo.o viewer-pangocairo.o -pthread  -L/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib ../pango/.libs/libpango-1.0.so ../pango/.libs/libpangox-1.0.so ../pango/.libs/libpangoft2-1.0.so ../pango/.libs/libpangocairo-1.0.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/work/x86_64-linux/pango-native-1.24.4-r1.2/pango-1.24.4/pango/.libs/libpangoft2-1.0.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/work/x86_64-linux/pango-native-1.24.4-r1.2/pango-1.24.4/pango/.libs/libpango-1.0.so
/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libgobject-2.0.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libgthread-2.0.so -lpthread /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libgmodule-2.0.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libglib-2.0.so -lrt /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libcairo.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libpixman-1.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libfontconfig.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libfreetype.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libexpat.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libpng12.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libX11.so
/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libxcb.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libpthread-stubs.so /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libXau.so -ldl /pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib/libz.so -lXrender -lm -pthread -Wl,-rpath -Wl,/pm/sledz/HydraIP/OE/tmp.6-SSZ-fensuse/sysroots/x86_64-linux/usr/lib
| /usr/lib64/gcc/x86_64-suse-linux/4.7/../../../../lib64/libXrender.so: undefined reference to `_XGetRequest'
| collect2: error: ld returned 1 exit status
-------------> snip <-------------

It seems that the libXrender version at the build host now misses the _XGetRequest symbol.

Would it be an acceptable solution to add libxrender-native to DEPENDS_virtclass-native?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


