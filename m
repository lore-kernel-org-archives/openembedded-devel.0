Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IRX23-0006MX-Ci
	for openembedded-devel@openembedded.org; Sat, 01 Sep 2007 19:45:15 +0200
Received: from vpn006101.vpn.utwente.nl (vpn006101.vpn.utwente.nl
	[130.89.6.101])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l81Hh61R004428 for <openembedded-devel@lists.openembedded.org>;
	Sat, 1 Sep 2007 19:43:06 +0200
Message-ID: <46D9A492.5090601@dominion.kabel.utwente.nl>
Date: Sat, 01 Sep 2007 19:42:42 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
	<1188653475.5722.1.camel@localhost.localdomain>
In-Reply-To: <1188653475.5722.1.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC][PATCH] Merging classes with poky
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
X-List-Received-Date: Sat, 01 Sep 2007 17:45:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Fri, 2007-08-31 at 13:29 +0200, Koen Kooi wrote:
>> ---
>> classes/base.bbclass        0b7bd90cd81cad21be3a5562472533d725e69760
>> +++
>> classes/base.bbclass        e9e18b1810f9cae7274bc8d18014c2ef9f972911
>> @@ -374,6 +374,18 @@ oe_machinstall() {
>>         fi
>>  }
>>  
>> +addtask showdata
>> +do_showdata[nostamp] = "1"
>> +python do_showdata() {
>> +       import sys
>> +       # emit variables and shell functions
>> +       bb.data.emit_env(sys.__stdout__, d, True)
>> +       # emit the metadata which isnt valid shell
>> +       for e in d.keys():
>> +           if bb.data.getVarFlag(e, 'python', d):
>> +               sys.__stdout__.write("\npython %s () {\n%s}\n" % (e,
>> bb.data.getVar(e, d, 1)))
>> +}
>> +
>>  addtask listtasks
>>  do_listtasks[nostamp] = "1"
>>  python do_listtasks() { 
> 
> I haven't looked closely at the diff yet but the above should not be
> merged back in. I removed it from OE.dev since its broken and the same
> (correct) information can be obtained with "bitbake -e". I will remove
> it from Poky too in due course.

Updated diffs at http://dominion.kabel.utwente.nl/koen/OE/poky/

Changes:

* remove showdata
* make rootfs_deb.bbclass work with current .dev



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG2aSSMkyGM64RGpERAmubAJ4qhpYEO8BNICcaZ9IVwmwFoF75ggCfcwZs
x3YWWBfmwBpXFxBHbnwIgFI=
=qKfx
-----END PGP SIGNATURE-----


