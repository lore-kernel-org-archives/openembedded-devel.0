Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SV1B1-0008UP-Vy
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 15:55:36 +0200
Received: by wgbdr1 with SMTP id dr1so1607043wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=GyBRNr1HwtLNd6tePXSw4CXHOTlWqJKzfSkuREaOEnQ=;
	b=t6VCAIZgesYTxgdsH1Zwifh8MQo0MhMke7g3bIODE4hpU/H+la+SVL2W33MfAoOmR4
	iN4DUgsqtgJjHqjtIs55MwH8FvoanwVLOl8d7I2An85/G/jNtQQ6kH4TCAo35FH1EvsP
	ki9brGr3YBPV8U/j+QRpzslMf7ibQeENApFgg8vLRH0e3CDuvYt+jQImg5WXFq3F8+bH
	m1MDRFDN/uj4XyYFtHjMNzbL/da6ICw+5l/FE0LloL6sFj/LOcefVP6C2hmHAeNJWXMX
	Ac28MHnZICSJyDFCN+CAOb31XboM6QhGhww5EA6uLTVMtPUK7J/NKtH2GqCRvgT0vJT4
	0GsQ==
Received: by 10.180.24.39 with SMTP id r7mr51023079wif.9.1337262333559; Thu,
	17 May 2012 06:45:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Thu, 17 May 2012 06:45:13 -0700 (PDT)
In-Reply-To: <20120517075820.GC3164@jama.jama.net>
References: <DB8F1B3EEF94C3439BFFE674EB05E3CC028713@HKNPRD0204MB116.apcprd02.prod.outlook.com>
	<20120517075820.GC3164@jama.jama.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 17 May 2012 06:45:13 -0700
X-Google-Sender-Auth: _JWEklQctDbtcYISlqMxZirHBsM
Message-ID: <CABcZANmvr7Vi7voO9puyPHe5=_dXtdxcbAY94TH9ABLPBQKwCw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Python exception running step do_package_update_index_ipk in OE classic
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
X-List-Received-Date: Thu, 17 May 2012 13:55:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 12:58 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, May 17, 2012 at 07:34:24AM +0000, Craig McQueen wrote:
>> I'm trying to build OE classic for i.MX28, following instructions at:
>> http://www.imxdev.org/wiki/index.php?title=3DAll_Boards_OpenEmbedded
>>
>> I'm trying to run:
>> =C2=A0 bitbake bootstrap-image
>>
>> It is failing on a step do_package_update_index_ipk when calling Python =
program opkg-make-index. See error below.
>>
>> The problem is when it calls subprocess.check_output(), but check_output=
() is only in Python 2.7, but not Python 2.6.
>>
>> On my machine, Python 2.7 is installed, however it seems that OE must be=
 running Python 2.6. I see that OE builds Python 2.6 in tmp/work/i686-linux=
/python-native-2.6.6-ml12.0.
>>
>> What would be a good way to fix this?
>
> send patch against
> http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
> to yocto ML
> to make it compatible with both python 2.6 and 2.7

In oe-core, we pulled check_output() and CalledProcessException() out
of 2.7 into the lib/oe tree for local use. You could do that in
opkg-utils too if licensing isn't an issue. It's a relatively small
amount of code.
--=20
Christopher Larson


