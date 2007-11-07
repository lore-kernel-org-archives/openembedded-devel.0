Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IpfNn-0001sV-N2
	for openembedded-devel@openembedded.org; Wed, 07 Nov 2007 08:31:27 +0100
Received: from bq8.dotserv.com (localhost [127.0.0.1])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lA77UbhK005809
	for <openembedded-devel@openembedded.org>;
	Wed, 7 Nov 2007 08:30:37 +0100
Received: (from apache@localhost)
	by bq8.dotserv.com (8.13.1/8.13.1/Submit) id lA77Ub97005805;
	Wed, 7 Nov 2007 08:30:37 +0100
X-Authentication-Warning: bq8.dotserv.com: apache set sender to
	eha@doredevelopment.dk using -f
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Date: Wed, 7 Nov 2007 08:30:37 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
Organization: =?UTF-8?Q?Dor=C3=A9_Development_ApS?=
In-Reply-To: <1EF150F3-338E-469F-8AA4-7816799D3F55@selfish.org>
References: <1EF150F3-338E-469F-8AA4-7816799D3F55@selfish.org>
Message-ID: <9726e5bab4d4cea59c08c70dbf3d05cc@127.0.0.1>
X-Sender: eha@doredevelopment.dk
User-Agent: RoundCube Webmail/0.1b
X-MIME-Autoconverted: from 8bit to quoted-printable by bq8.dotserv.com id
	lA77UbhK005809
Subject: Re: Why not use config.guess in conf/bitbake.conf ?
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
X-List-Received-Date: Wed, 07 Nov 2007 07:31:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


On Tue, 6 Nov 2007 17:06:48 +0100, Holger Freyther <zecke@selfish.org> wr=
ote:
>=20
> Am 06.11.2007 um 12:19 schrieb Esben Haabendal:
>>
>> What is the reason that conf/bitbake.conf is relying directly on
>> the 'uname' output for generating the BUILD_SYS string?
>>
>> I am trying to get OE building on Cygwin, and on my machine
>> bitbake.conf generates a BUILD_SYS that is not supported by
>> config.sub, which breaks a autotools packages.
>>
>> $ uname -a
>> CYGWIN_NT-5.1 PC_K_EHA 1.5.24(0.156/4/2) 2007-01-31 10:57 i686 Cygwin
>>
>> As bitbake.conf takes the first field as BUILD_OS, and the 5th
>> field as BUILD_ARCH and then set BUILD_SYS to ${BUILD_ARCH}-$
>> {BUILD_OS} I end up with
>> i686-cygwin_nt-5.1
>> which breaks config.sub due to the '-' in the os string.
>>
>> Using a current config.guess on this system, I get
>> i686-pc-cygwin
>> which is fine.
>> On my laptop (running gutsy) it would give me a BUILD_SYS
>> i686-pc-linux-gnu
>=20
> A sane OS does return something sane on uname. But e.g. check  build/
> Power\ Macintosh-darwin.conf on what can be done for none sane
> operating systems... So create your file for cygwin and send a patch ;)

Ah, nice approach. Didn't notice that.

But.... this file will be included after
 * build-${BUILD_OS} is added to OVERRIDES
 * STAGING_DIR_NATIVE is set to ${STAGING_DIR}/${BUILD_SYS}

So these will still be set to non-sane values, although the ${BUILD_OS} a=
nd ${BUILD_SYS} values will be sane.

Wouldn't it make more sense to include conf/build/${BUILD_SYS}.conf right=
 after constructing ${BUILD_SYS} from uname?  At least for now, it is not=
 used for anything else than altering these values.

/Esben
--=20
Esben Haabendal
Embedded Software Consultant
Dor=C3=A9 Development ApS



