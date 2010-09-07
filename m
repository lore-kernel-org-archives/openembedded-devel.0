Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Osrj6-0001Dc-PA
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:32:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id ADE54A6014
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 07:31:37 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id RUty5WvsDF-x
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 07:31:36 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 57A41A6013
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 07:31:34 +0100 (BST)
Message-ID: <4C85DBD0.9050708@xora.org.uk>
Date: Tue, 07 Sep 2010 07:29:36 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283809310-29893-1-git-send-email-eric@eukrea.com>
	<AANLkTi=LswfyrP_t-5G2iipd6umjkAmdwFiECLmZXMXW@mail.gmail.com>
In-Reply-To: <AANLkTi=LswfyrP_t-5G2iipd6umjkAmdwFiECLmZXMXW@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] mercurial-native: add recipe
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
X-List-Received-Date: Tue, 07 Sep 2010 06:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

 On 07/09/10 07:27, Frans Meulenbroeks wrote:
> 2010/9/6 Eric B=E9nard <eric@eukrea.com>:
>> * mercurial is a distributed SCM
>> * having the native recipe inside OpenEmbedded gives the
>> possibility to fetch code from mercurial's repositories
>> without the need to have mercurial installed on the host
>>
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>> ---
>>  recipes/mercurial/mercurial-native_1.6.3.bb |   23 ++++++++++++++++++=
+++++
>>  1 files changed, 23 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/mercurial/mercurial-native_1.6.3.bb
>>
>> diff --git a/recipes/mercurial/mercurial-native_1.6.3.bb b/recipes/mer=
curial/mercurial-native_1.6.3.bb
>> new file mode 100644
>> index 0000000..58fcaf1
>> --- /dev/null
>> +++ b/recipes/mercurial/mercurial-native_1.6.3.bb
>> @@ -0,0 +1,23 @@
>> +DESCRIPTION =3D "The Mercurial distributed SCM"
>> +SECTION =3D "console/utils"
>> +LICENSE =3D "GPLv2"
>> +
>> +SRC_URI =3D "http://mercurial.selenic.com/release/mercurial-${PV}.tar=
.gz;name=3Dsrc"
>> +
>> +DEPENDS =3D "python-native"
>> +PR =3D "r0"
>> +
>> +S =3D "${WORKDIR}/mercurial-${PV}"
>> +EXTRA_OEMAKE =3D "STAGING_LIBDIR=3D${STAGING_LIBDIR} STAGING_INCDIR=3D=
${STAGING_INCDIR} \
>> +       BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} PREFIX=3D${STA=
GING_DIR_NATIVE}/usr"
>> +
>> +do_install () {
>> +        install -d ${STAGING_DIR_NATIVE}/usr
> I'm a little bit surprised that you need this. I had expected install
> to take care of that.
> Otherwise, the recipe looks fine to me (but haven't test-build it yet)
>
Missed the original mail, but the install -d line should be in
do_install_prepend()

This makes it clearer that its a hack. You then also wont need to
specify the oe_runmake install bit.

Graeme



