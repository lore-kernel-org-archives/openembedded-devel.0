Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LY2Vb-0006s1-4r
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 19:11:27 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LY2UE-0002Px-75
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 18:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 18:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 18:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Feb 2009 19:04:59 +0100
Message-ID: <gn4cob$g07$1@ger.gmane.org>
References: <1234538851.24574.4.camel@EPBYMINW0568>
	<fce2a370902130810r61652aajcc71822d645fe532@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <fce2a370902130810r61652aajcc71822d645fe532@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Add new ruby-dbus package
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
X-List-Received-Date: Fri, 13 Feb 2009 18:11:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 17:10, Ihar Hrachyshka wrote:
> Please don't commit it. I forgot to add DEPENDS += "ruby" for it.

and dbus.

regards,

Koen


>
> On Fri, Feb 13, 2009 at 5:27 PM, Ihar Hrachyshka
> <ihar.hrachyshka@gmail.com>  wrote:
>> This is a package with D-Bus bindings for Ruby language.
>>
>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>> ---
>>   conf/checksums.ini               |    4 ++++
>>   packages/ruby/ruby-dbus_0.2.1.bb |   17 +++++++++++++++++
>>   2 files changed, 21 insertions(+), 0 deletions(-)
>>   create mode 100644 packages/ruby/ruby-dbus_0.2.1.bb
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 4e8e0f1..8d508eb 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -19074,6 +19074,10 @@ sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
>>   md5=797ea136fe43e4286c9362ee4516674e
>>   sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
>>
>> +[http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz]
>> +md5=1f6398d8bbafa272c0b43878fec43276
>> +sha256=cfcadc4ae860f2de3d6aa1a1230a410b1dedf783148a27a20205bb3b54e3c3ac
>> +
>>   [http://rxtx.qbang.org/pub/rxtx/rxtx-2.1-7r2.zip]
>>   md5=9290b4832d46199f8d798a531209640b
>>   sha256=31db3852a86105766758975519b27d262407c96cacad4f34ad0de5aae26addd9
>> diff --git a/packages/ruby/ruby-dbus_0.2.1.bb b/packages/ruby/ruby-dbus_0.2.1.bb
>> new file mode 100644
>> index 0000000..a1ce40c
>> --- /dev/null
>> +++ b/packages/ruby/ruby-dbus_0.2.1.bb
>> @@ -0,0 +1,17 @@
>> +DESCRIPTION = "${PN} bindings"
>> +SECTION = "devel/ruby"
>> +LICENSE = "LGPL"
>> +
>> +SRC_URI = "http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz"
>> +
>> +RUBY_DIR = "/usr/lib/ruby/1.8"
>> +
>> +S = "${WORKDIR}/ruby-dbus-${PV}"
>> +
>> +FILES_${PN} += "${RUBY_DIR}"
>> +
>> +do_install() {
>> +       install -d ${D}${RUBY_DIR}
>> +       cp -r lib/* ${D}${RUBY_DIR}
>> +}
>> +
>> --
>> 1.5.6.3
>>
>>
>>




