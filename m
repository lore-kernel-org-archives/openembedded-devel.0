Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 4046360685
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 13:33:10 +0000 (UTC)
Received: from [192.168.24.183] (p54AC5F3C.dip0.t-ipconnect.de [84.172.95.60])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 5E77E2802E7;
	Tue, 24 Oct 2017 13:30:07 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>, Stefan Sonski <s.sonski@gmail.com>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
Date: Tue, 24 Oct 2017 15:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"Chris E. Rallis" <Chris.Rallis@ravenind.net>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Tue, 24 Oct 2017 13:33:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
> Either this or the ptest change seems to cause:
> http://errors.yoctoproject.org/Errors/Details/157417/

FTR, I see the same error locally. Reverting both 8fd20e8b1
("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
branch of meta-qt5 fixes things for me.


Thanks,
Daniel



> 
> On Tue, Oct 17, 2017 at 9:56 PM, Stefan Sonski <s.sonski@gmail.com> wrote:
> 
>> From: "Chris E. Rallis" <Chris.Rallis@RavenInd.net>
>>
>> Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
>> ---
>>  classes/qmake5_base.bbclass | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
>> index 8e1fe20..042008c 100644
>> --- a/classes/qmake5_base.bbclass
>> +++ b/classes/qmake5_base.bbclass
>> @@ -28,6 +28,7 @@ EXTRA_OEMAKE = " \
>>      OE_QMAKE_LINK='${OE_QMAKE_LINK}' \
>>      OE_QMAKE_LDFLAGS='${OE_QMAKE_LDFLAGS}' \
>>      OE_QMAKE_AR='${OE_QMAKE_AR}' \
>> +    OE_QMAKE_OBJCOPY='${OE_QMAKE_OBJCOPY}' \
>>      OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
>>      OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
>>      OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
>> @@ -42,6 +43,7 @@ export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
>>  export OE_QMAKE_LINK = "${CXX}"
>>  export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
>>  export OE_QMAKE_AR = "${AR}"
>> +export OE_QMAKE_OBJCOPY = "${OBJCOPY}"
>>  export OE_QMAKE_STRIP = "echo"
>>  export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/
>> wayland-scanner"
>>
>> --
>> 2.14.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


