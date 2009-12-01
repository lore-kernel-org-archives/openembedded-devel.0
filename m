Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NFQ77-0004AJ-OH
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 11:37:48 +0100
Received: from [192.168.1.12] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 5400258413B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 12:23:49 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
Date: Tue, 1 Dec 2009 11:36:11 +0100
Message-Id: <F99B6DBE-77CA-4CC6-8A46-D8A0908084C4@vanille-media.de>
References: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
	<ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error while running bibake
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
X-List-Received-Date: Tue, 01 Dec 2009 10:37:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Am 01.12.2009 um 11:29 schrieb Frans Meulenbroeks:

> 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
>> hi
>> I want cross compile linphone for compulab EM-x270 board.when i try
>>   sudo bitbake -b
>> /home/development/em-x270/stuff/openembedded/recipes/linphone/
>> linphone_3.1.0.bb
>>    then i will get the following error
>>   *bb.parse.ParseError: Could not inherit file =
classes/autotools.bbclass
>> *
>>    pleasse guide me in compiling linphone for compulab board.
>=20
> first remark:
> there is no need to run bitbake as root.
>=20
> 2nd thing you could check is if the file exists in your tree and if so
> if your path is set properly.

More remarks:

1. Don't use -b unless you really know what you are doing, better use =
'bitbake linphone'.
2. Check whether BBPATH is correctly set (pointing to your conf files).

:M:=


