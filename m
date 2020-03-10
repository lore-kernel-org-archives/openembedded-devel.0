Return-Path: <dachaac@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id D682160B1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 19:56:30 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id r7so15630304ljp.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=TTDZ0QNKjoA1LVhqYhL8czCP4JzlOh7X7CO8/p7+DMQ=;
	b=t6aVIYyH7H8TkuNly01vTln3XEvfxZI9O8G5iefuOUsGtW9gEpY0n1e1k3GXtFHZyo
	RomAI764zRvgbtFtWn9vxQRzLg6p5DicQUWQpyPQk7WtksZahXto2ayiQ0RIy5BBxHVS
	QlilCeJhe9/kXik8T+Ln9APVHrex1y9P1J1ZaSRCnICTakMD7sTEwLCn4HIeEKIw0qBo
	jlkNqnyTSfj86qdoG0kl3yZQx01RwVXx0eh278uOg42/QXr+WBI0HbOxMD6E/hwtVGzf
	LnvmEG42QaPTPXt6oRkh/4j0LEMGmDTyIE0Jls7TTAMZK3kn7nrYWCUZlHpC7GTHJuKq
	xrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TTDZ0QNKjoA1LVhqYhL8czCP4JzlOh7X7CO8/p7+DMQ=;
	b=N5T2vToLQ9kLU4r5F11n9vDV1hrLmUi54xRRPCVp8GdgKFAgfjlEcKeSlSPfYtZtzB
	+CAhxEhRegnV6MRaY5PhV5bYRmQ/m5aG6pXCX/rEF1s6xL4mt5lENEOoXXXkMarWNqMs
	NmX7DAYnw6sC7NUpuQbwVussBDCwBI91LqAUuMasaRUq+XdBpL2xojYSiICBt9O4UP45
	jiJ/4jUi4lwSct1J7b9TA6Ga9DGmKpbpWSQtG42JmFobzjy6CRu/2x7NJe+AMaHyWetY
	n27/H1M0pUeJPq5X0/qgmgr4ogu7uXvBE5YkNFoLK6ZFoga0hG8nkcPcy9PluCcjlIXK
	w74A==
X-Gm-Message-State: ANhLgQ2udgsEG7Ch1+TN6gMlnQjLw5Z5WkkthUAX6iexMx8mQojzlA80
	wJCQhxC2006BejmsLgGM5kA2HTtH08E=
X-Google-Smtp-Source: ADFU+vtVwiAtRnPV7UN0/AkNjPjKghYcuetIIXoN09ntO2SOFiYVZ0Y1qv2HS55o7yaggxmIlOYTDQ==
X-Received: by 2002:a2e:b018:: with SMTP id y24mr13656411ljk.146.1583870190188;
	Tue, 10 Mar 2020 12:56:30 -0700 (PDT)
Received: from Vesas-MacBook-Pro.local (87-100-247-140.bb.dnainternet.fi.
	[87.100.247.140]) by smtp.googlemail.com with ESMTPSA id
	u9sm15641897ljo.106.2020.03.10.12.56.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Mar 2020 12:56:29 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20200310024936.18941-1-scott.branden@broadcom.com>
	<CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <3a1066ff-7016-dd0b-a7f5-197631b92785@gmail.com>
Date: Tue, 10 Mar 2020 21:56:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pycryptodomex: add 3.9.4 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2020 19:56:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

Actually no.

pythonX-cryptodome has need to conflict with pythonX-crypto.

But python3-cryptodomex can coexists with either one of those as they 
have own namespace.

Some software need to unfortunately have both python3-cryptodome (brings 
python3-crypto "API emulation") and python3-cryptodomex installed in 
order to function.

Thanks,
Vesa Jääskeläinen

On 10.3.2020 7.50, Tim Orling wrote:
> This probably should have an RCONFLICTS with python3-cryptodme (and maybe
> even python3-crypto).
> 
> These three packages step all over each other with same functionality...
> 
> On Mon, Mar 9, 2020 at 7:50 PM Scott Branden via Openembedded-devel <
> openembedded-devel@lists.openembedded.org> wrote:
> 
>> From: Rajesh Ravi <rajesh.ravi@broadcom.com>
>>
>> Add python3-pycryptodomex 3.9.4 recipe needed to build
>> such components as optee 3.8.0.
>>
>> Signed-off-by: Rajesh Ravi <rajesh.ravi@broadcom.com>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   .../python/python3-pycryptodomex_3.9.4.bb     | 30 +++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/
>> python3-pycryptodomex_3.9.4.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/
>> python3-pycryptodomex_3.9.4.bb
>> new file mode 100644
>> index 000000000..be6b10f3f
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY = "Cryptographic library for Python"
>> +DESCRIPTION = "PyCryptodome is a self-contained Python package of
>> low-level\
>> + cryptographic primitives."
>> +HOMEPAGE = "http://www.pycryptodome.org"
>> +LICENSE = "PD & BSD-2-Clause"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
>> +
>> +SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
>> +SRC_URI[sha256sum] =
>> "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
>> +
>> +inherit pypi
>> +inherit setuptools3
>> +
>> +RDEPENDS_${PN} += " \
>> +    ${PYTHON_PN}-io \
>> +    ${PYTHON_PN}-math \
>> +"
>> +
>> +RDEPENDS_${PN}-tests += " \
>> +    ${PYTHON_PN}-unittest \
>> +"
>> +
>> +PACKAGES =+ "${PN}-tests"
>> +
>> +FILES_${PN}-tests += " \
>> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
>> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
>> +"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

