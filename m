Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 4A05F6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 15:08:54 +0000 (UTC)
Received: (qmail 8964 invoked by uid 1003); 23 Dec 2015 15:08:54 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.110.59)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	23 Dec 2015 15:08:54 -0000
To: openembedded-devel@lists.openembedded.org
References: <1450813380-3570-1-git-send-email-philip@balister.org>
	<CAJ86T=VVf3_etCwsns3n6W2qFUwgkjK0krtHbZcb-XV4xCxoDQ@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <567AB906.5010208@balister.org>
Date: Wed, 23 Dec 2015 10:08:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VVf3_etCwsns3n6W2qFUwgkjK0krtHbZcb-XV4xCxoDQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Wed, 23 Dec 2015 15:08:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Thanks. Too much excitement over the output doing something useful. I
need to get this off my local tree since I know of at least one other
person working with thrift.

I'll update and resend.

Philip

On 12/22/2015 05:52 PM, Andre McCurdy wrote:
>  On Tue, Dec 22, 2015 at 11:43 AM, Philip Balister <philip@balister.org> wrote:
>>  * Run tested cpp bindings with GNU Radio Control Port.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>> new file mode 100644
>> index 0000000..43b93cd
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>> @@ -0,0 +1,30 @@
> 
> Maybe add SUMMARY, DESCRIPTION and HOMEPAGE ?
> 
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
>> +
>> +SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
>> +"
>> +SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "thrift-native boost python libevent flex-native bison-native openssl"
> 
> Move DEPENDS above SRC_URI.
> 
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +inherit pkgconfig cmake pythonnative
>> +
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>> +export BUILD_SYS
>> +export HOST_SYS
>> +
>> +EXTRA_OECMAKE = "-DWITH_QT4=OFF"
>> +EXTRA_OECMAKE_append_class-native = "-DWITH_QT4=OFF -DBUILD_TESTING=OFF \
>> +             -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
> 
> -DWITH_QT4=OFF is duplicated and _append without a leading space looks dubious.
> 
> Maybe better for the native and nativesdk classes to just over-ride
> EXTRA_OECMAKE rather than try to append?
> 
>> +EXTRA_OECMAKE_append_class-nativesdk = "-DBUILD_TESTING=OFF \
>> +             -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
>> +
>> +do_install_append () {
>> +       cd ${D}/${bindir}
>> +       ln -sf thrift thrift-compiler
> 
> Perhaps drop the unnecessary cd, ie:
> 
>   ln -sf thrift ${D}/${bindir}/thrift-compiler
> 
>> +}
>> +
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

