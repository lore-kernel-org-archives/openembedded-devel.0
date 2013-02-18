Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1U7N8P-0001dY-6H
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 10:35:43 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Mon, 18 Feb 2013
	10:19:33 +0100
X-TM-IMSS-Message-ID: <1b449db800004c9b@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 1b449db800004c9b ;
	Mon, 18 Feb 2013 10:19:29 +0100
Message-ID: <5121F224.4080906@nedap.com>
Date: Mon, 18 Feb 2013 10:19:32 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <511E373D.1070109@nedap.com>
	<CAPESJy6N4oTvAz9GBLN29UBZ=i1CgfKJ5DOQv3R6BS18AABe1Q@mail.gmail.com>
In-Reply-To: <CAPESJy6N4oTvAz9GBLN29UBZ=i1CgfKJ5DOQv3R6BS18AABe1Q@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: opkg-make-index not found
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
X-List-Received-Date: Mon, 18 Feb 2013 09:35:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/16/2013 07:51 AM, Takeshi Hamasaki wrote:

>> if I do
>>
>>      bitbake package-index
>>
>> it crashes with the message
>>
>>      | /bin/bash: opkg-make-index: command not found
>>
>> This is on a 64 debian machine, possibly the wrong path is searched?
>> (there is a opkg-make-index under sysroots/x86_64-linux/usr/bin)
>>
>>

> If you doubt the PATH setting, you should check the output from:
> $ bitbake -e | grep '^export PATH'
>

Well opkg-make-index is in the path.

Something strange is happening here.
If I edit package-index.bb and add a call to opkg-make-index

    do_package_index() {
         set -ex
    opkg-make-index   ### ADDED CODE
         ${PACKAGEINDEXES}
         set +ex
    }


it shows an error message when invoking bitbake package-index showing 
that opkg-make-index is actualy working...

    ///
    .../build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index
    [-h] [-s] [-m] [-l Packages.filelist] [-p Packages] [-r
    Packages.old] [-L localesdir] [-v] packagesdir
    NOTE: package package-index-1.0-r0: task do_package_index: Failed
    ///

Any idea?




