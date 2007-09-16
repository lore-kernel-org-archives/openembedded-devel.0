Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gergely.kis@gmail.com>) id 1IX1xt-0006Dt-Bf
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Sep 2007 23:47:41 +0200
Received: by py-out-1112.google.com with SMTP id a25so3025206pyi
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Sep 2007 14:44:06 -0700 (PDT)
Received: by 10.64.148.8 with SMTP id v8mr8799162qbd.1189979045626;
	Sun, 16 Sep 2007 14:44:05 -0700 (PDT)
Received: by 10.65.157.8 with HTTP; Sun, 16 Sep 2007 14:44:05 -0700 (PDT)
Message-ID: <a0a707170709161444w793eaa19hc5964fe05c7bb5f3@mail.gmail.com>
Date: Sun, 16 Sep 2007 23:44:05 +0200
From: "Gergely Kis" <openmoko@kisgergely.com>
Sender: gergely.kis@gmail.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Google-Sender-Auth: 6f63331eadaf47b4
Subject: OABI/EABI specific autotools settings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Sep 2007 21:47:41 -0000
X-Groupsio-MsgNum: 2930
Content-Type: multipart/mixed; 
	boundary="----=_Part_8313_9417612.1189979045607"

------=_Part_8313_9417612.1189979045607
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I was trying to use Orbit2 on an ARM EABI system (Openmoko 2007.2 on
QEMU), but I ran into alignment issues: the autotools presets in
site/arm-common assumed OABI structure alignment. The following
trivial patch fixed it for my build, but it is not suitable for
merging into OE, because it would break OABI builds. Therefore I would
like to propose a change which allows using different presets for EABI
and OABI builds. Basically the idea is to use the following files:

arm-common - non-ABI specific presets
arm-oabi-common - OABI presets
arm-eabi-common - EABI presets

arm-linux - non ABI specific presets
arm-oabi-linux - OABI presets
arm-eabi-linux - EABI presets

Actually the oabi/eabi files should only hold a handful of
declarations, mainly structure alignment settings.

What do you think? Would you accept a patch which implements the above
structure? Or is there a better method to support this?

The actual patch to arm-common is attached.

Best Regards,
Gergely

------=_Part_8313_9417612.1189979045607
Content-Type: text/x-patch; name="arm-corba-8byte-align.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="arm-corba-8byte-align.diff"
X-Attachment-Id: f_f6o2qoly

SW5kZXg6IG9wZW5tb2tvL29wZW5lbWJlZGRlZC9zaXRlL2FybS1jb21tb24KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQot
LS0gb3Blbm1va28ub3JpZy9vcGVuZW1iZWRkZWQvc2l0ZS9hcm0tY29tbW9uCTIwMDctMDktMDkg
MDA6NDk6MzIuMDAwMDAwMDAwICswMjAwCisrKyBvcGVubW9rby9vcGVuZW1iZWRkZWQvc2l0ZS9h
cm0tY29tbW9uCTIwMDctMDktMDkgMDI6MTM6MjUuMDAwMDAwMDAwICswMjAwCkBAIC0xNTgsMTUg
KzE1OCwxNSBAQAogIyBPUkJpdDIKIGFjX2N2X2FsaWdub2ZfQ09SQkFfYm9vbGVhbj0xCiBhY19j
dl9hbGlnbm9mX0NPUkJBX2NoYXI9MQotYWNfY3ZfYWxpZ25vZl9DT1JCQV9kb3VibGU9NAorYWNf
Y3ZfYWxpZ25vZl9DT1JCQV9kb3VibGU9OAogYWNfY3ZfYWxpZ25vZl9DT1JCQV9mbG9hdD00CiBh
Y19jdl9hbGlnbm9mX0NPUkJBX2xvbmc9NAotYWNfY3ZfYWxpZ25vZl9DT1JCQV9sb25nX2RvdWJs
ZT00Ci1hY19jdl9hbGlnbm9mX0NPUkJBX2xvbmdfbG9uZz00CithY19jdl9hbGlnbm9mX0NPUkJB
X2xvbmdfZG91YmxlPTgKK2FjX2N2X2FsaWdub2ZfQ09SQkFfbG9uZ19sb25nPTgKIGFjX2N2X2Fs
aWdub2ZfQ09SQkFfb2N0ZXQ9MQogYWNfY3ZfYWxpZ25vZl9DT1JCQV9wb2ludGVyPTQKIGFjX2N2
X2FsaWdub2ZfQ09SQkFfc2hvcnQ9MgotYWNfY3ZfYWxpZ25vZl9DT1JCQV9zdHJ1Y3Q9NAorYWNf
Y3ZfYWxpZ25vZl9DT1JCQV9zdHJ1Y3Q9MQogYWNfY3ZfYWxpZ25vZl9DT1JCQV93Y2hhcj0yCiBh
Y19jdl9mdW5jX2dldGFkZHJpbmZvPSR7YWNfY3ZfZnVuY19nZXRhZGRyaW5mbz15ZXN9CiAK

------=_Part_8313_9417612.1189979045607--
